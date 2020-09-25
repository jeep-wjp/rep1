package com.jeep.domain;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class Menu {
    private Integer id;//
    private Integer sm_parent_id;// '父菜单ID，一级菜单为0',
    private String sm_name;//  '菜单名称',
    private String sm_url;    //  '菜单URL',
    private String sm_perms;  // '授权(多个用逗号分隔，如：user:list,user:create)',
    private Integer sm_type;   //  '类型   0：目录   1：菜单   2：按钮',
    private String sm_icon; //  '菜单图标',
    private Integer sm_order;//   '排序',
    private String sm_create_dt; //   '创建时间',
    private Integer sm_create_uid;//   '创建者ID',
    private String sm_update_dt;//  '更新时间',
    private Integer sm_update_uid;//    '更新者ID',
    private List<Menu> children = new ArrayList<>();
}
