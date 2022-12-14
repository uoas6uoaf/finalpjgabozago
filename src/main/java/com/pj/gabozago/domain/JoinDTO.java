package com.pj.gabozago.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
//@AllArgsConstructor
public class JoinDTO {

	private Integer idx;
	private String email;
	private String password;
	private String name;
	private String nickname;
	private String phone;
	private String birthday;
	private String provider;
	private String uidNum;
	
	// ***
	// private String profileImg;
	// private MultipartFile profileImg;
	
	private String profilePath;
	
	private Integer point;
	private Date insertTs;
	private Date updateTs;   
	private String isSecession;
	
}// end class
