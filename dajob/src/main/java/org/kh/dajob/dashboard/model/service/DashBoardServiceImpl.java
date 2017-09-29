package org.kh.dajob.dashboard.model.service;

import java.util.ArrayList;

import org.kh.dajob.dashboard.model.dao.DashBoardDao;
import org.kh.dajob.dashboard.model.vo.DashBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("dashboardService")
public class DashBoardServiceImpl implements DashBoardService{
	@Autowired
	private DashBoardDao dashboardDao;
	
	@Override
	public ArrayList<DashBoard> selectMonTot() {
		return dashboardDao.selectMonTot();
	}

	@Override
	public int totProfit() {
		return dashboardDao.totProfit();
	}

	@Override
	public ArrayList<DashBoard> areaTop5() {
		return dashboardDao.areaTop5();
	}

	@Override
	public ArrayList<DashBoard> monTop5() {
		return dashboardDao.monTop5();
	}

}
