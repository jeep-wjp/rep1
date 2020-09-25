package com.jeep.service;

import com.jeep.domain.Dept;
import com.jeep.domain.GetListVO;

import java.util.List;
import java.util.Map;

public interface IDeptService {

    Integer addDept(Dept dept);

    List<Dept> findAllDept(Map<String, Object> map);

    List<Dept> findAllDeptID();

    int editDept(Dept dept);

    int delDept(Integer deptId);

    int deleteBatchDept(GetListVO getListVO);
}
