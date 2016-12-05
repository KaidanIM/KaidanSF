# path to local compiled swift 3 lib
SWIFT3PATH = ../swift-3.0
# from swift-config
SWIFTCXX = -DSWIFTEN_STATIC -DBOOST_ALL_NO_LIB -DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_SIGNALS_NO_DEPRECATION_WARNING -DSWIFT_EXPERIMENTAL_FT -std=gnu++11
SWIFTLIB = -lSwiften -lSwiften_Boost -lrt -lz -lssl -lcrypto -lxml2 -lresolv -lpthread -ldl -lm -lc -lstdc++


TEMPLATE = app
QT += qml quick core

TARGET = Kaidan

CONFIG += sailfishapp

INCLUDEPATH += $${SWIFT3PATH}/3rdParty/Boost/src
INCLUDEPATH += $${SWIFT3PATH}/

QMAKE_CXXFLAGS += $${SWIFTCXX}
LIBS += -L$${SWIFT3PATH}/Swiften -L$${SWIFT3PATH}/3rdParty/Boost $${SWIFTLIB}

DEFINES += BOOST_SIGNALS_NO_DEPRECATION_WARNING SFOS

OTHER_FILES += qml/Kaidan.qml \
	qml/cover/CoverPage.qml \
	qml/pages/LoginPage.qml \
	qml/pages/RosterPage.qml \
	rpm/Kaidan.spec \
	rpm/Kaidan.yaml \
	translations/*.ts \
	Kaidan.desktop

SOURCES += src/main.cpp \
	src/Kaidan.cpp \
	src/RosterContoller.cpp \
	src/RosterItem.cpp

HEADERS += src/Kaidan.h \
	src/EchoPayload.h \
	src/EchoPayloadParserFactory.h \
	src/EchoPayloadSerializer.h \
	src/RosterContoller.h \
	src/RosterItem.h

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/Kaidan-de.ts
