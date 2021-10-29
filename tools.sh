#!/bin/bash
by="\033[1;33m"
bye="\033[1;00m"
br="\033[1;31m"
bre="\033[1;00m"
blink="\e[5m"

echo -e "$blink" "$br"INSTALLATION MAY TAKE TIME BECAUSE IT INSTALLS LOTS OF PACKAGES SO BE PATIENT AND HAVE A COFFEE "$bre" "$blink"

cp bugprobe /usr/bin
echo -e "$by"Must Run in Root..."$bye"

apt-get install golang-go -y


GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder &> /dev/null

go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest &> /dev/null

GO111MODULE=on go get -u -v github.com/lc/gau &> /dev/null



go get -u github.com/tomnomnom/gf &> /dev/null


go get github.com/tomnomnom/waybackurls &> /dev/null


go get github.com/Emoe/kxss &> /dev/null


cd ~
mkdir .gf

git clone https://github.com/1ndianl33t/Gf-Patterns &> /dev/null

mv ~/Gf-Patterns/*.json ~/.gf 


cd ~
cd go
cd bin
cp waybackurls /usr/bin/
cp subfinder /usr/bin/
cp kxss /usr/bin/
cp gf /usr/bin/
cp httpx /usr/bin
cp gau /usr/bin

echo -e "$by"  "$bye"
echo -e "$by"  "$bye"
echo -e "$by" Installation of BugProbe is Completed now you can run bugprobe by command ./bugprobe in BugProbe Directory or You can run it by simply typing bugprobe and pressing enter  "$bye"
