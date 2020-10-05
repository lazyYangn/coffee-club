<template>
  <div class="login">
    <top-bar>
      <div slot="left">
        <span class="iconfont icon-fanhui icon" style="font-size:30px;line-height: 60px;color:#fff;" @click="goback"></span>
      </div>
      <div slot="middle">
        <div style="font-weight:blod;font-size:20px;line-height: 60px;color:#fff;">登录</div>
      </div>
    </top-bar>
    <my-content>
      <a-form-model ref="loginForm" :rules="rules" layout="vertical" style="overflow-y:auto" :model="form">
        <a-form-model-item label="" prop="id">
          <label style="color:#fff;font-size:16px">邮箱</label>
          <a-input size="large" v-model="form.id" placeholder="请输入邮箱" />
        </a-form-model-item>
        <a-form-model-item label="" prop="pwd">
          <label style="color:#fff;font-size:16px">密码</label>
          <a-input size="large" v-model="form.pwd" type="password" placeholder="请输入密码" />
        </a-form-model-item>
        <a-form-model-item style="margin-top:16px;">
          <a-button @click="sub('loginForm')" size="large" type="primary" block>登录</a-button>
        </a-form-model-item>
      </a-form-model>
      <div class="loading" v-if="loading">
        <span class="iconfont icon-jiazaizhong my-loading"></span>
      </div>
    </my-content>
  </div>
</template>
<script>
import TopBar from '@/components/topbar/TopBar'
import MyContent from '@/components/content/MyContent'
import { Http } from '@/kits/Http'
export default {
  name: 'Login',
  data() {
    return {
      loading: false,
      form: {
        id: '',
        pwd: '',
      },
      rules: {
        id: [
          { required: true, message: '请输入邮箱', trigger: 'blur' },
          { type: 'email', message: '请输入合法的邮箱地址', trigger: 'blur' },
        ],
        pwd: [{ required: true, message: '请输入密码', trigger: 'blur' }],
      },
    }
  },
  components: {
    TopBar,
    MyContent,
  },
  methods: {
    goback() {
      this.$router.go(-1)
    },
    sub(formName) {
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          this.loading = true
          let res = await Http('/login', this.form)
          try {
            if (res.code === 1) {
              // this.loading = false
              setCacheVal('token', res.data.token)
              setCacheVal('userid', res.data.userId)
              setCacheVal('username', res.data.userName)
              this.$message.success({ content: res.msg, key, duration: 2 })
              this.$router.replace({ path: '/main/home' })
            } else {
              // this.loading = false
              this.$message.error({ content: res.msg, key, duration: 2 })
            }
          } catch (e) {
            // this.loading = false
            this.$message.error({ content: e, key, duration: 2 })
          }
        } else {
          return false
        }
      })
    },
  },
}
</script>
<style scoped>
.login {
  width: 100%;
  height: 100%;
  background-image: url('../../../public/imgs/Bitmap.png') !important;
  background-size: cover;
}
.title {
  font-size: 20px;
  font-weight: bold;
  color: rgb(0 0 0 / 0.87);
}
.title-extend {
  font-size: 14px;
  font-weight: bold;
  color: #5f5f5f;
  margin-top: 10px;
}
.ant-btn {
  background-color: #02d126;
  height: 50px;
  font-size: 20px;
  color: #fff;
  box-shadow: #fff 0px 0px 0px !important;
  margin-top: 15px;
}
.ant-btn-primary {
  border: none !important;
}
.ant-input {
  height: 45px;
}
.loading {
  display: flex;
  justify-content: center;
  align-items: center;
  color: rgb(0 0 0 /0.5);
  font-size: 16px;
}
@keyframes rotation {
  from {
    -webkit-transform: rotate(0deg);
  }
  to {
    -webkit-transform: rotate(360deg);
  }
}
.my-loading {
  color: #02d126;
  font-size: 32px;
  transform: rotate(360deg);
  animation: rotation 3s linear infinite;
  -moz-animation: rotation 3s linear infinite;
  -webkit-animation: rotation 3s linear infinite;
  -o-animation: rotation 3s linear infinite;
}
</style>
