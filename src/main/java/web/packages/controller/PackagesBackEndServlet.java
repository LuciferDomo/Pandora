package web.packages.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.protobuf.Timestamp;
import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;
import com.mysql.cj.x.protobuf.MysqlxCrud.UpdateOperation;

import web.cruiseline.bean.CruiseLineVO;
import web.cruiseline.bean.PortNameListVO;
import web.cruiseline.bean.PortsOfCallListVO;
import web.cruiseline.service.impl.CruiseLineServiceImpl;
import web.emp.service.EmpService;
import web.emp.service.impl.EmpServiceImpl;
import web.packages.bean.PackageDetailVO;
import web.packages.bean.PackagesVO;
import web.packages.bean.PortsOfCallDateVO;
import web.packages.bean.TestVO;
import web.packages.service.PackageDetailService;
import web.packages.service.PackagesService;
import web.packages.service.PortsOfCallDateService;
import web.packages.service.PortsOfCallListService;
import web.packages.service.impl.PackageDetailServiceImpl;
import web.packages.service.impl.PackagesServiceImpl;
import web.packages.service.impl.PortsOfCallDateServiceImpl;
import web.packages.service.impl.PortsOfCallListServiceImpl;
import web.ship.bean.ShipTotalVO;
import web.ship.bean.ShipsVO;
import web.ship.dao.impl.ShipsDAOImpl;
import web.ship.service.impl.ShipService;

@WebServlet("/PackagesBackEndServlet")
@MultipartConfig
public class PackagesBackEndServlet extends HttpServlet {
	private Gson gson = new Gson();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println(action);

		if ("getAllPackage".equals(action)) {
			System.out.println("hi大聰明我在:getAllPackage");
			PackagesService packagesService = new PackagesServiceImpl();
			List<PackagesVO> packagesList = packagesService.getALLList();
			req.setAttribute("packagesList", packagesList);
			req.setAttribute("dateTimeFormat", DateTimeFormatter.ofPattern("yyyy年MM月dd日HH點mm分"));
			RequestDispatcher successView = req.getRequestDispatcher("/back-end/package/packageAll.jsp");
			successView.forward(req, resp);
		}

		if ("packageADD".equals(action)) {
			PackagesService packagesService = new PackagesServiceImpl();
			ShipService shipService = new ShipService();
			CruiseLineServiceImpl cruiseLineServiceImpl = new CruiseLineServiceImpl();
			PortsOfCallDateService portsOfCallDateService = new PortsOfCallDateServiceImpl();

			List<ShipTotalVO> shipList = shipService.getAll();
			List<CruiseLineVO> cruiseLineList = cruiseLineServiceImpl.getCruiseLineALL();
			List<PortsOfCallDateVO> portsOfCallDateList = portsOfCallDateService.getAll();

			String packageName = req.getParameter("packageName");
			String duration = req.getParameter("duration");
			String shipNo = req.getParameter("shipNo");
			String registrationStartTime = req.getParameter("registrationStartTime");
			String registrationDeadTime = req.getParameter("registrationDeadTime");

			req.setAttribute("shipList", shipList);
			req.setAttribute("cruiseLineList", cruiseLineList);

			RequestDispatcher successView = req.getRequestDispatcher("/back-end/package/packageADD.jsp");
			successView.forward(req, resp);

		}

