package com.demo.monitor;

import java.util.ArrayList;
import java.util.List;

import com.demo.common.model.MonitorLog;
import com.demo.common.model.MonitorObjectConfig;
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

    public void chart(){
        List<MonitorObjectConfig> monitors = MonitorObjectConfig.dao.findAll();
        setAttr("monitors", monitors);
        render("chart.jsp");
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
    
    public void chartData(){
        String appIds = getPara("appIds");
        String[] apps = appIds.split(",");
        Result result = new Result();
        List list = new ArrayList();
        for(int i=0;i<apps.length;i++){
            Page<MonitorLog> logs = MonitorLog.dao.paginate1(1, 20,apps[i]);
            if(null == logs.getList() || 0 == logs.getList().size()){
                MonitorLog log = new MonitorLog();
                MonitorObjectConfig obj = MonitorObjectConfig.dao.findById(apps[i]);
                log.setAppName(obj.getAppName());
                log.setObjectId(obj.getId());
                log.setAccessCount(0);
                logs.getList().add(log);
            }
            list.add(logs);
        }
        result.setData(list);
        renderText(JsonKit.toJson(result));
    }
    
    public void lastLog(){
        String appIds = getPara("appIds");
        List<MonitorLog> logs = MonitorLog.dao.getLastLog(appIds);
        renderText(JsonKit.toJson(logs));
    }
    
    
}
