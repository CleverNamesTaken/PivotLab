#!/bin/sh
#TODO virtual environments, fixing up paths

#apt install tools

echo '[+] Installing tools with apt'
sudo apt update
sudo apt install -y proxychains4 git python3 python3-venv python3-packaging socat iptables wget tar ssh sshuttle unzip

# Install the other tools

## Install golang
echo '[+] Installing golang'
wget https://go.dev/dl/go1.24.3.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.24.3.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' | sudo tee /etc/profile
rm go1.24.3.linux-amd64.tar.gz

## Install chisel

echo '[+] Installing chisel'
mkdir -p ~/tools/chisel
git clone https://github.com/jpillora/chisel.git ~/tools/chisel

## Install gost
echo '[+] Installing gost'
mkdir -p ~/tools/gost
wget https://github.com/ginuerzh/gost/releases/download/v2.12.0/gost_2.12.0_linux_amd64.tar.gz
tar -xzf gost_2.12.0_linux_amd64.tar.gz -C ~/tools/gost
rm gost_2.12.0_linux_amd64.tar.gz

## Install ligolo
echo '[+] Installing ligolo-ng'
mkdir -p ~/tools/ligolo-ng
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8/ligolo-ng_agent_0.8_linux_amd64.tar.gz
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8/ligolo-ng_agent_0.8_windows_amd64.zip
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8/ligolo-ng_proxy_0.8_linux_amd64.tar.gz
tar -xzf ligolo-ng_agent_0.8_linux_amd64.tar.gz -C ~/tools/ligolo-ng
unzip -o ligolo-ng_agent_0.8_windows_amd64.zip -d ~/tools/ligolo-ng
tar -xzf ligolo-ng_proxy_0.8_linux_amd64.tar.gz -C ~/tools/ligolo-ng
rm ligolo-ng_proxy_0.8_linux_amd64.tar.gz
rm ligolo-ng_agent_0.8_linux_amd64.tar.gz
rm ligolo-ng_agent_0.8_windows_amd64.zip

## Install neo-reGeorg
echo '[+] Installing neo-reGeorg'
git clone https://github.com/L-codes/Neo-reGeorg.git ~/tools/Neo-reGeorg

sudo python3 -m venv /opt/virtual_environments/neo-reGeorg
sudo /opt/virtual_environments/neo-reGeorg/bin/pip3 install requests requests[socks] packaging
sed -i 's:#!/usr/bin/env python:#!/opt/virtual_environments/neo-reGeorg/bin/python3:' ~/tools/Neo-reGeorg/neoreg.py


## Install weeveley
echo '[+] Installing weeveley'
git clone https://github.com/epinna/weevely3.git ~/tools/weevely
sudo python3 -m venv /opt/virtual_environments/weevely
sudo /opt/virtual_environments/weevely/bin/pip3 install prettytable Mako PyYAML python-dateutil PySocks pyOpenSSL setuptools telnetlib3
sed -i 's:#!/usr/bin/env python3:#!/opt/virtual_environments/weevely/bin/python3:' ~/tools/weevely/weevely.py
sed -i 's:import telnetlib:import telnetlib3:' ~/tools/weevely/modules/backdoor/tcp.py

## Install ssf
echo '[+] Installing ssf'
mkdir -p ~/tools/ssf
wget https://github.com/securesocketfunneling/ssf/releases/download/3.0.0/ssf-win-x86_64-3.0.0.zip
unzip ssf-win-x86_64-3.0.0.zip -d ~/tools/ssf
rm ssf-win-x86_64-3.0.0.zip
wget https://github.com/securesocketfunneling/ssf/releases/download/3.0.0/ssf-linux-x86_64-3.0.0.zip 
unzip ssf-linux-x86_64-3.0.0.zip -d  ~/tools/ssf/
rm ssf-linux-x86_64-3.0.0.zip


## Install suo5
echo '[+] Installing suo5'
git clone https://github.com/zema1/suo5.git ~/tools/suo5
wget https://github.com/zema1/suo5/releases/download/v1.3.1/suo5-linux-amd64 -O ~/tools/suo5/suo5-linux-amd64

## Create callMe.sh
echo '[+] Installing callMe.sh'
echo IyEvYmluL2Jhc2gKCmlmIFtbICIkMSIgPT0gIi1oIiB8fCAiJDEiID09ICItLWhlbHAiIHx8ICQjIC1sdCA1IF1dOyB0aGVuCiAgZWNobyAiVXNhZ2U6ICQwIFRBUkdFVF9JUCBUQVJHRVRfUE9SVCBDQUxMQkFDS19JUCBDQUxMQkFDS19QT1JUIFBST1RPQ09MIgogIGVjaG8KICBlY2hvICJBcmd1bWVudHM6IgogIGVjaG8gIiAgVEFSR0VUX0lQICAgICAgIFRoZSBJUCBhZGRyZXNzIG9mIHRoZSB0YXJnZXQgc2VydmVyLiIKICBlY2hvICIgIFRBUkdFVF9QT1JUICAgICBUaGUgcG9ydCBudW1iZXIgb24gdGhlIHRhcmdldCBzZXJ2ZXIuIgogIGVjaG8gIiAgQ0FMTEJBQ0tfSVAgICAgIFRoZSBJUCBhZGRyZXNzIHRvIGluY2x1ZGUgaW4gdGhlIGNhbGxiYWNrIGRhdGEuIgogIGVjaG8gIiAgQ0FMTEJBQ0tfUE9SVCAgIFRoZSBwb3J0IG51bWJlciB0byBpbmNsdWRlIGluIHRoZSBjYWxsYmFjayBkYXRhLiIKICBlY2hvICIgIFBST1RPQ09MICAgICAgICBUaGUgcHJvdG9jb2wgdG8gc3BlY2lmeSAoZS5nLiwgdGNwLCB1ZHApLiIKICBlY2hvCiAgZWNobyAiRXhhbXBsZToiCiAgZWNobyAiICAkMCBsaW51eCA4MCBrYWxpIDQ0NDQgdGNwIgogIGV4aXQgMQpmaQoKVEFSR0VUX0lQPSQxClRBUkdFVF9QT1JUPSQyCkNBTExCQUNLX0lQPSQzCkNBTExCQUNLX1BPUlQ9JDQKUFJPVE9DT0w9JDUKCnRpbWVvdXQgMXMgY3VybCAiaHR0cDovLyR7VEFSR0VUX0lQfToke1RBUkdFVF9QT1JUfS9zZW5kLXBhY2tldCIgIC1IICdDb250ZW50LVR5cGU6IGFwcGxpY2F0aW9uL2pzb24nIC0tZGF0YS1yYXcgJ3siaXAiOiInJHtDQUxMQkFDS19JUH0nIiwicG9ydCI6Iicke0NBTExCQUNLX1BPUlR9JyIsInByb3RvY29sIjoiJyR7UFJPVE9DT0x9JyJ9JwoK | base64 -d | sudo tee /usr/local/bin/callMe.sh
sudo chmod +x /usr/local/bin/callMe.sh

