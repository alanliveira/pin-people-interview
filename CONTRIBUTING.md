# Guia Técnico de Contribuição

Este documento descreve o fluxo oficial de contribuição para o projeto, baseado em controle de versão com Git e revisão via Pull Request.

A branch `main` é protegida e não permite commits diretos.

---

## 1. Criação de Branch

Toda contribuição deve partir da branch `main`.  
O nome da branch deve conter o identificador da tarefa (consultar no GitHub) seguido do tipo de trabalho.

### Padrão:
```
0XX-feature
```

### Comando:
```bash
git switch -c "0XX-feature"
```

Exemplo:
```bash
git switch -c "012-feature"
```

---

## 2. Desenvolvimento

Realize o desenvolvimento da funcionalidade ou correção na branch criada, respeitando:

- Padrões de código do projeto
- Organização dos commits
- Boas práticas de versionamento

---

## 3. Padrão de Commit

Os commits devem seguir obrigatoriamente o seguinte padrão:

```
[projeto] tag: mensagem
```

### Exemplo:
```bash
git commit -m "[backend] fix: melhorias contínuas"
```

Onde:
- **projeto**: módulo afetado (ex: backend, frontend, mobile)
- **tag**: tipo da alteração (`feat`, `fix`, `refactor`, `chore`, `test`, `docs`)
- **mensagem**: descrição objetiva da alteração

---

## 4. Envio da Branch para o Repositório Remoto

Após o commit:

```bash
git push origin 0XX-feature
```

---

## 5. Abertura de Pull Request

No GitHub, crie uma Pull Request com:

- Origem: sua branch (`0XX-feature`)
- Destino: `main`

A Pull Request será submetida a:

- Revisão de código
- Validação de regras do repositório
- Aprovação manual

---

## 6. Integração

Somente após aprovação da Pull Request:

- O merge na branch `main` será permitido
- O histórico permanecerá auditável
- O código estará apto para integração contínua

---

## Fluxo Resumido

1. Criar branch a partir da `main`
2. Desenvolver funcionalidade
3. Realizar commit padronizado
4. Enviar branch para o GitHub
5. Abrir Pull Request
6. Aguardar aprovação para merge

