#!/usr/bin/env bash
# ------------------------------------------------------------#
# Nome:          script01_pos_install.sh 
# Descrição:     Automação de pós instalação do Kubntu 20.04.
# Linkedin:      www.linkedin.com/in/mateusalvescf
# Escrito por:   Mateus Carvalho 
# Última edicão feita por: Mateus Carvalho 
# ------------------------------------------------------------#
# Como usar o script:         
#       $ ./atualiza_sistema.sh
# ------------------------------------------------------------#
# Bash Version:  
#              Bash 5.0.17
# ------------------------------------------------------------# 
# Crescimento e evolução do Script v1.0
# ------------------------------------------------------------#
#
#
#
# ------------------------------------------------------------#
# -----------------Declaração de Variáveis--------------------#
# ------------------------------------------------------------#
#
# 01 - Arquitetura em 32bits
arquitetura="dpkg --add-architecture i386"
#
# 02 - Diretórios para Armazenamentos Arquivos Externos
diretorio_deb="$HOME/programas_deb"
diretorio_zip="$HOME/programas_zip"
#
# 03 - Downloads Externos
downloads_deb=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    "https://download3.operacdn.com/pub/opera/desktop/74.0.3911.154/linux/opera-stable_74.0.3911.154_amd64.deb"
    "https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb"
    "https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megasync-xUbuntu_20.04_amd64.deb"
    "https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/dolphin-megasync-xUbuntu_20.04_amd64.deb"
    "https://dl.discordapp.net/apps/linux/0.0.13/discord-0.0.13.deb"
    "https://downloads.vivaldi.com/stable/vivaldi-stable_3.6.2165.40-1_amd64.deb"
    "https://download.virtualbox.org/virtualbox/6.1.18/virtualbox-6.1_6.1.18-142142~Ubuntu~eoan_amd64.deb"
    "https://sonik.dl.sourceforge.net/project/stacer/v1.1.0/stacer_1.1.0_amd64.deb"
    "https://az764295.vo.msecnd.net/stable/622cb03f7e070a9670c94bae1a45d78d7181fbd4/code_1.53.2-1613044664_amd64.deb"
    "https://github.com/shiftkey/desktop/releases/download/release-2.6.3-linux1/GitHubDesktop-linux-2.6.3-linux1.deb"
)
#
# 04 - Downloads Externos Compactados 
 #vagrant=("https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_linux_amd64.zip")
 libre=("https://mirror.turbozoneinternet.net.br/tdf/libreoffice/stable/7.1.0/deb/x86_64/LibreOffice_7.1.0_Linux_x86-64_deb.tar.gz")
 libre_tradutor=("https://mirror.nbtelecom.com.br/tdf/libreoffice/stable/7.1.0/deb/x86_64/LibreOffice_7.1.              0_Linux_x86-64_deb_langpackpt-BR.tar.gz")   
 libre_help=("http://mirror.ufms.br/tdf/libreoffice/stable/7.1.0/deb/x86_64/LibreOffice_7.1.0_Linux_x86-64_deb_helppack_pt-BR.tar.gz")
#
# 05 - Downloads do Wine 
down_chave=("https://dl.winehq.org/wine-builds/winehq.key")
chave=(winehq.key)
repositorio_wine=("deb https://dl.winehq.org/wine-builds/ubuntu/ focal main")
instalador_wine=("--install-recommends winehq-stable")
#
# 06 - Instalar Programas 
app_install=(arj audacity cabextract cowsay figlet filezilla gconf-service gconf-service-backend gconf2-common gimp git gparted gufw handbrake hardinfo kazam kodi kodi-pvr-iptvsimple kodi-pvr-plutotv kubuntu-restricted-addons kubuntu-restricted-extras  libappindicator1 libatomic1 libc++1 libc++1-10 libc++abi1-10 libc-ares2 libdbusmenu-gtk4 libgconf-2-4 libmediainfo0v5 libpython2-stdlib libpython2.7-minimal libpython2.7-stdlib libzen0v5 lollypop lunzip lutris lzip mpack neofetch oracle-java15-installer oracle-java15-set-default p7zip p7zip-rar plzip python-is-python2 python2 python2-minimal python2.7 python2.7-minimal qbittorrent rar retroarch* samba sharutils simplescreenrecorder snapd software-properties-common synaptic telegram-desktop toilet transmission unace unrar uudeview zsh)
#
# 07 - Remover Programas 
remover_programas=(elisa* kmahjongg* kmines* konversation* kpat* ksudoku* ktorrent* libreoffice* skanlite*)   
#
# 08 - Repositórios PPAs
ppa_lutris="ppa:lutris-team/lutris"
ppa_retroarch="ppa:libretro/stable"
ppa_kodi="ppa:team-xbmc/ppa"
ppa_java="ppa:linuxuprising/java"
#
# 09 - Travas do LOCK 
lock_apt1="/var/lib/dpkg/lock-frontend"
lock_apt2="/var/cache/apt/archives/lock"
lock_apt3="/var/lib/apt/lists/lock"
lock_apt4="/var/lib/dpkg/lock"
# ------------------------------------------------------------#
# -----------------Ínicio do Código---------------------------#
# ------------------------------------------------------------#
#
# Tempo de espera na tela em segundos. 
TIME=2
#
# 09 - Removendo travas do lock.
echo "Removendo travas eventuais..."
sleep $TIME
sudo rm $lock_apt1
sudo rm $lock_apt2
sudo rm $lock_apt3
sudo rm $lock_apt4
echo "Pronto, removidos as travas."
sleep $TIME
clear
#
# 07 - Remover Programas.
echo "Removendo Programas Listados..."
        echo
        sleep $TIME
        echo " Iniciando a remoção dos programas"
        for nome_do_programa in ${remover_programas[@]}; do 
            if dpkg -l | grep -q $nome_do_programa; then 
            sudo apt purge  "$nome_do_programa" -y          
        else 
            echo "[Lista dos programas removidos] -  $nome_do_programa"
            
       fi 
