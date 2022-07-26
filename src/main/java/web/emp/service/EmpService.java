package web.emp.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import web.emp.bean.EmpVO;
import web.emp.dao.EmpDAO;
import web.emp.dao.impl.EmpDAOImpl;

public interface EmpService {

	EmpVO selectByEmailAndPassword(EmpVO empVO);

	List<EmpVO> getAll();
	
	EmpVO getOneEmp(Integer employeeId) ;

	EmpVO addEmp(EmpVO empVO);

	EmpVO updateEmp(EmpVO empVO);

  boolean isExistEmail(String email);
	
}
