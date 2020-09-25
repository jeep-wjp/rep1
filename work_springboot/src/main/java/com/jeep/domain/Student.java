package com.jeep.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    private int id;
    private String name;
    private String school;


    public static void main(String[] args) {
        Student student = new Student();
        student.setId(3);
        System.out.println(student);
    }
}
