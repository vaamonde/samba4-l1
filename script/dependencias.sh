#!/bin/bash

#Atualizando as lista do Apt-Get
sudo apt-get update

#Instalando todos os pacotes que fazem parte das dependências dos Serviços de Redes
sudo apt-get install build-essential libacl1-dev libattr1-dev libblkid-dev libgnutls-dev libreadline-dev python-dev libpam0g-dev python-dnspython gdb pkg-config libpopt-dev libldap2-dev dnsutils libbsd-dev docbook-xsl libcups2-dev libpam-smbpass nfs-kernel-server