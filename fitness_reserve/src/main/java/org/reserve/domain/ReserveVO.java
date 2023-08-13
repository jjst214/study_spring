package org.reserve.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	private int rno;
	private int fno;
	private boolean rstatus;
	private Date rdate;
	private String rstart;
	private String rend;
	private int mno;
}
