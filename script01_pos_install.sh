#!/usr/bin/env bash
set -e 
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
# ------------------------------------------------------------#
# ------------------------------------------------------------#
# -------------------------VARIÁVEIS--------------------------#

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
)
#CHAVES
chaves=(winehq.key)
# ------------------------------------------------------------#


