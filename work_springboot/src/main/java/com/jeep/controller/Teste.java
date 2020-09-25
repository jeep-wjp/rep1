package com.jeep.controller;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jeep.domain.Student;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Teste {
    public static void main(String[] args) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonGenerator jsonGenerator = objectMapper.getJsonFactory().createJsonGenerator(System.out, JsonEncoding.UTF8);
            //list转JSON
            List<Student> list = new ArrayList< >();
            list.add(new Student(1,"zhangsan","xixi"));
            list.add(new Student(2,"王","北京"));
            list.add(new Student(3,"李","武汉"));
            jsonGenerator.writeObject(list);
            System.out.println(jsonGenerator);
        } catch(IOException e) {
            e.printStackTrace();
        }
    }
}
