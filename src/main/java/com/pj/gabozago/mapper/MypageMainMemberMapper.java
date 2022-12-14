package com.pj.gabozago.mapper;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.DAOException;

public interface MypageMainMemberMapper {		// 마이페이지 메인과 회원정보수정 및 탈퇴 페이지 관련 mapper

	
	// [공통] 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Select("SELECT count(idx) FROM ${tableName} WHERE member_idx = #{member.idx}")
	public abstract Integer countTotalOfRecords(@Param("member") MemberVO member, @Param("tableName") String tableName) throws DAOException;
	
	// 회원정보 불러오는 메소드
	@Select("SELECT * FROM tbl_member WHERE idx = #{idx}")
	public abstract MemberVO selectMemberInfo(MemberVO member) throws DAOException;
	
	// 회원의 사용일 임박순 숙소예약내역 2건을 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> selectReserOrderOfUseDate(MemberVO member) throws DAOException;
	
	// 닉네임 중복검사용
	@Select("SELECT count(idx) FROM tbl_member WHERE nickname = #{nickname}")
	public abstract boolean selectDoubleNickname(String nickname) throws DAOException;
	
	// 휴대폰번호 중복검사용
	@Select("SELECT count(idx) FROM tbl_member WHERE phone = #{phoneNumber}")
	public abstract boolean selectDoublePhone(String phoneNumber) throws DAOException;
	
	// 회원 수정 로직
	public abstract void updateMemberInfo(MemberDTO member) throws DAOException;
	
	// 회원 탈퇴 처리
	@Delete("DELETE FROM tbl_member WHERE idx = #{idx}")
	public abstract Boolean deleteMember(MemberVO member) throws DAOException;
	
	
} // end interface
