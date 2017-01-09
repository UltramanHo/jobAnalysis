package zju.jobs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import zju.jobs.domain.Result;
import zju.jobs.mapper.PositionMapper;
import zju.jobs.service.RequirementService;

public class RequirementServiceImpl implements RequirementService {

	@Autowired
	private PositionMapper positionMapper;
	
	@Override
	public List<Result> getPositionsBykinds() {
		
		List<Result>  resultList =  positionMapper.getPositionsBykinds();
		return resultList;
		
	}

	@Override
	public List<Result> getPositionsBycompany() {
		
		List<Result> resultList = positionMapper.getPositionsBycompany();
		return resultList;
	}

	@Override
	public List<Result> getPositionsByeducation() {
		
		List<Result> resultList = positionMapper.getPositionsByeducation();
		return resultList;
	}

	@Override
	public List<Result> getEmploymentBycity() {
		
		List<Result> resultList = positionMapper.getEmploymentBycity();
		return resultList;
	}
	@Override
	public List<Result> getEmploymentBycompany() {
		
		List<Result> resultList = positionMapper.getEmploymentBycompany();
		return resultList;
	}

	@Override
    public List<Result> getPositionsBycity() {
		
		List<Result> resultList = positionMapper.getPositionsBycity();
		return resultList;
	}


}
