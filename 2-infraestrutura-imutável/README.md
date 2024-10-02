# Infraestrutura Imutável

### A **infraestrututa imutável** consiste em um paradigma de gerenciamento de infraestrutura onde, uma vez criada o um componente de infraestrutura, sejam servidores, maáquinas virtuais ou containers, ele não poderá mais ser modificado. 

### Caso haja a necessidade de alterações, não será possível modificar a infraestrutura recém criada, sendo necessário a criação de uma nova versão desse componente, que irá substituir a anterior.

### Portanto, em infraestruturas imutáveis, qualquer mudança no sistema exige a criação de uma nova e a antiga é descartada. 

### Esse modelo, contudo, apresenta algumas vantagens em ambientes de produção. São elas:

- **Maior Consistência e Confiabilidade**:
   
   Uma vez criada e testada, a infraestrutura permanece exatamente igual ao logo de seu ciclo de vida, isso elimina a possível existência de `drifts`, `derivas` de configuração, isto é, divergências entre os ambientes geralmente causadas por mudanças manuais ou automáticas.
   
   Isso reduz o risco de ambientes diferentes apresentarem comportamentos inesperados, uma vez que cada instância é idêntica à anterior. 

- **Facilidade de Rollback**:
   
   Caso haja falhas, o `rollback` para a versão anterior da infraestrutura se torna muito mais fácil, uma vez que é preciso apenas reinstalar a versão desejada sem a necessidade de desinstalar pacotes ou desfazer mudanças manualmente.

   Isso também acaba por facilitar o gerenciamento do ciclo de vida da infraestrutura e possibilita uma rastreabilidade clara de mudanças, uma vez que permite o maior controle de rastreamento de versões.

- **Automação e Velocidade de Entrega**:
   
   Infraestrutura imutável se alinha bem com `pipelines` de `CI/CD`, pois a criação de instâncias imutáveis pode ser totalmente automatizada, permitindo que mudanças sejam testadas e aplicadas com confiança, uma vez que reduz a complexidade das etapas de configuração durante o `deployment`, tornando os processos mais rápidos e menos suscetíveis a erros humanos.

- **Escalabilidade Simples**:
   
   Em ambientes onde a escalabilidade é importante, como em plataformas baseadas em containers ou arquiteturas de microsserviços, a imutabilidade simplifica o processo de escalar componentes, uma vez que novas instâncias podem ser criadas rapidamente a partir de imagens já validadas.

# Ferramentas e Abordagens que Suportam Infraestruturas Imutáveis

### A infraestrutura imutável depende de várias ferramentas e abordagens que permitem a criação, gerenciamento e orquestração de recursos de forma consistente e automatizada. 

### A seguir estão algumas das principais tecnologias que suportam esse paradigma:

1. **Docker**:
   
   `Docker` é uma plataforma de containers que permite englobar uma aplicação e suas dependências em uma única imagem, garantindo que o software será executado independentemente do ambiente.
   
   Com o Docker, os containers são imutáveis, portanto, uma vez criada a imagem, ela é usada para instanciar containers idênticos. 
   
   Qualquer atualização no software ou configuração requer a criação de uma nova imagem, substituindo a versão antiga.

2. **Kubernetes**:
   
   `Kubernetes` é uma plataforma de orquestração de containers que automatiza a implantação e o gerenciamento de aplicações em containers. 
   
   Tem a capacidade de gerenciar containers imutáveis, garantindo que novos `pods` sejam criados a partir de imagens pré-definidas. 
   
   Quando uma nova versão é implantada, o Kubernetes substitui os pods antigos pelos novos, eliminando a necessidade de alterar os pods existentes.

3. **Terraform**:
   
   Como já dito anteriormente, `Terraform` é uma ferramenta de infraestrutura como código (`IaC`) que permite definir, provisionar e gerenciar recursos em nuvem de maneira automatizada.

   O Terraform usa a abordagem declarativa para provisionar a infraestrutura desejada e, quando ocorrem mudanças, ele cria novos recursos e elimina os antigos, mantendo a essência de imutabilidade.

4. **Ansible com abordagens imutáveis**:
   
   Embora tradicionalmente usada em infraestruturas mutáveis, o `Ansible` pode ser utilizado em conjunto com pipelines CI/CD para fornecer infraestruturas imutáveis. 
   
   Isso é feito, por exemplo, automatizando a criação de imagens de `Virtual Machines` ou containers que não serão alteradas após a implantação.

# Atividade Prática

### Vamos agora realizar uma atividade prática de criar uma imagem `Docker` simples, rodar um container e demonstrar o conceito de infraestrutura imutável. 

### Siga o passo a passo a seguir:

1. **Preparar a aplicação:**
   
   Vamos criar uma aplicação `Python` utilizando `Flask`simples para ser conteinerizada no `Docker`.

   Escolha um diretório de sua preferência e instale o Flask:

    `````
    pip install Flask
    `````

    Em seguida, crie o arquivo `app.py` com script abaixo:

    ````py
    from flask import Flask

    app = Flask(__name__)

    @app.route('/')
    def hello_world():
        return 'Olá, Docker! Esta é a Versão Imutável 1.'

    if __name__ == '__main__':
        app.run(host='0.0.0.0', port=5000)
    ````

2. **Criar o Dockerfile**:
   
   Crie um arquivo chamado `Dockerfile` no mesmo diretório com o seguinte código:

   ````
    FROM python:3.9-slim

    WORKDIR /usr/src/app

    RUN pip install --no-cache-dir Flask

    COPY . .

    EXPOSE 5000

    CMD ["python", "./app.py"]
    ````

3. **Construir a imagem Docker**:
   
   Construa a imagem Docker com o seguinte comando:

   ````
   docker build -t docker-imutavel-python-app:v1 .
   ````

   Verifique se a imagem foi criada corretamente com o comando:

   ````
   docker images
   ````

4. **Rodar o container a partir da imagem**:
   
   Execute o container com o comando:

   ````
   docker run -d -p 5000:5000 --name python-app docker-imutavel-python-app:v1
   ````

   Verifique se o container está rodando:

   ````
   docker ps
   ````

   Agora abra um navegador e acesse http://localhost:5000 para testar sua aplicação. 
   
   Você deverá ver a mensagem `Olá, Docker! Esta é a Versão Imutável 1.`

5. **Alterar o conteúdo da aplicação**:
   
   Vamos agora modificar nossa aplicação `app.py` para simular uma mudança de versão.

   Iremos alterar a mensagem da seguinte forma:

   ````py
   @app.route('/')
   def hello_world():
        return 'Olá, Docker! Esta é a Versão Imutável 2.'
    ````

    Agora, vamos construir uma nova imagem Docker:

    ````
    docker build -t docker-imutavel-python-app:v2 .
    ````

    Por fim, vamos substituir o container com a nova versão.

    Para isso, devemos parar e remover o container antigo e iniciar um novo container com a imagem atualizada:

    ````
    docker stop python-app
    docker rm python-app
    docker run -d -p 5000:5000 --name python-app docker-imutavel-python-app:v2
    ````

    Acesse novamente http://localhost:5000 e agora verá a nova mensagem `'Olá, Docker! Esta é a Versão Imutável 2.'`











