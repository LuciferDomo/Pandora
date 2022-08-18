package web.emp.dao;

import java.util.List;

import web.emp.bean.EmpVO;

public interface EmpDAO {

	void insert(EmpVO empVO);
	
	void update(EmpVO empVO);
	
	void delete(Integer employeeId);

	EmpVO findByPrimaryKey(Integer employeeId);
	
	List<EmpVO> getAll();
	
	EmpVO selectByEmailAndPassword(EmpVO empVO);

	void updateWithOutPicture(EmpVO empVO);
    
	boolean isExistEmail(String email);
	

	

	

	

	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//      public List<EmpVO> getAll(Map<String, String[]> map); 
}
