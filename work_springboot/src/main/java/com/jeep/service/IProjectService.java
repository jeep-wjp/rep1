package com.jeep.service;

import com.jeep.domain.Project;

import java.util.List;
import java.util.Map;

public interface IProjectService {
    List<Project> findAllProject(Map<String,Integer> map);

    Long findAllCount();

    int addProject(Project project);

    int updateProject(Project project);

    int deleteProject(Project project);

    List<Project> findAllProjectId();
}
