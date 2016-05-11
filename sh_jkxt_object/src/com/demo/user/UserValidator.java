package com.demo.user;

import com.demo.common.model.User;
import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * BlogValidator.
 */
public class UserValidator extends Validator {
	
	protected void validate(Controller controller) {
		//validateRequiredString("blog.title", "titleMsg", "请输入Blog标题!");
		//validateRequiredString("blog.content", "contentMsg", "请输入Blog内容!");
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(User.class);
		String actionKey = getActionKey();
		if (actionKey.equals("/user/add"))
			controller.render("user_add.jsp");
		else if (actionKey.equals("/user/edit"))
			controller.render("user_edit.jsp");
	}
}
