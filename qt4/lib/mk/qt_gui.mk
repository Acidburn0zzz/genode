include $(REP_DIR)/lib/import/import-qt_gui.mk

SHARED_LIB = yes

# extracted from src/gui/Makefile
QT_DEFINES += -DQT_BUILD_GUI_LIB -DQT_NO_USING_NAMESPACE -DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_USE_FAST_OPERATOR_PLUS -DQT_USE_FAST_CONCATENATION -DQT_NO_FONTCONFIG -DQT_NO_OPENTYPE -DQT_NO_STYLE_MAC -DQT_NO_STYLE_WINDOWSVISTA -DQT_NO_STYLE_WINDOWSXP -DQT_NO_STYLE_GTK -DQT_NO_STYLE_WINDOWSCE -DQT_NO_STYLE_WINDOWSMOBILE -DQT_NO_STYLE_S60 -DQ_INTERNAL_QAPP_SRC -DQT_NO_DEBUG -DQT_CORE_LIB
QT_DEFINES += -DQT_NO_QWS_SIGNALHANDLER

# use default warning level to avoid noise when compiling contrib code
CC_WARN = -Wno-unused-but-set-variable -Wno-deprecated-declarations

# extracted from src/gui/Makefile
SRC_CC = \
         qsoundqss_qws.cpp \
         qcopchannel_qws.cpp \
         qdecoration_qws.cpp \
         qdecorationfactory_qws.cpp \
         qdecorationplugin_qws.cpp \
         qdirectpainter_qws.cpp \
         qlock.cpp \
         qscreen_qws.cpp \
         qscreenmulti_qws.cpp \
         qscreenproxy_qws.cpp \
         qwindowsystem_qws.cpp \
         qwscommand_qws.cpp \
         qwscursor_qws.cpp \
         qwsevent_qws.cpp \
         qwsmanager_qws.cpp \
         qwsproperty_qws.cpp \
         qtransportauth_qws.cpp \
         qwslock.cpp \
         qwssharedmemory.cpp \
         qwssocket_qws.cpp \
         qwssignalhandler.cpp \
         qwsembedwidget.cpp \
         qdecorationdefault_qws.cpp \
         qdecorationstyled_qws.cpp \
         qdecorationwindows_qws.cpp \
         qscreendriverplugin_qws.cpp \
         qscreendriverfactory_qws.cpp \
         qkbd_qws.cpp \
         qkbddriverplugin_qws.cpp \
         qkbddriverfactory_qws.cpp \
         qmouse_qws.cpp \
         qmousedriverplugin_qws.cpp \
         qmousedriverfactory_qws.cpp \
         qguivariantanimation.cpp \
         qaction.cpp \
         qactiongroup.cpp \
         qapplication.cpp \
         qboxlayout.cpp \
         qclipboard.cpp \
         qcursor.cpp \
         qdrag.cpp \
         qdnd.cpp \
         qevent.cpp \
         qformlayout.cpp \
         qgridlayout.cpp \
         qkeysequence.cpp \
         qlayout.cpp \
         qlayoutengine.cpp \
         qlayoutitem.cpp \
         qmime.cpp \
         qpalette.cpp \
         qshortcut.cpp \
         qshortcutmap.cpp \
         qsound.cpp \
         qstackedlayout.cpp \
         qtooltip.cpp \
         qguivariant.cpp \
         qwhatsthis.cpp \
         qwidget.cpp \
         qwidgetaction.cpp \
         qkeymapper.cpp \
         qgesture.cpp \
         qstandardgestures.cpp \
         qgesturerecognizer.cpp \
         qgesturemanager.cpp \
         qsoftkeymanager.cpp \
         qdesktopwidget.cpp \
         qguiplatformplugin.cpp \
         qapplication_qws.cpp \
         qclipboard_qws.cpp \
         qcursor_qws.cpp \
         qdesktopwidget_qws.cpp \
         qdnd_qws.cpp \
         qeventdispatcher_qws.cpp \
         qsound_qws.cpp \
         qwidget_qws.cpp \
         qkeymapper_qws.cpp \
         qsessionmanager_qws.cpp \
         qbitmap.cpp \
         qicon.cpp \
         qiconloader.cpp \
         qimage.cpp \
         qimageiohandler.cpp \
         qimagereader.cpp \
         qimagewriter.cpp \
         qpaintengine_pic.cpp \
         qpicture.cpp \
         qpictureformatplugin.cpp \
         qpixmap.cpp \
         qpixmapcache.cpp \
         qpixmapdata.cpp \
         qpixmapdatafactory.cpp \
         qpixmapfilter.cpp \
         qiconengine.cpp \
         qiconengineplugin.cpp \
         qmovie.cpp \
         qpixmap_raster.cpp \
         qnativeimage.cpp \
         qimagepixmapcleanuphooks.cpp \
         qpixmap_qws.cpp \
         qbmphandler.cpp \
         qppmhandler.cpp \
         qxbmhandler.cpp \
         qxpmhandler.cpp \
         qpnghandler.cpp \
         qbezier.cpp \
         qblendfunctions.cpp \
         qbrush.cpp \
         qcolor.cpp \
         qcolor_p.cpp \
         qcssutil.cpp \
         qdrawutil.cpp \
         qemulationpaintengine.cpp \
         qgraphicssystem.cpp \
         qmatrix.cpp \
         qmemrotate.cpp \
         qoutlinemapper.cpp \
         qpaintdevice.cpp \
         qpaintengine.cpp \
         qpaintengine_alpha.cpp \
         qpaintengine_preview.cpp \
         qpaintengineex.cpp \
         qpainter.cpp \
         qpainterpath.cpp \
         qpathclipper.cpp \
         qpdf.cpp \
         qpen.cpp \
         qpolygon.cpp \
         qprintengine_pdf.cpp \
         qprintengine_ps.cpp \
         qprinter.cpp \
         qrasterizer.cpp \
         qregion.cpp \
         qstroker.cpp \
         qstylepainter.cpp \
         qtessellator.cpp \
         qtextureglyphcache.cpp \
         qtransform.cpp \
         qwindowsurface.cpp \
         qpaintbuffer.cpp \
         qpaintengine_raster.cpp \
         qdrawhelper.cpp \
         qimagescale.cpp \
         qgrayraster.c \
         qgraphicssystem_qws.cpp \
         qprinterinfo_unix.cpp \
         qbackingstore.cpp \
         qcolormap_qws.cpp \
         qpaintdevice_qws.cpp \
         qcups.cpp \
         qwindowsurface_qws.cpp \
         qfont.cpp \
         qfontengine.cpp \
         qfontsubset.cpp \
         qfontmetrics.cpp \
         qfontdatabase.cpp \
         qtextcontrol.cpp \
         qtextengine.cpp \
         qtextlayout.cpp \
         qtextformat.cpp \
         qtextobject.cpp \
         qtextoption.cpp \
         qfragmentmap.cpp \
         qtextdocument.cpp \
         qtextdocument_p.cpp \
         qtexthtmlparser.cpp \
         qabstracttextdocumentlayout.cpp \
         qtextdocumentlayout.cpp \
         qtextcursor.cpp \
         qtextdocumentfragment.cpp \
         qtextimagehandler.cpp \
         qtexttable.cpp \
         qtextlist.cpp \
         qtextdocumentwriter.cpp \
         qsyntaxhighlighter.cpp \
         qcssparser.cpp \
         qzip.cpp \
         qtextodfwriter.cpp \
         qstatictext.cpp \
         qfont_qws.cpp \
         qfontengine_qws.cpp \
         qfontengine_ft.cpp \
         qfontengine_qpf.cpp \
         qabstractfontengine_qws.cpp \
         qstyle.cpp \
         qstylefactory.cpp \
         qstyleoption.cpp \
         qstyleplugin.cpp \
         qstylehelper.cpp \
         qcommonstyle.cpp \
         qproxystyle.cpp \
         qstylesheetstyle.cpp \
         qstylesheetstyle_default.cpp \
         qcdestyle.cpp \
         qplastiquestyle.cpp \
         qcleanlooksstyle.cpp \
         qwindowsstyle.cpp \
         qmotifstyle.cpp \
         qabstractbutton.cpp \
         qabstractslider.cpp \
         qabstractspinbox.cpp \
         qcalendarwidget.cpp \
         qcheckbox.cpp \
         qcombobox.cpp \
         qcommandlinkbutton.cpp \
         qdatetimeedit.cpp \
         qdial.cpp \
         qdialogbuttonbox.cpp \
         qdockwidget.cpp \
         qdockarealayout.cpp \
         qeffects.cpp \
         qfontcombobox.cpp \
         qframe.cpp \
         qgroupbox.cpp \
         qlabel.cpp \
         qlcdnumber.cpp \
         qlineedit_p.cpp \
         qlineedit.cpp \
         qlinecontrol.cpp \
         qmainwindow.cpp \
         qmainwindowlayout.cpp \
         qmdiarea.cpp \
         qmdisubwindow.cpp \
         qmenu.cpp \
         qmenubar.cpp \
         qmenudata.cpp \
         qprogressbar.cpp \
         qpushbutton.cpp \
         qradiobutton.cpp \
         qrubberband.cpp \
         qscrollbar.cpp \
         qsizegrip.cpp \
         qslider.cpp \
         qspinbox.cpp \
         qsplashscreen.cpp \
         qsplitter.cpp \
         qstackedwidget.cpp \
         qstatusbar.cpp \
         qtabbar.cpp \
         qtabwidget.cpp \
         qtextedit.cpp \
         qtextbrowser.cpp \
         qtoolbar.cpp \
         qtoolbarlayout.cpp \
         qtoolbarextension.cpp \
         qtoolbarseparator.cpp \
         qtoolbox.cpp \
         qtoolbutton.cpp \
         qvalidator.cpp \
         qabstractscrollarea.cpp \
         qwidgetresizehandler.cpp \
         qfocusframe.cpp \
         qscrollarea.cpp \
         qworkspace.cpp \
         qwidgetanimator.cpp \
         qtoolbararealayout.cpp \
         qplaintextedit.cpp \
         qprintpreviewwidget.cpp \
         qprintdialog_unix.cpp \
         qpagesetupdialog_unix.cpp \
         qabstractprintdialog.cpp \
         qabstractpagesetupdialog.cpp \
         qcolordialog.cpp \
         qdialog.cpp \
         qerrormessage.cpp \
         qfiledialog.cpp \
         qfontdialog.cpp \
         qinputdialog.cpp \
         qmessagebox.cpp \
         qprogressdialog.cpp \
         qsidebar.cpp \
         qfilesystemmodel.cpp \
         qfileinfogatherer.cpp \
         qpagesetupdialog.cpp \
         qwizard.cpp \
         qprintpreviewdialog.cpp \
         qabstractitemview.cpp \
         qheaderview.cpp \
         qlistview.cpp \
         qbsptree.cpp \
         qtableview.cpp \
         qtreeview.cpp \
         qabstractitemdelegate.cpp \
         qitemdelegate.cpp \
         qitemselectionmodel.cpp \
         qdirmodel.cpp \
         qlistwidget.cpp \
         qtablewidget.cpp \
         qtreewidget.cpp \
         qproxymodel.cpp \
         qabstractproxymodel.cpp \
         qsortfilterproxymodel.cpp \
         qitemeditorfactory.cpp \
         qstandarditemmodel.cpp \
         qstringlistmodel.cpp \
         qtreewidgetitemiterator.cpp \
         qdatawidgetmapper.cpp \
         qfileiconprovider.cpp \
         qcolumnview.cpp \
         qcolumnviewgrip.cpp \
         qstyleditemdelegate.cpp \
         qinputcontextfactory.cpp \
         qinputcontextplugin.cpp \
         qinputcontext.cpp \
         qwsinputcontext_qws.cpp \
         qgraphicsgridlayout.cpp \
         qgraphicsitem.cpp \
         qgraphicsitemanimation.cpp \
         qgraphicslayout.cpp \
         qgraphicslayout_p.cpp \
         qgraphicslayoutitem.cpp \
         qgraphicslinearlayout.cpp \
         qgraphicsproxywidget.cpp \
         qgraphicsscene.cpp \
         qgraphicsscene_bsp.cpp \
         qgraphicsscenebsptreeindex.cpp \
         qgraphicssceneevent.cpp \
         qgraphicssceneindex.cpp \
         qgraphicsscenelinearindex.cpp \
         qgraphicstransform.cpp \
         qgraphicsview.cpp \
         qgraphicswidget.cpp \
         qgraphicswidget_p.cpp \
         qgridlayoutengine.cpp \
         qsimplex_p.cpp \
         qgraphicsanchorlayout_p.cpp \
         qgraphicsanchorlayout.cpp \
         qsystemtrayicon.cpp \
         qcompleter.cpp \
         qdesktopservices.cpp \
         qundogroup.cpp \
         qundostack.cpp \
         qundoview.cpp \
         qsystemtrayicon_qws.cpp \
         qguistatemachine.cpp \
         qkeyeventtransition.cpp \
         qmouseeventtransition.cpp \
         qbasickeyeventtransition.cpp \
         qbasicmouseeventtransition.cpp \
         qgenericmatrix.cpp \
         qmatrix4x4.cpp \
         qquaternion.cpp \
         qvector2d.cpp \
         qvector3d.cpp \
         qvector4d.cpp \
         qgraphicseffect.cpp \
         moc_qdecorationplugin_qws.cpp \
         moc_qdirectpainter_qws.cpp \
         moc_qwsmanager_qws.cpp \
         moc_qwsembedwidget.cpp \
         moc_qscreendriverplugin_qws.cpp \
         moc_qkbddriverplugin_qws.cpp \
         moc_qmousedriverplugin_qws.cpp \
         moc_qboxlayout.cpp \
         moc_qclipboard.cpp \
         moc_qdesktopwidget.cpp \
         moc_qdrag.cpp \
         moc_qdnd_p.cpp \
         moc_qformlayout.cpp \
         moc_qgridlayout.cpp \
         moc_qlayout.cpp \
         moc_qshortcut.cpp \
         moc_qsizepolicy.cpp \
         moc_qpalette.cpp \
         moc_qstackedlayout.cpp \
         moc_qkeymapper_p.cpp \
         moc_qsoftkeymanager_p.cpp \
         moc_qguiplatformplugin_p.cpp \
         moc_qeventdispatcher_qws_p.cpp \
         moc_qiconengineplugin.cpp \
         moc_qimageiohandler.cpp \
         moc_qpictureformatplugin.cpp \
         moc_qpixmapfilter_p.cpp \
         moc_qbrush.cpp \
         moc_qpainter.cpp \
         moc_qpaintbuffer_p.cpp \
         moc_qfont.cpp \
         moc_qfontdatabase.cpp \
         moc_qfont_p.cpp \
         moc_qtextformat.cpp \
         moc_qtextobject.cpp \
         moc_qtextdocument.cpp \
         moc_qtextimagehandler_p.cpp \
         moc_qtexttable.cpp \
         moc_qtextlist.cpp \
         moc_qabstractfontengine_qws.cpp \
         moc_qabstractfontengine_p.cpp \
         moc_qstyle.cpp \
         moc_qstyleplugin.cpp \
         moc_qcommonstyle.cpp \
         moc_qproxystyle.cpp \
         moc_qcdestyle.cpp \
         moc_qplastiquestyle.cpp \
         moc_qcleanlooksstyle.cpp \
         moc_qwindowsstyle.cpp \
         moc_qmotifstyle.cpp \
         moc_qbuttongroup.cpp \
         moc_qabstractbutton.cpp \
         moc_qabstractslider.cpp \
         moc_qcalendartextnavigator_p.cpp \
         moc_qcheckbox.cpp \
         moc_qcombobox_p.cpp \
         moc_qcommandlinkbutton.cpp \
         moc_qdatetimeedit_p.cpp \
         moc_qdial.cpp \
         moc_qdockwidget_p.cpp \
         moc_qframe.cpp \
         moc_qlcdnumber.cpp \
         moc_qlinecontrol_p.cpp \
         moc_qmainwindow.cpp \
         moc_qmainwindowlayout_p.cpp \
         moc_qprogressbar.cpp \
         moc_qradiobutton.cpp \
         moc_qrubberband.cpp \
         moc_qscrollbar.cpp \
         moc_qslider.cpp \
         moc_qspinbox.cpp \
         moc_qsplashscreen.cpp \
         moc_qsplitter.cpp \
         moc_qstackedwidget.cpp \
         moc_qstatusbar.cpp \
         moc_qtabbar_p.cpp \
         moc_qtoolbarlayout_p.cpp \
         moc_qtoolbarextension_p.cpp \
         moc_qtoolbarseparator_p.cpp \
         moc_qvalidator.cpp \
         moc_qwidgetresizehandler_p.cpp \
         moc_qfocusframe.cpp \
         moc_qscrollarea.cpp \
         moc_qwidgetanimator_p.cpp \
         moc_qerrormessage.cpp \
         moc_qsidebar_p.cpp \
         moc_qfileinfogatherer_p.cpp \
         moc_qlistview.cpp \
         moc_qabstractitemdelegate.cpp \
         moc_qlistwidget_p.cpp \
         moc_qtablewidget_p.cpp \
         moc_qtreewidget_p.cpp \
         moc_qitemeditorfactory_p.cpp \
         moc_qstringlistmodel.cpp \
         moc_qcolumnviewgrip_p.cpp \
         moc_qinputcontextplugin.cpp \
         moc_qinputcontext.cpp \
         moc_qwsinputcontext_p.cpp \
         moc_qgraphicsitemanimation.cpp \
         moc_qgraphicsscenelinearindex_p.cpp \
         moc_qgraphicswidget.cpp \
         moc_qgraphicsanchorlayout.cpp \
         moc_qsystemtrayicon.cpp \
         moc_qcompleter_p.cpp \
         moc_qsystemtrayicon_p.cpp \
         moc_qundogroup.cpp \
         moc_qundostack.cpp \
         moc_qundostack_p.cpp \
         moc_qundoview.cpp \
         moc_qkeyeventtransition.cpp \
         moc_qmouseeventtransition.cpp \
         moc_qbasickeyeventtransition_p.cpp \
         moc_qbasicmouseeventtransition_p.cpp \
         moc_qgraphicseffect.cpp \
         moc_qgraphicseffect_p.cpp \
         qrc_qstyle.cpp \
         qrc_qmessagebox.cpp

