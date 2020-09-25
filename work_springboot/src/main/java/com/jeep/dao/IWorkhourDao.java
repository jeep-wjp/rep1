package com.jeep.dao;

import com.jeep.domain.Workhour;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
public interface IWorkhourDao {

    @Insert("insert into project_work_hour(pui_pi_id,pui_su_id,pui_work_hour,pui_input_dt) " +
            "values(#{pui_pi_id},#{pui_su_id},#{pui_work_hour},#{pui_input_dt})")
    int addWorkhour(Workhour workhour);

    @Select(" <script>SELECT * FROM project_work_hour\n" +
            "        <where>\n" +
            "            <if test=\"pui_input_dt1_start != null and pui_input_dt1_start != '' and pui_input_dt2_end != null and pui_input_dt2_end != ''\">\n" +
            "              and pui_input_dt between  #{pui_input_dt1_start} and #{pui_input_dt2_end}\n" +
            "            </if>\n" +
            "        </where>\n" +
            "        limit #{page},#{limit}</script>")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "id", column = "id"),
            @Result(property = "pui_pi_id", column = "pui_pi_id"),
            @Result(property = "pui_su_id", column = "pui_su_id"),
            @Result(property = "pui_work_hour", column = "pui_work_hour"),
            @Result(property = "pui_input_dt", column = "pui_input_dt")
    })
    List<Workhour> findAllWorkhour(Map<String, Object> map);

    @Select(" <script>SELECT count(id) FROM project_work_hour\n" +
            "        <where>\n" +
            "            <if test=\"pui_input_dt1_start != null and pui_input_dt1_start != '' and pui_input_dt2_end != null and pui_input_dt2_end != ''\">\n" +
            "              and pui_input_dt between  #{pui_input_dt1_start} and #{pui_input_dt2_end}\n" +
            "            </if>\n" +
            "        </where></script>")
    int findWorkhourCount(Map<String, Object> map);

    @Update("update project_work_hour set pui_pi_id=#{pui_pi_id}," +
            "pui_work_hour=#{pui_work_hour},pui_input_dt=#{pui_input_dt} where id=#{id}")
    int updateWorkhour(Workhour workhour);

    @Delete("delete from project_work_hour where id=#{id}")
    int deleteWorkhour(Workhour workhour);
}
