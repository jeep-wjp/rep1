package com.jeep.service;

import com.jeep.domain.Menu;

import java.util.List;
import java.util.Map;

public interface IMenuService {
    List<Menu> getMenu(Integer id);

    List<Menu> findAllMenu(Map<String, Object> map);

    int findAllMenuCount(Map<String, Object> map);

    List<Menu> getMenuByRoleID(Integer role_id);

    int addMenu(Menu menu);

    int updateMenu(Menu menu);

    int deleteMenu(Menu menu);
}
