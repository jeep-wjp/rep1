package com.jeep.controller;

import com.jeep.domain.Dept;
import com.jeep.domain.GetListVO;
import com.jeep.domain.Res;
import com.jeep.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/DeptController")
public class DeptController {
    @Autowired
    IDeptService iDeptService;

    @RequestMapping("/findAllDept")
    @ResponseBody
    public Res findAllDept(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<>();
        map.put("page", (page - 1) * limit);
        map.put("limit", limit);
        List<Dept> deptList = iDeptService.findAllDept(map);
        if (deptList != null && deptList.size() > 0) {
            Long count = (long)iDeptService.findAllDeptID().size();
            Res res1 = new Res(0, "", count, deptList);
            return res1;
        }
        return null;
    }

    @RequestMapping("/findAllDeptID")
    @ResponseBody
    public List<Dept> findAllDeptID() {
        List<Dept> deptList = iDeptService.findAllDeptID();
        if (deptList != null && deptList.size() > 0) {
            return deptList;
        }
        return null;
    }

    @RequestMapping("/addDept")
    public void addDept(Dept dept, HttpServletResponse res) {
        Integer i = iDeptService.addDept(dept);
        if (i > 0) {
            try {
                res.getWriter().write("true");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    @RequestMapping("/editDept")
    @ResponseBody
    public boolean editDept(Dept dept) {
        int i = iDeptService.editDept(dept);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @RequestMapping("/delDept")
    @ResponseBody
    public boolean delDept(Integer deptid) {
        int i = iDeptService.delDept(deptid);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @RequestMapping("/deleteBatchDept")
    @ResponseBody
    public boolean deleteBatchDept(Integer[] idStr) {
        GetListVO getListVO = new GetListVO();
        getListVO.setIds(Arrays.asList(idStr));
        int i = iDeptService.deleteBatchDept(getListVO);
        if (i > 0) {
            return true;
        }
        return false;
    }

}
