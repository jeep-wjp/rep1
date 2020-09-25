package com.jeep.service.impl;

import com.jeep.dao.IMenuDao;
import com.jeep.domain.Menu;
import com.jeep.domain.ParentAndChild;
import com.jeep.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class MenuServiceImpl implements IMenuService {
    @Autowired(required = false)
    IMenuDao iMenuDao;
    @Override
    public List<Menu> getMenu(Integer id) {
        return ParentAndChild.getSort(iMenuDao.getMenu(id));
    }

    @Override
    public List<Menu> findAllMenu(Map<String, Object> map) {
        return iMenuDao.findAllMenu(map);
    }

    @Override
    public int findAllMenuCount(Map<String, Object> map) {
        return iMenuDao.findAllMenuCount(map);
    }

    @Override
    public List<Menu> getMenuByRoleID(Integer role_id) {
        return iMenuDao.getMenuByRoleID(role_id);
    }

    @Override
    public int addMenu(Menu menu) {
        return iMenuDao.addMenu(menu);
    }

    @Override
    public int updateMenu(Menu menu) {
        return iMenuDao.updateMenu(menu);
    }

    @Override
    public int deleteMenu(Menu menu) {
        return iMenuDao.deleteMenu(menu);
    }

}
