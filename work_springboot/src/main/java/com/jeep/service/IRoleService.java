package com.jeep.service;

import com.jeep.domain.Role;

import java.util.List;
import java.util.Map;

public interface IRoleService {
    int addRole(Role role);

    List<Role> findAllRole(Map<String, Object> map);

    int findAllRoleCount(Map<String, Object> map);

    int deleteResourceByRoleID(Integer roleId);

    int addResourceByRoleID(Map<String,Object> map);

    int updateRole(Role role);

    int deleteRole(Role role);
}
