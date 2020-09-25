package com.jeep.domain;


import lombok.Data;

import java.io.Serializable;

@Data
public class Res  implements Serializable {
    private Integer code;
    private String msg;
    private Long count;
    private Object data;

    public Res() {
    }

    public Res(Integer code, String msg, Long count, Object data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

}
