package web.member.service;

import java.util.List;

import web.member.bean.MemberVO;

public interface MemberService {
	
	MemberVO selectByEmailAndPassword(MemberVO memberVO);
	
	List<MemberVO> getAll();
	
	MemberVO getOneMember(Integer memberId) ;
	
	MemberVO addMember(MemberVO memberVO);
	
	MemberVO updateMember(MemberVO memberVO);
	
	boolean isExistEmail(String memberEmail);
	
	void insertMember(MemberVO memberVO);
	
	MemberVO updateMemberSe(MemberVO memberVO);
	
	MemberVO selectMemberIDPW(MemberVO memberVO);
	
	MemberVO updateMemberPW(Integer memberid,String password);
	
	MemberVO selectMemberIDEmail(String email);
}
