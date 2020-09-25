package com.jeep.service.impl;

import com.jeep.dao.IDeptDao;
import com.jeep.domain.Dept;
import com.jeep.domain.GetListVO;
import com.jeep.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class DeptServiceImpl  implements IDeptService {
    @Autowired(required = false)
    IDeptDao iDeptDao;
    @Override
    public Integer addDept(Dept dept) {
        return iDeptDao.addDept(dept);
    }

    @Override
    public List<Dept> findAllDept(Map<String, Object> map) {
        return iDeptDao.findAllDept(map);
    }

    @Override
    public List<Dept> findAllDeptID() {
        return iDeptDao.findAllDeptID();
    }

    @Override
    public int editDept(Dept dept) {
       return iDeptDao.editDept(dept);
    }

    @Override
    public int delDept(Integer deptId) {
        return iDeptDao.delDept(deptId);
    }

    @Override
    public int deleteBatchDept(GetListVO getListVO) {
        return iDeptDao.deleteBatchDept(getListVO);
    }

}
