#
# \brief  Front end to the Genode build system
# \author Norman Feske
# \date   2011-08-04
#

#
# The operation of the build system can be tuned using the following variables,
# which can be specified at the command line or supplied via the
# 'etc/build.conf' file.
#
# BASE_DIR       - this directory points to Genode's 'base' repository
# REPOSITORIES   - list of directories incorporared into the build process
# VERBOSE        - variable that controls the verboseness of the build process
#
#                  By default, compiler messages are not displayed. If you are
#                  interested in these messages set this variable to nothing.
#                  ('VERBOSE=')
#
# VERBOSE_MK    - variable that controls the verboseness of make invocations
# VERBOSE_DIR   - variable that controls the verboseness of changing directories
#
#                 Using this variable, you can enable the make messages printed
#                 when changing directories. To enable the messages, set the
#                 variable to nothing.
#
# LIB_CACHE_DIR - location of the library build cache
#
#                 This variable defines the place for the library build cache.
#                 Normally, the libcache is located at 'var/libcache' and
#                 there is no need to change it.
#

##
## Define global configuration variables
##

-include etc/build.conf

PWD            := $(shell pwd)
BUILD_BASE_DIR := $(PWD)
INSTALL_DIR    := $(PWD)/bin

export BASE_DIR         ?= ../base
export REPOSITORIES     ?= $(BASE_DIR:%base=%base-linux) $(BASE_DIR)
export VERBOSE          ?= @
export VERBOSE_DIR      ?= --no-print-directory
export VERBOSE_MK       ?= @
export LIB_CACHE_DIR    ?= $(BUILD_BASE_DIR)/var/libcache
export LIB_PROGRESS_LOG ?= $(BUILD_BASE_DIR)/progress.log
export LIB_DEP_FILE     ?= var/libdeps
export ECHO             ?= echo -e

#
# Convert user-defined directories to absolute directories
#
# The 'echo' shell command expands '~' characters to the home directory,
# 'realpath' converts relative path names to absolute.
#
REPOSITORIES := $(realpath $(shell echo $(REPOSITORIES)))
BASE_DIR     := $(realpath $(shell echo $(BASE_DIR)))

#
# Configure shell program before executing any shell commands. On Ubuntu the
# standard shell is dash, which breaks colored output via its built-in echo
# command.
#
export SHELL := $(shell which bash)

select_from_repositories = $(firstword $(foreach REP,$(REPOSITORIES),$(wildcard $(REP)/$(1))))

include $(BASE_DIR)/mk/global.mk

#
# Some compilers do not support the compiler arguments that we use with 'gcc'
# and, consequently, spit errors. Hence, we have to check if the compiler
# arguments are supported and drop them in the other case. We cache the result
# of the check in the CC_OPT_CHECKCC variable. The caching improves the build
# performance by 5 to 10 percent.
#
checkcc = $(shell if $(CUSTOM_CC) $(1) -o /dev/null -xc - <<< 'int main(void){return 0;}' &> /dev/null; then echo "$(1)" ; fi ;)

CC_OPT_CHECKCC  = $(call checkcc, -static)
CC_OPT_CHECKCC += $(call checkcc, -fno-stack-protector)

export CC_OPT_CHECKCC

export LIBGCC_INC_DIR = $(shell dirname `$(CUSTOM_CXX_LIB) -print-libgcc-file-name`)/include

#
# Find out about the target directories to build
#
DST_DIRS = $(filter-out all clean bin cleanall again run/%,$(MAKECMDGOALS))

ifeq ($(MAKECMDGOALS),)
DST_DIRS = .
endif

#
# Default rule: build all directories specified as make arguments
#
all $(DST_DIRS): gen_deps_and_build_targets
	@true

#
# Helper to find targets in repositories
# The sed command is there to replace /./ by /. This happens when DST_DIRS = .
#
find_src_target_mk     = $(GNU_FIND) $$i/src/$(@:.visit=) -name target.mk 2>/dev/null | sed "s/\/\.\//\//g"
find_all_src_target_mk = for i in $(REPOSITORIES); do $(find_src_target_mk); done

