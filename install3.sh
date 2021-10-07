#!/bin/bash

echo "INSTALANDO POLYBAR"
sleep 5
#instalacion de la Polybar
cd $HOME/Descargas/entorno
git clone https://github.com/VaughnValle/blue-sky.git
cd blue-sky/polybar/
mkdir $HOME/.config/polybar
cp * -r ~/.config/polybar

#Descomentar en caso de que el archivo $HOME/.config/bspwm/bspwmrc no tenga el contenido
echo '~/.config/polybar/./launch.sh' >> $HOME/.config/bspwm/bspwmrc
cd fonts
sudo cp * /usr/share/fonts/truetype/
fc-cache -v
echo "Presionamos Win + Alt + R para ver la Polybar"
echo "Terminado"
