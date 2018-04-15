# Twitter like client and server using rails vue graphql


Twitter like app
========

This application is a application test to use Rails as a backend with
graphql-ruby as graphql server, and Vuejs with vue-appolo for the
graphql client for the frontend. DB is sqlite.

`graphql-ruby <http://graphql-ruby.org/>`
`Vue-apollo <https://github.com/Akryum/vue-apollo>`
`Vue <https://fr.vuejs.org/>`

.. code:: shell

    done=3;echo done;done

Same name, but three distinct meanings (sigh). The Bash interpreter can
sort out this perversity, but I decided not to try to recreate the Bash
interpreter to beautify a script. This means there will be some border
cases this Python program won't be able to process. But in tests with
large Linux system Bash scripts, its error-free score was ~99%.

Installation
------------

SCRIPTED Installation :
In terminal application : clone the project

.. code:: shell

    git clone https://github.com/Kelhen/twitter_like.git

then go into the cloned project and init the project

.. code:: shell

    cd twitter_like
    chmod +x server.sh
    ./server.sh init

To start the project, safari should open on the application

.. code:: shell

    ./server.sh start

MANUAL Installation :

.. code:: shell

    git clone https://github.com/Kelhen/twitter_like.git
    cd twitter_like/server/
    gem install bundler
    gem install rails -v 5.1.4
    rails db:create
    cd ../client
    npm i

MANUAL Start :

Server:

.. code:: shell

    cd server/
    rails server

Client :

.. code:: shell
    cd client/
    npm run dev
