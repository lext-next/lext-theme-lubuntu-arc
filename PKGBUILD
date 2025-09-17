pkgname=lext-theme-lubuntu-arc
pkgdesc="LXQt theme: Lubuntu-Arc (for Lubuntu $upstreampkgver)"           

# Intentionally not following the release and version numbering of Lubuntu
pkgver=1 
pkgrel=1

arch=('any')                                                      
url="https://github.com/lext-next/lext-artwork-lubuntu"                 
license=('GPL')                                                          
depends=('lxqt-session')
conflicts=('lubuntu-artwork' 'lubuntu-artwork-18-04')
source=("https://github.com/lext-next/lext-theme-lubuntu-arc/lext-theme-lubuntu-arc.tar.xz")
                                                                                   
sha256sums=('SKIP')  # for testing; replace with real checksum later                 
                                
package() {

    install -d "$pkgdir/usr/share/lxqt/themes"

    cp -r "$srcdir"/usr "$pkgdir"
}
