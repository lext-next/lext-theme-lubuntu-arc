# lext-theme-lubuntu-arc
Install the **Lubuntu Arc** *LXQt desktop theme* (as used by Lubuntu) on **Arch Linux**.

### Some screenshots
<p>
  <a href="screenshots/full1.png">
    <img src="screenshots/preview1.png" width="450">
  </a>
  &nbsp;&nbsp;&nbsp;
  <a href="screenshots/full2.png">
    <img src="screenshots/preview2.png" width="450">
  </a>
</p>

The screenshots above apply to traditional **X11** server, with the classic ***Application Menu*** widget, and not the very ~~ugly~~ totally different *Fancy Menu* widget. Fortunately, the original menu widget is still available, and easily selected. Even under Wayland. Unfortunately, it renders ~~strangely~~ incorrectly with most Wayland *compositors*. Behaviour with the KDE Plasma compositor is acceptable. 

The samples use ***openbox*** and ***picom***. Openbox is good enough, but easily interchangeable with another X11 window manager. Picom gives nice shades to the windows, and, if desired transparency. I restrict transparency to ***Qterminal*** only, and although *Qterminal* has a setting for that, it may now work some *backends*. In that case *picom* can provide it, although the configuration thereof is a bit ~~complicated~~ tricky. 

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
