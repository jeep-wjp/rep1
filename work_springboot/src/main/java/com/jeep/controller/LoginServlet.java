package com.jeep.controller;
import com.jeep.domain.User;
import com.jeep.service.IUserService;
import com.jeep.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LoginServlet {
    @Autowired
    IUserService userService;

    @RequestMapping("login")
    public String gologin()
    {
        return "/page/login/login.jsp";
    }
    @RequestMapping("/loginServlet")
    @ResponseBody
    public boolean login(User user, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        List<User> allUser = userService.findAllUser(map);
        boolean flag = false;
        for (int i = 0; i < allUser.size(); i++) {
            String name1 = allUser.get(i).getSu_name();
            String password1 = allUser.get(i).getSu_login_passwd();
            if (user.getSu_name() != null && user.getSu_login_passwd() != null) {
//                if (user.getSu_name().equals(name1) && user.getSu_login_passwd().equals(password1)){
                if (user.getSu_name().equals(name1) && MD5Util.md5(user.getSu_login_passwd()).equals(password1)) {
                    flag = true;
                    request.getSession().setAttribute("user", allUser.get(i));
                    break;
                }
            }
        }
        if (flag) {
           return true;
        }
        return false;
    }

    @RequestMapping("/loginOut")
    public String loginOut(User user, HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        return "/page/login/login.jsp";
    }
}
