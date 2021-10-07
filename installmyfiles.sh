#!/bin/bash

echo "Cargando archivos de configuracion para bspwm y sxhdk"
sleep 5
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

echo "CONFIGURANDO POLYBAR"
sleep 5
#Configurando las barras de la Polybar y anadiendo mis scripts personalizados
cp $HOME/Descargas/entorno/archivosConfiguracion/polybar/current.ini $HOME/.config/polybar
cp $HOME/Descargas/entorno/archivosConfiguracion/polybar/launch.sh $HOME/.config/polybar
cp $HOME/Descargas/entorno/archivosConfiguracion/polybar/workspace.ini $HOME/.config/polybar
cp $HOME/Descargas/entorno/archivosConfiguracion/polybar/scripts/powermenu_alt $HOME/.config/polybar/scripts
cp $HOME/Descargas/entorno/archivosConfiguracion/polybar/scripts/themes/powermenu_alt.rasi $HOME/.config/polybar/scripts/themes

chmod +x $HOME/.config/polybar/launch.sh
chmod +x $HOME/.config/polybar/scripts/powermenu_alt

cp -r $HOME/Descargas/entorno/archivosConfiguracion/bin $HOME/.config/
chmod +x $HOME/.config/bin/ethernet_status.sh
chmod +x $HOME/.config/bin/hackthebox_status.sh
chmod +x $HOME/.config/bin/victim_status.sh

echo "CONFIGURANDO TRANSPARENCIA PICOM"
sleep 5
#Instalando la transparencia
cp $HOME/Descargas/entorno/archivosConfiguracion/picom/* $HOME/.config/picom

echo "CONFIGURANDO ROFI"
sleep 5
cp -r $HOME/Descargas/entorno/archivosConfiguracion/rofi $HOME/.config/
  #NOTA: editar el usario del archivo ~/.config/rofi/config en la linea 1
  
  echo "INSTALANDO SLIM BLOQUE PANTALLA"
    #Cambiando la imagen del panel de bloqueo
sudo cp $HOME/Descargas/entorno/archivosConfiguracion/fondo/panel.png /usr/share/slim/themes/default
sudo cp $HOME/Descargas/entorno/archivosConfiguracion/fondo/background.png /usr/share/slim/themes/default
sudo chmod 644 /usr/share/slim/themes/default/panel.png

echo "CONFIGURANDO ZSH USER"
cp archivos/.zshrc $HOME/Descargas/entorno/archivosConfiguracion/
cp $HOME/Descargas/entorno/archivosConfiguracion/p10k/.p10k.zsh $HOME/
sudo cp $HOME/Descargas/entorno/archivosConfiguracion/p10kRoot/.p10k.zsh /root/

echo "AGREGANDO MIS SCRIPTS A .ZSHRC"
sleep 5
#Agregando mis scripts en .zshrc
	#Descomentar en caso de no tenerlos
#cat $HOME/Descargas/entorno/archivosConfiguracion/misScripts/victima >> $HOME/.zshrc
#cat $HOME/Descargas/entorno/archivosConfiguracion/misScripts/clearv >> $HOME/.zshrc
#cat $HOME/Descargas/entorno/archivosConfiguracion/misScripts/mkdirt >> $HOME/.zshrc
#cat $HOME/Descargas/entorno/archivosConfiguracion/misScripts/exp >> $HOME/.zshrc
cp -r $HOME/Descargas/entorno/archivosConfiguracion/misScripts/Ports /opt

echo "ENLAZANDO ARCHIVOS .ZSHRC Y CONFIG DE BASH A .ZSH"
sleep 3
cp $HOME/Descargas/entorno/archivosConfiguracion/.zshrc $HOME/
	#Enlazando archivos 
sudo cp $HOME/Descargas/entorno/archivosConfiguracion/p10kRoot/.p10k.zsh /root/
sudo  ln -s -f $HOME/.zshrc /root/.zshrc

echo "TERMINADO "
sleep 8
reboot
