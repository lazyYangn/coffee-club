<template>
  <div class="product-card" v-if="project">
    <div class="product-img" :style="imgStyle(project.cate_pic)"></div>
    <div class="product-desc">
      <div>{{ project.name }}</div>
      <div>{{ project.title }}</div>
    </div>
  </div>
  <div class="product-card" v-else-if="likeProduct" @click="goDetail(likeProduct)">
    <div class="product-img" :style="imgLikeStyle(likeProduct.food_pic)"></div>
    <div class="product-desc">
      <div>{{ likeProduct.food_name }}</div>
      <div>{{ likeProduct.food_title }}</div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'DisplayItem',
  props: {
    project: Object,
    likeProduct: Object,
  },
  computed: {
    imgStyle() {
      return (url) => {
        return url && url !== ''
          ? {
              backgroundImage: `url(${url})`,
              backgroundSize: 'cover',
            }
          : ''
      }
    },
    imgLikeStyle() {
      return (url) => {
        return url && url !== ''
          ? {
              backgroundImage: `url(${url})`,
              backgroundSize: 'cover',
              backgroundPosition: 'center center',
            }
          : ''
      }
    },
  },
  methods: {
    goDetail(item) {
      this.$router.push({ path: '/productdetails/' + item.food_id })
    },
  },
}
</script>

<style scoped>
.product-card {
  background-color: #fff;
  height: 178px;
  width: 147px;
  border-radius: 15px;
  box-shadow: 0px 1px 8px rgb(40 40 40 / 0.2);
}
.product-img {
  background-color: #e5e5e5;
  height: 120px;
  border-top-left-radius: 15px;
  border-top-right-radius: 15px;
}
.product-desc {
  font-size: 14px;
  padding: 8px 12px;
  display: flex;
  flex-direction: column;
}
</style>
