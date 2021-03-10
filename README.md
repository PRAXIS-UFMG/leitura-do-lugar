# README Leitura do Lugar

Instruções para instalação e implantação da aplicação web.

## Dependências
* Ruby: >= 2.7
* NodeJs: >= 14
* Bundler: >= 2.2
* Yarn: >= 2.4

## Configuração
### Instalação das dependências
Após a instalação do Ruby e NodeJs e a instalação da _gem_ Bundler e do pacote npm Yarn, é necessário a instalação das dependências do projeto através dos comandos `bundle install` e `yarn install`.

Obs.: é recomendado configurar o Bundler com o comando `bundle config set path 'vendor/bundle'` para que ele não escreva um diretório global quando instalar as dependências.

### Banco de dados
O projeto está configurado para utilizar o SGBD MySQL e irá utilizar a variável de ambiente `LEITURA_DO_LUGAR_DATABASE_URL` e o o _encoding_ `utf8mb4` para se conectar ao banco. É necessário que o usuário provido tenha permissão para alterar as tabelas do banco especificado pela url.

### Arquivos enviados por upload
O projeto possui a funcionalidade de upload de arquivos diversos, que são armazenados na pasta indicada pela variável de ambiente `LEITURA_DO_LUGAR_FILES`. Obs.: o caminho deve terminar com o nome da pasta sem um `\` no final.

## Testes
A biblioteca Minitest é usada para os testes de unidade, executados por `bundle exec rails test`. Também existem testes de integração, que requerem que navegador Firefox esteja instalado e podem ser executados através de `bundle exec rails test:integration`.

## Implantação
Para execução em um ambiente de produção, é necessário definir as variáveis de ambiente `RAILS_ENV`, `NODE_ENV` como `production` além das variáveis referentes ao BD e upload de arquivos já descritas.
Na primeira conexão ao banco é necessário executar `bundle exec rails db:setup` para a criação das tabelas e em toda nova implantação (nova versão) `bundle exec rails db:migrate` para migração para a nova versão do esquema.

### Arquivos estáticos
É necessário compilar os arquivos estáticos que serão servidos pelo Rails na pasta `\public`, isso é feito através do comando `bundle exec rails assets:precompile`.
Para que o Rails (ao invés de um servidor HTTP como Apache ou NGINX) sirva diretamente estes arquivos, é necessário definir a variável de ambiente `RAILS_SERVE_STATIC_FILES` como `true`.

Obs.: é necessário que as variáveis de ambiente `RAILS_ENV` e `NODE_ENV` já estejam definidas como `production` a este ponto.

### Servidor
Por padrão o Ruby on Rails (e por extensão este projeto) utiliza o _web server_ [Puma](https://puma.io/). Ele pode ser utilizado em conjunto com um proxy reverso, atrás de um servidor HTTP, através de uma porta interna ou _unix socket_.

Para iniciar o servidor é utilizado o comando `bundle exec puma [opções]` onde `opções` são argumentos extras opcionais para o Puma (para definir a localização do _socket_ com `-b unix:///tmp/leitura_do_lugar.sock` por ex.).

Para receber os logs da aplição no _stream_ `stdout`, defina a variável de ambiente `RAILS_LOG_TO_STDOUT`.

## Ambiente padrão de execução
Apesar das instruções neste README serem aplicáveis à grande maioria dos sistemas *nix (MacOS, Linux, etc) sem grandes complicações, um exemplo sólido e mais completo de um ambiente de execução para o projeto disponível na web é o [Buildpack da plataforma Heroku para Ruby](https://github.com/heroku/heroku-buildpack-ruby).