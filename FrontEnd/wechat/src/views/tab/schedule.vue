<template>
  <div class="tab-page-container">
    <div v-if="isTeacher">
      <mt-cell v-for="(item,index) in course" :title="item.title" :label="getLabel(item,index)" :to="{name:'details', params:{courseId:item.id}}"
        is-link>
        <span>{{getStatus(item,index)}}</span>
      </mt-cell>
      <h2 v-if="!course.length" style="text-align:center">暂未创建任何课程</h2>
        <div class="schedule-notify">
          <div v-if="max - course.length > 0">
            <mt-button size="large" type="primary" @click="$router.push({name:'create-course'})">创建</mt-button>
            <span>提示：你可以创建{{max}}个毕业课题，当前还可以创建{{max - course.length}}个课题</span>
          </div>
          <div v-else-if="max - course.length == 0">
            <span>提示：你可以创建{{max}}个毕业课题，已达到最大课题数</span>
          </div>
          <div v-else>
            <span>提示：您多创建了{{course.length-max}}个课题，请删除！</span>
          </div>
        </div>
    </div>
    <div v-else>
      <mt-cell v-for="(item,index) in course" :title="item.title" :label="item.teacher" :to="{name:'details', params:{courseId:item.id}}"
        is-link>
        <span>{{getStatus(item,index)}}</span>
      </mt-cell>
        <h2 v-if="!course.length" style="text-align:center">暂未选定任何课程</h2>
        <div class="schedule-notify">
          <span>提示：按照院系规定你最多可同时向{{max}}个课题发出意向,最终将与一名老师达成互选。</span>
        </div>
    </div>
  </div>

</template>
<script>
  export default {
    name: "schedule-tab",
    data() {
      return {
        isTeacher: false,
        course: [],
        max: 0,
      }
    },
    created() {
      this.getCourse()
      util.isTeacher().then(user=>{
        this.isTeacher = user.isTeacher
      })
    },
    methods: {
      getCourse() {
        this.$http.get("schedule").then((res) => {
          this.course = res.data.data.course
          this.max = res.data.data.max
        })
      },
      getStatus(item, index) {
        if (item.status == 1) {
          return ['待审核', '未通过审核', '通过审核'][item.check_status]
        }
        return ["已删除", "审核中", "互选中", "互选完成"][item.status]
      },
      getLabel(item, index) {
        if (item.status == 1) {
          // 如果在审核中，则不显示label
          return ""
        }
        return item.student_list ? ('名单：' + item.student_list) : '尚未有人选中'
      },

    },

  };

</script>
<style>
  .schedule-notify {
    margin-top: 15px;
    font-size: 13px;
    text-align: center;
  }
</style>
