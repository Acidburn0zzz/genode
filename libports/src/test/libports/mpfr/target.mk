TARGET = test-mpfr
LIBS   = cxx env mpfr
SRC_CC = main.cc

# The gmp.lib by now only compiles for 32-bit so we have to mind that
REQUIRES = 32bit


vpath main.cc $(PRG_DIR)/..
