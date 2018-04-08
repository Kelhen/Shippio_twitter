<template>
<div id="app">
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="#">
      <font-awesome-icon :icon="['fab', 'twitter']" />
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link disabled" href="#">My profile</a>
        </li>
      </ul>
      <form class="form-inline mt-2 mt-md-0">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search user</button>
      </form>
    </div>
  </nav>
  <main role="main" class="container">
    <div class="container">
      <create-twitt></create-twitt>
    </div>
    <div class="container">
      <twitt-list></twitt-list>
    </div>
  </main>
</div>
</template>

<script>
import FontAwesomeIcon from '@fortawesome/vue-fontawesome'
import TwittList from './components/TwittList'
import CreateTwitt from './components/CreateTwitt'

export default {
  name: 'app',

  components: {
    TwittList,
    CreateTwitt,
    FontAwesomeIcon
  }
}
</script>

<style lang="scss">
@import './styles/custom_bootstrap.scss';
@import '../node_modules/bootstrap/scss/bootstrap.scss';

.container {
    padding-top: 40px;
}

textarea {
    width: auto;
    resize: vertical;
}
</style>