# add Genode-specific sources
SRC_CC += qkbdpc101_qws.cpp \
          qwindowsurface_nitpicker_qws.cpp \
          moc_qwindowsurface_nitpicker_qws_p.cpp \
          qscreennitpicker_qws.cpp \
          qmousenitpicker_qws.cpp \
          qkbdnitpicker_qws.cpp \
          qinputnitpicker_qws.cpp \
          moc_qinputnitpicker_qws.cpp

# some source files need to be generated by moc from other source/header files before
# they get #included again by the original source file in the compiling stage

# source files generated from header files ("moc_%.cpp: %.h" rule in spec-qt4.mk)
# extracted from "compiler_moc_header_make_all" target
COMPILER_MOC_HEADER_MAKE_ALL_FILES = \
                                     moc_qdecorationplugin_qws.cpp \
                                     moc_qdirectpainter_qws.cpp \
                                     moc_qwindowsystem_qws.cpp \
                                     moc_qwsmanager_qws.cpp \
                                     moc_qwsembedwidget.cpp \
                                     moc_qscreendriverplugin_qws.cpp \
                                     moc_qkbddriverplugin_qws.cpp \
                                     moc_qmousedriverplugin_qws.cpp \
                                     moc_qaction.cpp \
                                     moc_qactiongroup.cpp \
                                     moc_qapplication.cpp \
                                     moc_qboxlayout.cpp \
                                     moc_qclipboard.cpp \
                                     moc_qdesktopwidget.cpp \
                                     moc_qdrag.cpp \
                                     moc_qdnd_p.cpp \
                                     moc_qformlayout.cpp \
                                     moc_qgridlayout.cpp \
                                     moc_qlayout.cpp \
                                     moc_qshortcut.cpp \
                                     moc_qsizepolicy.cpp \
                                     moc_qpalette.cpp \
                                     moc_qstackedlayout.cpp \
                                     moc_qwidget.cpp \
                                     moc_qwidgetaction.cpp \
                                     moc_qkeymapper_p.cpp \
                                     moc_qgesture.cpp \
                                     moc_qgesturemanager_p.cpp \
                                     moc_qsoftkeymanager_p.cpp \
                                     moc_qguiplatformplugin_p.cpp \
                                     moc_qeventdispatcher_qws_p.cpp \
                                     moc_qiconengineplugin.cpp \
                                     moc_qimageiohandler.cpp \
                                     moc_qmovie.cpp \
                                     moc_qpictureformatplugin.cpp \
                                     moc_qpixmapfilter_p.cpp \
                                     moc_qbrush.cpp \
                                     moc_qpainter.cpp \
                                     moc_qpaintbuffer_p.cpp \
                                     moc_qfont.cpp \
                                     moc_qfontdatabase.cpp \
                                     moc_qfont_p.cpp \
                                     moc_qtextcontrol_p.cpp \
                                     moc_qtextformat.cpp \
                                     moc_qtextobject.cpp \
                                     moc_qtextdocument.cpp \
                                     moc_qabstracttextdocumentlayout.cpp \
                                     moc_qtextdocumentlayout_p.cpp \
                                     moc_qtextimagehandler_p.cpp \
                                     moc_qtexttable.cpp \
                                     moc_qtextlist.cpp \
                                     moc_qsyntaxhighlighter.cpp \
                                     moc_qabstractfontengine_qws.cpp \
                                     moc_qabstractfontengine_p.cpp \
                                     moc_qstyle.cpp \
                                     moc_qstyleplugin.cpp \
                                     moc_qcommonstyle.cpp \
                                     moc_qproxystyle.cpp \
                                     moc_qstylesheetstyle_p.cpp \
                                     moc_qcdestyle.cpp \
                                     moc_qplastiquestyle.cpp \
                                     moc_qcleanlooksstyle.cpp \
                                     moc_qwindowsstyle.cpp \
                                     moc_qmotifstyle.cpp \
                                     moc_qbuttongroup.cpp \
                                     moc_qabstractbutton.cpp \
                                     moc_qabstractslider.cpp \
                                     moc_qabstractspinbox.cpp \
                                     moc_qcalendartextnavigator_p.cpp \
                                     moc_qcalendarwidget.cpp \
                                     moc_qcheckbox.cpp \
                                     moc_qcombobox.cpp \
                                     moc_qcombobox_p.cpp \
                                     moc_qcommandlinkbutton.cpp \
                                     moc_qdatetimeedit.cpp \
                                     moc_qdatetimeedit_p.cpp \
                                     moc_qdial.cpp \
                                     moc_qdialogbuttonbox.cpp \
                                     moc_qdockwidget.cpp \
                                     moc_qdockwidget_p.cpp \
                                     moc_qfontcombobox.cpp \
                                     moc_qframe.cpp \
                                     moc_qgroupbox.cpp \
                                     moc_qlabel.cpp \
                                     moc_qlcdnumber.cpp \
                                     moc_qlineedit.cpp \
                                     moc_qlinecontrol_p.cpp \
                                     moc_qmainwindow.cpp \
                                     moc_qmainwindowlayout_p.cpp \
                                     moc_qmdiarea.cpp \
                                     moc_qmdisubwindow.cpp \
                                     moc_qmenu.cpp \
                                     moc_qmenubar.cpp \
                                     moc_qprogressbar.cpp \
                                     moc_qpushbutton.cpp \
                                     moc_qradiobutton.cpp \
                                     moc_qrubberband.cpp \
                                     moc_qscrollbar.cpp \
                                     moc_qsizegrip.cpp \
                                     moc_qslider.cpp \
                                     moc_qspinbox.cpp \
                                     moc_qsplashscreen.cpp \
                                     moc_qsplitter.cpp \
                                     moc_qstackedwidget.cpp \
                                     moc_qstatusbar.cpp \
                                     moc_qtabbar.cpp \
                                     moc_qtabbar_p.cpp \
                                     moc_qtabwidget.cpp \
                                     moc_qtextedit.cpp \
                                     moc_qtextbrowser.cpp \
                                     moc_qtoolbar.cpp \
                                     moc_qtoolbarlayout_p.cpp \
                                     moc_qtoolbarextension_p.cpp \
                                     moc_qtoolbarseparator_p.cpp \
                                     moc_qtoolbox.cpp \
                                     moc_qtoolbutton.cpp \
                                     moc_qvalidator.cpp \
                                     moc_qabstractscrollarea.cpp \
                                     moc_qabstractscrollarea_p.cpp \
                                     moc_qwidgetresizehandler_p.cpp \
                                     moc_qfocusframe.cpp \
                                     moc_qscrollarea.cpp \
                                     moc_qworkspace.cpp \
                                     moc_qwidgetanimator_p.cpp \
                                     moc_qplaintextedit.cpp \
                                     moc_qplaintextedit_p.cpp \
                                     moc_qcolordialog.cpp \
                                     moc_qdialog.cpp \
                                     moc_qerrormessage.cpp \
                                     moc_qfiledialog.cpp \
                                     moc_qfontdialog.cpp \
                                     moc_qinputdialog.cpp \
                                     moc_qmessagebox.cpp \
                                     moc_qprogressdialog.cpp \
                                     moc_qsidebar_p.cpp \
                                     moc_qfilesystemmodel.cpp \
                                     moc_qfileinfogatherer_p.cpp \
                                     moc_qwizard.cpp \
                                     moc_qabstractitemview.cpp \
                                     moc_qheaderview.cpp \
                                     moc_qlistview.cpp \
                                     moc_qtableview.cpp \
                                     moc_qtreeview.cpp \
                                     moc_qabstractitemdelegate.cpp \
                                     moc_qitemdelegate.cpp \
                                     moc_qitemselectionmodel.cpp \
                                     moc_qdirmodel.cpp \
                                     moc_qlistwidget.cpp \
                                     moc_qlistwidget_p.cpp \
                                     moc_qtablewidget.cpp \
                                     moc_qtablewidget_p.cpp \
                                     moc_qtreewidget.cpp \
                                     moc_qtreewidget_p.cpp \
                                     moc_qproxymodel.cpp \
                                     moc_qabstractproxymodel.cpp \
                                     moc_qsortfilterproxymodel.cpp \
                                     moc_qitemeditorfactory_p.cpp \
                                     moc_qstandarditemmodel.cpp \
                                     moc_qstringlistmodel.cpp \
                                     moc_qdatawidgetmapper.cpp \
                                     moc_qcolumnviewgrip_p.cpp \
                                     moc_qcolumnview.cpp \
                                     moc_qstyleditemdelegate.cpp \
                                     moc_qinputcontextplugin.cpp \
                                     moc_qinputcontext.cpp \
                                     moc_qwsinputcontext_p.cpp \
                                     moc_qgraphicsitem.cpp \
                                     moc_qgraphicsitemanimation.cpp \
                                     moc_qgraphicsproxywidget.cpp \
                                     moc_qgraphicsscene.cpp \
                                     moc_qgraphicsscenebsptreeindex_p.cpp \
                                     moc_qgraphicssceneindex_p.cpp \
                                     moc_qgraphicsscenelinearindex_p.cpp \
                                     moc_qgraphicstransform.cpp \
                                     moc_qgraphicsview.cpp \
                                     moc_qgraphicswidget.cpp \
                                     moc_qgraphicsanchorlayout.cpp \
                                     moc_qsystemtrayicon.cpp \
                                     moc_qcompleter.cpp \
                                     moc_qcompleter_p.cpp \
                                     moc_qsystemtrayicon_p.cpp \
                                     moc_qundogroup.cpp \
                                     moc_qundostack.cpp \
                                     moc_qundostack_p.cpp \
                                     moc_qundoview.cpp \
                                     moc_qkeyeventtransition.cpp \
                                     moc_qmouseeventtransition.cpp \
                                     moc_qbasickeyeventtransition_p.cpp \
                                     moc_qbasicmouseeventtransition_p.cpp \
                                     moc_qgraphicseffect.cpp \
                                     moc_qgraphicseffect_p.cpp

