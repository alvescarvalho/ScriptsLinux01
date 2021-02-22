#!/usr/bin/env bash
#
#
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
# -------------------------ÍNICIO -VARIÁVEIS------------------#
# ------------------------------------------------------------#
set -e 
#
#Removendo Travas do APT 
trava1="/var/lib/dpkg/lock-frontend"
trava2="/var/cache/apt/archives/lock"

#Adicionando suporte a 32bits
suporte="dpkg --add-architecture i386"

#Download da chave do wine
down_chave=(
    "https://dl.winehq.org/wine-builds/winehq.key"
)
#Chaves do Wine
chave=(winehq.key)

#Repositório Wine
repo_wine=("deb https://dl.winehq.org/wine-builds/ubuntu/ focal main")

#Lista de PPAs
ppa_lutris="ppa:lutris-team/lutris"
ppa_retroarch="ppa:libretro/stable"
ppa_kodi="ppa:team-xbmc/ppa"
ppa_java="ppa:linuxuprising/java"

#Downloads de programas via WGET 
downloads=(
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
)

#Download de programas compactados e zipados
 vagrant=("https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_linux_amd64.zip")
 libre=("https://mirror.turbozoneinternet.net.br/tdf/libreoffice/stable/7.1.0/deb/x86_64/LibreOffice_7.1.0_Linux_x86-64_deb.tar.gz")
 libre_tradutor=("https://mirror.nbtelecom.com.br/tdf/libreoffice/stable/7.1.0/deb/x86_64/LibreOffice_7.1.0_Linux_x86-64_deb_langpack_pt-BR.tar.gz")   
 libre_help=("http://mirror.ufms.br/tdf/libreoffice/stable/7.1.0/deb/x86_64/LibreOffice_7.1.0_Linux_x86-64_deb_helppack_pt-BR.tar.gz")
#Diretorio onde serão armazenados os conteudos baixados
diretorio_arquivos_deb="$HOME/programas_do_script_pos_install"
diretorio_compactados_zip="$HOME/programas_do_script_compactados_pos_install"

#Pasta onde ficará o livreoffice
#libreoffice_pasta="$HOME/libreofficedescompactado"
#Remover programas desnecessários
app_remover=(
    elisa 
    ktorrent 
    konversation 
    skanlite 
    libreoffice* 
    ksudoku 
    kmahjongg 
    kmines 
    kpat
)   

#Listas de programas para instalar 
app_install=(
    arj 
    audacity
    cabextract 
    cowsay
    figlet 
    filezilla
    gimp
    git 
    gparted 
    gufw 
    handbrake 
    hardinfo
    kazam
    kodi 
    kodi-pvr-iptvsimple
    kodi-pvr-plutotv 
    kubuntu-restricted-addons 
    kubuntu-restricted-extras
    lollypop
    lunzip
    lutris
    lzip 
    mpack
    neofetch 
    oracle-java15-installer
    oracle-java15-set-default
    p7zip 
    p7zip-rar 
    plzip
    qbittorrent
    rar 
    retroarch*
    samba
    sharutils 
    simplescreenrecorder
    snapd 
    software-properties-common 
    synaptic
    telegram-desktop
    toilet
    transmission
    unace
    unrar
    uudeview
    zsh 
)
# -------------------- FIM -VARIÁVEIS-------------------------#

# ------------------------------------------------------------#
# --------------------ÍNICIO DO SCRIPT------------------------#
TIME=2
#Adicionando suporte a arquitetura em 32bits.
    echo "Vamos adicionar o suporte a 32bits"
    echo "Aguarde"
    sleep $TIME
    echo "Adicionando suporte a arquitetura em 32bits"
    sudo ${suporte[@]}
    clear

#Instalando Wine 
    echo "Fazendo download da chave direto do site do wine"
    sleep $TIME
    wget -nc  ${down_chave[@]}
    echo "Adicionando a chave no sistema"
    sleep $TIME
    sudo apt-key add ${chave[@]}
    clear
    echo " Adicionando o repositório do wine no linux"
    sleep $TIME  
   sudo apt-add-repository -r "$repo_wine" -y
   echo "Feito esta instalado o repositório!"
   clear

