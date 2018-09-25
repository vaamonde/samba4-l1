Atualização do Curso de SAMBA-4 Level 1 (25/09/2018)

Testes feito utilizando o VirtualBOX versão 5.2.18

1. Download do GNU/Linux Ubuntu Server 14.04.x LTS
Download da versão 14.04.5: http://releases.ubuntu.com/14.04/

2. Criação da Máquina Virtual no Oracle VirtualBOX
Errata: No video deixei a Placa de Rede em Modo Rede Interna, o correto e deixar nesse primeiro momento em Modo NAT caso você não tenha o serviços de DHCP na sua rede ou em Modo Bridge, caso já tenha esse serviço, por exemplo um Roteador Wireless.

3. Instalação do GNU/Linux Ubuntu Server 14.04.x LTS
A versão 14.04.5 nas telas iniciais de instalação mudou um pouco, mais essas alterações não afeta o processo inicial de instalação;
A versão 14.04.5 utiliza o Kernel na versão 4.4.0-31-generic.

4. Atualização do GNU/Linux Ubuntu Server 14.04.x LTS
Recomendo utilizar o comando apt (não usar o apt-get),vantagens dele ser mais rápido, mostrar a barra de progração e resolver melhor as dependências;
Atulização do GRUB, manter o sugerido na tela de manter o arquivo de configuração;
No video de atualização, recomendo fazer o comando: sudo apt dist-upgrade, esse comendo não está no vídeo, logo em seguida fazer um reboot da máquina para verificar se está tudo OK;
Kernel será atualizado para a versão 4.4.0-135.

5. Instalação e Configuração do Serviço de NTP
Todo o procedimento está OK

6. Instalação e Configuração do Serviço de Kerberos
Todo o procedimento está OK

7. Instalação das Dependências dos Serviços de Redes
Criação do arquivo no Github, instalar o git no servidor com o comando: sudo apt install git, acessar sua pasta home com o comando: cd ~, clonar o projeto com o comando: https://github.com/vaamonde/samba4-l1, acessar a pasta com o comando: cd samba4-l1/script, executar o script: sudo sh dependencias.sh.

8. Configurando o Endereço de Rede no GNU/Linux Ubuntu Server
Essa e a parte mais importante, as configurações de redes que será utilizada para todo o cenário, nesse ambiente estou com a placa de rede em Modo Bridge, tenho um router rodando, mais tem que tomar cuidado com o DHCP;
Ficou faltando fazer a configuração do arquivo /etc/hostname, correto e ter o nome FQDN do seu servidor dentro dele, edita o arquico com o comando: sudo vim /etc/hostname, completa o nome do servidor, no exemplo: ptispo01dc01.pti.intra

9. Instalação do SAMBA-4 Server e suas Dependências
Criação do arquivo no Github, acessar a pasta com o comando: cd samba4-l1/script, executar o script: sudo sh samba4.sh;
Nessa nova atualização e necessário instalar a dependência do Winbind;
Informação importante, a versão do SAMBA-4 e a 4.3.11;
Recomendação que não está no vídeo, fazer a reinicialização do servidor com o comando: sudo reboot.

10. Provisionando o SAMBA-4 Server como Active Directory Domain Controller
Para parar o serviço do SAMBA, os daemon mudou, correto: sudo serviço smbd stop (fazer duas vezes) e depois: sudo service nmbd stop (fazer duas vezes), checar o statuso com o comando: sudo service samba status, tem que aparecer a linha: stop/waiting;
Na opção do provisionamento usar a linha: samba-tool domain provision --use-rfc2307 --use-xattrs=yes --interactive, não usar mais a opção: --use-ntvfs pois foi descontinuada nas novas versões, gerando problemas de permissão;

11. Pós-Provisionamento do SAMBA-4 Server - Troubleshooting
Comando: sudo service samba status não reportar mais o status corretamente, ele reportar para o serviço do samba-ad-dc;
Comando: sudo samba-tool testparm a saída do resultado e muito diferente do mostrado no vídeo, agora com menos opções;