$(subst moc_,,$(COMPILER_MOC_HEADER_MAKE_ALL_FILES:.cpp=.o)) : $(COMPILER_MOC_HEADER_MAKE_ALL_FILES)

# source files generated from source files ("%.moc: %.cpp" rule in spec-qt4.mk)
# extracted from "compiler_moc_source_make_all" target
COMPILER_MOC_SOURCE_MAKE_ALL_FILES = \
                                     qkbd_qws.moc \
                                     qtooltip.moc \
                                     qwhatsthis.moc \
                                     qpixmapcache.moc \
                                     qcalendarwidget.moc \
                                     qdockwidget.moc \
                                     qeffects.moc \
                                     qfontcombobox.moc \
                                     qmdisubwindow.moc \
                                     qmenu.moc \
                                     qtoolbox.moc \
                                     qworkspace.moc \
                                     qcolordialog.moc \
                                     qfontdialog.moc \
                                     qinputdialog.moc \
                                     qtableview.moc \
                                     qlistwidget.moc \
                                     qitemeditorfactory.moc \
                                     qdesktopservices.moc \
                                     qundoview.moc

$(COMPILER_MOC_SOURCE_MAKE_ALL_FILES:.moc=.o) : $(COMPILER_MOC_SOURCE_MAKE_ALL_FILES)

