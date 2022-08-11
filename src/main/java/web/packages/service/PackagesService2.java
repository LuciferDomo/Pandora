package web.packages.service;

import java.util.List;
import java.util.Map;

import web.member.bean.MemberVO;
import web.packages.bean.PackagesVO;
import web.packages.dao.impl.PackagesDAOImpl;

public interface PackagesService {
	
	List<PackagesVO> getAll(Map<String, String[]> map);
	
	PackagesVO getOnePackage(Integer packageId);
	

}
