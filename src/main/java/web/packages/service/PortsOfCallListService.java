package web.packages.service;

import java.util.List;
import java.util.Map;

import com.mysql.cj.x.protobuf.MysqlxCrud.Insert;

import web.cruiseline.bean.PortNameListVO;
import web.cruiseline.bean.PortsOfCallListVO;
import web.packages.bean.PortsOfCallDateVO;

public interface PortsOfCallListService {
	List<PortsOfCallListVO> getByCruiseLineNo(Integer cruiseLineNo);
	Map<Integer, String> getPortMap(); 
	List<PortNameListVO> getAll(Map<String, String[]> map);
	
	
}
