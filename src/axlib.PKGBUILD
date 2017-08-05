# A PKGBUILD script for packaging axlib for msys2

_pkgname=axlib

pkgbase=$_pkgname
pkgname=$_pkgname
pkgver=current
pkgrel=1
pkgdesc="Single header libraries for comprising the base Axia framework"
arch=('any')
url="https://github.com/axia-sw/axlib/"
license=('ZLIB')
groups=('devel')
depends=()
makedepends=('git')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=()
source=("${_pkgname}::git+https://github.com/axia-sw/axlib/")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo $(git rev-list --count $(git log -1 --format=%h)).$(git log -1 "--date=format:%Y%m%d" --format=%cd)
}


package() {
	_dstbase=${pkgdir}${MINGW_PREFIX}
	_dstinc="${_dstbase}/include"

	install -d "${_dstinc}"

	cd "${srcdir}/${_pkgname}"
	find include -name '*' -type d -print0 | while IFS= read -r -d $'\0' line; do
		install -d "${_dstbase}/${line}"
	done
	find include -name '*' -type f -print0 | while IFS= read -r -d $'\0' line; do
		install -m755 "$line" -T "${_dstbase}/${line}"
	done
}
