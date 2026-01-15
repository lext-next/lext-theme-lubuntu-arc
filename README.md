# lext-theme-lubuntu-arc
Install the **Lubuntu Arc** *LXQt desktop theme* (as used by Lubuntu) on **Arch Linux**.

### Some screenshots
<p>
  <a href="screenshots/full1.png">
    <img src="screenshots/preview1" width="300">
  </a>
  <a href="screenshots/full2.png">
    <img src="screemshots/preview2.png" width="300">
  </a>
</p>
### Installation
This theme is available on AUR (for Arch Linux): 
```bash
$ yay -S lext-theme-lubuntu-arc
```
#### Arch Linux without AUR helper
If you don't have an AUR helper like *yay* installed:
```bash
$ git clone https://github.com/lext-next/lext-theme-lubuntu-arc
$ cd lext-theme-lubuntu-arc
$ makepkg -si
```
Optionally followed by: 
```bash
$ cd ..
$ rm -Rf lext-theme-lubuntu-arc 
```

### What is this?
This repository is intended for use with AUR (for Arch Linux and derived systems). There is already a package 'lubuntu-artwork' in the AUR that's supposed to install the Lubuntu-Arc theme as well. Mentioned package has a problem (due to that it is no longer being maintained) and can't be used anymore to install the theme (witdout tweaking the PKGBUILD file). Besides it is 'bulky' since it contains all of the artwork (including various large wallpaper files). This package lext-theme-lubuntu-arc contains only what is needed, and is maintained.

The actual *AUR* components (PKGBUILD etc.) are not in this repository, but reside on AUR. 