done
#
# 00 - Limpar sistema.
sudo apt autoremove -y 
sudo apt autoclean
sudo apt clean
#
# 01 - Adicionando suporte a arquitetura em 32bits.
echo "Adicionando suporte a arquitetura em 32bits"
sleep $TIME
sudo ${arquitetura[@]}
echo "Pronto"
#
# 08 - Instalando programas via PPAs
sudo apt-add-repository ${ppa_retroarch[@]} -y 
sudo apt-add-repository ${ppa_lutris[@]} -y 
sudo apt-add-repository ${ppa_kodi[@]} -y 
sudo apt-add-repository ${ppa_java[@]} -y 
#
# 00 - Atualizar Sistema.
sudo apt update
#
# 06 - Instalar Programas
echo "Instalando programas em APT listados..."
        echo
        sleep $TIME
        echo " Iniciando a instalação dos programas"
        for instalando_programa in ${app_install[@]}; do 
            if ! dpkg -l | grep -q $instalando_programa; then 

            sudo apt install "$instalando_programa" -y
        else 
            echo "[Instalado estes programas ao lado =>] -  $instalando_programa"
       fi 
done
#   
# 03 - Baixando programas .DEB pela internet 
mkdir "$diretorio_deb"
wget -c "${downloads_deb[@]}" -P "$diretorio_deb"
cd $HOME/programas_deb
sudo dpkg -i *.deb
cd $HOME/
sudo rm -rf $HOME/programas_deb
#
# 05 - Instalando Wine 
echo "Baixando chave do wine"
sleep $TIME
wget -nc  ${down_chave[@]}
echo "Adicionando a chave no sistema"
sleep $TIME
sudo apt-key add ${chave[@]}
sudo rm winehq.key
clear
echo " Adicionando o repositório do wine no linux"
sudo apt-add-repository "$repositorio_wine" -y
sudo apt update
sudo apt install $instalador_wine -y 
echo "Feito esta instalado o repositório!"
#
# 04 - Baixando o  Vagrant 
#wget -c "${vagrant[@]}" -P "$diretorio_zip"

# 04 - Instalando o LibreOffice
mkdir "$diretorio_zip"
wget -c "${libre[@]}" -P "$diretorio_zip"
wget -c "${libre_tradutor[@]}" -P "$diretorio_zip"
wget -c "${libre_help[@]}" -P "$diretorio_zip"
cd $HOME/programas_zip
# Extraindo Vagrant
#unzip *.zip 
tar -xzf LibreOffice_7.1.0_Linux_x86-64_deb.tar.gz 
tar -xzf LibreOffice_7.1.0_Linux_x86-64_deb_langpack_pt-BR.tar.gz
tar -xzf LibreOffice_7.1.0_Linux_x86-64_deb_helppack_pt-BR.tar.gz
#unzip *.zip 
#unzip  $HOME/programas_do_script_compactados_pos_install/*.zip
# Instalando o LibreOffice 7.1
cd LibreOffice_7.1.0.3_Linux_x86-64_deb/DEBS/
sudo dpkg -i *.deb
# Instalando o pacote de idiomas em português 
cd $HOME/programas_zip 
cd LibreOffice_7.1.0.3_Linux_x86-64_deb_langpack_pt-BR/DEBS/
sudo dpkg -i *.deb
# Instalando Pacote de Ajuda em Português 
cd $HOME/programas_zip
cd LibreOffice_7.1.0.3_Linux_x86-64_deb_helppack_pt-BR/DEBS/
sudo dpkg -i *.deb
# Removendo pasta que contém os arquivos.
cd $HOME/
sudo rm -rf "${diretorio_zip[@]}"
#
# Limpando o sistema
sudo apt autoremove -y 
sudo apt clean 
sudo apt autoclean 
sudo apt clean
#
# Finalizado 
sleep $TIME
echo " Acabou "
sleep $TIME
# ------------------------------------------------------------#
# --------------------Fim do Código---------------------------#
# ------------------------------------------------------------#

