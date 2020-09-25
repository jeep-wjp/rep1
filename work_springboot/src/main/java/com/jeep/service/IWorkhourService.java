package com.jeep.service;

import com.jeep.domain.Workhour;

import java.util.List;
import java.util.Map;

public interface IWorkhourService {
    int addWorkhour(Workhour workhour);

    List<Workhour> findAllWorkhour(Map<String, Object> map);

    int findWorkhourCount(Map<String, Object> map);

    int deleteWorkhour(Workhour workhour);

    int updateWorkhour(Workhour workhour);
}
