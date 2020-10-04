<template>
  <div @click="doActive" class="tab-bar-item" :style="avtiveStyle">
    <slot name="icon">
      <div :class="icon" style="font-size:19px"></div>
    </slot>
  </div>
</template>
<script>
export default {
  name: 'TabBarItem',
  props: {
    icon: {
      type: String,
      default: 'iconfont icon-caidaniconwodehui',
    },
    activeColor: {
      type: String,
      default: '#02D126',
    },
    path: String,
  },
  data() {
    return {
      isActive: false,
    }
  },
  methods: {
    doActive() {
      // router跳转
      if (this.$route.path != this.path) {
        this.$router.replace({ path: this.path })
      }
    },
  },
  computed: {
    avtiveStyle() {
      return this.$route.path.indexOf(this.path) > -1 ? { color: '#02D126' } : null
    },
  },
}
</script>
<style scoped>
.tab-bar-item {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
</style>
