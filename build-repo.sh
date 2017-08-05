if [ -e staging ]; then
	rm -rf staging
fi
mkdir -p staging/build
mkdir -p staging/distribution

package_repo() {
	mkdir -p "staging/build/$1"
	rm -rf "staging/build/$1/./*"
	cp "src/$1.PKGBUILD" "staging/build/$1/PKGBUILD"

	pushd "staging/build/$1"
	makepkg -i
	popd
	find "staging/build/$1" -name '*.pkg.tar.xz' -type f -print0 | while IFS= read -r -d $'\0' line; do
		cp "$line" "staging/distribution/"
	done
}
add_package_to_db() {
	find "staging/build/$1" -name '*.pkg.tar.xz' -type f -print0 | while IFS= read -r -d $'\0' line; do
		repo-add staging/distribution/axia-sw.db.tar.gz $line
	done
}

packages=("axlib" "doll")

for pkg in ${packages[@]}; do
	echo "Packaging: $pkg..."
	package_repo "$pkg"
done

echo "Creating repository..."
repo-add staging/distribution/axia-sw.db.tar.gz staging/distribution/*.pkg.tar.xz
