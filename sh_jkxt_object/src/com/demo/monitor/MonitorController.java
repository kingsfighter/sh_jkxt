package com.demo.monitor;

import com.demo.common.model.MonitorObjectConfig;
import com.demo.common.model.User;
import com.demo.common.result.Result;
import com.demo.util.EasyuiUtil;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;

/**
 * UserController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
 */
public class MonitorController extends Controller {
    public void index() {
        render("monitor.jsp");
    }

    public void list() {
        Page<MonitorObjectConfig> page = MonitorObjectConfig.dao.paginate(getParaToInt(0, 1), 10);
        renderJson(EasyuiUtil.adapterEasyuiPage(page));
    }

    public void add() {
        MonitorObjectConfig moc = getModel(MonitorObjectConfig.class);
        moc.save();
        renderText(JsonKit.toJson(new Result()));
    }

    public void edit() {
        getModel(MonitorObjectConfig.class).update();
        renderText(JsonKit.toJson(new Result()));
    }

    public void delete() {
        MonitorObjectConfig.dao.deleteById(getParaToInt("id"));
        renderText(JsonKit.toJson(new Result()));
    }
}
