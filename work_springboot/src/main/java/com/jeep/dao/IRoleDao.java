package com.jeep.dao;

import com.jeep.domain.Role;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
public interface IRoleDao {
    @Insert("INSERT INTO `db_wh`.`sys_role` (`sr_name`,`sr_sign`,`sr_remark`,`sr_create_uid`,`sr_create_dt`,`sr_update_dt`,`sr_update_uid`,`sr_issuperadmin`,`sr_issysadmin`) \n" +
            "VALUES(#{sr_name},#{sr_sign},#{sr_remark},#{sr_create_uid},#{sr_create_dt},#{sr_update_dt},#{sr_update_uid},#{sr_issuperadmin},#{sr_issysadmin})")
    int addRole(Role role);

    @Select("<script>select * from sys_role " +
            "<if test=\"page != null and limit != null\">\n" +
            " limit #{page},#{limit}\n" +
            " </if></script>")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "sr_name", column = "sr_name"),
            @Result(property = "sr_sign", column = "sr_sign"),
            @Result(property = "sr_remark", column = "sr_remark"),
            @Result(property = "sr_create_uid", column = "sr_create_uid"),
            @Result(property = "sr_create_dt", column = "sr_create_dt"),
            @Result(property = "sr_update_dt", column = "sr_update_dt"),
            @Result(property = "sr_issuperadmin", column = "sr_issuperadmin"),
            @Result(property = "sr_issysadmin", column = "sr_issysadmin"),
    })
    List<Role> findAllRole(Map<String, Object> map);

    @Select("select count(id) from sys_role")
    int findAllRoleCount(Map<String, Object> map);

    @Delete("delete from sys_role_menu where srm_role_id=#{id}")
    int deleteResourceByRoleID(Integer id);

    @Insert("insert into sys_role_menu(srm_role_id,srm_menu_id) values(#{srm_role_id},#{srm_menu_id})")
    int addResourceByRoleID(Map<String, Object> map);

    @Update("UPDATE \n" +
            "  `db_wh`.`sys_role` \n" +
            "SET\n" +
            "  `sr_name` = #{sr_name},\n" +
            "  `sr_sign` = #{sr_sign},\n" +
            "  `sr_remark` = #{sr_remark},\n" +
            "  `sr_create_uid` = #{sr_create_uid},\n" +
            "  `sr_create_dt` = #{sr_create_dt},\n" +
            "  `sr_update_dt` = #{sr_update_dt},\n" +
            "  `sr_update_uid` = #{sr_update_uid},\n" +
            "  `sr_issuperadmin` = #{sr_issuperadmin},\n" +
            "  `sr_issysadmin` = #{sr_issysadmin} \n" +
            "WHERE `id` = #{id} ;")
    int updateRole(Role role);

    @Delete("DELETE FROM `db_wh`.`sys_role` WHERE `id` = #{id}")
    int deleteRole(Role role);
}