#Create SSF config.json
echo '[+] Creating default ssf config.json'
echo ewogICJzc2YiOiB7CiAgICAiYXJndW1lbnRzIjogIiIsCiAgICAiY2lyY3VpdCI6IFtdLAogICAgImh0dHBfcHJveHkiOiB7CiAgICAgICJob3N0IjogIiIsCiAgICAgICJwb3J0IjogIiIsCiAgICAgICJ1c2VyX2FnZW50IjogIiIsCiAgICAgICJjcmVkZW50aWFscyI6IHsKICAgICAgICAidXNlcm5hbWUiOiAiIiwKICAgICAgICAicGFzc3dvcmQiOiAiIiwKICAgICAgICAiZG9tYWluIjogIiIsCiAgICAgICAgInJldXNlX250bG0iOiB0cnVlLAogICAgICAgICJyZXVzZV9uZWdvIjogdHJ1ZQogICAgICB9CiAgICB9LAogICAgInNvY2tzX3Byb3h5IjogewogICAgICAidmVyc2lvbiI6IDUsCiAgICAgICJob3N0IjogIiIsCiAgICAgICJwb3J0IjogIjEwODAiCiAgICB9LAogICAgInRscyIgOiB7CiAgICAgICJjYV9jZXJ0X3BhdGgiOiAiLi9jZXJ0cy90cnVzdGVkL2NhLmNydCIsCiAgICAgICJjZXJ0X3BhdGgiOiAiLi9jZXJ0cy9jZXJ0aWZpY2F0ZS5jcnQiLAogICAgICAia2V5X3BhdGgiOiAiLi9jZXJ0cy9wcml2YXRlLmtleSIsCiAgICAgICJrZXlfcGFzc3dvcmQiOiAiIiwKICAgICAgImRoX3BhdGgiOiAiLi9jZXJ0cy9kaDQwOTYucGVtIiwKICAgICAgImNpcGhlcl9hbGciOiAiREhFLVJTQS1BRVMyNTYtR0NNLVNIQTM4NCIKICAgIH0sCiAgICAic2VydmljZXMiOiB7CiAgICAgICJkYXRhZ3JhbV9mb3J3YXJkZXIiOiB7ICJlbmFibGUiOiB0cnVlIH0sCiAgICAgICJkYXRhZ3JhbV9saXN0ZW5lciI6IHsKICAgICAgICAiZW5hYmxlIjogdHJ1ZSwKICAgICAgICAiZ2F0ZXdheV9wb3J0cyI6IGZhbHNlCiAgICAgIH0sCiAgICAgICJzdHJlYW1fZm9yd2FyZGVyIjogeyAiZW5hYmxlIjogdHJ1ZSB9LAogICAgICAic3RyZWFtX2xpc3RlbmVyIjogewogICAgICAgICJlbmFibGUiOiB0cnVlLAogICAgICAgICJnYXRld2F5X3BvcnRzIjogZmFsc2UKICAgICAgfSwKICAgICAgImNvcHkiOiB7ICJlbmFibGUiOiBmYWxzZSB9LAogICAgICAic2hlbGwiOiB7CiAgICAgICAgImVuYWJsZSI6IGZhbHNlLAogICAgICAgICJwYXRoIjogIi9iaW4vYmFzaHxDOlxcd2luZG93c1xcc3lzdGVtMzJcXGNtZC5leGUiLAogICAgICAgICJhcmdzIjogIiIKICAgICAgfSwKICAgICAgInNvY2tzIjogeyAiZW5hYmxlIjogdHJ1ZSB9CiAgICB9CiAgfQp9Cg== | base64 -d > ~/tools/ssf/config.json


# install exploits
echo '[+] Downloading the exploit POCs'
mkdir -p ~/tools/exploits
git clone https://github.com/IppSec/evil-cups.git ~/tools/exploits/evil-cups

git clone https://github.com/TeneBrae93/CVE-2025-3243.git ~/tools/exploits/CVE-2025-3243


sudo python3 -m venv /opt/virtual_environments/exploits
sudo /opt/virtual_environments/exploits/bin/pip3 install ippserver
sed -i 's:#!/usr/bin/env python3:#!/opt/virtual_environments/exploits/bin/python3:' ~/tools/exploits/evil-cups/evilcups.py

echo '[+] All done.  Happy hacking'



