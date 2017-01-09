package zju.jobs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import zju.jobs.domain.Result;
import zju.jobs.service.RequirementService;
import com.alibaba.fastjson.JSON;

@Controller
public class PositionRequireController {
	@Autowired
	private RequirementService requirementService;
	
	@RequestMapping(value="/getPositionsBykinds", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPositionsBykinds(HttpServletRequest request) throws Exception {
			
			List<Result> list = requirementService.getPositionsBykinds();
			String json = JSON.toJSONString(list);
			String jsonCallback = request.getParameter("jsoncallback");
			String josnStr = jsonCallback + "(" + json + ")";
			return josnStr;
		}
	
	@RequestMapping(value="/getPositionsBycompany", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPositionsBycompany(HttpServletRequest request) throws Exception {
			
			List<Result> list = requirementService.getPositionsBycompany();
			String json = JSON.toJSONString(list);
			String jsonCallback = request.getParameter("jsoncallback");
			String josnStr = jsonCallback + "(" + json + ")";
			return josnStr;
		}
	
	@RequestMapping(value="/getPositionsByeducation", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPositionsByeducation(HttpServletRequest request) throws Exception {
			
			List<Result> list = requirementService.getPositionsByeducation();
			String json = JSON.toJSONString(list);
			String jsonCallback = request.getParameter("jsoncallback");
			String josnStr = jsonCallback + "(" + json + ")";
			return josnStr;
		}
	
	@RequestMapping(value="/getPositionsBycity", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getPositionsBycity(HttpServletRequest request) throws Exception {
			
			List<Result> list = requirementService.getPositionsBycity();
			String json = JSON.toJSONString(list);
			String jsonCallback = request.getParameter("jsoncallback");
			String josnStr = jsonCallback + "(" + json + ")";
			return josnStr;
		}

	@RequestMapping(value="/getSalariesByfields", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getSalariesByfields(HttpServletRequest request) throws Exception {
			
			List<Result> list = requirementService.getSalariesByfields();
			String json = JSON.toJSONString(list);
			String jsonCallback = request.getParameter("jsoncallback");
			String josnStr = jsonCallback + "(" + json + ")";
			System.out.println(josnStr);
			return josnStr;
		}
	
	@RequestMapping(value="/getSalariesBykinds", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getSalariesBykinds(HttpServletRequest request) throws Exception {
			
			List<Result> list = requirementService.getSalariesBykinds();
			String json = JSON.toJSONString(list);
			String jsonCallback = request.getParameter("jsoncallback");
			String josnStr = jsonCallback + "(" + json + ")";
			return josnStr;
		}
	
	@RequestMapping(value="/getSalariesByyear", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getSalariesByyear(HttpServletRequest request) throws Exception {
			
			List<Result> list = requirementService.getSalariesByyear();
			String json = JSON.toJSONString(list);
			String jsonCallback = request.getParameter("jsoncallback");
			String josnStr = jsonCallback + "(" + json + ")";
			return josnStr;
		}
	
	@RequestMapping(value="/getSalariesBycity", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getSalariesBycity(HttpServletRequest request) throws Exception {
			
			List<Result> list = requirementService.getSalariesBycity();
			String json = JSON.toJSONString(list);
			String jsonCallback = request.getParameter("jsoncallback");
			String josnStr = jsonCallback + "(" + json + ")";
			return josnStr;
		}	
}
