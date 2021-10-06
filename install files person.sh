#!/bin/bash

cp archivos/.zshrc $HOME/Descargas/entorno/archivosConfiguracion/
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
