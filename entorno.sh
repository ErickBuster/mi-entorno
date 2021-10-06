#!/bin/bash

#actualizacion e instalacion de paquetes
echo "ACTUALIZANDO"
sleep 1
sudo apt update
sudo parrot-upgrade
sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev
clear
echo "CREANDO CARPETAS"
#creando carpeta y copiando archivos necesarios
mkdir $HOME/Descargas/entorno
mkdir $HOME/Descargas/entorno/archivosConfiguracion
cp -r archivos/* $HOME/Descargas/entorno/archivosConfiguracion
cd $HOME/Descargas/entorno
sleep 3
clear

echo "BSPWM Y SXHDK"
#clonando bspwm y sxhdk
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
sudo apt install xclip -y
#installando dependencias de bspwm y sxhdk
cd bspwm/
make
sudo make install
cd ../sxhkd/
make
sudo make install
sudo apt install bspwm

#Cargando archivos de configuracion bspwm y sxhdk
	#creando directorios
mkdir $HOME/.config/bspwm
mkdir $HOME/.config/bspwm/scripts
mkdir $HOME/.config/sxhkd
	#copiando archivos en sus respectivas carpetas
cp $HOME/Descargas/entorno/archivosConfiguracion/bspwn/bspwmrc $HOME/.config/bspwm
cp -r $HOME/Descargas/entorno/archivosConfiguracion/bspwn/scripts $HOME/.config/bspwm/
cp    $HOME/Descargas/entorno/archivosConfiguracion/sxhdk/sxhkdrc $HOME/.config/sxhkd
	#agregando permisos
chmod +x $HOME/.config/bspwm/bspwmrc
chmod +x $HOME/.config/bspwm/scripts/bspwm_resize
chmod +x $HOME/.config/sxhkd/sxhkdrc
	#NOTA: recordar modificar usuario en el archivo sxhdk por tu usuario en la linea 124
	#NOTA2: recorda modificar usuario en el archivo bspwmrc por tu usuario en la linea 20
echo "INSTALANDO POLYBAR"
sleep 5

#Instalacion de la Polibar
	#instalacion de paquetes
sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
cd $HOME/Descargas/entorno
git clone --recursive https://github.com/polybar/polybar
cd polybar/
mkdir build
cd build/
cmake ..
make -j $(nproc)
sudo make install


echo "INSTALANDO PICOM"
sleep5

#instalación de Picom para ajustar las transparencias (Compton ya está deprecated).
	#instalando paquetes y actualizando
sudo apt update
sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev
	#clonando picom
cd $HOME/Descargas/entorno
git clone https://github.com/ibhagwan/picom.git
cd picom/
	#instalando picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

echo "INSTALANDO ROFI"
sleep 5
#Instalacion de Rofi
sudo apt install rofi -y
	#NOTA: En este punto podemos reiniciar la maquina, pero lo haremos al finalizar la instalacion
reboot
