# Axia MSYS2 Package Repository

This is a package repository for [msys2](http://www.msys2.org/).

You can add this repository to your package manager by running the following
command in your msys2 terminal:

```
if ! `cat /etc/pacman.conf | grep "axia-sw" > /dev/null 2>&1`; then
  printf '[axia-sw]\nServer = https://github.com/axia-sw/msys2-packages/releases/download/current/\nSigLevel = PackageOptional' >> /etc/pacman.conf
fi
```

## Local builds

If you don't want to add an external database but want these installed as
packages, then you can clone this repository and run `./build-repo.sh` to
install the locally built packages as side-effects of generating the database.

```
git clone https://github.com/axia-sw/msys2-packages
cd msys2-packages
./build-repo.sh
```

## Available packages

The following packages are provided by this repository:

- [`axlib`](https://github.com/axia-sw/axlib) - Core development framework
  implemented as a series of single-header-libraries.
- [`doll`](https://github.com/axia-sw/Doll) - General purpose 2D game engine
  library.
