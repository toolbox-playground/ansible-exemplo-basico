#!/bin/bash

# Lista de pacotes a serem instalados
packages=(
    "curl"
    "git"
    "vim"
    "htop"
)

# Função para instalar pacotes
install_packages() {
    echo "Atualizando lista de pacotes..."
    sudo apt-get update -y

    for package in "${packages[@]}"
    do
        echo "Instalando $package..."
        sudo apt-get install -y $package
    done
}

# Chama a função para instalar os pacotes
install_packages

echo "Todos os pacotes foram instalados com sucesso!"