<template>
  <div>
    <top-bar class="top-bar">
      <!-- <div slot="left" class="top-left"></div> -->
      <div slot="middle">
        <div style="font-weight:blod;font-size:20px;line-height: 60px; ">菜单</div>
      </div>
      <div slot="right">
        <span class="iconfont icon-shezhi"> </span>
      </div>
    </top-bar>
    <my-content class="my-content">
      <div class="img-content" :style="imgPath">
        <div class="user_ava">
          <a-avatar :size="180" icon="user" class="user_ava" v-if="imageUrl" :src="imageUrl" />
          <a-avatar icon="user" class="user_ava" v-else>
            <a-icon :type="loading ? 'loading' : 'plus'" />
            <div class="ant-upload-text">
              Upload
            </div>
          </a-avatar>
        </div>
        <div class="user">
          <div class="user-name">张三</div>
          <div class="user-desc">asdfghjkl;'wertyui</div>
        </div>
        <div class="zx-box">
          <span class="iconfont icon-zhaoxiangji" style="font-size: 56px;" @click="showModal"></span>
          <a-modal :visible="visible" @ok="handleOk" @cancel="handleCancel">
            <div v-for="(item, index) in imgs" :key="item + index" class="ava-list">
              <img src="../../../../public/imgs/ava01.png" alt="" />
            </div>
          </a-modal>
        </div>
      </div>
      <div class="btn-content">
        <div class="user-menu">
          <div class="menu-item">
            <div class="item-num">33</div>
            <div class="item-title">喜欢</div>
          </div>
          <div class="menu-item">
            <div class="item-num">33</div>
            <div class="item-title">喜欢</div>
          </div>
          <div class="menu-item">
            <div class="item-num">33</div>
            <div class="item-title">喜欢</div>
          </div>
          <div class="menu-item">
            <div class="item-num">33</div>
            <div class="item-title">喜欢</div>
          </div>
        </div>
        <div class="user-desc-box">
          1ssssqwertyuiopasdfghjklzxcvbnm,.wertyu1ssssqwertyuiopasdfghjklzxcvbnm,.wertyu1ssssqwertyuiopasdfghjklzxcvbnm,
        </div>
        <div class="btn-box">
          关注
        </div>
      </div>
    </my-content>
  </div>
</template>
<script>
// 引入头部组件
import TopBar from '@/components/topbar/TopBar'
// 引入内容组件
import MyContent from '@/components/content/MyContent'
function getBase64(img, callback) {
  const reader = new FileReader()
  reader.addEventListener('load', () => callback(reader.result))
  reader.readAsDataURL(img)
}
let imgs = [
  '../../../../public/imgs/ava01.png',
  '../../../../public/imgs/ava02.png',
  '../../../../public/imgs/ava03.png',
  '../../../../public/imgs/ava04.png',
  '../../../../public/imgs/ava05.png',
  '../../../../public/imgs/ava06.png',
  '../../../../public/imgs/ava07.png',
  '../../../../public/imgs/ava08.png',
  '../../../../public/imgs/ava09.png',
]
export default {
  name: 'Account',
  data() {
    return {
      imgs,
      loading: false,
      imageUrl: '',
      ModalText: 'Content of the modal',
      visible: false,
      confirmLoading: false,
    }
  },
  methods: {
    showModal() {
      this.visible = true
    },
    handleOk(e) {
      this.ModalText = 'The modal will be closed after two seconds'
      this.confirmLoading = true
      setTimeout(() => {
        this.visible = false
        this.confirmLoading = false
      }, 2000)
    },
    handleCancel(e) {
      console.log('Clicked cancel button')
      this.visible = false
    },
    handleChange(info) {
      if (info.file.status === 'uploading') {
        this.loading = true
        return
      }
      if (info.file.status === 'done') {
        // Get this url from response in real world.
        getBase64(info.file.originFileObj, (imageUrl) => {
          this.imageUrl = imageUrl
          this.loading = false
        })
      }
    },
    beforeUpload(file) {
      const isJpgOrPng = file.type === 'image/jpeg' || file.type === 'image/png'
      if (!isJpgOrPng) {
        this.$message.error('You can only upload JPG file!')
      }
      const isLt2M = file.size / 1024 / 1024 < 2
      if (!isLt2M) {
        this.$message.error('Image must smaller than 2MB!')
      }
      return isJpgOrPng && isLt2M
    },
  },
  components: {
    TopBar,
    MyContent,
  },
  computed: {
    imgPath() {
      return () => {
        return {
          backgroundImage: `url(${this.imageUrl})`,
          backgroundSize: 'cover',
        }
      }
    },
  },
}
</script>
<style scoped>
.top-bar {
  background-color: rgb(0 0 0 /0);
}
.my-content {
  padding: 0 !important;
}
.main-content {
  position: relative;
}
.img-content {
  height: 55%;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  z-index: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #afebd2;
}
.user {
  position: absolute;
  bottom: 0;
  width: 100%;
}
.btn-content {
  background-color: #f7f7ff;
  border-radius: 25px 25px 0 0;
  height: 50%;
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 2;
  padding: 20px;
  display: flex;
  flex-direction: column;
}
.user_ava {
  width: 180px;
  height: 180px;
  border-radius: 50%;
}
.user-name {
  font-size: 24px;
  padding: 0 20px;
  font-weight: bold;
  color: #fff;
  position: absolute;
  bottom: 80px;
}
.user-desc {
  font-size: 16px;
  padding: 0 20px;
  color: #fff;
  position: absolute;
  bottom: 50px;
}
.zx-box {
  padding: 0 20px;
  color: #fff;
  position: absolute;
  bottom: 35px;
  right: 0px;
}
.user-menu {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.menu-item {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  flex: 1;
}
.item-num {
  font-size: 24px;
  font-weight: bold;
}
.item-title {
  font-size: 16px;
}
.user-desc-box {
  margin-top: 20px;
  padding: 0 30px;
  overflow-wrap: break-word;
}
.btn-box {
  background-color: #02d126;
  width: 200px;
  height: 60px;
  border-radius: 15px;
  margin: 20px auto;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  font-size: 20px;
  font-weight: bold;
}
.ava-list {
  margin-top: 20px;
}
.ava-list img {
  float: left;
  width: 33.33%;
  box-sizing: border-box;
  padding: 10px;
}
</style>
