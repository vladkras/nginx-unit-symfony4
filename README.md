# Docker image with NGINX Unit and Symfony 4

### TL;DR

1. `docker run -d -p 80:8300 -v "$(pwd)/symfony:/symfomy" vladkras/nginx-unit-symfony4`
2. Wait
3. `ls symfony`

### What is this
This image uses [vladkras/nginx-unit-php7](https://hub.docker.com/r/vladkras/nginx-unit-php7/) to create [Symfony 4](https://symfony.com/4) project.

> Symfony is a set of PHP Components, a Web Application framework, a Philosophy, and a Community — all working together in harmony. &copy; https://symfony.com


> NGINX Unit is a new, lightweight, open source application server built to meet the demands of today’s dynamic and distributed applications. &copy; https://www.nginx.com

You can use it to start your Symfony project in just one command.

### Usage
Same as [parent image](https://github.com/vladkras/nginx-unit-php7) you can launch it with

`docker run -p 80:8300 vladkras/nginx-unit-symfony4`

this command will install additional php extensions and [Composer](https://getcomposer.org/) in Dockerfile and create blank (aka skeleton) symfony4 project in entrypoint.sh

Wait a while and open http://localhost (or any other ip bound to your docker machine). You should see "Welcome to Symfony" page.

I don't use `-d` key here for development purposes. If you add it be patient! Symfony installation may some time depending on your system resources and network speed.

Surely you need access to your code, so add volume to your command:

`docker run -p 80:8300 -v "$(pwd)/code:/symfony" vladkras/nginx-unit-symfony4`

By default Symfony is installed in `/symfony/` dir (why not?). Of course you can use any dir instead `$(pwd)/code` on your host machine but it must be empty for installation to succeed.

### Variables
`SYMFONY_VERSION=4.0.*` you can change default value with:

`docker run -p 80:8300 -e SYMFONY_VERSION=4.0.0 vladkras/nginx-unit-symfony4`

though, this will affect only [symfony/skeleton](https://github.com/symfony/skeleton) package

Default `INSTALL_PATH=/symfony`

if you want to install Symfony somewhere else. If you use it you have to reconfigure your app by changing config json and sending it again to control socket

### Contribute

If you have any questions feel free to open [New issues](https://github.com/vladkras/nginx-unit-symfony4/issues/new)

### License

This package is licensed under [MIT License](https://github.com/vladkras/nginx-unit-symfony4) and contains:
* [Composer](https://getcomposer.org/) also available under [MIT License](https://github.com/composer/composer/blob/master/LICENSE)
* [NGINX Unit](https://www.nginx.com/products/nginx-unit/) licensed under [Apache License](https://github.com/nginx/unit/blob/master/LICENSE)
* [Symfony](https://symfony.com/) licensed under [MIT License](https://github.com/symfony/symfony/blob/master/LICENSE) too
