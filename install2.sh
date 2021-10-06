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
		#Para instalar posteriormente Firefox en OPT
sudo chown $(whoami):$(whoami) /opt

echo "DESCARGANDO HACK NERD FONTS"
sleep 5
#Instalando Hack Nerd Fonts para la terminal
cd /usr/local/share/fonts
sudo cp $HOME/Descargas/entorno/archivosConfiguracion/Fonts/Hack.zip .
sudo unzip Hack.zip
sudo rm Hack.zip
	#Entrar a la configuracion de la terminal y el Tipografia elegir Hack Nerd Font Mono Regular
	#Para configurar la terminal hacemos lo sig:
	#Preferencias Perfil > General
		#Forma del Curso = Doble T
		#Mostrara barra de Menu = desenmarcar
		#Campana de terminal = desenmarcar
		#Tipografia = Hack Nerd Mono Regular
	#Preferencias Perfil > Desplazamiento
		#La barra de desplazamiento = Desconectado
#instalamos Foxy Proxy Manualmente

echo "INTALANDO FEH"
sleep 5
#Instalacion de feh para cargar fondos de pantalla
sudo apt install feh -y
mkdir $HOME/Desktop/Images
cp $HOME/Descargas/entorno/archivosConfiguracion/fondo/fondo.jpg $HOME/Desktop/Images/
echo "feh --bg-fill /home/erickbuster/Desktop/Images/fondo.jpg" >> ~/.config/bspwm/bspwmrc
	#Modificar la ruta donde se encuentre tu imagen de fondo
	#En caso de no cargar el fondo configurar la ruta del fondo en el archivo ~./config/bspwm/bspwmrc linea 20
echo "REINICIANDO"
sleep 3
sudo kill -9 -1
