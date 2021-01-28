const Controller = require("egg").Controller;

class FeedbackController extends Controller {
    //获取反馈数据
    async feedback() {
        let res = await this.ctx.service.feedbackService.feedback();
        this.ctx.response.body = res;
    }

    //根据id删除反馈数据
    async delFeedId() {
        let obj = this.ctx.request.query;
        let res = await this.ctx.service.feedbackService.delFeedId(obj);
        this.ctx.response.body = res;
    }

    //删除选择的反馈
    async delChecked() {
        let obj = this.ctx.request.query;
        let res = await this.ctx.service.feedbackService.delChecked(obj);
        this.ctx.response.body = res;
    }

}

module.exports = FeedbackController;