#!/usr/bin/env bash

Action(){
  _action=$1
  if [[ $_action = 'install' ]]; then
    InitProject
  elif [[ $_action = 'start' ]]; then
    StartProject
  else
    echo 'agument incorrect. valide argument : install start'
  fi
}

InitProject(){
  echo "initialisation of the server and client"
  cd server ||  (echo 'server not found'; exit 1)
  gem install bundler
  gem install rails -v 5.1.4
  rails db:create
  cd ..
  cd client ||  (echo 'client not found'; exit 1)
  npm isntall
  echo 'finish'
  echo
  echo 'To start the application run :'
  echo './server.sh start'
}

StartProject(){
  echo 'server and client starting...'
  cd server ||  (echo 'server not found'; exit 1)
  rails server &
  cd ..
  cd client ||  (echo 'client not found'; exit 1)
  npm run dev &
  open -a safari 'http://localhost:8080'
  echo 'server run on http://localhost:3000'
  echo 'client run on http://localhost:8080'
}


CheckVariable(){
  if [[ $# != 1 ]]; then
    echo "usage : ./server.sh [install|start]"
    exit
  else
    Action $1
  fi
}

CheckVariable
