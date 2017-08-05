# A PKGBUILD script for packaging Doll for msys2

_pkgname=doll
_buildty=RELEASE
_buildd=build

pkgbase=$_pkgname
pkgname=$_pkgname
pkgver=current
pkgrel=1
pkgdesc="General purpose 2D game engine library"
arch=('x86_64')
url="https://github.com/axia-sw/Doll/"
license=('ZLIB')
groups=('devel')
depends=('axlib' 'msys2-w32api-runtime')
makedepends=('git' 'sed' 'mingw-w64-x86_64-cmake' 'msys2-w32api-headers')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=()
source=("${_pkgname}::git+https://github.com/axia-sw/Doll/")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo $(git rev-list --count $(git log -1 --format=%h)).$(git log -1 "--date=format:%Y%m%d" --format=%cd)
}

build() {
	mkdir -p "${srcdir}/${_buildd}"
	cd "${srcdir}/${_buildd}"

	cmake -DAXLIBDIR="" -DCMAKE_BUILD_TYPE=Release -DDOLL_BUILD_VARIANT=${_buildty} -G "Unix Makefiles" "${srcdir}/${_pkgname}"
	cmake --build .
}

package() {
	_dstbase=${pkgdir}${MINGW_PREFIX}
	_dstinc="${_dstbase}/include"
	_dstlib="${_dstbase}/lib"

	install -d "${_dstinc}"
	install -d "${_dstlib}"

	cd "${srcdir}/${_buildd}"
	install -m755 "$(find . -name 'libDoll*.a')" -T "${_dstlib}/libDoll.a"

	pushd "${srcdir}/${_pkgname}"
	find include -name '*' -type d -print0 | while IFS= read -r -d $'\0' line; do
		install -d "${_dstbase}/${line}"
	done
	find include -name '*' -type f -print0 | while IFS= read -r -d $'\0' line; do
		install -m755 "$line" -T "${_dstbase}/${line}"
	done
	popd
}
