package com.jeep.dao;

import com.jeep.domain.GetListVO;
import com.jeep.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
public interface IUserDao {
    @Insert(" INSERT INTO sys_user (`su_name`,`su_login_name`,`su_login_passwd`,`su_sex`,\n" +
            "        `su_birth_dt`,`su_icon`,`su_address`,\n" +
            "        `su_province`,`su_city`,`su_district`,`su_dept_id`,`su_email`,\n" +
            "        `su_mobile`,`su_status`,`su_create_uid`,`su_create_dt`)\n" +
            "        VALUES( #{su_name},#{su_login_name},#{su_login_passwd},#{su_sex},#{su_birth_dt},\n" +
            "                        #{su_icon},#{su_address},#{su_province},#{su_city},\n" +
            "                        #{su_district},#{su_dept_id},#{su_email},#{su_mobile},\n" +
            "                        #{su_status},#{su_create_uid},#{su_create_dt})")
    int addUser(User user);

    @Select("<script> select sys_user.*,sys_user_role.sur_role_id from sys_user\n" +
            "        left join sys_user_role on sys_user.id=sys_user_role.sur_user_id\n" +
            "        <where>\n" +
            "            <if test=\"su_name != null and su_name != ''\">\n" +
            "                and sys_user.su_name like '%${su_name}%'\n" +
            "            </if>\n" +
            "\n" +
            "        </where>\n" +
            "        <if test=\"page != null and limit != null\">\n" +
            "            limit #{page},#{limit}\n" +
            "        </if></script>")
    List<User> findAllUser(Map<String, Object> map);

    @Select("<script>select count(sys_user.id) from sys_user\n" +
            "        <where>\n" +
            "            <if test=\"su_name != null and su_name != ''\">\n" +
            "                and su_name like '%${su_name}%'\n" +
            "            </if>\n" +
            "        </where></script>")
    Long findAllUserCount(Map<String, Object> map);

    @Update("  update sys_user set `su_name`=#{su_name},`su_login_name`=#{su_login_name},`su_login_passwd`=#{su_login_passwd},\n" +
            "         `su_sex`=#{su_sex},`su_birth_dt`=#{su_birth_dt},`su_icon`=#{su_icon},`su_address`=#{su_address},\n" +
            "        `su_province`=#{su_province},`su_city`=#{su_city},`su_district`=#{su_district},`su_dept_id`=#{su_dept_id},`su_email`=#{su_email},\n" +
            "        `su_mobile`=#{su_mobile},`su_status`=#{su_status},`su_create_uid`=#{su_create_uid},`su_create_dt`=#{su_create_dt}\n" +
            "         where id=#{id}")
    int updateUser(User user);

    @Delete("delete from sys_user where id=#{id}")
    int deleteUser(User user);

    @Select("select * from sys_user")
    List<User> findAllUserId();

    @Delete("<script> delete from sys_user\n" +
            "        <if test=\"ids!=null and ids.size()>0\">\n" +
            "            <foreach collection=\"ids\" item=\"id\" open=\"where id in (\" close=\")\" separator=\",\">\n" +
            "                #{id}\n" +
            "            </foreach>\n" +
            "        </if></script>")
    int deleteBatchUser(GetListVO getListVO);

    @Insert(" INSERT INTO sys_user_role (`sur_user_id`,`sur_role_id`)\n" +
            "        VALUES(#{id},#{sur_role_id})")
    int addRoleForUser(User user);

    @Update("update sys_user_role set `sur_role_id`=#{sur_role_id}\n" +
            "         where sur_user_id=#{id}")
    int updateRoleForUser(User user);

    @Select("select count(id) from sys_user_role where sur_user_id=#{id}")
    int findRoleByUserID(User user);

    @Delete(" delete from sys_user_role where sur_user_id=#{id}")
    int deleteRoleByUser(User user);
}
