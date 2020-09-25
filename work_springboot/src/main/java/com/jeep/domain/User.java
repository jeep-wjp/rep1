package com.jeep.domain;

import lombok.*;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User  implements Serializable {
    private Integer id;//'主键',
    private String su_name;  //'用户姓名'
    private String su_login_name;//'用户系统登录名',
    private String su_login_passwd;// '用户系统登录密码',
    private Integer su_sex;//'用户性别，-1未知，0男，1女',
    private String su_birth_dt;// '用户生日(格式：yyyy-MM-dd)',
    private String su_icon;// '用户头像',
    private String su_address;// '用户详细地址',
    private String su_province;// '用户所在省份',
    private String su_city;// '用户所在城市',
    private String su_district;// '用户所在地区',
    private Integer su_dept_id;// '用户所属部门ID',
    private String su_email;// '用户电子邮箱',
    private String su_mobile;// '用户电话号码',
    private Integer su_status;//'用户状态，0不可用，1可用',
    private Integer su_create_uid;// '用户信息创建者ID',
    private String su_create_dt;// '用户信息创建时间(格式：yyyy-MM-dd hh:mm:ss)',
    private Integer sur_role_id;// '用户角色id',

}
