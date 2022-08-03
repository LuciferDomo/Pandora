package web.member.dao;

import java.util.List;

import web.member.bean.MemberVO;

public interface MemberDAO{
	
	void insert(MemberVO memberVO);
	
	void update(MemberVO memberVO);
	
	void delete(Integer memeberId);
	
	MemberVO findByPrimaryKey(Integer memberId);
	
	List<MemberVO> getAll();
	
	MemberVO selectByEmailAndPassword(MemberVO memberVO);
	
	void updateWithOutPicture(MemberVO memberVO);
    
	boolean isExistEmail(String memberEmail);
}