package org.reserve.domain;


import java.util.List;

import lombok.Data;

@Data
public class PaymentVO {
	private int pno;
	private int rno;
	private String pkind;
	private String pbank;
	private String pdate;
}
