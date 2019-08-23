package com.pnu.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pnu.bbs.dao.BBSDao;
import com.pnu.bbs.dto.BBSDto;



@Service
public class BBSServiceImpl implements BBSService {
	@Autowired
	private BBSDao bbsDao;

	@Override
	public List<BBSDto> list(String dong)  {
		//System.out.println(saveDir);
		return bbsDao.list(dong);		
	}

}
//  -> DAO

