<template>
  <div>{{twitt.twitt}} ({{twitt.created_at}})</div>
</template>

<script>
export default {
  name: 'TwittItem',
  props: ['twitt']
}
</script>
