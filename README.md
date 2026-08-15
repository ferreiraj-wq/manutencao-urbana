# Sistema Web para Registro e Acompanhamento de Ocorrências de Manutenção Urbana

Projeto acadêmico desenvolvido para o Projeto Integrador de Tecnologia da Informação II - UFMS.

## Módulo 3 - Banco de Dados e Controle de Versão

Nesta etapa foram desenvolvidos:
- modelo de dados;
- tabelas e relacionamentos;
- chaves primárias e estrangeiras;
- comandos SQL de inserção, consulta, atualização e remoção;
- organização para versionamento com Git e publicação no GitHub.

## Entidades
- usuario
- categoria
- status_ocorrencia
- orgao_responsavel
- ocorrencia
- imagem
- atualizacao_ocorrencia

## Estrutura

```text
manutencao-urbana-modulo3/
├── database/
│   ├── schema.sql
│   ├── seed.sql
│   └── queries.sql
├── .gitignore
└── README.md
```

## Como executar

1. Instale o MySQL 8 ou superior.
2. Abra o MySQL Workbench.
3. Execute `database/schema.sql`.
4. Execute `database/seed.sql`.
5. Execute os comandos de `database/queries.sql`.

## Sugestão de commits

```bash
git add .
git commit -m "Cria estrutura inicial do banco de dados"

git add .
git commit -m "Adiciona dados iniciais para testes"

git add .
git commit -m "Adiciona consultas e operações SQL"
```
