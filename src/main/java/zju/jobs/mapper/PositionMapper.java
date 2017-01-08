package zju.jobs.mapper;

import java.util.List;

import zju.jobs.domain.Result;

public interface PositionMapper {
	
	List<Result> getPositionsBykinds();
	
	List<Result> getPositionsBycompany();
	
	List<Result> getPositionsByeducation();
	
	List<Result> getPositionsBycity();

}
