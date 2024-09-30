# Lista de pacotes a serem instalados
$packages = @(
    "curl",
    "git",
    "vim",
    "htop"
)

# Função para instalar pacotes
function Install-Packages {
    Write-Host "Atualizando lista de pacotes..."

    foreach ($package in $packages) {
        Write-Host "Instalando $package..."
        choco install $package -y
    }
}

# Chama a função para instalar os pacotes
Install-Packages

Write-Host "Todos os pacotes foram instalados com sucesso!"
