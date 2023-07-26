package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	//어노테이션으로 걸어주는 방법1
	@Select("Select sysdate from dual")
	public String getTime();
	
	//xml로 걸어주는 방법2
	public String getTime2();
}
