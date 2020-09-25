package com.jeep.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dept implements Serializable {
    private Integer dept_id;//'机构编号，主键',
    private Integer dept_parent_id;//'上级机构ID，一级部门为0',
    private String dept_name;//'机构名称',
    private Integer dept_order;//'机构排序',
    private Integer dept_flag;//'是否启用，0启用，1禁用',
    private String dept_addr;//'机构地址',
    private String dept_contact;//'机构联系人',
    private String dept_phone;//'机构联系电话',
    private String dept_desc;//'机构简介',
}
