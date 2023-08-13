package org.reserve.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private int pno;
	private int rno;
	private String pkind;
	private String pbank;
	private Date pdate;
}
