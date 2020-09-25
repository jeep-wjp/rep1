package com.jeep.service.impl;

import com.jeep.dao.IUserDao;
import com.jeep.domain.GetListVO;
import com.jeep.domain.User;
import com.jeep.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired(required = false)
    IUserDao iUserDao;

    @Override
    public int addUser(User user) {
        return iUserDao.addUser(user);
    }

    @Override
    public List<User> findAllUser(Map<String, Object> map) {
        return iUserDao.findAllUser(map);
    }

    @Override
    public Long findAllUserCount(Map<String, Object> map) {
        return iUserDao.findAllUserCount(map);
    }

    @Override
    public int updateUser(User user) {
        return iUserDao.updateUser(user);
    }

    @Override
    public int deleteUser(User user) {
        return iUserDao.deleteUser(user);
    }

    @Override
    public List<User> findAllUserId() {
        return iUserDao.findAllUserId();
    }

    @Override
    public int deleteBatchUser(GetListVO getListVO) {
        return iUserDao.deleteBatchUser(getListVO);
    }

    @Override
    public int addRoleForUser(User user) {
        return iUserDao.addRoleForUser(user);
    }

    @Override
    public int updateRoleForUser(User user) {
        return iUserDao.updateRoleForUser(user);
    }

    @Override
    public int findRoleByUserID(User user) {
        int roleByUserID = iUserDao.findRoleByUserID(user);
        return roleByUserID;
    }

    @Override
    public int deleteRoleByUser(User user) {
        return iUserDao.deleteRoleByUser(user) ;
    }

}
