package com.example.demo.vo;

import lombok.Data;

@Data
public class MemberVo
{
	private int member_num;
	private String member_name;
	private String member_id;
	private String member_pw;
	private String member_email;
	private String member_phone;
	private String member_birth;
	private String member_address;
	private int member_auth;
}
