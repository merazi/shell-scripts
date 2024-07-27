#!/bin/bash

# This is a script to run inside the root folder of a laravel
# proyect so it gets server into localhost:8000


# first move .env.example to .env
cp -r .env.example .env;

# now install composer things
echo "Installing composer deps"
composer install;

# configure artisan
php artisan key:generate;
php artisan migrate;
php artisan db:seed;

# finally, serve the thingy
php artisan serve;
