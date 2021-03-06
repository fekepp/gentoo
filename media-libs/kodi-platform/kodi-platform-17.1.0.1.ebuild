# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/xbmc/${PN}.git"
	inherit git-r3
else
	KEYWORDS="~amd64 ~x86"
	GIT_COMMIT="c8188d8"
	SRC_URI="https://github.com/xbmc/${PN}/tarball/${GIT_COMMIT} -> ${P}.tar.gz"
	S="${WORKDIR}/xbmc-kodi-platform-${GIT_COMMIT}"
fi

DESCRIPTION="Kodi platform support library"
HOMEPAGE="https://kodi.tv"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	=media-tv/kodi-17*
	=dev-libs/libplatform-2*
	dev-libs/tinyxml
	"

RDEPEND="${DEPEND}"
