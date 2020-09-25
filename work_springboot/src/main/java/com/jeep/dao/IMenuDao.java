package com.jeep.dao;

import com.jeep.domain.Menu;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
public interface IMenuDao {

    @Select("SELECT sm.* FROM sys_role_menu srm,sys_user_role sur,sys_menu sm ,sys_user su\n" +
            "WHERE su.id=sur.sur_user_id AND sur.`sur_role_id`= srm.`srm_role_id` AND srm.`srm_menu_id`=sm.`id` AND sur.`sur_user_id`=#{id}")
    List<Menu> getMenu(Integer id);
    @Select("SELECT sm.* FROM sys_role_menu srm,sys_menu sm\n" +
            "        WHERE sm.id=srm.`srm_menu_id` AND srm.`srm_role_id`=#{id}")
    List<Menu> getMenuByRoleID(Integer id);
    @Select("<script>select * from sys_menu " +
            "<if test=\"page != null and limit != null\">\n" +
            "limit #{page},#{limit}\n"+
            " </if></script>")
    List<Menu> findAllMenu(Map<String, Object> map);
    @Select("select count(id) from sys_menu")
    int findAllMenuCount(Map<String, Object> map);
    @Insert("INSERT INTO `db_wh`.`sys_menu` (`sm_parent_id`,`sm_name`,`sm_url`,`sm_perms`," +
            "`sm_type`,`sm_icon`,`sm_order`,`sm_create_dt`,`sm_create_uid`," +
            "`sm_update_dt`,`sm_update_uid`) \n" +
            "VALUES(#{sm_parent_id},#{sm_name},#{sm_url},#{sm_perms}," +
            "#{sm_type},#{sm_icon},#{sm_order},#{sm_create_dt},#{sm_create_uid}," +
            "#{sm_update_dt},#{sm_update_uid})")
    int addMenu(Menu menu);

    @Update("UPDATE \n" +
            "  `db_wh`.`sys_menu` \n" +
            "SET\n" +
            "  `sm_parent_id` = #{sm_parent_id},\n" +
            "  `sm_name` = #{sm_name},\n" +
            "  `sm_url` = #{sm_url},\n" +
            "  `sm_perms` = #{sm_perms},\n" +
            "  `sm_type` = #{sm_type},\n" +
            "  `sm_icon` = #{sm_icon},\n" +
            "  `sm_order` = #{sm_order},\n" +
            "  `sm_update_dt` = #{sm_update_dt},\n" +
            "  `sm_update_uid` = #{sm_update_uid} \n" +
            "WHERE `id` = #{id} ;")
    int updateMenu(Menu menu);
    @Delete("DELETE FROM `db_wh`.`sys_menu` \n" +
            "WHERE `id` = #{id}")
    int deleteMenu(Menu menu);
}
