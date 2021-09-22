#!/bin/bash

## Removendo travas eventuiais do apt ##

sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock;

## Update repositories ##

sudo apt update -y &&

## Installation of packages and repositories ##

sudo apt install filezilla git snapd &&

## Installation Snap packages ##

sudo snap install --classic code &&

## Installation of external packages ##

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

## System update ##

sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y &&

## Finish ##

echo "Finalizado"