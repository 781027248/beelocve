const Service = require("egg").Service;

/* sql语句:
insert into students(name,stuno,sex,class_id) values('金文刚',4073,'男',1);
delete from students where name='xmj';
update course set name='web全栈' where name='c++';
select id from user where id=?;
 */
class adminService extends Service {
	// 获取所有用户
	async getAllUser() {
		var result = await this.app.mysql.query(`select * from user`);
		return result;
	}
	// 用户封号
	async lockUser(id) {
		await this.app.mysql.query(`update user set canuse="0" where id=${id}`);
		var result = await this.app.mysql.query(`select * from user`);
		return result;
	}
	// 解封
	async unlockUser(id) {
		await this.app.mysql.query(`update user set canuse="1" where id=${id}`);
		var result = await this.app.mysql.query(`select * from user`);
		return result;
	}
}
module.exports = adminService;
