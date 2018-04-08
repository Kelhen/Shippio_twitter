<template>
  <div class="row">
    <div class="col-1">
      <img src="../assets/default_icon.png" alt="Avatar" width="48" height="48" class="rounded-circle">
    </div>
    <div class="col-sm-11">
      <h5>toto</h5> {{ twitt.created_at | moment("calendar") }}
    </div>
    <div class="row">
      <div class="col-sm">
      <p class="lead">{{twitt.twitt}}</p>
    </div></div>
  </div>
</template>

<script>
export default {
  name: 'TwittItem',
  props: ['twitt']
}
</script>
