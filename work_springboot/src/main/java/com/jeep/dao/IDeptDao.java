package com.jeep.dao;

import com.jeep.domain.Dept;
import com.jeep.domain.GetListVO;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.*;
import java.util.List;
import java.util.Map;

@Mapper
public interface IDeptDao {
    @Insert(" INSERT INTO `db_wh`.`sys_dept` (`dept_parent_id`,`dept_name`,\n" +
            "        `dept_order`,`dept_flag`,`dept_addr`,`dept_contact`,`dept_phone`,`dept_desc`)\n" +
            "        VALUES(#{dept_parent_id},#{dept_name},#{dept_order},#{dept_flag}\n" +
            "        ,#{dept_addr},#{dept_contact},#{dept_phone},#{dept_desc})")
    Integer addDept(Dept dept);

    @Select("select * from sys_dept limit #{page},#{limit}")
    List<Dept> findAllDept(Map<String, Object> map);
    @Select(" SELECT * FROM sys_dept where dept_flag=0")
    List<Dept> findAllDeptID();
    @Update(" update sys_dept set `dept_parent_id`=#{dept_parent_id},`dept_name`=#{dept_name},\n" +
            "        `dept_order`=#{dept_order},`dept_flag`=#{dept_flag},`dept_addr`=#{dept_addr},\n" +
            "        `dept_contact`=#{dept_contact},`dept_phone`=#{dept_phone},`dept_desc`=#{dept_desc}\n" +
            "        where dept_id=#{dept_id}")
    int editDept(Dept dept);
    @Delete("delete from sys_dept where dept_id=#{deptid}")
    int delDept(Integer deptId);
    @Delete("<script> delete from sys_dept\n" +
            "        <if test=\"ids!=null and ids.size>0\">\n" +
            "            <foreach collection=\"ids\" item=\"id\" open=\"where dept_id in (\" close=\")\" separator=\",\">\n" +
            "                #{id}\n" +
            "            </foreach>\n" +
            "        </if></script>")
    int deleteBatchDept(GetListVO getListVO);
}
