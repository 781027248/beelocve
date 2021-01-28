<template>
  <!-- 内容主体区域 -->
  <div class="main layui-anim layui-anim-upbit">
    <table class="layui-table" lay-size="sm">
      <colgroup>
        <col width="150" />
        <col width="200" />
        <col />
      </colgroup>
      <thead>
        <tr>
          <th>用户id</th>
          <th>用户电话</th>
          <th>昵称</th>
          <th>密码</th>
          <th>账号状态</th>
          <th style="width:100px">操作</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in userlist" :key="user.id">
          <td>{{user.id}}</td>
          <td>{{user.username}}</td>
          <td>{{user.nickname}}</td>
          <td>{{user.password}}</td>
          <td>{{user.canuse}}</td>
          <td>
            <button class="layui-btn layui-btn-normal" @click="lock(user.id,user.username,user.canuse)">封号</button>
            <br />
            <button class="layui-btn layui-btn-warm" @click="unlock(user.id,user.username,user.canuse)">解封</button>
          </td>
        </tr>
      </tbody>
    </table>
    <div id="page"></div>
  </div>
</template>
<script>
export default {
  data: function () {
    return {
      userlist: [],
    };
  },
  created() {
    this.$http.get("/getAllUser").then((r) => {
      this.userlist = r.data;
    });
  },
  mounted() {
    layui.use("element", function () {
      var element = layui.element;
    });
  },
  methods: {
    changebtn(){

    },
    // 封号
    lock(id, username,canuse) {
      if(canuse==0){
        alert("该账号已经处于封号状态");
        return;
      }
      this.$http
        .post("/lockUser", {
          id,
        })
        .then((r) => {
          this.userlist = r.data;
          alert(`用户${username}已被封号`);
        });
    },
    // 解封
    unlock(id, username,canuse) {
      if(canuse==1){
        alert("该账号状态正常");
        return;
      }
      // alert(id);
      this.$http
        .post("/unlockUser", {
          id,
        })
        .then((r) => {
          this.userlist = r.data;
          alert(`用户${username}已解封`);
        });
    },
  },
};
</script>

<style scoped>
div.main{
  overflow: scroll;
}
td,
th {
  text-align: center;
}
</style>