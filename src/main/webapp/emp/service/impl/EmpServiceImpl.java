package web.emp.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import web.emp.bean.EmpVO;
import web.emp.dao.EmpDAO;
import web.emp.dao.impl.EmpDAOImpl;
import web.emp.service.EmpService;

public class EmpServiceImpl implements EmpService {

	EmpDAO dao = new EmpDAOImpl();

	@Override
	public EmpVO selectByEmailAndPassword(EmpVO empVO) {

		EmpVO resultEmpVO = dao.selectByEmailAndPassword(empVO);

		return resultEmpVO;
	}

	public void deleteEmp(Integer empno) {

		dao.delete(empno);
	}

	public EmpVO getOneEmp(Integer employeeId) {

		return dao.findByPrimaryKey(employeeId);
	}

	@Override
	public List<EmpVO> getAll() {

		return dao.getAll();
	}

	@Override
	public EmpVO addEmp(EmpVO empVO) {

		empVO.setPassword("a1234");
		empVO.setStatus("1");
		empVO.setLastModificationDate(LocalDateTime.now());
		
		
		dao.insert(empVO);

		return empVO;
	}

	@Override
	public EmpVO updateEmp(EmpVO empVO) {
		if (empVO.getEmpPictureId() != null && empVO.getEmpPictureId().length != 0) {
			dao.update(empVO);
		} else {
			dao.updateWithOutPicture(empVO);
		}
		
		

		return empVO;
	}

	@Override
	public boolean isExistEmail(String email) {
		
		boolean result = dao.isExistEmail(email);
		
		return 	result;
	}

}
