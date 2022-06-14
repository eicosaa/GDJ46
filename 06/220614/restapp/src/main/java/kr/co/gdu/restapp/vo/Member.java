package kr.co.gdu.restapp.vo;

import lombok.Data;

@Data
public class Member {
    private String id;
    private String pw;
    private String name;
    private int age;
    private String gender;
}
