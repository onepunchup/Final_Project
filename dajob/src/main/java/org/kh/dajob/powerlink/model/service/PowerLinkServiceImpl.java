package org.kh.dajob.powerlink.model.service;

import java.util.ArrayList;

import org.kh.dajob.powerlink.model.dao.PowerLinkDao;
import org.kh.dajob.powerlink.model.vo.PowerLink;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("powerlinkService")
public class PowerLinkServiceImpl implements PowerLinkService {
	@Autowired
	private PowerLinkDao powerlinkDao;

	@Override
	public PowerLink selectId(String memberId) {
		return powerlinkDao.selectId(memberId);
	}
	
	@Override
	public int updateCnt(String member_id) {
		return powerlinkDao.updateCnt(member_id);
	}

	@Override
	public ArrayList<PowerLink> selectPowerLinkAll() {
		return powerlinkDao.selectPowerLinkAll();
	}

}
