SRC_CC  = blit.cc
REQUIRES = x86 64bit
INC_DIR += $(REP_DIR)/src/lib/blit/x86/x86_64 \
           $(REP_DIR)/src/lib/blit/x86

vpath blit.cc $(REP_DIR)/src/lib/blit
