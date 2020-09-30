<template>
  <div class="top">
    <div class="top-left">
      <slot name="left"></slot>
    </div>
    <div class="top-middle">
      <slot name="middle"></slot>
    </div>
    <div class="top-right">
      <slot name="right"></slot>
    </div>
  </div>
</template>
<script>
export default {
  data () {
    return {}
  },
  methods: {},
  components: {}
}
 </script>
<style scoped>
body {
  margin: 0;
}
.top {
  z-index: 999;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 60px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0px 18px;
  background-color: #fff;
}
.top-left {
  font-weight: bold;
}
.top-middle {
  width: 80%;
  text-align: center;
}
.top-right .iconfont {
  font-size: 24px;
}
</style>