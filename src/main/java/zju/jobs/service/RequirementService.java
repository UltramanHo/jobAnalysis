package zju.jobs.service;

import java.util.List;

import zju.jobs.domain.Result;

public interface RequirementService {
	
	public List<Result> getPositionsBykinds();
	public List<Result> getPositionsBycompany();
	public List<Result> getPositionsByeducation();
	public List<Result> getPositionsBycity();

}
