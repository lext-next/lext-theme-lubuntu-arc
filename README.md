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
This repository is intended for use with AUR (for Arch Linux and derived systems). There is already a package 'lubuntu-artwork' in the AUR that's supposed to install the Lubuntu-Arc theme as well. Mentioned package has a problem. If the LXQt team publishes a new version, installation on Arch Linux fails until *moi* fix the *PKGBUILD* file. Besides it is 'bulky' since it contains all of the artwork (including various large wallpaper files). 

This AUR package (*lext-theme-lubuntu-arc) contains only what is needed, and depends not on an *upstream* server. Twice a year a new version (which reflects the latest Lubuntu release) is published by *upstream*. I'll try to keep up with it. But, if unnoticed, the former AUR package will fail. Tendency is that only few changes have been made in the recent years. Recently mostly due to the introduction of said *Fancy Menu* widget. 

### Disclaimer
The actual *AUR* components (PKGBUILD etc.) are not in this repository (i.e. the one which you are looking at right now). That part resides on the AUR website. The contents required by AUR also does not live in this repository. As with every website you visit, the use of the *lext-theme-lubuntu-arc* package is subject to possible monitoring in any form, and you should decide if you want to leave your footprint *before installing*.

### Wishlist
I really could appreciate if my highly valued **LXQt**-team (or perhaps my even highly appreciated **Arch Linux** group of LXQt maintainers) could *ask* during installation which menu widget should be applied.
