package org.reserve.domain;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	public int idCheck(String mid) throws Exception;
}
