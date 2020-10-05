<template>
  <div>
    <top-bar class="top-bar">
      <div slot="left">
        <span class="iconfont icon-fanhui icon" style="font-size:30px;line-height: 60px; color:#fff;" @click="goback"></span>
      </div>
      <div slot="middle">
        <div style="font-weight:blod;font-size:20px;line-height: 60px;color:#fff;">注册</div>
      </div>
    </top-bar>
    <my-content class="my-content">
      <div style="margin-top:60px">
        <a-form-model ref="registerform" :rules="rules" layout="vertical" :model="form" style="overflow-y:auto">
          <a-form-model-item label="" prop="username">
            <label style="color:#fff;font-size:16px;">用户昵称</label>
            <a-input v-model="form.username" placeholder="请输入您的用户昵称" />
          </a-form-model-item>
          <a-form-model-item label="" prop="mail">
            <label style="color:#fff;font-size:16px;">邮箱</label>
            <a-input v-model="form.mail" type="email" placeholder="请输入您的邮箱" />
          </a-form-model-item>
          <a-form-model-item label="" prop="pwd">
            <label style="color:#fff;font-size:16px;">密码</label>
            <a-input v-model="form.pwd" type="password" placeholder="请输入您的密码" />
          </a-form-model-item>
          <a-form-model-item>
            <a-button @click="sub('registerform')" block style="margin-top:24px;border:none;box-shadow: 0px 0px 8px #E3E3E3;">
              注册
            </a-button>
          </a-form-model-item>
        </a-form-model>
      </div>
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
const key = "loadingkey"
export default {
  data () {
    let validateMail = (rule, value, callback) => {
      if (value === '') {
        callback(new Error("请输入邮箱"))
      } else {
        callback()
      }
    }
    let validatePwd = (rule, value, callback) => {
      if (value === '') {
        callback(new Error("不能为空"))
      } else if (value.length <= 3) {
        callback(new Error("密码长度太短"))
      } else if (value.indexOf(" ") >= 0) {
        callback(new Error("密码格式不正确"))
      } else {
        callback()
      }
    }
    return {
      loading: false,
      form: {
        username: "",
        mail: "",
        pwd: "",
      },
      rules: {
        username: [{ required: true, message: "请输入用户昵称", trigger: "blur" }],
        mail: [
          { validator: validateMail, trigger: 'blur' },
          { type: 'email', message: "请输入合法的邮箱地址", trigger: "blur" }
        ],
        pwd: [
          { validator: validatePwd, trigger: 'blur' },
        ]
      }
    };
  },
  components: {
    MyContent,
    TopBar
  },
  methods: {
    goback () {
      this.$router.go(-1)
    },
    sub (formName) {
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          this.loading = true
          let res = await Http("/register", this.form)
          try {
            if (res.code === 1) {
              this.loading = false
              this.login()
            } else {
              this.loading = false
            }
          } catch (e) {
            this.$message.error({ content: e, key, duration: 2 });
            this.loading = false
          }
        }
      });
    }
  },
};
</script>

<style scoped>
.top-bar {
  background-color: rgb(0 0 0 /0);
}
.my-content {
  background-image: url("../../../public/imgs/Bitmap.png") !important;
}
.ant-input {
  height: 45px;
}
.title {
  font-size: 20px;
  color: rgb(0 0 0 / 0.87);
  font-weight: bold;
}
.title-extend {
  display: flex;
  font-size: 14px;
  font-weight: bold;
  color: #5f5f5f;
  margin-top: 10px;
}
.ant-form >>> .ant-form-item-label > label {
  color: rgb(0 0 0 / 0.5);
}
.ant-btn {
  background-color: #02d126;
  height: 50px;
  font-size: 20px;
  color: #fff;
  box-shadow: #fff 0px 0px 0px !important;
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