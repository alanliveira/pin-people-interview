# 🧰 Tecnologias do Projeto

Este projeto foi desenvolvido utilizando **Ruby on Rails** como framework principal, seguindo boas práticas de desenvolvimento, testes automatizados, segurança e documentação de APIs.

Abaixo estão listadas as principais tecnologias e bibliotecas utilizadas.

---

## 🚀 Framework Principal

- **Ruby on Rails (~> 8.1.2)**  
  Framework web MVC utilizado para estruturar a aplicação, fornecer rotas, controllers, models e integração com banco de dados.

---

## 🗄️ Banco de Dados

- **PostgreSQL (pg ~> 1.1)**  
  Banco de dados relacional utilizado como principal sistema de persistência de dados.

---

## 🌐 Servidor Web

- **Puma (>= 5.0)**  
  Servidor web concorrente e performático para aplicações Ruby on Rails.

---

## 📦 Serialização e APIs

- **Jbuilder**  
  Utilizado para construção de respostas JSON da API.
  
- **Rack CORS**  
  Configuração de políticas de CORS para permitir requisições de diferentes origens (ex: frontend separado).

---

## 🖼️ Processamento de Imagens

- **Image Processing (~> 1.2)**  
  Biblioteca para redimensionamento e manipulação de imagens (ex: integração com Active Storage).

---

## ⚡ Performance

- **Bootsnap**  
  Otimiza o tempo de boot da aplicação através de cache de carregamento.

- **Thruster**  
  Ferramenta para melhorar performance em ambientes específicos.

---

## 🌍 Internacionalização e Compatibilidade

- **TZInfo-data**  
  Suporte a zonas de tempo em ambientes Windows e JRuby.

---

## 🧪 Testes Automatizados

- **RSpec Rails (~> 8.0)**  
  Framework principal de testes.

- **Factory Bot Rails (~> 6.5)**  
  Criação de dados de teste através de fábricas.

- **Shoulda Matchers (~> 7.0)**  
  Matchers para testes de validações e associações.

- **Faker (~> 3.6)**  
  Geração de dados fake para testes.

- **SimpleCov (~> 0.22.0)**  
  Geração de relatório de cobertura de testes.

---

## 🔍 Qualidade e Segurança

- **Rubocop Rails Omakase**  
  Padronização de código Ruby e Rails.

- **Brakeman**  
  Análise estática de segurança para aplicações Rails.

- **Bundler Audit**  
  Verificação de vulnerabilidades em gems.

- **RubyCritic (~> 5.0)**  
  Análise de complexidade e qualidade do código.

---

## 📑 Documentação de API

- **Rswag (rswag-specs, rswag-api, rswag-ui ~> 2.17)**  
  Ferramenta para geração automática de documentação Swagger/OpenAPI a partir dos testes.

---

## 📂 Manipulação de Arquivos

- **CSV (~> 3.3)**  
  Importação e exportação de arquivos CSV.

---

## ⚙️ Configuração de Ambiente

- **Dotenv (~> 3.2)**  
  Gerenciamento de variáveis de ambiente para desenvolvimento e testes.

---

## 🧑‍💻 Ambiente de Desenvolvimento

- **Debug**  
  Ferramenta de debug para Ruby.

- **Spring Commands RSpec (~> 1.0)**  
  Execução rápida dos testes com preload do ambiente.

---

## 🧠 Arquitetura do Projeto

- Backend baseado em API REST.
- Testes automatizados com RSpec.
- Documentação automática via Swagger (Rswag).
- Boas práticas de segurança e qualidade de código.
- Banco relacional PostgreSQL.
- Suporte a importação de dados via CSV.

---

📌 **Resumo:**  
O projeto utiliza uma stack moderna do ecossistema Rails, com foco em:
- API bem documentada  
- Testes automatizados  
- Qualidade de código  
- Segurança  
- Performance  

---
