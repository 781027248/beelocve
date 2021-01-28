<template>
  <div class="layui-anim layui-anim-up">
    <div class="layui-carousel" id="lunbo">
      <div carousel-item>
        <div><img src="@/assets/img/home/lunbo1.png" alt=""></div>
        <div><img src="@/assets/img/home/lunbo2.jpg" alt=""></div>
        <div><img src="@/assets/img/home/lunbo3.jpg" alt=""></div>
        <div><img src="@/assets/img/home/lunbo4.jpg" alt=""></div>
        <div><img src="@/assets/img/home/lunbo5.jpg" alt=""></div>
      </div>
    </div>
    <hr class="layui-bg-green" />
    <blockquote class="layui-elem-quote">
      评分
      <div id="score"></div>
    </blockquote>
    <hr class="layui-bg-green" />
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      score: "",
    };
  },
  mounted() {
    layui.use("rate", function () {
      var rate = layui.rate;

      //渲染
      var ins1 = rate.render({
        elem: "#score",
        choose: function (value) {
          if (value > 4) alert("么么哒");
        },
      });
    });

    layui.use("carousel", function () {
      var carousel = layui.carousel;
      //建造实例
      carousel.render({
        elem: "#lunbo",
        width: "100%", //设置容器宽度
        arrow: "always", //始终显示箭头
        //,anim: 'updown' //切换动画方式
      });
    });
  },
};
</script>

<style>
</style>