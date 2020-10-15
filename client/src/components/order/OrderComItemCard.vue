<template>
  <div class="item-box" @click="goDetail(food.food_id)">
    <div class="good-img" :style="imgStyle(food.food_pic)"></div>
    <div class="good-info">
      <div class="good-name" style="font-size:16px;">{{food.food_name}}</div>
      <div class="good-desc" style="color:#ccc;"><span style="margin:0px 3px" v-for="item in food.skus" :key="item">{{item}}</span></div>
      <div class="good-num">× {{food.countbuy}}</div>
    </div>
    <div class="good-price">￥ {{food.food_price}}</div>
  </div>
</template>
<script>
export default {
  data () {
    return {}
  },
   props:{
    food:Object
  },
  created() {
    console.log(this.food)
  },
  methods: {
    goDetail(id){
      this.$router.push({path:'/productdetails/'+id})
    }
  },
  components: {},
  computed: {
    imgStyle(){
      return (url)=>{
        return {
        backgroundImage:`url(${url})`,
        backgroundSize: "cover",
        backgroundPosition: "center  center",
      }
      }
      
    }
  }
}
</script>
<style scoped>
.item-box {
  margin-top: 10px;
  display: flex;
}
.good-img {
  width: 80px;
  height: 80px;
  background-color: #ccc;
  border-radius: 10px;
}
.good-info {
  flex: 8;
  padding-left: 15px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.good-price {
  font-size: 24px;
  font-weight: bold;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>