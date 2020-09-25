package com.jeep.controller;

import com.jeep.domain.Res;
import com.jeep.domain.User;
import com.jeep.domain.Workhour;
import com.jeep.service.IWorkhourService;
import com.jeep.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/WorkhourController")
public class WorkhourController {
    @Autowired
    IWorkhourService iWorkhourService;

    @RequestMapping("/findAllWorkhour")

    public Res findAllWorkhour(Integer page, Integer limit, String pui_input_dt1_start, String pui_input_dt2_end) {
        Map<String , Object> map = new HashMap<>();
        map.put("page",(page-1)*limit);
        map.put("limit",limit);
        map.put("pui_input_dt1_start",pui_input_dt1_start);
        map.put("pui_input_dt2_end",pui_input_dt2_end);

        List<Workhour> workhour = iWorkhourService.findAllWorkhour(map);
        if (workhour != null && workhour.size() > 0) {
          Long count =  (long)iWorkhourService.findWorkhourCount(map);
            return new Res(0, "", count, workhour);
        }
        return null;
    }

    @RequestMapping("/addWorkhour")
    public boolean addWorkhour(Workhour workhour, HttpServletRequest request) {
        workhour.setPui_input_dt(DateUtils.toSqlDate(new Date()));
        User user = (User) request.getSession().getAttribute("user");
        workhour.setPui_su_id(user.getId());
        int i = iWorkhourService.addWorkhour(workhour);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @RequestMapping("/updateWorkhour")
    public boolean updateWorkhour(Workhour workhour) {
        workhour.setPui_input_dt(DateUtils.toSqlDate(new Date()));
        int i = iWorkhourService.updateWorkhour(workhour);
        if (i > 0) {
            return true;
        }
        return false;
    }
    @RequestMapping("/deleteWorkhour")

    public boolean deleteWorkhour(Integer id) {
        Workhour workhour = new Workhour();
        workhour.setId(id);
        int i = iWorkhourService.deleteWorkhour(workhour);
        if (i > 0) {
            return true;
        }
        return false;
    }

}
