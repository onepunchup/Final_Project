package org.kh.dajob.workhere.model.service;

import java.util.ArrayList;

import org.kh.dajob.workhere.model.vo.Workhere;

public interface WorkhereService {

	ArrayList<Workhere> selectWorkhereList(int currentPage, int limit);
	Workhere selectWorkhere(String no);
	int getListCount();
	int deleteWorkhere(String no);
	ArrayList<Workhere> selectJobSearchList(Workhere wh);
	ArrayList<Workhere> selectTopPower();
	ArrayList<Workhere> selectWorkhereList();
	ArrayList<Workhere> selectPowerLinkList();
}
