package com.jeep.controller;

import com.jeep.domain.GetListVO;
import com.jeep.domain.Res;
import com.jeep.domain.User;
import com.jeep.service.IUserService;
import com.jeep.utils.DateUtils;
import com.jeep.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/UserController")
public class UserController {
    @Autowired
    IUserService iUserService;

    /**
     * 14      * 向用户登录页面跳转
     * 15
     */

    @RequestMapping("/login")
    public String toLogin() {
        return "login/login";
    }

    @RequestMapping("/upload")
    @ResponseBody
    public Res uploadFile(MultipartFile file, HttpServletRequest request) {
        String originalFilename = file.getOriginalFilename();
        System.out.println("文件名--->" + originalFilename);
        String uustr = UUID.randomUUID().toString().replace("-", "");
        String destName = uustr + originalFilename;
        String realPath = request.getServletContext().getRealPath("/");
        System.out.println("realPath->" + realPath);
        File aa = new File(realPath);
        File parentFile = aa.getParentFile().getParentFile();
        File realPathFile = new File(parentFile, "src/main/webapp/images");
//        File realPathFile = new File("D:\\IdeaWorkspace\\javamaven\\taskTime\\images");
        if (!realPathFile.exists()) {
            realPathFile.mkdirs();
        }
        File destFile = new File(realPathFile, destName);
        try {
            file.transferTo(destFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        HashMap<String, String> hashMap = new HashMap<>();
        hashMap.put("src", realPathFile.getAbsolutePath() + "\\" + destName);
        Res res = new Res(0, "", 1L, hashMap);
//        hashMap.clear();
        return res;
    }


    @RequestMapping("/findAllUser")
    @ResponseBody
    public Res findAllUser(String su_name, Integer page, Integer limit, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("su_name", su_name);
        map.put("page", (page - 1) * limit);
        map.put("limit", limit);

        List<User> userList = iUserService.findAllUser(map);
        Long aLong = iUserService.findAllUserCount(map);
        System.out.println("userList->" + userList.size());
        Res res = new Res(0, "", aLong, userList);
        if (res != null) {
            request.setAttribute("tip", "查询成功！");
            return res;
        }
        request.setAttribute("tip", "没有数据！");
        return null;
    }

    @RequestMapping("/findAllUserId")
    @ResponseBody
    public List<User> findAllUserId() {
        List<User> userList = iUserService.findAllUserId();
        System.out.println("userList.size():" + userList.size());
        return userList;
//        try {
//            ObjectMapper mapper = new ObjectMapper();
//            String s = mapper.writeValueAsString(userList);
//            System.out.println(s);
//            response.getWriter().write(s);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    @RequestMapping("/addUser")
    public String addUser(User user, HttpServletRequest request) {
        user.setSu_login_passwd(MD5Util.md5(user.getSu_login_passwd()));
        User user1 =(User) request.getSession().getAttribute("user");
        user.setSu_create_uid(user1.getId());
        user.setSu_create_dt(DateUtils.toSqlDate(new Date()));
        int i = iUserService.addUser(user);
        if (i > 0 ) {
            request.setAttribute("tip", "添加成功！");
            return "page/user/sys_user.jsp";
//            return "redirect:/UserController/findAllUser";
        }
        request.setAttribute("tip", "添加失败！");
        return "page/user/sys_user_add.jsp";
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public void updateUser(User user, HttpServletResponse response) {
        System.out.println("a");
        user.setSu_login_passwd(MD5Util.md5(user.getSu_login_passwd()));
        int i = iUserService.updateUser(user);
       int count = iUserService.findRoleByUserID(user);
        int j=0;
       if(count>0){
            j =iUserService.updateRoleForUser(user);

       }else {
           j =iUserService.addRoleForUser(user);
       }

        if (i > 0&&j>0) {
//            response.setAttribute("tip", "修改成功！");
            try {
                response.getWriter().write("true");
            } catch (IOException e) {
                e.printStackTrace();
            }
//            return "redirect:/UserController/findAllUser";
        }

//        response.setAttribute("tip", "修改失败！");

    }


    @RequestMapping("/deleteUser")
    @ResponseBody
    public void deleteUser(Integer id, HttpServletResponse response) {
        System.out.println(id);
        User user = new User();
        user.setId(id);
        int i = iUserService.deleteUser(user);
        int j = iUserService.deleteRoleByUser(user);
        if (i > 0&& j>0) {
//            response.setAttribute("tip", "删除成功！");
            try {
                response.getWriter().write("true");
            } catch (IOException e) {
                e.printStackTrace();
            }
//            return "redirect:/UserController/findAllUser";
        }
//        request.setAttribute("tip", "删除失败！");
    }

    @RequestMapping("/deleteBatchUser")
    @ResponseBody
    public Boolean deleteBatchUser(Integer[] idStr) {
        GetListVO getListVO = new GetListVO();
        List<Integer> integers = Arrays.asList(idStr);
        getListVO.setIds(integers);
        int i = iUserService.deleteBatchUser(getListVO);
        if (i > 0) {
            return true;
        }
        return false;
    }

}
