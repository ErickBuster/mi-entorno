#!/bin/bash

echo "CONFIGURANDO TRANSPARENCIA PICOM"
sleep 5
#Instalando la transparencia

mkdir ~/.config/picom
cd ~/.config/picom
cp $HOME/Descargas/entorno/blue-sky/picom.conf .

#Configuracion de bordeados y seguimiendo del raton
	#Descomentar si el archivo $HOME/.config/bspwm/bspwmrc no contiene el codigo siguiente
	#Antes de recargar la configuración, hacemos un seguimiento del ratón para saber en qué ventana estamos con la siguiente instrucción en el 'bspwm':
echo "bspc config focus_follows_pointer true" >> $HOME/.config/bspwm/bspwmrc

	#Posteriormente, ejecutamos los siguientes comandos para aplicar los bordeados:
echo 'picom --experimental-backends &' >> $HOME/.config/bspwm/bspwmrc
echo 'bspc config border_width 0' >> $HOME/.config/bspwm/bspwmrc

echo "CONFIGURANDO ROFI"
sleep 5
#Configuracion del rofi
mkdir -p ~/.config/rofi/themes
cp ~/Descargas/entorno/blue-sky/nord.rasi ~/.config/rofi/themes

echo "INSTALANDO SLIM"
sleep 5
#Instalacion del Slim y Slimlock
sudo apt update
sudo apt install slim libpam0g-dev libxrandr-dev libfreetype6-dev libimlib2-dev libxft-dev
sudo apt update
sudo apt install slim libpam0g-dev libxrandr-dev libfreetype6-dev libimlib2-dev libxft-dev
cd $HOME/Descargas/entorno
git clone https://github.com/joelburget/slimlock.git
cd slimlock/
sudo make
sudo make install
	#Copiamos archivos de configuracion
cd $HOME/Descargas/entorno/blue-sky/slim
sudo cp slim.conf /etc/
sudo cp slimlock.conf /etc
sudo cp -r default /usr/share/slim/themes
#Reiniciamos el sistema y una vez arrancado, incorporamos en el archivo 'bspwmrc' la siguiente línea para arreglar el cursor:
	#Descomentar en caso de no tener la linea en el archivo $HOME/.config/bspwm/bspwmrc
echo "xsetroot -cursor_name left_ptr &" >> $HOME/.config/bspwm/bspwmrc

echo "INSTALANDO POWERLVL10K"
sleep 6
#Instalacion del powerlevel10K (zsh)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
#configurando la terminal zsh
	#User
echo "CONFIGURANDO ZSH USER"
sleep 5
zsh
	#Opciones personales:
	#y - y - y - y
	#2 clasic
	#1 unicode
	#3 dark
	#1 No
	#1 Angled
	#2 Blurred
	#2 Blurred
	#1 One line
	#2 Sparce
	#2 Many Icons
	#2 Fluent
	#y
	#2 Quiet
	#y


echo "CONFIGURANDO ZSH DEBE HACERLO MANUAL ROOT"
echo "sudo su "
sleep 5
	#Root
#sudo su
#zsh
	#Para evitar un pequeño problema de permisos a la hora de desde el usuario root migrar con 'su' al usuario con bajos privilegios, ejecutamos los siguientes comandos:
sudo chown $(whoami):$(whoami) /root
sudo chown $(whoami):$(whoami) /root/.cache -R
sudo chown $(whoami):$(whoami) /root/.local -R
echo "Permisos Agregados"
sleep 3

echo "INSTALANDO BATCAT"
sleep 4
#Instalacion de Batcat
#sudo apt install batcat -y
sudo dpkg -i $HOME/Descargas/entorno/archivosConfiguracion/bat_0.18.2_amd64.deb

echo "INSTALANDO LSD"
sleep 3
#Instalacion de lsd
sudo dpkg -i $HOME/Descargas/entorno/archivosConfiguracion/lsd_0.20.1_amd64.deb

	#Configurando para que corra por zsh y no con bash
sudo usermod --shell /usr/bin/zsh $(whoami)
sudo usermod --shell /usr/bin/zsh root

echo "INSTALANDO FZF"
sleep 4
#Instalacion de fzf para buscador inteligente
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
#Opciones: y -y -y

echo "INSTALAR FZF PARA ROOT MANUALMENTE"
echo "sudo su"
echo "git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf"
echo "~/.fzf/install"
sleep 5

echo "INSTALANDO RANGER"
sleep 3
#Instalacion de Ranger
sudo apt install ranger -y
	#ejecutar ranger
	#ranger

echo "INSTALANDO NVIM y NANORC"
sleep 4
#Instalacion nvim
cd $HOME/.config/nvim/
wget https://github.com/arcticicestudio/nord-vim/archive/master.zip
unzip master.zip
rm master.zip
mv nord-vim-master/colors/ .
rm -r nord-vim-master/
rm init.vim

wget https://raw.githubusercontent.com/Necros1s/lotus/master/lotus.vim
wget https://raw.githubusercontent.com/Necros1s/lotus/master/lotusbar.vim
cp $HOME/Descargas/entorno/archivosConfiguracion/misScripts/init.vim .
#wget https://raw.githubusercontent.com/Necros1s/lotus/master/init.vim #(Quitamos las líneas del plug)

	#Configurando entorno nanorc
wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh
sudo cp $HOME/Descargas/entorno/archivosConfiguracion/misScripts/nanorc /etc/
	#NOTA: configurar usuario de la linea 231
echo "CONFIGURAR NANORC PARA ROOT MANUALMENTE"
echo "sudo su"
echo "wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh"

echo "FINALIZADO!!!!..."
sleep 5
reboot
