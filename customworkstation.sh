#!/bin/bash

## Removendo travas eventuiais do apt ##
sudo apt-get clean ; sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock;

## Update dos repositórios ##

sudo apt update -y &&

## Instalação de pacotes e repositórios ##

sudo apt install filezilla git snapd &&

## Instalação de pacotes Snap ##

sudo snap install --classic code &&

## Instalação de Pacotes Externos ##

#--- Brave ---#
sudo apt install apt-transport-https curl &&

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg &&

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list &&

sudo apt update &&

sudo apt install brave-browser ;

#--- Notion ---#
wget https://notion.davidbailey.codes/notion-linux.list ;
sudo mv notion-linux.list /etc/apt/sources.list.d/notion-linux.list;
sudo apt update && sudo apt install notion-desktop;

#--- Qbittorrent --#
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable ;
sudo apt-get update ;
sudo apt-get install qbittorrent ;

#--- Zoom ---#
wget https://zoom.us/client/latest/zoom_amd64.deb -O zoom.deb ;
sudo apt install ./zoom.deb ;

#--- BalenaEtcher ---#
echo "deb https://dl.bintray.com/resin-io/debian stable etcher" | sudo tee /etc/apt/sources.list.d/etcher.list ;
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61 ;
sudo apt-get update ;
sudo apt-get install etcher-electron ;
## Atualização do Sistema ##

sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y &&

## Fim ##

echo "Finalizado"