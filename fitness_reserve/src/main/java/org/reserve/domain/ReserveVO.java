package org.reserve.domain;


import java.util.List;

import lombok.Data;

@Data
public class ReserveVO {
	private int rno;
	private int fno;
	private boolean rstatus;
	private String rdate;
	private String rstart;
	private String rend;
	private int mno;
	
	private List<ReserveVO> rvoList;
}
