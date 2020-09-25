package com.jeep.dao;

import com.jeep.domain.Project;
import org.apache.ibatis.annotations.*;


import java.util.List;
import java.util.Map;

@Mapper
public interface IProjectDao {
    @Select("select * from project_info limit #{page},#{limit}")
    List<Project> findAllProject(Map<String,Integer> map);

    @Insert("INSERT INTO project_info (`pi_name`,`pi_department`,`pi_create_uid`,`pi_create_dt`,`pi_plan_start_dt`,`pi_plan_end_dt`,`pi_real_start_dt`,`pi_real_end_dt`,`pi_state`)\n" +
            "                        VALUES( #{pi_name},#{pi_department},#{pi_create_uid},#{pi_create_dt},#{pi_plan_start_dt},#{pi_plan_end_dt},#{pi_real_start_dt},#{pi_real_end_dt},#{pi_state})")
    int addProject(Project project);
    @Select(" select count(*) from project_info")
    Long finAllCount();
    @Update(" update project_info set `pi_name`=#{pi_name},`pi_department`=#{pi_department},`pi_create_uid`=#{pi_create_uid},`pi_create_dt`=#{pi_create_dt},\n" +
            "         `pi_plan_start_dt`=#{pi_plan_start_dt},`pi_plan_end_dt`=#{pi_plan_end_dt},`pi_real_start_dt`=#{pi_real_start_dt},`pi_real_end_dt`=#{pi_real_end_dt},`pi_state`=#{pi_state}\n" +
            "         where id=#{id}")
    int updateProject(Project project);
    @Delete("delete from project_info where id=#{id}")
    int deleteProject(Project project);
    @Select("select * from project_info")
    List<Project> findAllProjectId();
}
