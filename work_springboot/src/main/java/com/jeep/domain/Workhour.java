package com.jeep.domain;

import lombok.Data;

@Data
public class Workhour {
    private Integer id;//'主键',
    private Integer pui_pi_id;   //   '项目ID',
    private Integer pui_su_id;   //   '用户ID',
    private Double pui_work_hour; //工时数，单位：小时',
    private String pui_input_dt;//'工时录入时间(格式：yyyy-MM-dd hh:mm:ss)',
}
