# Teste Técnico - Pin People

Esse teste tem como objetivo cumprir os requisitos 1, 3 e 9 do [Desafio](desafio/README.md) proposto.

---

## Requisitos

Esse projeto foi desenvolvido usando um gerenciador de linguagens chamado [Mise](https://mise.jdx.dev/getting-started.html) com os plugins do Ruby e nodeJS ativo, recomento que vejo [Go rails Setup](https://gorails.com/setup/windows/11).

*   Linguagem (Ruby 3.4.7, Node.js 24.13.1, Python 3.9)
*   Gerenciador de pacotes (bundle 4.0.0)
*   Docker / Docker Compose

## Instalação

Passo a passo para configurar o ambiente local:

```bash
# Clone o repositório
git clone <url-do-repositorio>

# Entre na pasta
cd pin-people-interview

# Instale as dependências
mise install

# Copiar o arquivo de exemplo de variaveis de ambiente
cp .env.example .env

# Crie um link simbólico dentro da pasta backend
ln -s .env backend/.env

# inicia o serviçõ do banco de dados
docker compose -f 'compose.yml' up -d --build 'database'

# Acesse o diretório backend
cd backend

# prepara o banco de dados
bin/rails db:setup

# Execute as migrações se ouver
bin/rails db:migrate

# Criação e atualização da documentação
RAILS_ENV=test rails rswag

# Com os testes concluido execute o arquivo para popular o banco de dados
bin/rails data:import
```

## Como Executar

Para ambientes de desenvolvimento.

```bash
bin/rails s
```

Acesse no seu navegador a página [localhost:3000](http://localhost:3000) para abrir a documentação do projeto.

![Página inicial da aplicação](<docs/images/Captura de tela 2026-02-24 112309.png>)

> ### Dica
>
> Caso necessite definir uma porta diferente, coloque a variável de ambiente ```PORT=``` no seu ```.env```


## Como Testar

Comandos para rodar a suíte de testes.

```bash
# Prepare o banco de dados
bin/rails db:setup

# Execute as migrações se houver
bin/rails db:migrate

# Execução dos testes
bin/test
```


## Tecnologias

- [backend](backend/README.md)
