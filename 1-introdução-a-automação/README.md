# Introdução a Automação

### Quando falamos de automação no contexto de DevOps, enfatizamos série de benefícios significativos que impactam diretamente a eficiência operacional e a qualidade dos produtos entregues.

### Implementar processos de automação são fundamentais para acelerar processos, reduzir erros humanos e melhorar a eficiência geral das equipes. 

### Aqui estão os principais benefícios e sua importância:

- **Aumento de Eficiência**: A automação acelera tarefas repetitivas e permite que as equipes se concentrem em atividades de maior valor estratégico, como inovação e melhorias contínuas.

- **Redução de Erros Humanos**: Ao eliminar processos manuais, a automação garante maior consistência e precisão, reduzindo a chance de erros que prejudicariam a operação ou a qualidade dos serviços.
  
- **Agilidade na Entrega**: Com processos automatizados, é possível acelerar o ciclo de desenvolvimento e implantação, resultando em respostas mais ágeis às demandas do mercado.

- **Escalabilidade Operacional**: Possibilita uma gestão eficiente de infraestrutura em grande escala, permitindo que as operações se adaptem rapidamente ao crescimento ou mudanças na demanda, sem comprometer a qualidade.

- **Padronização de Processos**: Scripts automatizados asseguram que os processos sejam executados de maneira consistente em diferentes ambientes, evitando incompatibilidade e falhas durante as fases de desenvolvimento, testes e produção.

- **Melhoria da Qualidade**: A automação facilita a integração contínua e testes automatizados, aumentando a qualidade do código e garantindo que menos problemas cheguem à produção.



# Ferramentas de Automação no Mercado

#### Vimos, primeiramente, que automação é um pilar essencial em DevOps, promovendo eficiência, qualidade e velocidade, enquanto habilita as equipes a entregar valor de forma contínua e confiável.

#### A seguir, falaremos sobre algumas ferramentas de automação mais utilizadas no mercado e suas respectivas funções.

## 1. Ansible

### Utiliza arquivos de configuração `YAML` chamados `playbooks` onde as tarefas e configurações são descritas de maneira declarativa. É baseado na arquitetura sem agentes, conectando-se remotamente via `SSH` para executar suas tarefas, dispensando a instalação de qualquer software específico nos dispositivos que estão sendo gerenciados.

**Cenários de Uso**:

-   Provisionamento de servidores.
-   Automação de configuração de sistemas operacionais e aplicativos.
-   Orquestração de workflows complexos, como atualizações em larga escala.
  
## 2. Terraform

### Uma ferramenta de infraestrutura como código (`IaC`) usada para criar, gerenciar e versionar infraestruturas também de maneira declarativa. Com o Terraform, você pode automatizar o provisionamento de recursos em diversos provedores de nuvem de diversas plataformas diferentes, como AWS, Azure e Google Cloud.

**Cenários de Uso**:

- Provisionamento de infraestrutura em nuvem (ex. instâncias EC2, Virtual Machine no Azure).
- Gerenciamento de redes, balanceadores de carga e outros recursos de nuvem.
- Criação e gestão de ambientes inteiros de maneira consistente.

## 3. Puppet:

### Ferramenta robusta para gerenciamento de configuração com arquitetura cliente-servidor, ideal para automação de aplicativos complexos. O Puppet utiliza linguagem própria para definir a configuração de sistemas e permite a automação e controle de grandes infraestruturas. Oferece  flexibilidade para automações avançadas, permitindo integração com diversas tecnologias, além de suportar scripts reutilizáveis e controle de versões das configurações.

**Cenários de Uso**:

- Gerenciamento de configuração em larga escala, especialmente em ambientes com requisitos de conformidade e auditoria.
- Manutenção e configuração contínua de servidores.

## 4. Chef:

### Também segue o conceito de infraestrutura como código (`IaC`), permitindo que os usuários escrevam scripts, chamados de `receitas`, para automatizar a configuração e manutenção de servidores e aplicações.