#Atualizar o sistema

sudo apt update 
clear

#Adicionando PPAs no sistema

sudo apt-add-repository    ${ppa_retroarch[@]} -y 
sudo apt-add-repository    ${ppa_lutris[@]} -y 
sudo apt-add-repository    ${ppa_kodi[@]} -y 
sudo apt-add-repository    ${ppa_java[@]} -y 

#Atualizando ppas

sudo apt update
clear

# Instalando Programas via Wget  
#
    #Instalando todos os programas .deb
mkdir "$diretorio_arquivos_deb"
wget -c "${downloads[@]}" -P "$diretorio_arquivos_deb"
cd $HOME/programas_do_script_pos_install
sudo dpkg -i *.deb
sudo apt install -f -y 
cd $HOME/
sudo rm -rf $HOME/programas_do_script_pos_install

##---------------------------------------------------##
#
# Instalando LibreOffice 7.1 e o Vagrant 
#
   # Criando diretório e fazendo download para dentro da pasta
mkdir "$diretorio_compactados_zip"
cd $HOME/programas_do_script_compactados_pos_install
wget -c "${vagrant[@]}" -P "$diretorio_compactados_zip"
wget -c "${libre[@]}" -P "$diretorio_compactados_zip"
wget -c "${libre_tradutor[@]}" -P "$diretorio_compactados_zip"
wget -c "${libre_help[@]}" -P "$diretorio_compactados_zip"
   # Extraindo os arquivos do conteúdo zipado
unzip  $HOME/programas_do_script_compactados_pos_install/*.zip
tar -xzf LibreOffice_7.1.0_Linux_x86-64_deb.tar.gz 
tar -xzf LibreOffice_7.1.0_Linux_x86-64_deb_langpack_pt-BR.tar.gz
tar -xzf LibreOffice_7.1.0_Linux_x86-64_deb_helppack_pt-BR.tar.gz
   # Instalando o LibreOffice 7.1
cd $HOME/programas_do_script_compactados_pos_install/
cd LibreOffice_7.1.0.3_Linux_x86-64_deb/DEBS/
sudo dpkg -i *.deb
   # Instalando o pacote de idiomas em português 
cd $HOME/programas_do_script_compactados_pos_install 
cd LibreOffice_7.1.0.3_Linux_x86-64_deb_langpack_pt-BR/DEBS
sudo dpkg -i *.deb
   # Instalando Pacote de Ajuda em Português 
cd $HOME/programas_do_script_compactados_pos_install 
cd LibreOffice_7.1.0.3_Linux_x86-64_deb_helppack_pt-BR/DEBS
sudo dpkg -i *.deb
   # Removendo pasta que contém os arquivos.
sudo rm -rf "${diretorio_compactados_zip[@]}"

##---------------------------------------------------##
#
# Instalando aplicativos APT
echo "Instalando programas em APT listados..."
        echo
        sleep $TIME
        echo " Iniciando a instalação dos programas"
        for nome_app in ${app_install[@]}; do 
            if ! dpkg -l | grep -q $nome_app; then 
            sudo apt install  "$nome_app" -y 
            
        else 
            echo "[INSTALADO] -  $nome_app"
       fi 
done

# Removendo aplicativos do sistema 
echo "Removendo programas desnecessários..."
        echo
        sleep $TIME
        echo " Iniciando a remoção de programas"
        for nome_app in ${app_remover[@]}; do 
            if ! dpkg -l | grep -q $nome_app; then 
            sudo apt purge  "$nome_app" -y 
            
        else 
            echo "[REMOVIDO] -  $nome_app"
        fi 
done
# Limpando o sistema

sudo apt autoremove -y 
sudo apt clean 
sudo apt autoclean 
sudo apt clean