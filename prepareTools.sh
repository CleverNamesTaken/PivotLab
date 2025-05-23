#!/bin/sh

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


## Install pivotnacci
echo '[+] Installing pivotnacci'
git clone https://github.com/blackarrowsec/pivotnacci.git ~/tools/pivotnacci

## Install ssf
echo '[+] Installing ssf'
mkdir -p ~/tools/ssf
wget https://github.com/securesocketfunneling/ssf/releases/download/3.0.0/ssf-win-x86_64-3.0.0.zip
unzip ssf-win-x86_64-3.0.0.zip -d ~/tools/ssf
rm ssf-win-x86_64-3.0.0.zip
wget https://github.com/securesocketfunneling/ssf/releases/download/3.0.0/ssf-linux-x86_64-3.0.0.zip 
unzip ssf-linux-x86_64-3.0.0.zip -d  ~/tools/ssf/
rm ssf-linux-x86_64-3.0.0.zip

#Need to get config.json

## Install suo5
echo '[+] Installing suo5'
git clone https://github.com/zema1/suo5.git ~/tools/suo5
wget https://github.com/zema1/suo5/releases/download/v1.3.1/suo5-linux-amd64 -O ~/tools/suo5/suo5-linux-amd64

## Create callMe.sh
echo '[+] Installing callMe.sh'
echo IyEvYmluL2Jhc2gKCmlmIFtbICIkMSIgPT0gIi1oIiB8fCAiJDEiID09ICItLWhlbHAiIHx8ICQjIC1sdCA1IF1dOyB0aGVuCiAgZWNobyAiVXNhZ2U6ICQwIFRBUkdFVF9JUCBUQVJHRVRfUE9SVCBDQUxMQkFDS19JUCBDQUxMQkFDS19QT1JUIFBST1RPQ09MIgogIGVjaG8KICBlY2hvICJBcmd1bWVudHM6IgogIGVjaG8gIiAgVEFSR0VUX0lQICAgICAgIFRoZSBJUCBhZGRyZXNzIG9mIHRoZSB0YXJnZXQgc2VydmVyLiIKICBlY2hvICIgIFRBUkdFVF9QT1JUICAgICBUaGUgcG9ydCBudW1iZXIgb24gdGhlIHRhcmdldCBzZXJ2ZXIuIgogIGVjaG8gIiAgQ0FMTEJBQ0tfSVAgICAgIFRoZSBJUCBhZGRyZXNzIHRvIGluY2x1ZGUgaW4gdGhlIGNhbGxiYWNrIGRhdGEuIgogIGVjaG8gIiAgQ0FMTEJBQ0tfUE9SVCAgIFRoZSBwb3J0IG51bWJlciB0byBpbmNsdWRlIGluIHRoZSBjYWxsYmFjayBkYXRhLiIKICBlY2hvICIgIFBST1RPQ09MICAgICAgICBUaGUgcHJvdG9jb2wgdG8gc3BlY2lmeSAoZS5nLiwgdGNwLCB1ZHApLiIKICBlY2hvCiAgZWNobyAiRXhhbXBsZToiCiAgZWNobyAiICAkMCBsaW51eCA4MCBrYWxpIDQ0NDQgdGNwIgogIGV4aXQgMQpmaQoKVEFSR0VUX0lQPSQxClRBUkdFVF9QT1JUPSQyCkNBTExCQUNLX0lQPSQzCkNBTExCQUNLX1BPUlQ9JDQKUFJPVE9DT0w9JDUKCnRpbWVvdXQgMXMgY3VybCAiaHR0cDovLyR7VEFSR0VUX0lQfToke1RBUkdFVF9QT1JUfS9zZW5kLXBhY2tldCIgIC1IICdDb250ZW50LVR5cGU6IGFwcGxpY2F0aW9uL2pzb24nIC0tZGF0YS1yYXcgJ3siaXAiOiInJHtDQUxMQkFDS19JUH0nIiwicG9ydCI6Iicke0NBTExCQUNLX1BPUlR9JyIsInByb3RvY29sIjoiJyR7UFJPVE9DT0x9JyJ9JwoK | base64 -d | sudo tee /usr/local/bin/callMe.sh
sudo chmod +x /usr/local/bin/callMe.sh
