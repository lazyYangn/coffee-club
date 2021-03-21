<template>
    <div>
        <top-bar>
            <div slot="left" class="top-left">
            </div>
            <div slot="middle">
                <div class="title" style="font-weight: blod;  line-height: 60px">
                    收藏夹
                </div>
            </div>
        </top-bar>
        <my-content :refreshFunc="refresh" pull>
            <a-list :grid="{ gutter: 16, column: 2 }" :data-source="likegoods">
                <a-list-item slot="renderItem" slot-scope="item">
                    <display-item :likeProduct="item"></display-item>
                </a-list-item>
            </a-list>
        </my-content>
    </div>
</template>

<script>
// 引入顶部组件
import TopBar from "@/components/topbar/TopBar";
// 引入content组件
import MyContent from "@/components/content/MyContent";
// 引入商品卡片
import DisplayItem from "@/components/display/DisplayItem";
import {
    HttpGql,
    ImgUrl
} from "@/kits/Http";
import {
    getCacheVal
} from '@/kits/LocalStorage'

export default {
    data() {
        return {
            likegoods: [],
        };
    },
    created() {
        this.initData();
    },
    methods: {
        async initData() {
            if (getCacheVal("token") && getCacheVal("token").length > 0) {
                let userid = getCacheVal('userid')
                let sql = {
                    query: `
              {
                user(u_id:"${userid}"){
                    u_id
                    name
                    favorite{
                      food_name
                      food_id
                      food_pic
                      food_title
                    }
                  }
              }
          `,
                };
                try {
                    let res = await HttpGql(sql);
                    this.likegoods = res.data.user.favorite.map((item) => {
                        item.food_pic = ImgUrl + item.food_pic;
                        return item;
                    });
                    this.$store.commit('pushLike', this.likegoods)
                    return true;
                } catch (error) {
                    return false;
                }
            } else {
                console.log('请登录')
                //为了加载效果
                return true
            }
        },
        refresh() {
            return this.initData();
        },
    },
    components: {
        TopBar,
        MyContent,
        DisplayItem,
    },
};
</script>

<style>
.title {
    font-size: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* 隐藏滚动进度条 */
::-webkit-scrollbar {
    display: none;
}
</style>
