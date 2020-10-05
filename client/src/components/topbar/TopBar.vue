<template>
  <div class="top">
    <div class="top-left">
      <slot name="left">
        <span class="iconfont icon-caidan" @click="showDrawer"></span>
        <a-drawer width="280px" placement="left" title="Basic Drawer" :closable="false" :visible="visible" @close="onClose">
          <p>Some contents...</p>
          <p>Some contents...</p>
          <p>Some contents...</p>
        </a-drawer>
      </slot>
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
  data() {
    return {
      visible: false,
    }
  },
  methods: {
    showDrawer() {
      this.visible = true
    },
    onClose() {
      this.visible = false
    },
  },
  components: {},
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
  background-color: #f5f5f5;
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
