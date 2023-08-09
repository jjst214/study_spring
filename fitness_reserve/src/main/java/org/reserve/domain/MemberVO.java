package org.reserve.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private int mno;
	private String mid;
	private String mpw;
	private String mname;
	private String phone;
	private String email;
	private String address;
	private Date regdate;
	private boolean enabled;
	private List<AuthVO> authList; 
}