		if ("updateOption".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			resp.setContentType("application/json;charset=utf-8");
			resp.setCharacterEncoding("UTF-8");
			System.out.println("我在updateOption");
			PrintWriter out = resp.getWriter();
			Map<String, String[]> map = req.getParameterMap();

			PortsOfCallListService portNameListService = new PortsOfCallListServiceImpl();
			List<PortNameListVO> portNameList = portNameListService.getAll(map);
			Map<String, List<String>> optionMap = new HashMap<>();

			req.setAttribute("cruiseLine", portNameList);

			List<String> portsOfCallListNoList = portNameList.stream().map(vo -> vo.getPortsOfCallListNo().toString())
					.collect(Collectors.toList());
			List<String> cruiseLinesNoList = portNameList.stream().map(vo-> vo.getCruiseLinesNo().toString()).distinct().collect(Collectors.toList());
			List<String> portOfCallNoList = portNameList.stream().map(vo-> vo.getPortOfCallNo().toString()).collect(Collectors.toList());
			List<String> portNameNoList = portNameList.stream().map(vo-> vo.getPortName()).collect(Collectors.toList());
			List<String> portOfCallSequenceList = portNameList.stream().map(vo-> vo.getPortOfCallSequence().toString()).collect(Collectors.toList());
			
			System.out.println(portOfCallNoList);
			System.out.println(portNameNoList);
			optionMap.put("portsOfCallListNoList", portsOfCallListNoList);
			optionMap.put("cruiseLinesNoList", cruiseLinesNoList);
			optionMap.put("portOfCallNoList", portOfCallNoList);
			optionMap.put("portNameNoList", portNameNoList);
			optionMap.put("portOfCallSequenceList", portOfCallSequenceList);
			
			out.print(gson.toJson(optionMap));

			out.flush();

		}

		if ("updateOption2".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			resp.setContentType("application/json;charset=utf-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter out = resp.getWriter();

			Map<String, String[]> map = req.getParameterMap();

			PackagesService packagesService = new PackagesServiceImpl();
			List<PackagesVO> packagesList = packagesService.getAll(map);
			Map<String, List<String>> optionMap = new HashMap<>();
			if (packagesList.size() == 0) {
				List<String> data = new ArrayList<>();
				optionMap.put("size", data);
				packagesList = (List<PackagesVO>) req.getSession().getAttribute("lastQuery");
			} else {
				req.getSession().setAttribute("lastQuery", packagesList);
			}
			List<String> packageNoList = packagesList.stream().map(vo -> vo.getPackageNo().toString())
					.collect(Collectors.toList());
			List<String> departureDistinct = packagesList.stream().map(vo -> vo.getDeparture()).distinct()
					.collect(Collectors.toList());
			List<String> destinationDistinct = packagesList.stream().map(vo -> vo.getDestination()).distinct()
					.collect(Collectors.toList());
			List<String> departureTimeDistinct = packagesList.stream()
					.map(vo -> vo.getDepartureTime().format(DateTimeFormatter.ofPattern("yyyy-MM"))).distinct()
					.collect(Collectors.toList());
			List<String> duration = packagesList.stream().map(vo -> vo.getDuration().toString()).distinct()
					.collect(Collectors.toList());

			System.out.println("天數:" + duration);

			optionMap.put("packageNoList", packageNoList);
			optionMap.put("departureDistinct", departureDistinct);
			optionMap.put("destinationDistinct", destinationDistinct);
			optionMap.put("departureTimeDistinct", departureTimeDistinct);

			optionMap.put("Duration", duration);

			if (!optionMap.containsKey("size")) {
				List<String> data = new ArrayList<>();

				for (int i = 0; i < packagesList.size(); i++) {
					data.add(String.valueOf(i));

					optionMap.put("size", data);
				}

			}

			out.print(gson.toJson(optionMap));
			out.flush();

//			out.print(gson.toJson(departureDistinct));
//			System.out.println(gson.toJson(departureDistinct));
//			out.flush();
		}

		if ("getOnePackageDetail".equals(action)) {
			System.out.println("hi傻逼我在:getOnePackageDetail");
			Integer packageNo = Integer.valueOf(req.getParameter("packageNo"));
			System.out.println(packageNo);
			PackageDetailService packageDetailService = new PackageDetailServiceImpl();
			List<PackageDetailVO> packagesDetailList = packageDetailService.getOnePackageDetail(packageNo);
			req.setAttribute("packagesDetailList", packagesDetailList);
			req.setAttribute("dateTimeFormat", DateTimeFormatter.ofPattern("yyyy年MM月dd日HH點mm分"));
			RequestDispatcher successView = req.getRequestDispatcher("/front-end/package/packageDetail.jsp");
			successView.forward(req, resp);

		}

	}

}