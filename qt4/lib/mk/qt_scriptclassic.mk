include $(REP_DIR)/lib/import/import-qt_scriptclassic.mk

SHARED_LIB = yes

# extracted from src/script/Makefile
QT_DEFINES += -DQT_BUILD_SCRIPT_LIB -DQT_NO_USING_NAMESPACE -DQLALR_NO_QSCRIPTGRAMMAR_DEBUG_INFO -DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQ_SCRIPT_DIRECT_CODE -DQT_NO_DEBUG -DQT_CORE_LIB

# use default warning level to avoid noise when compiling contrib code
CC_WARN =

# extracted from src/script/Makefile
SRC_CC = \
         qscriptasm.cpp \
         qscriptast.cpp \
         qscriptastvisitor.cpp \
         qscriptcompiler.cpp \
         qscriptecmaarray.cpp \
         qscriptecmaboolean.cpp \
         qscriptecmacore.cpp \
         qscriptecmadate.cpp \
         qscriptecmafunction.cpp \
         qscriptecmaglobal.cpp \
         qscriptecmamath.cpp \
         qscriptecmanumber.cpp \
         qscriptecmaobject.cpp \
         qscriptecmaregexp.cpp \
         qscriptecmastring.cpp \
         qscriptecmaerror.cpp \
         qscriptcontext_p.cpp \
         qscriptengine.cpp \
         qscriptengine_p.cpp \
         qscriptengineagent.cpp \
         qscriptextenumeration.cpp \
         qscriptextvariant.cpp \
         qscriptcontext.cpp \
         qscriptcontextinfo.cpp \
         qscriptfunction.cpp \
         qscriptgrammar.cpp \
         qscriptlexer.cpp \
         qscriptclassdata.cpp \
         qscriptparser.cpp \
         qscriptprettypretty.cpp \
         qscriptxmlgenerator.cpp \
         qscriptsyntaxchecker.cpp \
         qscriptstring.cpp \
         qscriptclass.cpp \
         qscriptclasspropertyiterator.cpp \
         qscriptvalueiteratorimpl.cpp \
         qscriptvalueiterator.cpp \
         qscriptvalueimpl.cpp \
         qscriptvalue.cpp \
         qscriptextqobject.cpp \
         qscriptable.cpp \
         qscriptextensionplugin.cpp \
         moc_qscriptextensionplugin.cpp

# some source files need to be generated by moc from other source/header files before
# they get #included again by the original source file in the compiling stage

# source files generated from existing header files ("moc_%.cpp: %.h" rule in spec-qt4.mk)
# extracted from "compiler_moc_header_make_all" target
COMPILER_MOC_HEADER_MAKE_ALL_FILES = \
                                     moc_qscriptengine.cpp \
                                     moc_qscriptextensionplugin.cpp

$(subst moc_,,$(COMPILER_MOC_HEADER_MAKE_ALL_FILES:.cpp=.o)) : $(COMPILER_MOC_HEADER_MAKE_ALL_FILES)

# source files generated from existing source files ("%.moc: %.cpp" rule in spec-qt4.mk)
# extracted from "compiler_moc_source_make_all" rule
COMPILER_MOC_SOURCE_MAKE_ALL_FILES = \
                                     qscriptextqobject.moc

$(COMPILER_MOC_SOURCE_MAKE_ALL_FILES:.moc=.o) : $(COMPILER_MOC_SOURCE_MAKE_ALL_FILES)

INC_DIR += $(REP_DIR)/src/lib/qt4/mkspecs/qws/genode-x86-g++ \
           $(REP_DIR)/include/qt4 \
           $(REP_DIR)/contrib/include \
           $(REP_DIR)/include/qt4/QtCore \
           $(REP_DIR)/contrib/include/QtCore \
           $(REP_DIR)/include/qt4/QtCore/private \
           $(REP_DIR)/contrib/include/QtCore/private \
           $(REP_DIR)/include/qt4/QtScript \
           $(REP_DIR)/contrib/qtscriptclassic-1.0_1-opensource/include/QtScript \
           $(REP_DIR)/contrib/qtscriptclassic-1.0_1-opensource/src \
           $(REP_DIR)/src/lib/qt4/src/corelib/global

LIBS += qt_core libc

vpath % $(REP_DIR)/include/qt4/QtScript
vpath % $(REP_DIR)/include/qt4/QtScript/private

vpath % $(REP_DIR)/src/lib/qt4/src/script

vpath % $(REP_DIR)/contrib/qtscriptclassic-1.0_1-opensource/src
