<template>
<div class="login-page">

<div class="form-section">
  <h1 class="text">华科毕设选题管理系统</h1>
  <el-input placeholder="账号" v-model="data.account" class="login-input">
    <template slot="prepend">账号</template>
  </el-input>
  <el-input placeholder="密码" type="password" v-model="data.password" class="login-input">
    <template slot="prepend">密码</template>
  </el-input>
  <el-button type="primary" size="large" @click="login" class="login-btn">登录</el-button>
</div>

</div>
</template>


<script>
  export default {
    name: "login",
    data() {
      return {
        data: {
          account: "19951995",
          password: "19951995"
        }
      }
    },
    watch: {

    },
    computed: {
    },
    methods: {
      login() {
        this.$http.post("login", this.$data.data).then((res)=> {
          if (!res.data.state) {
            this.$message.error(res.data.msg);
          }
        }).catch(function (error) {
          console.log(error);
        })
      }
    },
  };
</script>


<style>
.text {
  text-align: center;
}
  .form-section{
    width: 450px;
    margin: 120px auto;
  }
  .login-input {
    margin: 10px 0 ;
  }
  .login-btn {  
    width: 100%
  }
</style>
