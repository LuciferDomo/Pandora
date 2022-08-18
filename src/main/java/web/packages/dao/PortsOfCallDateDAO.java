package web.packages.dao;

import java.util.List;

import web.packages.bean.PackagesVO;
import web.packages.bean.PortsOfCallDateVO;

public interface PortsOfCallDateDAO {

	List<PortsOfCallDateVO> getAll();
	
	void insertPortsOfCallDate(PortsOfCallDateVO portsOfCallDateVO);
	
	List<PortsOfCallDateVO> getByPackageNo(Integer packageNo);
	
}
