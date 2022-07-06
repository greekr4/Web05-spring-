package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myshop.dao.RecentlyDAO;
import com.myshop.dto.RecentlyDTO;

@Service
public class RecentlyServiceImpl implements RecentlyService {
	@Inject
	private RecentlyDAO dao;

	@Override
	public List<RecentlyDTO> RecentlyList(int cus_seq) throws Exception {
		return dao.RecentlyList(cus_seq);
	}

	

}
