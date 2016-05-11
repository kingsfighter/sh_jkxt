package com.demo.user;

import com.demo.common.model.Blog;
import com.demo.common.model.User;
import com.demo.common.result.Result;
import com.demo.util.EasyuiUtil;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.json.Json;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;

/**
 * UserController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
 */
public class UserController extends Controller {
    public void index() {
        render("user.jsp");
    }

    public void list() {
        Page<User> page = User.me.paginate(getParaToInt(0, 1), 10);
        renderJson(EasyuiUtil.adapterEasyuiPage(page));
    }

    public void showAddView() {
        render("user_add.jsp");
    }

    @Before(UserValidator.class)
    public void add() {
        User user = getModel(User.class);
        //set default password
        user.setPassword("123456");
        user.save();
        renderText(JsonKit.toJson(new Result()));
    }
    
    public void showEditView() {
        //setAttr("user", JsonKit.toJson(User.me.findById(getParaToInt("id"))));
        setAttr("user", User.me.findById(getParaToInt("id")));
        render("user_edit.jsp");
    }

    @Before(UserValidator.class)
    public void edit() {
        getModel(User.class).update();
        renderText(JsonKit.toJson(new Result()));
    }

    public void delete() {
        User.me.deleteById(getParaToInt("id"));
        renderText(JsonKit.toJson(new Result()));
    }
}