-include $(call select_from_repositories,etc/specs.conf)
-include $(BUILD_BASE_DIR)/etc/specs.conf
export SPEC_FILES := $(foreach SPEC,$(SPECS),$(call select_from_repositories,mk/spec-$(SPEC).mk))
include $(SPEC_FILES)
export SPECS

##
## First stage: generate library dependencies
##

#
# Reset library-build log and library-dependency file
#
# The 'progress' file contains the names of the already processed libraries
# of the current build process. Before considering to process any library,
# the build system checks if the library is already present in the 'progress'
# file and, if yes, skips it.
#
.PHONY: init_progress_log
init_progress_log:
	@echo "#" > $(LIB_PROGRESS_LOG)
	@echo "# Library build progress log - generated by dep_prg.mk and dep_lib.mk" >> $(LIB_PROGRESS_LOG)
	@echo "#" >> $(LIB_PROGRESS_LOG)

.PHONY: init_libdep_file
init_libdep_file:
	@echo "#"                                               > $(LIB_DEP_FILE)
	@echo "# Library dependencies for build '$(DST_DIRS)'" >> $(LIB_DEP_FILE)
	@echo "#"                                              >> $(LIB_DEP_FILE)
	@echo ""                                               >> $(LIB_DEP_FILE)
	@echo "export SPEC_FILES := \\"                        >> $(LIB_DEP_FILE)
	@for i in $(SPEC_FILES); do \
	  echo "  $$i \\" >> $(LIB_DEP_FILE); done
	@echo ""                                               >> $(LIB_DEP_FILE)
	@echo "LIB_CACHE_DIR = $(LIB_CACHE_DIR)"               >> $(LIB_DEP_FILE)
	@echo "BASE_DIR      = $(realpath $(BASE_DIR))"        >> $(LIB_DEP_FILE)
	@echo "VERBOSE      ?= $(VERBOSE)"                     >> $(LIB_DEP_FILE)
	@echo "VERBOSE_MK   ?= $(VERBOSE_MK)"                  >> $(LIB_DEP_FILE)
	@echo "VERBOSE_DIR  ?= $(VERBOSE_DIR)"                 >> $(LIB_DEP_FILE)
	@echo "INSTALL_DIR  ?= $(INSTALL_DIR)"                 >> $(LIB_DEP_FILE)
	@echo "SHELL        ?= $(SHELL)"                       >> $(LIB_DEP_FILE)
	@echo "MKDIR        ?= mkdir"                          >> $(LIB_DEP_FILE)
	@echo ""                                               >> $(LIB_DEP_FILE)
	@echo "all:"                                           >> $(LIB_DEP_FILE)
	@echo "	@true # prevent nothing-to-be-done message"    >> $(LIB_DEP_FILE)
	@echo ""                                               >> $(LIB_DEP_FILE)

#
# We check if any target.mk files exist in the specified src directory. If
# there exist any target.mk files, we revisit each repository and create
# corresponding rules in the library-dependency file.
#
# This stage is executed serially.
#

$(dir $(LIB_DEP_FILE)):
	@mkdir -p $@

VISIT_DST_DIRS = $(addsuffix .visit,$(DST_DIRS))

.PHONY: $(VISIT_DST_DIRS)
.NOTPARALLEL: $(VISIT_DST_DIRS)
$(VISIT_DST_DIRS): $(dir $(LIB_DEP_FILE)) init_libdep_file init_progress_log
	@echo "checking library dependencies for $(@:.visit=)..."
	@test "`$(find_all_src_target_mk)`" != "" ||\
	      (echo Error: non-existing target $(@:.visit=); false)
	$(VERBOSE_MK)set -e; for i in $(REPOSITORIES); do \
	  for j in `$(find_src_target_mk)`; do \
	    $(MAKE) $(VERBOSE_DIR) -f $(BASE_DIR)/mk/dep_prg.mk \
	      REP_DIR=$$i TARGET_MK=$$j \
	      BUILD_BASE_DIR=$(BUILD_BASE_DIR) \
	      SHELL=$(SHELL) \
	      DARK_COL="$(DARK_COL)" DEFAULT_COL="$(DEFAULT_COL)"; done; done

