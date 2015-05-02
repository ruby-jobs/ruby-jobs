# Ruby Jobs [![Code Climate](https://codeclimate.com/github/ruby-jobs/ruby-jobs/badges/gpa.svg)](https://codeclimate.com/github/ruby-jobs/ruby-jobs) [![Build Status](https://travis-ci.org/ruby-jobs/ruby-jobs.svg?branch=master)](https://travis-ci.org/ruby-jobs/ruby-jobs) [![Test Coverage](https://codeclimate.com/github/ruby-jobs/ruby-jobs/badges/coverage.svg)](https://codeclimate.com/github/ruby-jobs/ruby-jobs)

Repositório do Ruby Jobs [www.rubyjobs.me](http://www.rubyjobs.me/).

O projeto foi criado com o intuito de mostrar ofertas de emprego para desenvolvedores Ruby.

## Instalação

Clone o repositório

```
git clone https://github.com/ruby-jobs/ruby-jobs.git
```

Instale as dependências

```
bundle install
overcommit --install
```

Copie o conteúdo do arquivo `database.yml.example` e crie um arquivo `database.yml`. Nele configure seus dados de acesso ao `postgresql`

Crie o banco, rode as migrations e opcionalmente rode os seeds para ter uma base de dados inicial.

```
rake db:create
rake db:migrate
rake db:seed
```

Rode os testes :+1:

```
rspec
```

Rode a aplicação :grin:

```
rails server
```
