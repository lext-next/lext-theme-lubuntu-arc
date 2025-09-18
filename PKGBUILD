# Maintainer: Frtz Qe <nextlxqt@gmail.com>

pkgname=lext-theme-lubuntu-arc
upstreampkgver="25.10-2"
pkgdesc="LXQt theme: Lubuntu-Arc (from Lubuntu $upstreampkgver)"

# Intentionally not following the release and version numbering of Lubuntu
pkgver=1
pkgrel=1

arch=('any')
url="https://github.com/lext-next/lext-theme-lubuntu-arc"
license=('GPL-2.0')

depends=('lxqt-session')
conflicts=('lubuntu-artwork' 'lubuntu-artwork-18-04')
source=("https://github.com/lext-next/lext-theme-lubuntu-arc/raw/refs/heads/main/lext-theme-lubuntu-arc.tar.xz")

sha256sums=('SKIP')  # for testing; replace with real checksum later

package() {

    install -d "$pkgdir/usr/share/lxqt/themes"

    cp -r "$srcdir"/usr "$pkgdir"
}
