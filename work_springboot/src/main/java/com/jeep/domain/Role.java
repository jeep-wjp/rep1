package com.jeep.domain;

import lombok.Data;

@Data
public class Role {
    private Integer id; // '角色ID，主键',
    private String sr_name;// '角色名称',
    private String sr_sign;// '角色标识',
    private String sr_remark;//  '备注',
    private Integer sr_create_uid;// '创建用户id',
    private String sr_create_dt;// '创建时间',
    private String sr_update_dt;//  '更新时间',
    private Integer sr_update_uid;//  '更新者ID',
    private Character sr_issuperadmin;// '是否是超级管理员，Y是，N不是。超级管理员角色不能被删除和修改。',
    private Character sr_issysadmin;// '是否是系统管理员，Y是，N不是。系统管理员可以创建普通管理员和分配角色权限；非系统管理员不能分配权限。',
}
