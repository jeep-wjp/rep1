package com.jeep.service.impl;

import com.jeep.dao.IRoleDao;
import com.jeep.domain.Role;
import com.jeep.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class RoleServiceImpl implements IRoleService {
    @Autowired(required = false)
    IRoleDao iRoleDao;
    @Override
    public int addRole(Role role) {
        return iRoleDao.addRole(role);

    }

    @Override
    public List<Role> findAllRole(Map<String, Object> map) {
        return iRoleDao.findAllRole(map);
    }

    @Override
    public int findAllRoleCount(Map<String, Object> map) {
        return iRoleDao.findAllRoleCount(map);
    }

    @Override
    public int deleteResourceByRoleID(Integer roleId) {
        return iRoleDao.deleteResourceByRoleID(roleId);
    }

    @Override
    public int addResourceByRoleID(Map<String,Object> map) {
        return iRoleDao.addResourceByRoleID(map);
    }

    @Override
    public int updateRole(Role role) {
        return iRoleDao.updateRole(role);
    }

    @Override
    public int deleteRole(Role role) {
        return iRoleDao.deleteRole(role);
    }
}
