package web.member.service;

import java.util.List;

import web.member.bean.MemberVO;

public interface MemberService {
	
	MemberVO selectByEmailAndPassword(MemberVO memberVO);
	
	List<MemberVO> getAll();
	
	MemberVO getOneMember(Integer memberId) ;
	
	MemberVO updateMember(MemberVO memberVO);
	
	void insertMember(MemberVO memberVO);
}
