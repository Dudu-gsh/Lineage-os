#!/bin/bash
clear
echo "Ola e bem vindo ao meu menu"
sleep 1
echo "Hello and welcome to my menu"
sleep 1
echo "Escolha uma lingua"
echo "Chosse one language"
echo ""
echo "1) English (Adding soon)"
echo "2) Portugues"
echo ""
echo "Aviso,quando for escrever,escreva pt pra portugues ou en pra ingles"
sleep 1
echo "Warnig,when your gonna wtite,write pt for portuguese or en for english"
sleep 1
read -rp "Escreva  /  Write:" lang

if [[ $lang == pt ]]; then
echo "Bem vindo ao meu lineageos 23 builder"
chmod +x $(pwd)/lineageos23pt.sh
./lineageos23pt.sh
echo "Agora voce tem um build do lineageos 23"
exit 1

elif [[ $lang == en ]]; then 
echo "Welcome to my lineageos 23 builder"
chmod +x lineageos23en.sh
./lineageos23en.sh
echo "Now you have a build of lineageos 23"
else 
echo "Nao entendi meu fi."
echo "I dont understand"
