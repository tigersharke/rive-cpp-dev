PORTNAME=	rive-cpp
DISTVERSION=	g20210706
CATEGORIES=	graphics
PKGNAMESUFFIX=	-dev
DISTNAME=	${PORTNAME}-${GH_TAGNAME}
DIST_SUBDIR=	${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=	nope@nothere
COMMENT=	Portable library for drawing vector-based scenes and animation

LICENSE=	MIT

BUILD_DEPENDS=  premake5:devel/premake5
LIB_DEPENDS=    libthorvg.so:graphics/libthorvg 
USES=		gmake

USE_GITHUB=	nodefault
GH_ACCOUNT=	rive-app
GH_PROJECT=	rive-cpp 
GH_TAGNAME=	24896fd6e16d27182acd2b43055fd5cb9fb14e5b

WRKSRC=	${WRKDIR}/${PORTNAME}-${GH_TAGNAME}

do-configure:
	cd ${WRKSRC}/build && premake5 gmake2

do-build:
	cd ${WRKSRC}/build && ${MAKE_ENV} ${MAKE_CMD} config=release

do-install:
# Applicable files are in ${WRKSRC}/build/bin/release and ${WRKSRC}/build/obj/release

#.include <bsd.port.options.mk>

.include <bsd.port.mk>
