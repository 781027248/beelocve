const Controller = require("egg").Controller;

class adminController extends Controller {
	// 登录
	async getAllUser() {
		let res = await this.ctx.service.adminService.getAllUser();
		this.ctx.response.body = res;
	}
	// 封号
	async lockUser() {
		let id=this.ctx.request.body.id;
		let res = await this.ctx.service.adminService.lockUser(id);
		this.ctx.response.body = res;
	}
	// 解封
	async unlockUser() {
		let id=this.ctx.request.body.id;
		let res = await this.ctx.service.adminService.unlockUser(id);
		this.ctx.response.body = res;
	}
}

module.exports = adminController;