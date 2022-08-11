package web.packages.service.impl;

import java.util.List;
import java.util.Map;

import web.packages.bean.PackagesVO;
import web.packages.dao.PackagesDAO;
import web.packages.dao.impl.PackagesDAOImpl;
import web.packages.service.PackagesService;

public class PackagesServiceImpl implements PackagesService {

	private PackagesDAO dao;

	public PackagesServiceImpl() {
		dao = new PackagesDAOImpl();
	}

	public List<PackagesVO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}

	@Override
	public PackagesVO getOnePackage(Integer packageId) {
		return dao.findByPrimaryKey(packageId);
	}
}
