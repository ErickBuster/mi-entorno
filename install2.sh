#!/bin/bash

echo "INSTALANDO FIREJAIL"
sleep 5
#Instalamos firejail para tener un firefox enjaulado y protegido
sudo apt install firejail -y
	#NOTA: instalamos el Firefox mas reciente y lo descargamos en /opt y lo descomprimimos tar -xf <firefox.tar>
	#Personalizar Firefox:
		#Desenmarcar preguntar navegador predeterminado
		#Buscar
			#Buscador predeterminado : Duckduckgo
		#Privacidad y Seguridad
			#Ususario y contra: Desenmarcar preguntar para guardar contra
			#Historial : No recordar el historial
#Configuracion de la terminal
	#Editar > Preferencias de Perfil > Desplazamiento > Barra de desplaza = Desconectado
	#General -> Desenmarcar:
		#Mostrar la barra de menus en los terminales
		#Campana del terminal

echo "DESCARGANDO HACK NERD FONTS"
sleep 5
#Instalando Hack Nerd Fonts para la terminal
cp $HOME/Descargas/entorno/archivosConfiguracion/Fonts/Hack.zip /usr/local/share/fonts
unzip /usr/local/share/fonts/Hack.zip
rm /usr/local/share/fonts/Hack.zip
	#Entrar a la configuracion de la terminal y el Tipografia elegir Hack Nerd Font Mono Regular

#instalamos Foxy Proxy Manualmente

echo "INTALANDO FEH"
sleep 5
#Instalacion de feh para cargar fondos de pantalla
sudo apt install feh -y
mkdir $HOME/Desktop/Images
cp $HOME/Descargas/entorno/archivosConfiguracion/fondo/fondo.jpg $HOME/Desktop/Images/
cd $HOME/Desktop/Images
	#En caso de no cargar el fondo configurar la ruta del fondo en el archivo ~./config/bspwm/bspwmrc


echo "INSTALANDO POLYBAR"
sleep 5
#instalacion de la Polybar
cd $HOME/Descargas/entorno
git clone https://github.com/VaughnValle/blue-sky.git
cd blue-sky/polybar/
mkdir $HOME/.config/polybar
cp * -r $HOME/.config/polybar

#Descomentar en caso de que el archivo $HOME/.config/bspwm/bspwmrc no tenga el contenido
#echo '~/.config/polybar/./launch.sh' >> $HOME/.config/bspwm/bspwmrc
cd fonts
sudo cp * /usr/share/fonts/truetype/
fc-cache -v
	#Presionamos Win + Shift + R para ver la Polybar


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
mkdir $HOME/.config/picom
cp $HOME/Descargas/entorno/archivosConfiguracion/picom/* $HOME/.config/picom

#Configuracion de bordeados y seguimiendo del raton
	#Descomentar si el archivo $HOME/.config/bspwm/bspwmrc no contiene el codigo siguiente
	#Antes de recargar la configuración, hacemos un seguimiento del ratón para saber en qué ventana estamos con la siguiente instrucción en el 'bspwm':
#echo "bspc config focus_follows_pointer true" >> $HOME/.config/bspwm/bspwmrc

	#Posteriormente, ejecutamos los siguientes comandos para aplicar los bordeados:
#echo 'picom --experimental-backends &' >> $HOME/.config/bspwm/bspwmrc
#echo 'bspc config border_width 0' >> $HOME/.config/bspwm/bspwmrc

echo "CONFIGURANDO ROFI"
sleep 5
#Configuracion del rofi
cp -r $HOME/Descargas/entorno/archivosConfiguracion/rofi $HOME/.config/


echo "INSTALANDO SLIM"
sleep 5
#Instalacion del Slim y Slimlock
sudo apt update
sudo apt install slim libpam0g-dev libxrandr-dev libfreetype6-dev libimlib2-dev libxft-dev
sudo apt install slim libpam0g-dev libxrandr-dev libfreetype6-dev libimlib2-dev libxft-dev
cd $HOME/Descargas/entorno
git clone https://github.com/joelburget/slimlock.git
cd slimlock/
sudo make
sudo make install
	#Copiamos archivos de configuracion
cd $HOME/Descargas/entorno/blue-sky/slim
cp slim.conf /etc/
cp slimlock.conf /etc
cp -r default /usr/share/slim/themes
cp $HOME/Descargas/entorno/archivosConfiguracion/fondo/panel.png /usr/share/slim/themes/default
cp $HOME/Descargas/entorno/archivosConfiguracion/fondo/background.png /usr/share/slim/themes/default

#Reiniciamos el sistema y una vez arrancado, incorporamos en el archivo 'bspwmrc' la siguiente línea para arreglar el cursor:
	#Descomentar en caso de no tener la linea en el archivo $HOME/.config/bspwm/bspwmrc
#echo "xsetroot -cursor_name left_ptr &" >> $HOME/.config/bspwm/bspwmrc

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

cp $HOME/Descargas/entorno/archivosConfiguracion/p10k/.p10k.zsh $HOME/
echo "CONFIGURANDO ZSH DEBE HACERLO MANUAL ROOT: sudo su -> zsh"
sleep 5
	#Root
#sudo su
#zsh

echo "INSTALANDO BATCAT"
sleep 4
#Instalacion de Batcat
#sudo apt install batcat -y
dpkg -i $HOME/Descargas/entorno/archivosConfiguracion/bat_0.18.2_amd64.deb

echo "INSTALANDO LSD"
sleep 3
#Instalacion de lsd
dpkg -i $HOME/Descargas/entorno/archivosConfiguracion/lsd_0.20.1_amd64.deb

echo "AGREGANDO MIS SCRIPTS A .ZSHRC"
sleep 5
#Agregando mis scripts en .zshrc
	#Para evitar un pequeño problema de permisos a la hora de desde el usuario root migrar con 'su' al usuario con bajos privilegios, ejecutamos los siguientes comandos:
sudo chown $(whoami):$(whoami) /root
sudo chown $(whoami):$(whoami) /opt
sudo chown $(whoami):$(whoami) /root/.cache -R
sudo chown $(whoami):$(whoami) /root/.local -R
echo "Permisos Agregados"
sleep 3
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
cp $HOME/Descargas/entorno/archivosConfiguracion/p10kRoot/.p10k.zsh /root/
sudo  ln -s -f $HOME/.zshrc /root/.zshrc

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
#(Quitamos las líneas del plug)

#Configurando entorno nanorc
wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh
	#NOTA: configurar usuario de la linea 231
sudo cp $HOME/Descargas/entorno/archivosConfiguracion/misScripts/nanorc /etc/
echo "CONFIGURAR NANORC PARA ROOT MANUALMENTE"
echo "sudo su"
echo "wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh"

echo "FINALIZADO!!!!..."