# UI headers
qfiledialog.o: ui_qfiledialog.h

INC_DIR += $(REP_DIR)/src/lib/qt4/mkspecs/qws/genode-x86-g++ \
           $(REP_DIR)/include/qt4/QtCore/private \
           $(REP_DIR)/contrib/$(QT4)/include/QtCore/private \
           $(REP_DIR)/include/qt4/QtGui/private \
           $(REP_DIR)/contrib/$(QT4)/include/QtGui/private \
           $(REP_DIR)/src/lib/qt4/src/corelib/global \
           $(REP_DIR)/contrib/$(QT4)/src/corelib/codecs \
           $(REP_DIR)/contrib/$(QT4)/src/3rdparty/harfbuzz/src \
           $(REP_DIR)/contrib/$(QT4)/src/gui/dialogs

LIBS += qt_core libpng zlib libc libm freetype

vpath % $(REP_DIR)/include/qt4/QtGui
vpath % $(REP_DIR)/include/qt4/QtGui/private

vpath % $(REP_DIR)/src/lib/qt4/src/gui/embedded
vpath % $(REP_DIR)/src/lib/qt4/src/gui/animation
vpath % $(REP_DIR)/src/lib/qt4/src/gui/effects
vpath % $(REP_DIR)/src/lib/qt4/src/gui/kernel
vpath % $(REP_DIR)/src/lib/qt4/src/gui/image
vpath % $(REP_DIR)/src/lib/qt4/src/gui/painting
vpath % $(REP_DIR)/src/lib/qt4/src/gui/text
vpath % $(REP_DIR)/src/lib/qt4/src/gui/styles
vpath % $(REP_DIR)/src/lib/qt4/src/gui/widgets
vpath % $(REP_DIR)/src/lib/qt4/src/gui/dialogs
vpath % $(REP_DIR)/src/lib/qt4/src/gui/accessible
vpath % $(REP_DIR)/src/lib/qt4/src/gui/itemviews
vpath % $(REP_DIR)/src/lib/qt4/src/gui/inputmethod
vpath % $(REP_DIR)/src/lib/qt4/src/gui/graphicsview
vpath % $(REP_DIR)/src/lib/qt4/src/gui/util
vpath % $(REP_DIR)/src/lib/qt4/src/gui/statemachine
vpath % $(REP_DIR)/src/lib/qt4/src/gui/math3d


vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/embedded
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/animation
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/effects
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/kernel
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/image
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/painting
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/text
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/styles
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/widgets
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/dialogs
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/accessible
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/itemviews
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/inputmethod
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/graphicsview
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/util
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/statemachine
vpath % $(REP_DIR)/contrib/$(QT4)/src/gui/math3d
