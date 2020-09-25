package com.jeep.controller;

import com.jeep.domain.Res;
import com.jeep.domain.Role;
import com.jeep.domain.User;
import com.jeep.service.IRoleService;
import com.jeep.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/RoleController")
public class RoleController {
    @Autowired
    IRoleService iRoleService;

    @RequestMapping("/findAllRole")
    public Res findAllRole(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<>();
        if (page != null && limit != null) {
            map.put("page", (page - 1) * limit);
            map.put("limit", limit);
        }
        List<Role> roleList = iRoleService.findAllRole(map);
        Long count = (long) iRoleService.findAllRoleCount(map);
        return new Res(0, "", count, roleList);
    }


    @RequestMapping("/addRole")
    public boolean addRole(Role role, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        System.out.println(user);
        role.setSr_create_uid(user.getId());
        role.setSr_update_uid(user.getId());
        int i = iRoleService.addRole(role);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @RequestMapping("/updateRole")
    @ResponseBody
    public boolean updateRole(Role role, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        role.setSr_update_uid(user.getId());
        role.setSr_update_dt(DateUtils.toSqlDate(new Date()));
        int i = iRoleService.updateRole(role);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @RequestMapping("/deleteRole")
    @ResponseBody
    public boolean deleteRole(Role role) {
        int i = iRoleService.deleteRole(role);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @RequestMapping("/updateRoleResource")
    @ResponseBody
    public boolean updateRoleResource(Integer[] ids) {
        System.out.println(ids.length);
        try {
            if (ids != null) {

                int a = iRoleService.deleteResourceByRoleID(ids[0]);
                for (int i = 1; i < ids.length; i++) {
                    Map<String, Object> map = new HashMap<>();
                    map.put("srm_role_id", ids[0]);
                    map.put("srm_menu_id", ids[i]);
                    System.out.println(ids[i]);
                    int b = iRoleService.addResourceByRoleID(map);
                }

            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }


}
