package com.jeep.service.impl;

import com.jeep.dao.IProjectDao;
import com.jeep.domain.Project;
import com.jeep.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ProjectServiceImpl implements IProjectService {
    @Autowired(required = false)
    private IProjectDao iProjectDao;
    @Override
    public List<Project> findAllProject(Map<String,Integer> map) {
        return iProjectDao.findAllProject(map);
    }

    @Override
    public Long findAllCount() {
        return iProjectDao.finAllCount();
    }

    @Override
    public int addProject(Project project) {
        return iProjectDao.addProject(project);
    }

    @Override
    public int updateProject(Project project) {
      return   iProjectDao.updateProject(project);
    }

    @Override
    public int deleteProject(Project project) {
      return   iProjectDao.deleteProject(project);
    }

    @Override
    public List<Project> findAllProjectId() {
        return iProjectDao.findAllProjectId();
    }
}
