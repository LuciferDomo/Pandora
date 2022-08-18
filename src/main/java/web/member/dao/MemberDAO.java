package web.member.dao;

import java.util.List;


import web.member.bean.MemberVO;

public interface MemberDAO {

	void insert(MemberVO memberVO);

	void update(MemberVO memberVO);

	void updateWithOutPicture(MemberVO memberVO);

//	void delete(Integer memeberId);

	MemberVO findByPrimaryKey(Integer memberId);

	List<MemberVO> getAll();

	MemberVO selectByEmailAndPassword(MemberVO memberVO);

	boolean isExistEmail(String memberEmail);

	void delete(Integer memberId);
	
	void updateWithOutPictureSe(MemberVO memberVO);
	
	void updateSe(MemberVO memberVO);
	
	MemberVO selectMemberIDPW(MemberVO memberVO);//
	
//	MemberVO selectMemberIDPW(String email, String password);
	
	void updateMemberPW(MemberVO memberBean);
	
	MemberVO selectMemberIDEmail(String email);
	
	
}
