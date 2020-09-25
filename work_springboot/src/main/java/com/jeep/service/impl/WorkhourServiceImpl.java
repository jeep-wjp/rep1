package com.jeep.service.impl;

import com.jeep.dao.IWorkhourDao;
import com.jeep.domain.Workhour;
import com.jeep.service.IWorkhourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class WorkhourServiceImpl implements IWorkhourService {
    @Autowired(required = false)
    IWorkhourDao iWorkhourDao;
    @Override
    public int addWorkhour(Workhour workhour) {
        return iWorkhourDao.addWorkhour(workhour);
    }

    @Override
    public List<Workhour> findAllWorkhour(Map<String, Object> map) {
        return iWorkhourDao.findAllWorkhour(map);
    }

    @Override
    public int findWorkhourCount(Map<String, Object> map) {
        return iWorkhourDao.findWorkhourCount(map);
    }

    @Override
    public int deleteWorkhour(Workhour workhour) {
        return iWorkhourDao.deleteWorkhour(workhour);
    }

    @Override
    public int updateWorkhour(Workhour workhour) {
        return iWorkhourDao.updateWorkhour(workhour);
    }
}
