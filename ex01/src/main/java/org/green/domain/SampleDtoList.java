package org.green.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
@Data
public class SampleDtoList {
	private List<SampleDTO> list;
	public SampleDtoList() {
		list = new ArrayList<SampleDTO>();
	}
}
