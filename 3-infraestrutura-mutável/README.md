# Infraestrutura Mutável

### A **infraestrutura mutável** refere-se a um modelo em que os recursos, após criados, podem ser modificados diretamente. 

### Isso significa que, uma vez que o recurso é provisionado, ele poderá ser modificado mesmo que ainda esteja em funcionamento, sem a necessidade de destruí-lo ou recriá-lo.

### Uma infraestrutura mutável é usada geralmente em ambientes onde recriar recursos continuamente se torna um fator mais complexo ou quando se faz necessário realizar pequenas modificações sem o custo de substituir toda a infraestrutura.

### Porém, assim como outros modelos, este também possui suas desvantagens:

- **Deriva de Configuração**: 
  
  Quando modificamos diretamente os recursos de infraestrutura, há o risco de que as configurações se desviem do estado original desejado. 
  
  Isso pode ocorrer devido as atualizações manuais que não são replicadas de forma consistente nos demais servidores.

- **Inconsistências**: 
  
  Ao longo do tempo, a infraestrutura mutável pode apresentar diferenças entre ambientes ou servidores, dificultando a previsibilidade e a rastreabilidade do ambiente. 
  
  Pequenas modificações podem causar impactos inesperados, como falhas em ambientes de produção.

- **Aumento do Risco**: 
  
  A aplicação de atualizações ou patches diretamente nos servidores pode causar falhas se não forem bem gerenciadas. 
  
  Além disso, corrigir uma atualização problemática pode ser difícil sem um histórico claro de mudanças.

# Exemplos de Infraestrutura Mutável

### A seguir abordaremos alguns exemplo de infraestruturas mutáveis e como se comportam:

1. **Servidores Tradicionais**: 
   
    Em ambientes de data center ou servidores virtuais, é comum que as atualizações de software sejam realizadas diretamente no servidor em execução, sem que ele seja substituído por outro.
   
2.  **Atualizações In-Place**: 
   
    Refere-se ao processo de aplicar atualizações diretamente em sistemas em funcionamento, como pacotes de software, bibliotecas ou sistemas operacionais.

3. **Aplicação de Patches**: 
    
    Atualizações de segurança e melhorias de desempenho são implementadas diretamente nos servidores em funcionamento, sem a necessidade de reiniciar ou substituir completamente o sistema.

# Atividade Prática

