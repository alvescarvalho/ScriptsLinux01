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
#PROGRAMAS PARA EXCLUIR 
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

#PROGRAMAS PARA INSTALAR
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
#REMOVENDO TRAVAS EVENTUAIS DO APT
trava1="/var/lib/dpkg/lock-frontend"
trava2="/var/cache/apt/archives/lock"

#ATUALIZAR SISTEMA
atualiza_sistema="apt update"

#ADICIONANDO SUPORTE A 32bits
suporte="dpkg --add-architecture i386"

#PPAs
ppa_lutris="ppa:lutris-team/lutris"
ppa_retroarch="ppa:libretro/stable"
ppa_kodi="ppa:team-xbmc/ppa"
ppa_java="ppa:linuxuprising/java"

#DOWNLOADS
downloads=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    "https://dl.winehq.org/wine-builds/winehq.key"
    "https://download3.operacdn.com/pub/opera/desktop/74.0.3911.154/linux/opera-stable_74.0.3911.154_amd64.deb"
    "https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb"
    "https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megasync-xUbuntu_20.04_amd64.deb"
    "https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/dolphin-megasync-xUbuntu_20.04_amd64.deb"
    "https://dl.discordapp.net/apps/linux/0.0.13/discord-0.0.13.deb"
    "https://downloads.vivaldi.com/stable/vivaldi-stable_3.6.2165.40-1_amd64.deb"
    "https://download.virtualbox.org/virtualbox/6.1.18/virtualbox-6.1_6.1.18-142142~Ubuntu~eoan_amd64.deb"
    "https://mirror.turbozoneinternet.net.br/tdf/libreoffice/stable/7.1.0/deb/x86_64/LibreOffice_7.1.0_Linux_x86-64_deb.tar.gz"
    "https://sonik.dl.sourceforge.net/project/stacer/v1.1.0/stacer_1.1.0_amd64.deb"
    "https://az764295.vo.msecnd.net/stable/622cb03f7e070a9670c94bae1a45d78d7181fbd4/code_1.53.2-1613044664_amd64.deb"
    "https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_linux_amd64.zip"
)
#CHAVES
chaves=(winehq.key)

#REPOSITÓRIOS
repositorios=(
    "deb https://dl.winehq.org/wine-builds/ubuntu/ focal main"

)

# CRIANDO DIRETÓRIO TEMPORÁRIO 
cd $(mktemp -d)
# -------------------------FIM -VARIÁVEIS------------------#



# ------------------------------------------------------------#
# --------------------ÍNICIO DO SCRIPT------------------------#
TIME=3
while true; clear; 
    do
    echo " "
    echo " "
echo "Seja bem vindo ao script de automação Sr.$USER $0 do Kubuntu!"
echo ""
echo "Escolha uma opção abaixo para começar!"
echo " 
      1 - Adicionando Arquitetura em 32bits Ok
      2 - Desinstalando Programas OK
      3 - Adicionando Repositórios PPAs OK
      4 - Atualizar o Sistema OK 
      5 - Remover Travas Eventuais do APT ok
      6 - Instalando Programas em  APT
      7 - Instalando Programas em .DEB
      8 - Instalando Programas em .AppImage
      9 - Desisntalar Programas desnecessários
      0 - Sair do sistema ok"  
echo " "
echo -n "Digite a opção escolhida:"

read opcao 
case $opcao in
     1)        
         echo "Adicionando suporte para arquitetura em 32bits em."
         echo
         sudo ${suporte[@]} 
         echo "Perfeito adicionado a arquitetura em 32bits."
         echo 
         sudo  ${atualiza_sistema[@]}
         clear
         echo
         echo "Perfeito, estamos voltando ao menu iniciar."
         echo "Reiniciando menu em 3seg..."
         sleep $TIME 

     ;;

     2)
        echo "Certo estamos excluindo os programas que você pediu"
        echo
        sudo apt purge ${app_remover[@]} -y
        clear
        echo

        
     ;; 

     3) 
        echo " Instalando Repositórios PPAs"
        echo
        sudo add-apt-repository  "$ppa_lutris" -y
        sudo add-apt-repository  "$ppa_retroarch" -y 
        sudo add-apt-repository  "$ppa_kodi" -y
        sudo add-apt-repository  "$ppa_java"  -y
        echo
        sudo apt update 
        clear   
        echo "Repositórios Instalados."
        echo " Voltando ao menu..."
        sleep $TIME
    ;;

    4)
        echo " Atualizando o sistema"
        echo
        echo "Vamos atualizar agora as listas dos repositórios"
        sleep $TIME
        sudo apt update 

    ;;

    5)
        echo "Removendo travas do APT "
        sudo rm $trava1
        sleep $TIME 
        sudo rm $trava2
        echo
        echo "Voltando ao menu"
        clear


    
    ;;
    
    6)
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
clear
;;
    0)

        echo "Certo saindo do sistema"
        echo "Saindo do sistema em 3.2.1..."
        sleep $TIME
        clear
        exit 1
        
    ;;
esac
done