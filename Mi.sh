#!/bin/bash
set -e

echo "[+] Atualizando sistema..."
sudo apt update && sudo apt upgrade -y

echo "[+] Instalando dependências..."
sudo apt install -y curl wget unzip zip bc bison flex build-essential \
libssl-dev libncurses5-dev libelf-dev clang ccache libtool libzstd-dev \
python3 kmod gcc-aarch64-linux-gnu

echo "[+] Clonando kernel do LineageOS (Xiaomi MT6785 - rosemary) - branch principal mais recente..."
git clone https://github.com/LineageOS/android_kernel_xiaomi_mt6785.git
cd android_kernel_xiaomi_mt6785

echo "[+] Baixando setup.sh do KernelSU..."
curl -LO https://raw.githubusercontent.com/tiann/KernelSU/main/scripts/setup.sh
chmod +x setup.sh

echo "[+] Aplicando KernelSU..."
./setup.sh

echo "[+] Clonando AnyKernel3 (mais recente)..."
cd ..
git clone https://github.com/osm0sis/AnyKernel3.git

echo "[✓] Tudo pronto!"
echo "    Para compilar:"
echo "    cd android_kernel_xiaomi_mt6785"
echo "    make O=out ARCH=arm64 rosemary_defconfig"
echo "    make O=out ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j\$(nproc)"
