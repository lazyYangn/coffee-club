<template>
  <div class="tab-bar tab-bar-extend">
    <slot></slot>
  </div>
</template>
<script>
export default {
  name: 'TabBar',
  data () {
    return {}
  },
  methods: {},
  components: {}
}
</script>
<style>
.tab-bar-extend {
  display: flex;
  align-items: center;
  flex-direction: row;
  justify-content: center;
}
.tab-bar {
  position: fixed;
  height: 64px;
  left: 0px;
  bottom: 0px;
  right: 0px;
  width: 100%;
  background: #ffffff;
  border-radius: 100px 100px 0px 0px;
  z-index: 999;
}
</style>