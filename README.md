# Ruby Jobs [![Code Climate](https://codeclimate.com/github/ruby-jobs/ruby-jobs/badges/gpa.svg)](https://codeclimate.com/github/ruby-jobs/ruby-jobs) [![Build Status](https://github.com/ruby-jobs/ruby-jobs/workflows/CI/badge.svg)](https://travis-ci.org/ruby-jobs/ruby-jobs) [![Test Coverage](https://codeclimate.com/github/ruby-jobs/ruby-jobs/badges/coverage.svg)](https://codeclimate.com/github/ruby-jobs/ruby-jobs)

Repositório do Ruby Jobs [www.rubyjobs.com.br](http://www.rubyjobs.com.br/).

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

Configure as chaves do reCAPTCHA como varíaveis de ambiente. adicione as seguintes linhas no `.bash_profile` (Mac) ou `.bashrc` (Linux).
  
    export RECAPTCHA_SITE_KEY="YOURPUBLICKEY"
    export RECAPTCHA_SECRET_KEY="YOURPRIVATEKEY"


Para o deploy no Heroku, use os comandos:


    heroku config:set RECAPTCHA_SITE_KEY="YOURPUBLICKEY"
    heroku config:set RECAPTCHA_SECRET_KEY="YOURPRIVATEKEY
    heroku config:set NEW_RELIC_KEY="YOURNEWRELICKEY"


Rode os testes :+1:

```
rspec
```

Rode a aplicação :grin:

```
rails server
```

### Development with docker and docker-compose

```shell script
docker-compose build
docker-compose up -d
docker-compose run --rm app bundle exec rake db:create db:migrate
docker-compose up # run http://localhost:3000
docker-compose ps

docker-compose stop
docker-compose down
docker-compose up --build
docker-compose run --rm app rake db:create
docker-compose run web rails db:setup db:migrate 
docker-compose run web rails db:migrate 
docker-compose run --rm app  rails console
docker-compose run --rm app bash

# Stop the container(s) using the following command:
docker-compose down

# Delete all containers using the following command:
docker rm -f $(docker ps -a -q)

# Delete all volumes using the following command:
docker volume rm $(docker volume ls -q)

# Restart the containers using the following command:
docker-compose up -d
docker-compose logs
#remove all containers

docker system prune -a
docker images -a
```
