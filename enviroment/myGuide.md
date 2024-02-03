# Mi guía de instalación 🚀

## Instalando paquetes principales 📦

```bash
sudo pacman -S base-devel git vim xcb-util xcb-util-wm xcb-util-keysyms xcb-util-xinerama alsa-lib xcb-util-test xcb-util-shape lightdm lightdm-gtk-greeter
```

### Editar este archivito para que funcione lightdm

```bash
sudo vim /etc/lightdm/lightdm.conf
```

Y buscar la linea que dija **#greeter-session=example-gtk-gnome** y colocar:

```conf
greeter-session=lightdm-gtk-greeter
```

### Habilitando el servicio

```bash
sudo systemctl enable lightdm.service
```

## Instalando bspwn y sxhkd y demás paquetes 📦

```bash
sudo pacman -S bspwm sxhkd feh alacritty neofetch htop pcmanfm cmatrix xarchiver figlet firejail unrar zip unzip tmux
```

```bash
touch ~/.xprofile
vim ~/.xprofile
```

```conf
# Archivo ~/.xprofile
sxhkd &
exec bspwm
```

### Copiando archivos de configuración

```bash
mkdir ~/.config
mkdir ~/.config/bspwm ~/.config/sxhkd
cd /usr/share/doc/bspwm/examples
cp bspwmrc ~/.config/bspwm
chmod +x ~/.config/bspwm/bspwmrc
cp sxhkdrc ~/.config/sxhkd
vim ~/.config/sxhkd/sxhkdrc
```

Ahora para nuestra configuración personalizada copiamos tanto el [bspwmrc](https://www.google.com) y el [sxhkdrc](https://www.google.com)


### Creamos el archivo bspwm_resize:

```bash
mkdir ~/.config/bspwm/scripts/
touch ~/.config/bspwm/scripts/bspwm_resize; chmod +x ~/.config/bspwm/scripts/bspwm_resize
```

```bash
#!/usr/bin/env bash

if bspc query -N -n focused.floating > /dev/null; then
	step=20
else
	step=100
fi

case "$1" in
	west) dir=right; falldir=left; x="-$step"; y=0;;
	east) dir=right; falldir=left; x="$step"; y=0;;
	north) dir=top; falldir=bottom; x=0; y="-$step";;
	south) dir=top; falldir=bottom; x=0; y="$step";;
esac

bspc node -z "$dir" "$x" "$y" || bspc node -z "$falldir" "$x" "$y"
```



## Instalando la polybar 📦

```bash
sudo pacman -S cmake pkg-config python-sphinx cairo xcb-util xcb-proto xcb-util-image xcb-util-wm xcb-util-keysyms xcb-util-cursor alsa-lib pulseaudio jsoncpp libmpdclient curl libnl
```

```bash
cd ~/Downloads/
git clone --recursive https://github.com/polybar/polybar
cd polybar/
mkdir build
cd build/
cmake ..
make -j$(nproc)
sudo make install
```

### Tema para polybar
```bash
git clone https://github.com/VaughnValle/blue-sky.git
mkdir ~/.config/polybar
cd ~/Downloads/blue-sky/polybar/
cp * -r ~/.config/polybar
echo '~/.config/polybar/./launch.sh' >> ~/.config/bspwm/bspwmrc
cd fonts
sudo cp * /usr/share/fonts/truetype/
fc-cache -v
```

Hacemos Windows + Shift + R para cargar la configuración y deberíamos ver la Polybar por arriba.


## Instalando Rofi y Rofi emoji 🚀

```bash
sudo pacman -S rofi rofi-emoji xdotool
mkdir ~/.config/rofi
```

Copiar los [archivos](https://www.google.com) de configuración para rofi

### Apple font para rofi emoji

```bash
git clone https://aur.archlinux.org/ttf-apple-emoji.git
cd ttf-apple-emoji
makepkg -si
```

Luego copiamos este [archivo](https://www.google.com) de fuentes en ~/


## Instalando zsh, oh my zsh, y power level 10k 📦

```bash
sudo pacman -S zsh
```

- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Power Level 10k](https://github.com/romkatv/powerlevel10k)

Ejecutar el siguiente comando para cambiar de terminal de bash a zsh

```bash
chsh -s $(which zsh) # ❌ a veces falla
chsh -s /bin/zsh
```

Para tener resaltado de syntaxis y demás ver el siguiente [artículo](https://gist.github.com/minhanhhere/4a124522b2931dd47fa0aed56ad9843e)


## Colocando las fuentes para el sistema ✍️

Descargar las siguientes [fuentes](www.google.com) y copiarlas

```bash
cd /usr/share/fonts
sudo cp -rf ~/Downloads/Hack.zip ~/Downloads/Iosevka.zip ~/Downloads/CascadiaCodePL.ttf .
sudo unzip Hack.zip
sudo unzip  Iosevka.zip
sudo rm -rf LICENCE README.md
```