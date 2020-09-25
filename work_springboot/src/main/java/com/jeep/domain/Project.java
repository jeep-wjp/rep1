package com.jeep.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Project implements Serializable {
    private Integer id;  //'主键',
    private String pi_name; //'项目名称',
    private String pi_department;  //'项目所属单位/部门/公司',
    private Integer pi_create_uid;  //'项目创建者ID',
    private String pi_create_dt;   //'项目创建时间（格式：yyyy-MM-dd hh:mm:dd）',
    private String pi_plan_start_dt;  //'项目计划开始日期（格式：yyyy-MM-dd）',
    private String pi_plan_end_dt;   //'项目计划结束日期（格式：yyyy-MM-dd）',
    private String pi_real_start_dt;   //'项目实际开始日期（格式：yyyy-MM-dd）'
    private String pi_real_end_dt;   //'项目实际结束日期（格式：yyyy-MM-dd）'
    private Integer pi_state;   //'项目状态，0表示未开始，1表示进行中，2表示已完成'

}
