TARGET   = timer
SRC_CC   = main.cc platform_timer.cc
REQUIRES = okl4 arm
LIBS     = cxx server env alarm

INC_DIR  = $(PRG_DIR)/../include $(PRG_DIR)/../include_periodic

vpath main.cc $(PRG_DIR)/..
