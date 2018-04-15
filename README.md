# Twitter like client and server using rails vue graphql


Twitter like app
========

This application is a application test to use Rails as a backend with
graphql-ruby as graphql server, and Vuejs with vue-appolo for the
graphql client for the frontend. DB is sqlite.

graphql-ruby (http://graphql-ruby.org/)
Vue-apollo (https://github.com/Akryum/vue-apollo)
Vue (https://fr.vuejs.org/)


Installation MAC OSX
------------

SCRIPTED Installation :
In terminal application : clone the project

```shell
git clone https://github.com/Kelhen/twitter_like.git
```

then go into the cloned project and init the project

```shell
cd twitter_like
chmod +x server.sh
./server.sh init
```

To start the project, safari should open on the application

```shell
./server.sh start
```


MANUAL Installation :

```shell
git clone https://github.com/Kelhen/twitter_like.git
cd twitter_like/server/
gem install bundler
gem install rails -v 5.1.4
rails db:create
cd ../client
npm i
```
MANUAL Start :

Server:

```shell
cd server/
rails server
```

Client :

```shell
cd client/
npm run dev
```
