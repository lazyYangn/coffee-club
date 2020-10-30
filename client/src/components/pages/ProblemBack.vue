<template>
  <div>
    <my-content class="problemback-my-content">
      <div class="problemback-top-bar">
        <div class="iconfont icon-fanhui problemback-icon" @click="goback"></div>
        <div class="problemback-top-text">问题反馈</div>
      </div>
      <div class="problemback-top-box">
        <div class="problemback-content-box">
          <div class="problemback-user-img">
            <img :src="userimg" style="width: 60px;height: 60px;border-radius:50%;">
          </div>
          <div class="problemback-text-box">
            <div style="font-size:16px;color:#fff;font-weight:bold;">快来说说软件使用过程中的问题吧!</div>
            <div style="margin-top:5px;font-size:14px;color:#fff;">功能异常/体验问题/产品建议等</div>
          </div>
        </div>
        <div class="problemback-btn-group">
          <div class="problemback-btn-item" @click="showDrawer">我要反馈</div>
          <div class="problemback-text-btn">
            <span class="iconfont icon-tubiao-" style="font-size:20px;line-height:40px">
            </span>
            <span style="font-size:16px;margin-left:5px;">订单问题</span>
          </div>
        </div>
      </div>
      <div class="problemback-problem-box">
        <div class="problemback-hot-box">
          <div>热门问题</div>
        </div>
        <div class="problemback-problem-content-box">
          <div class="problemback-problem-item">
            <div>交易下单过程不能付款</div>
            <div class="iconfont icon-iconfontjiantou5"></div>
          </div>
          <div class="problemback-problem-item">
            <div>会员名无法修改</div>
            <div class="iconfont icon-iconfontjiantou5"></div>
          </div>
          <div class="problemback-problem-item">
            <div>账户优惠券使用不了</div>
            <div class="iconfont icon-iconfontjiantou5"></div>
          </div>
          <div class="problemback-problem-item">
            <div>交易订单无法删除</div>
            <div class="iconfont icon-iconfontjiantou5"></div>
          </div>
          <div class="problemback-problem-item">
            <div>交易订单无法删除</div>
            <div class="iconfont icon-iconfontjiantou5"></div>
          </div>
          <div class="problemback-problem-item">
            <div>账户优惠券使用不了</div>
            <div class="iconfont icon-iconfontjiantou5"></div>
          </div>
        </div>
      </div>
      <div>
        <a-drawer :placement="placement" :closable="false" :visible="visible" height="360">
          <div class="problemback-commit-box">
            <div style="font-size:18px;font-weight:bold;">请描述coffee-club的使用问题</div>
            <div class="iconfont icon-cha" style="font-size:12px;line-height:28px;" @click="onClose"></div>
          </div>
          <div class="problemback-commit-text">
            <a-textarea placeholder="某个功能无法使用、页面白屏/卡顿/闪退、或其它产品建议(5个字以上)" :rows="4" v-model="commit.textareaVal" />
          </div>
          <div class="problemback-commit-btn" @click="sub">提交</div>
        </a-drawer>
      </div>
    </my-content>
  </div>
</template>
<script>
// 引入内容组件
import MyContent from '@/components/content/MyContent'
// 引入获取用户头像图片根路径
import { Http, ImgUrl, ba } from '@/kits/Http'
// 引入获取本地用户头像
import { getCacheVal } from '@/kits/LocalStorage'
export default {
  name: "ProblemBack",
  data () {
    return {
      userimg: '',
      visible: false,
      placement: 'bottom',
      //输入框中的内容
      commit: {
        // 用户提交的文字内容
        textareaVal: '',
        // 用户id
        userid: getCacheVal("userid"),
      }
    }
  },
  methods: {
    goback () {
      this.$router.go(-1);
    },
    showDrawer () {
      this.visible = true;
    },
    onClose () {
      this.visible = false;
    },
    onChange (e) {
      this.placement = e.target.value;
    },
    async sub () {
      let res = await Http("/usercommittext", this.commit);
      if (res.code === 1) {
        this.$message.success({ content: res.msg, duration: 2 });
        this.visible = false
        this.commit.textareaVal = ''
      } else {
        this.$message.error({ content: res.msg, duration: 2 });
      }

    },
  },
  created () {
    this.userimg = getCacheVal('imgpath')
  },

  components: {
    MyContent
  }
}
</script>
<style>
.ant-upload-select-picture-card i {
  font-size: 32px;
  color: #999;
}

.ant-upload-select-picture-card .ant-upload-text {
  margin-top: 8px;
  color: #666;
}

.ant-upload-list-picture-card .ant-upload-list-item {
  width: 64px !important;
  height: 64px !important;
}

.ant-upload-list-picture-card-container {
  width: 64px !important;
  height: 64px !important;
}
.ant-upload.ant-upload-select-picture-card {
  width: 64px !important;
  height: 64px !important;
}

.ant-upload .ant-upload-select .ant-upload-select-picture-card {
  width: 64px !important;
  height: 64px !important;
}

.problemback-top-bar {
  padding: 0 10px;
  position: fixed;
  top: 0;
  right: 0;
  left: 0;
  display: flex;
  background-color: #02d126;
  color: #fff;
}
.problemback-icon {
  font-size: 30px !important;
  line-height: 60px;
  flex: 1;
}
.problemback-top-text {
  flex: 11;
  font-size: 18px;
  line-height: 57px;
  display: flex;
  justify-content: center;
}
.problemback-my-content {
  padding: 0px 10px !important;
  background-image: linear-gradient(
    #02d126 10%,
    rgb(2 209 38 /0.7) 20%,
    #f5f5f5 35%
  );
}
.problemback-content-box {
  display: flex;
}
.problemback-user-img {
  width: 60px;
  height: 60px;
  background-color: #fff;
  border-radius: 50%;
}
.problemback-text-box {
  margin-left: 10px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.problemback-btn-group {
  padding: 20px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.problemback-btn-item {
  background-color: #fff;
  border-radius: 25px;
  width: 300px;
  height: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 16px;
  color: #02d126;
}
.problemback-text-btn {
  color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 15px;
}
.problemback-problem-box {
  background-color: #fff;
  height: 350px;
  border-radius: 10px;
  position: relative;
}
.problemback-hot-box {
  font-size: 18px;
  padding: 10px 20px;
}
.problemback-hot-box::after {
  content: "";
  position: absolute;
  top: 45px;
  border: 1px solid #f5f5f5;
  width: 100%;
  left: 0px;
}
.problemback-problem-content-box {
  padding: 10px 20px;
}
.problemback-problem-item {
  display: flex;
  justify-content: space-between;
  padding: 10px 0;
}
.problemback-commit-box {
  display: flex;
  justify-content: space-between;
}
.problemback-commit-text {
  margin-top: 10px;
}
.problemback-commit-pic {
  margin-top: 20px;
}
.problemback-commit-btn {
  background-color: #02d126;
  height: 40px;
  width: 90px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  border-radius: 12px;
  font-size: 16px;
  position: fixed;
  bottom: 60px;
  right: 20px;
  font-weight: bold;
}
</style>