**Cenários de Uso**:

- Automação de deploy de aplicações complexas.
- Configuração de servidores e clusters de forma programática.
- Gerenciamento de aplicativos de maneira flexível e personalizada.

# Atividade Prática

#### Agora, vamos realizar uma atividade prática que envolve a criação de um script básico para automatizar uma tarefa comum e repetitiva, como a instalação de pacotes em uma máquina. 

#### Iremos explorar como isso pode ser feito tanto em `Bash` quanto em `PowerShell`, oferecendo exemplos práticos em ambas as linguagens. 

#### Esta atividade tem por objetivo facilitar as tarefas de administração realizadas frequentemente. 

#### A seguir, fornecemos as etapas detalhadas para que você possa aplicar essa automação no seu ambiente de trabalho.

## Exemplo em Bash (Linux/macOS):

#### Neste exemplo, o script é o arquivo Bash `install-packages.sh` que automatiza a instalação de uma lista de pacotes, torna o arquivo executável e, por fim, executa o script para que os pacotes sejam instalados automaticamente.





### 1. Criação do Arquivo do Script

#### Escolha um diretório e crie um arquivo chamado `install-packages.sh` usando o editor de texto de sua preferência.

````
touch install-packages.sh
````

### 2. Definição das Tarefas do Script

#### No arquivo `install-packages.sh`, vamos inserir os comandos necessários para realizar nossa automação.

#### Criaremos, primeiramente, uma lista que define os pacotes que desejamos instalar no sistema. Neste caso os pacotes instalados serão: `curl, git, vim e htop`.

````
packages=(
    "curl"
    "git"
    "vim"
    "htop"
)
````

#### Neste momento definimos uma função chamada `install_packages` que primeiro exibe uma mensagem de atualização da lista de pacotes e, em seguida, executa o comando `sudo apt-get update -y`, que atualiza a lista de pacotes disponíveis no sistema sem solicitar confirmação do usuário.

#### Ainda dentro da função, utilizamos um loop `for` para percorrer a lista de `packages`. Para cada pacote na lista, ele exibe uma mensagem informando que o pacote está sendo instalado. Em seguida, o comando `sudo apt-get install -y $package` é executado, onde `$package` representa o nome do pacote atual sendo processado no loop. 


````
install_packages() {
    echo "Atualizando lista de pacotes..."
    sudo apt-get update -y

    for package in "${packages[@]}"
    do
        echo "Instalando $package..."
        sudo apt-get install -y $package
    done
````

#### Por fim, a função `install_packages` é chamada, iniciando o processo de atualização e instalação dos pacotes definidos.

#### Após a conclusão, o script exibe uma mensagem final indicando que todos os pacotes foram instalados com sucesso.

````
install_packages

echo "Todos os pacotes foram instalados com sucesso!"
````

### 3. Execução do Script

#### Primeiro, precisamos tornar o script executável.
#### Para isso, navegue até o diretório onde se encontra o arquivo `install-packages.sh` e, no terminal, execute o comando:

````
chmod +x install-packages.sh
````

#### Agora execute o script com o seguinte comando:

````
./install-packages.sh
````

#### Aqui está um exemplo simplificado de como as mensagens podem aparecer no terminal ao executar o último comando, mostrando apenas as etapas principais do processo:


````
Atualizando lista de pacotes...
Instalando curl...
Instalando git...
Instalando vim...
Instalando htop...
Todos os pacotes foram instalados com sucesso!
````

## Exemplo em PowerShell (Windows)

#### Utilizaremos o mesmo exemplo anterior, porém agora para executar o script em `PowerShell`no Windows.

#### Salve o código abaixo em um arquivo chamado `install-packages.ps1`:

````
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
````

#### Em seguida abra o PowerShell como administrador e navegue até o diretório onde o arquivo foi salvo.

#### Execute o script usando o seguinte comando: 

````
.\install-packages.ps1
````







