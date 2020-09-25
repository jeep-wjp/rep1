package com.jeep.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jeep.domain.Menu;
import com.jeep.domain.Res;
import com.jeep.domain.User;
import com.jeep.service.IMenuService;
import com.jeep.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/MenuController")
public class MenuController {
    @Autowired
    IMenuService iMenuService;

    @RequestMapping("/addMenu")
    @ResponseBody
    public boolean addMenu(Menu menu, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        menu.setSm_create_uid(user.getId());
        menu.setSm_update_uid(user.getId());
        menu.setSm_create_dt(DateUtils.toSqlDate(new Date()));
        menu.setSm_update_dt(DateUtils.toSqlDate(new Date()));
        int i = iMenuService.addMenu(menu);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @RequestMapping("/deleteMenu")
    @ResponseBody
    public boolean deleteMenu(Integer id, HttpServletRequest request) {
        Menu menu = new Menu();
        menu.setId(id);
        int i = iMenuService.deleteMenu(menu);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @RequestMapping("/updateMenu")
    @ResponseBody
    public boolean updateMenu(Menu menu, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        menu.setSm_update_uid(user.getId());
        menu.setSm_update_dt(DateUtils.toSqlDate(new Date()));
        int i = iMenuService.updateMenu(menu);
        if (i > 0) {
            return true;
        }
        return false;
    }

    //查询所有的菜单列表
    @RequestMapping("/findAllMenu")
    @ResponseBody
    public Res findAllMenu(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<>();;
        if (page != null && limit != null) {
            map.put("page", (page - 1) * limit);
            map.put("limit", limit);
        }
        List<Menu> menuList = iMenuService.findAllMenu(map);
        if (menuList != null && menuList.size() > 0) {
            Long count = (long) iMenuService.findAllMenuCount(map);
            return new Res(0, "", count, menuList);
        }
        return null;
    }

    //    权限菜单对应角色的回显
    @RequestMapping("/findSelectedMenu")
    @ResponseBody
    public List<Integer> findSelectedMenu(Integer role_id) {
        List<Menu> list = iMenuService.getMenuByRoleID(role_id);
        List<Integer> listid = new ArrayList<>();

        List idlist = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            listid.add(list.get(i).getId());
            List<Menu> children = list.get(i).getChildren();
            for (int i1 = 0; i1 < children.size(); i1++) {
                listid.add(children.get(i1).getId());
            }
        }
//        return JSON.toJSONString(idlist);
        return listid;
    }

    //    根据选中角色获取菜单列表
    @RequestMapping("/findMenuList")
    @ResponseBody
    public JSONArray findMenuList(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        JSONArray array = new JSONArray();
        List<Menu> list = iMenuService.getMenu(user.getId());
        for (int i = 0; i < list.size(); i++) {
            Menu menu = list.get(i);
            JSONObject object = new JSONObject();
            object.put("title", list.get(i).getSm_name());
            object.put("icon", "&#xe630;");
            object.put("href", menu.getSm_url());
            object.put("spread", false);
            JSONArray array1 = new JSONArray();
            List<Menu> children = menu.getChildren();
            for (int i1 = 0; i1 < children.size(); i1++) {
                JSONObject object1 = new JSONObject();
                object1.put("title", children.get(i1).getSm_name());
                object1.put("icon", "&#xe61c;");
                object1.put("href", children.get(i1).getSm_url());
                object.put("spread", false);
                array1.add(object1);
            }
            object.put("children", array1);
            array.add(object);
        }

        return array;
    }

    //    获取权限菜单列表
    @RequestMapping("/getMenuData")
    @ResponseBody
    public JSONArray getMenuData(Integer id) {
        JSONArray array = new JSONArray();
        List<Menu> list = iMenuService.getMenu(1);
        for (int i = 0; i < list.size(); i++) {
            Menu menu = list.get(i);
            JSONObject object = new JSONObject();
            object.put("title", menu.getSm_name());
            object.put("id", menu.getId());
            object.put("field", "");
            object.put("checked", false);
            object.put("spread", false);
            JSONArray array1 = new JSONArray();
            List<Menu> children = menu.getChildren();
            for (int i1 = 0; i1 < children.size(); i1++) {
                JSONObject object1 = new JSONObject();
                object1.put("title", children.get(i1).getSm_name());
                object1.put("id", children.get(i1).getId());
                object1.put("field", "");
                array1.add(object1);
            }
            object.put("children", array1);
            array.add(object);
        }
        return array;
    }
}
