package org.kh.dajob.dashboard.model.service;

import java.util.ArrayList;

import org.kh.dajob.dashboard.model.vo.DashBoard;

public interface DashBoardService {
	ArrayList<DashBoard> selectMonTot();
	int totProfit();
	ArrayList<DashBoard> areaTop5();
	ArrayList<DashBoard> monTop5();
}
