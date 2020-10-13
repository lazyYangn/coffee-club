<template>
  <div class="goods-box">
    <div class="goods-img"></div>
    <div class="goods-name">热咖啡</div>
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
.goods-box {
  display: flex;
  flex-direction: column;
  height: 110px;
  width: 100px;
  justify-content: center;
  align-items: center;
  margin-left: 10px;
}
.goods-img {
  background-color: #ccc;
  height: 80px;
  width: 80px;
  border-radius: 10px;
}
.goods-name {
  max-width: 80px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
</style>