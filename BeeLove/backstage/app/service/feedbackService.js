const Service = require("egg").Service;
const fs = require('fs');
const path = require("path");
const {
    resolveNaptr
} = require("dns");

/* sql语句:
insert into students(name,stuno,sex,class_id) values('金文刚',4073,'男',1);
delete from students where name='xmj';
update course set name='web全栈' where name='c++';
select id from user where id=?;
 */
class FeedbackService extends Service {
    //获取反馈数据
    async feedback() {
        let sql = "select A.id,A.user_id userid,B.nickname,A.content,DATE_FORMAT(A.time,'%Y-%m-%d') time from feedback A,user B where A.user_id = B.id";
        let res = await this.ctx.app.mysql.query(sql, []);
        return res;
    }

    //根据id删除反馈数据
    async delFeedId(obj) {
        let sql = "delete from feedback where id=?";
        let res = await this.ctx.app.mysql.query(sql, [obj.id]);
        return res;
    }

    //删除选择的反馈
    async delChecked(obj) {
        let sql = `delete from feedback where ${obj.id}`;
        let res = await this.ctx.app.mysql.query(sql, []);
        return res;
    }
}

module.exports = FeedbackService;