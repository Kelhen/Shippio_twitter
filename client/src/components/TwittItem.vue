<template>
  <div class="row border border-light rounded twitt">
    <div class="col-1" style="padding: 5px">
      <img src="../assets/default_icon.png" alt="Avatar" width="48" height="48" class="rounded-circle">
    </div>
    <div class="col-sm-11">
      <h5>{{twitt.user.name}}</h5> {{ twitt.created_at | moment("calendar") }}
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

export default {
  name: 'TwittItem',
  props: ['twitt'],
  components: {
    FontAwesomeIcon
  }
}
</script>

<style lang="scss">
.twitt
{
  margin: 2px;
  padding-top: 5px;
}
.twitt:hover{
  background-color: rgb(230, 236, 240)
}
</style>
