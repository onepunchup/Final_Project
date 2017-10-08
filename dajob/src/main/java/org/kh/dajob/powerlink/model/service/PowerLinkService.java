package org.kh.dajob.powerlink.model.service;

import java.util.ArrayList;

import org.kh.dajob.powerlink.model.vo.PowerLink;

public interface PowerLinkService {

	PowerLink selectId(String memberId);
	int updateCnt(String member_id);
	ArrayList<PowerLink> selectPowerLinkAll();
	ArrayList<PowerLink> selectPercentage();

}
