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
# -------------------------VARIÁVEIS--------------------------#
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

#ADICIONANDO SUPORTE A 32bits
suporte="dpkg --add-architecture i386"

#PPAs
ppa_lutris="lutris-team/lutris"
ppa_retroarch="libretro/stable"
ppa_kodi="team-xbmc/ppa"
ppa_java="linuxuprising/java"

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
# ------------------------------------------------------------#
# --------------------ÍNICIO DO SCRIPT------------------------#
