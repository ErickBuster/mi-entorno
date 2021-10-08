# miEntorno
## Descarga
```
cd $HOME/Descargas
git clone https://github.com/ErickBuster/miEntorno
```
Agregar permisos a los instaladores
```
cd miEntorno
chmod +x install*
```
## Instalar consecutivamente todos los instaladores [1 - 4]
### Install 1
La instalacion de 'install1.sh'
Se actualizara e instalara Bspwm, Sxhdk, Picom, Rofi y la Polybar. Posteriormente se reiniciara la maquina
```
./install1.sh
```
Iniciar con bspwm en la pantalla de inicio de sesion
Verificamos que funcione: presionando Win + Enter para desplegar una consola.
Para ver y editar mas atajos de teclado revisar el archivo:
- $HOME/.config/sxhkd/sxhkdrc

### Install 2
La instalacion de 'install2.sh'
Se instalara Firejail, Hack nerd fonts, Feh y reiniciara nuevamente
```
cd $HOME/Descargas/miEntorno
./install2.sh
```
> Seguir los siguientes pasos
- Firejail para tener Firefox en un sistema enjaulado y con proteccion
- NOTA: instalamos el Firefox mas reciente y lo descargamos en /opt y lo descomprimimos tar -xf <firefox.tar> y eliminamos el comprimido
- Personalizar Firefox:
  - Desenmarcar preguntar navegador predeterminado
  - Buscar
    - Buscador predeterminado: Duckduckgo
  - Privacidad y Seguridad
    - Ususario y contra: Desenmarcar preguntar para guardar contra
    - Historial: No recordar el historial
- Configuracion de la terminal e instalar los Hack Nerd Fonts
  - Editar > Preferencias de Perfil > Desplazamiento > Barra de desplaza = Desconectado
  - General -> Desenmarcar:
    - Mostrar la barra de menus en los terminales
    - Campana del terminal
    - Elegir un color gris para la letra
- Instalamos Foxy Proxy Manualmente para burpsuite

Feh nos servira para definir un fondo de pantalla
si queremos cambiar el fondo nos vamos a la ruta
```
cd $HOME/Desktop/Images/
```
y movemos la imagen aqui como fondo.jpg

### Install 3
La instalacion de 'install3.sh'
Se instalara la Polybar 
```
./install3.sh
```
Despues de installar, presionamos Win + Alt + R
y veremos en la parte superior la polybar por default, posteiormente instalaremos las personalizaciones

### Install 4
La instalacion de 'install4.sh'
Se configurara Picom, Rofi e instalara: Slim, Powerlevel10k, zsh, Batcat, Lsd, Ranger, Nvim y Nanorc
Terminando se reiniciara de nuevo para aplicar los cambios
```
./install4.sh
```
> Seguir los siguientes pasos:
1. Al momento de llegar a la instalacion de Slim nos mostrara:
   - lightdm y slim -> seleccionamos slim
2. Al llegar a la configuracion de Powerlever 10k la personalizacion es la siguiente
   - yes - yes - yes - yes
   - 2 clasic
   - 1 unicode
   - 3 dark
   - 1 No
   - 1 Angled
   - 2 Blurred
   - 2 Blurred
   - 1 One line
   - 2 Sparce
   - 2 Many Icons
   - 2 Fluent
   - yes
   - 2 Quiet
   - yes
> NOTA: presionar 'exit' para continuar con la instalacion
3. Al llegar a la instalacion de FZF colocamos las opciones
   - yes
   - yes
   - yes

> Instalar manualmente lo siguiente y hacer esto antes de installar el ultimo instalador:
  - instalar powerlevel 10k para root y elegir la misma configuracion como en el punto 2
```
sudo su
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
```
  - instalar FZF para root y elegir la misma configuracion como en el punto 3
```
sudo su
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
### Install 4
Instalara y sustituira scripts y herramientas personalizadas para:
- bspwm
- sxhdk
- polybar
- picom
- rofi
- zshrc
```
./installmyfiles.sh
```
>NOTA: editar en todos los archivos el usuario ya que por defecto esta erickbuster
```
sudo find / -type f 2>/dev/null | xargs grep "erickbuster" 2>/dev/null
```
Mostrara todos los archivos con el usuario, modificar cada uno por tu usuario! usando sed 
```
sed -i 's/erickbuster/<tu Usuario>/g' <archivo a modificar>
```
algunos archivos a editar son:
```
sed -i 's/erickbuster/<tu Usuario>/g' $HOME/.zshrc
sed -i 's/erickbuster/<tu Usuario>/g' $HOME/.config/bspwm/bspwmrc
sed -i 's/erickbuster/<tu Usuario>/g' $HOME/.config/sxhdk/sxhdkrc
sed -i 's/erickbuster/<tu Usuario>/g' $HOME/.config/rofi/config
sed -i 's/erickbuster/<tu Usuario>/g' #HOME/.config/bin/victim_status.sh
sudo sed -i 's/erickbuster/<tu Usuario>/g' /etc/nanorc
```
donde <tu Usuario> lo consultas con:
  ```
  whoami
  ```
