<template>
<div class="row border border-light rounded twitt">
  <div class="col-1" style="padding: 5px">
    <!-- <avatar v-bind:username='usename'></avatar> -->
    <avatar :username="`${twitt.postedBy.name}`" :src="require(`@/assets/${img}`)" :size="48"></avatar>
  </div>
  <div class="col-sm-11">
    <h5>{{twitt.postedBy.name}}</h5> {{ twitt.created_at | moment("calendar") }}
  </div>
  <div class="col-sm-12">
    <p class="lead">{{twitt.twitt}}</p>
  </div>
  <div class="col-12">
    <font-awesome-icon icon="comment" /> x reply
  </div>
</div>
</template>

<script>
import FontAwesomeIcon from '@fortawesome/vue-fontawesome'
import Avatar from 'vue-avatar'

export default {
  name: 'TwittItem',
  props: [ 'twitt' ],
  components: {
    FontAwesomeIcon,
    Avatar
  },
  computed: {
    img () {
      return this.twitt.postedBy.image
    },
    usename () {
      return this.twitt.postedBy.name
    }
  }
}
</script>

<style lang="scss">
.twitt {
    margin: 2px;
    padding-top: 5px;
}
.twitt:hover {
    background-color: rgb(230, 236, 240);
}
</style>
