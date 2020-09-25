package com.jeep.service;

import com.jeep.domain.GetListVO;
import com.jeep.domain.User;

import java.util.List;
import java.util.Map;

public interface IUserService {
    int addUser(User user);

    List<User> findAllUser(Map<String,Object> map);

    Long findAllUserCount(Map<String,Object> map);

    int updateUser(User user);

    int deleteUser(User user);

    List<User> findAllUserId();

    int deleteBatchUser(GetListVO getListVO);

    int addRoleForUser(User user);

    int updateRoleForUser(User user);

    int findRoleByUserID(User user);

    int deleteRoleByUser(User user);
}
