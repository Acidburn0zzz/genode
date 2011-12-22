TARGET           = hypervisor
REQUIRES         = x86 32bit nova
NOVA_SRC_DIR     = $(REP_DIR)/contrib
NOVA_BUILD_DIR   = $(BUILD_BASE_DIR)/kernel
STARTUP_LIB      =
SRC_CC           = $(sort $(notdir $(wildcard $(NOVA_SRC_DIR)/src/*.cpp)))
SRC_S            = $(sort $(notdir $(wildcard $(NOVA_SRC_DIR)/src/*.S)))
INC_DIR          = $(NOVA_SRC_DIR)/include
CC_OLEVEL        = -Os
CC_WARN          = -Wall -Wextra -Waggregate-return -Wcast-align -Wcast-qual \
                   -Wconversion -Wdisabled-optimization -Wformat=2 \
                   -Wmissing-format-attribute -Wmissing-noreturn -Wpacked \
                   -Wpointer-arith -Wredundant-decls -Wshadow -Wwrite-strings \
                   -Wabi -Wctor-dtor-privacy -Wno-non-virtual-dtor \
                   -Wold-style-cast -Woverloaded-virtual -Wsign-promo \
                   -Wframe-larger-than=64 -Wlogical-op -Wstrict-null-sentinel \
                   -Wstrict-overflow=5 -Wvolatile-register-var
CC_OPT          += -pipe -mpreferred-stack-boundary=2 -mregparm=3 -m32 \
                   -fdata-sections -fomit-frame-pointer -freg-struct-return \
                   -freorder-blocks -funit-at-a-time -fno-exceptions -fno-rtti \
                   -fno-stack-protector -fvisibility-inlines-hidden
CXX_LINK_OPT     = -Wl,--gc-sections -Wl,--warn-common -Wl,-static -Wl,-n
LD_TEXT_ADDR     = 0xc0000000
LD_SCRIPT_STATIC = hypervisor.o

$(TARGET): hypervisor.o

hypervisor.o: $(NOVA_SRC_DIR)/src/hypervisor.ld
	$(VERBOSE)$(CC) $(INCLUDES) -MP -MMD -pipe -m32 -xc -E -P $< -o $@

clean cleanall:
	$(VERBOSE)rm -rf $(NOVA_BUILD_DIR)

vpath %.cpp $(NOVA_SRC_DIR)/src
vpath %.S $(NOVA_SRC_DIR)/src
