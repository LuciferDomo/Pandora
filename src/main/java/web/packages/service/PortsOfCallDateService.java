package web.packages.service;

import java.util.List;

import web.packages.bean.PortsOfCallDateVO;

public interface PortsOfCallDateService {
	
	List<PortsOfCallDateVO> getAll();
	
	PortsOfCallDateVO insertPortsOfCallDate(PortsOfCallDateVO portsOfCallDateVO);	
	
	List<PortsOfCallDateVO> getByPackageNo(Integer packageNo);

}