.PHONY: $(LIB_DEP_FILE)
$(LIB_DEP_FILE): $(VISIT_DST_DIRS)

##
## Second stage: build targets based on the result of the first stage
##

$(INSTALL_DIR):
	$(VERBOSE)mkdir -p $@

.PHONY: gen_deps_and_build_targets
gen_deps_and_build_targets: $(INSTALL_DIR) $(LIB_DEP_FILE)
	@$(VERBOSE_MK)$(MAKE) $(VERBOSE_DIR) -f $(LIB_DEP_FILE) all

.PHONY: again
again: $(INSTALL_DIR)
	@$(VERBOSE_MK)$(MAKE) $(VERBOSE_DIR) -f $(LIB_DEP_FILE) all

##
## Rules for running automated test cases
##

RUN_OPT ?=
RUN_ENV := $(call select_from_repositories,run/env)

ifeq ($(RUN_ENV),)
run: run_no_env
endif

run_no_env:
	@echo "Error: There exists no execution environment this platform"
	@false

# helper for run/% rule
RUN_SCRIPT = $(call select_from_repositories,run/$*.run)

#
# Read tools configuration to obtain the cross-compiler prefix passed
# to the run script.
#
-include $(call select_from_repositories,etc/tools.conf)

run/%: $(call select_from_repositories,run/%.run) $(RUN_ENV)
	$(VERBOSE)test -f "$(RUN_SCRIPT)" || (echo "Error: No run script for $*"; exit -1)
	$(VERBOSE)$(GENODE_DIR)/tool/run --genode-dir $(GENODE_DIR) \
	                                 --name $* \
	                                 --specs "$(SPECS)" \
	                                 --repositories "$(REPOSITORIES)" \
	                                 --cross-dev-prefix "$(CROSS_DEV_PREFIX)" \
	                                 --qemu-args "$(QEMU_OPT)" \
	                                 --include $(RUN_ENV) $(RUN_OPT) \
	                                 --include $(RUN_SCRIPT)

##
## Clean rules
##

#
# For cleaning, visit each directory for that a corresponding target.mk
# file exists in the source tree. For each such directory, we call
# the single_target rule.
#
clean_targets:
	$(VERBOSE_MK)for d in `$(GNU_FIND) -mindepth 1 -type d | $(TAC) | sed "s/^..//"`; do \
		for r in $(REPOSITORIES); do \
			test -f $$r/src/$$d/target.mk && \
				$(MAKE) $(VERBOSE_DIR) clean \
					-C $$d \
					-f $(BASE_DIR)/mk/prg.mk \
					BUILD_BASE_DIR=$(BUILD_BASE_DIR) \
					PRG_REL_DIR=$$d \
					SHELL=$(SHELL) \
					REP_DIR=$$r || \
				true; \
		done; \
	done

clean_libcache:
	$(VERBOSE)rm -rf var/libcache

clean_run:
	$(VERBOSE)rm -rf var/run

clean_gen_files:
	$(VERBOSE)rm -f $(LIB_PROGRESS_LOG)
	$(VERBOSE)rm -f $(LIB_DEP_FILE)

clean_install_dir:
	$(VERBOSE)(test -d $(INSTALL_DIR) && find $(INSTALL_DIR) -type l -not -readable -delete) || true

clean_empty_dirs: clean_targets clean_libcache clean_run clean_gen_files clean_install_dir
	$(VERBOSE)$(GNU_FIND) . -depth -type d -empty -delete

clean cleanall: clean_empty_dirs

