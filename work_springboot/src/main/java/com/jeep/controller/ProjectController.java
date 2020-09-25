package com.jeep.controller;


import com.jeep.domain.Project;
import com.jeep.domain.Res;
import com.jeep.domain.User;
import com.jeep.service.IProjectService;
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
public class ProjectController {
    @Autowired
    IProjectService iProductService;

    @RequestMapping("/findAllProject")
    @ResponseBody
    public Res findAllProject(Integer page, Integer limit, HttpServletResponse response) {
        Map<String, Integer> map = new HashMap<>();
        map.put("page", (page - 1) * limit);
        map.put("limit", limit);
        Long allCount = iProductService.findAllCount();
        List<Project> projectList = iProductService.findAllProject(map);
        System.out.println("projectList.size():" + projectList.size());
        Res res = new Res(0,"",allCount,projectList);
        return res;
//        JSONObject object = new JSONObject();
//        object.put("code",0);
//        object.put("msg","");
//        object.put("count",iProductService.findAllCount());
//        object.put("data", JSON.toJSON(projectList));
//        try {
//            response.getWriter().print(object.toJSONString());
//            response.getWriter().flush();
//            response.getWriter().close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }
    @RequestMapping("/findAllProjectId")
    @ResponseBody
    public List<Project> findAllProjectId() {
        List<Project> findAllProjectId = iProductService.findAllProjectId();
        System.out.println("findAllProjectId.size():" + findAllProjectId.size());
        return findAllProjectId;
    }



    @RequestMapping("/addProject")
    public void addProject(Project project, HttpServletResponse response, HttpServletRequest request) {
        try {
            System.out.println("/addProject");
            User user =(User) request.getSession().getAttribute("user");
            project.setPi_create_uid(user.getId());
            if (user!=null){
                int i = iProductService.addProject(project);
                System.out.println("添加的数据条数："+i);
                if (i>0){
                    response.getWriter().write("true");
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateProject")
    public void updateProject(Project project, HttpServletResponse response) {
        try {
            System.out.println("/updateProject");
//            System.out.println("project" + project);
            int i = iProductService.updateProject(project);
            System.out.println("修改的数据条数："+i);
            if (i>0){
                response.getWriter().write("true");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteProject")
    public void deleteProject(Integer id, HttpServletResponse response) {
        try {
            Project project = new Project();
            project.setId(id);
            System.out.println("/deleteProject");
            System.out.println("project" + project);
            int i = iProductService.deleteProject(project);
            System.out.println("删除的数据条数："+i);
            if (i>0){
                response.getWriter().write("true");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
