#!/bin/bash

#  MIT License
#
#  Copyright (c) 2026 Dudu-gsh
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in all
#  copies or substantial portions of the Software.
#
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.

CORES=$(( $(nproc) - 2 ))
(( CORES < 1 )) && CORES=1
set -euo pipefail
sudo apt update -y 
sudo apt upgrade -y 
sudo apt install -y bc bison build-essential \
ccache curl flex g++-multilib gcc-multilib git \
git-lfs gnupg gperf imagemagick protobuf-compiler \
python3-protobuf lib32readline-dev \
lib32z1-dev libdw-dev libelf-dev libgnutls-dev \
lz4 libsdl1.2-dev libssl-dev libxml2 \
libxml2-utils lzop pngcrush rsync schedtool \
squashfs-tools xsltproc xxd zip zlib1g-dev \
python-is-python3
mkdir -p ~/bin
mkdir -p ~/android/lineage

curl -fLo ~/bin/repo https://storage.googleapis.com/git-repo-downloads/repo
chmod a+x ~/bin/repo
clear
cat <<EOF >> ~/.profile
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
EOF
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache 
source ~/.profile
read -rp "Tell me your email of github,is for the repo to work" EMAIL 
read -rp "And name,u can put anything" NAME 
clear
git config --global user.email "$EMAIL"
git config --global user.name "$NAME"
git lfs install
git config --global trailer.changeid.key "Change-Id"

ccache -M 30G
ccache -o compression=true

cd ~/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-23.2 --git-lfs --no-clone-bundle
repo sync -c -j"$CORES"
clear
echo "On the steps to build on the lineageos,theres a step with breakfast NameOfUrDevice,Plese write bellow"
echo "Ex:rosemary"
read -rp "Whats whas written there?: " CODENOME
source build/envsetup.sh
clear
echo "Now take a sleep,coffe,or something,this will take a WILLE"
sleep 3
breakfast "$CODENOME"
funcao() {
  echo "Please,Downlaod and write where is the lineageos installer zip!"
echo "Ex:/home/myuser/Downloads/"
read -rp "Write here:" ZIP 
}
funcao

while [[ ! -f "$ZIP" ]]; do 
echo "File not found!"
funcao
done
funcao2() {
  echo "What's written on Extract proprietary blobs part?"
read -rp "Escreva aqui" PASTA
}
funcao2
while [[ ! -d "$PASTA" ]]; do
echo "Wrong path!"
funcao2
done
cd "$PASTA"
if [[ -f "./extract-files.sh" ]]; then
    ./extract-files.sh
elif [[ -f "./extract-files.py" ]]; then
   ./extract-files.py
  else
  echo "Important file not found!"
  exit 1
fi
croot
brunch "$CODENOME"
