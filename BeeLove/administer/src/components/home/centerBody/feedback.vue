<template>
  <div class="mytable">
    <table class="layui-table layui-anim layui-anim-upbit">
      <colgroup>
        <col width="150" />
        <col width="200" />
        <col />
      </colgroup>
      <thead>
        <tr>
          <th>
            <input type="checkbox" @click="checkAll" :checked="all" />
            全选
          </th>
          <th>用户id</th>
          <th>用户昵称</th>
          <th>反馈内容</th>
          <th>反馈时间</th>
          <th style="width:100px">操作</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in feedArr" :key="item.id">
          <td>
            <input
              class="check"
              type="checkbox"
              :value="item.id"
              :checked="checked"
              :feedid="item.id"
              @click="checkItem"
            />
          </td>
          <td>{{item.id}}</td>
          <td>{{item.nickname}}</td>
          <td>{{item.content}}</td>
          <td>{{item.time}}</td>
          <td>
            <button type="button" class="layui-btn layui-btn-lg" @click="delItem" :feedid="item.id">
              <i class="layui-icon">&#xe640;</i>
            </button>
          </td>
        </tr>
        <tr>
          <td colspan="6">
            <button
              type="button"
              class="layui-btn layui-btn-lg"
              style="width:80%"
              @click="delChecked"
            >
              <i class="layui-icon">&#xe640;</i>
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      feedArr: [],
      all: false,
      checked: false,
      checkArr: [],
    };
  },
  created() {
    this.getList();
  },
  mounted() {
    layui.use("element", function () {
      var element = layui.element;
    });
  },
  methods: {
    checkAll() {
      if (this.checked === true) {
        this.checked = false;
      } else {
        this.checked = true;
      }
    },
    checkItem() {
      let flag = true;
      let allcheck = document.getElementsByClassName("check");
      for (let i = 0; i < allcheck.length; i++) {
        if (allcheck[i].checked) {
          flag = true;
        } else {
          flag = false;
          break;
        }
      }
      if (flag) {
        this.all = true;
      } else {
        this.all = false;
      }
      console.log(flag, this.all);
    },
    delChecked(event) {
      let idStr = "";
      let all = document.getElementsByClassName("check");
      for (let i = 0; i < all.length; i++) {
        if (all[i].checked) {
          let id = this.feedArr[i].id;
          if (i != all.length - 1) {
            idStr = idStr + `id=${id} or `;
          } else {
            idStr = idStr + `id=${id}`;
          }
          this.checkArr.push(this.feedArr[i].id);
        }
      }
      this.$http
        .get("/delChecked", {
          params: {
            id: idStr,
          },
        })
        .then((res) => {
          this.getList();
        })
        .catch((err) => {
          console.log(err);
        });
    },
    delItem(event) {
      let id = event.target.getAttribute("feedid");
      this.$http
        .get("/delFeedId", {
          params: {
            id: id,
          },
        })
        .then((res) => {
          this.getList();
        })
        .catch((err) => {
          console.log(err);
        });
    },
    getList() {
      this.$http
        .get("/feedback", {})
        .then((res) => {
          this.feedArr = res.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style scoped>
.mytable {
  height: 500px;
  overflow: scroll;
}
td,
th {
  text-align: center;
}
</style>