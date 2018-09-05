# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Sound card based multimode software modem for Amateur Radio use"
HOMEPAGE="http://www.w1hkj.com"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="hamlib nls pulseaudio"
IUSE_CPU_FLAGS=" sse sse2 sse3"
IUSE+=" ${IUSE_CPU_FLAGS// / cpu_flags_x86_}"

RDEPEND="x11-libs/fltk:1[threads,xft]
	media-libs/libsamplerate
	media-libs/libpng:0
	x11-misc/xdg-utils
	dev-perl/RPC-XML
	dev-perl/Term-ReadLine-Perl
	|| (
		media-libs/portaudio[oss]
		media-libs/portaudio[alsa]
	)
	hamlib? ( media-libs/hamlib )
	pulseaudio? ( media-sound/pulseaudio )
	>=media-libs/libsndfile-1.0.10"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog NEWS README )

PATCHES=( "$FILESDIR"/$PN-c++11.patch )

src_configure() {
	econf --with-sndfile \
		$(use_with hamlib) \
		$(use_enable nls) \
		$(use_with pulseaudio) \
		$(use_enable cpu_flags_x86_sse optimizations sse) \
		$(use_enable cpu_flags_x86_sse2 optimizations sse2) \
		$(use_enable cpu_flags_x86_sse3 optimizations sse3) \
		--without-asciidoc
}