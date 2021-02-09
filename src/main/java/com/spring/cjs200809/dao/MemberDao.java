package com.spring.cjs200809.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.MemberVo;

public interface MemberDao {

	public MemberVo getIdCheck(@Param("mid") String mid);

	public MemberVo getemailCheck(@Param("email") String email);

	public void memberJoin(@Param("vo") MemberVo vo);

}
