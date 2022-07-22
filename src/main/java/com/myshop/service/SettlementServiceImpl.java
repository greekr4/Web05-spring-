package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myshop.dao.SettlementDAO;
import com.myshop.dto.SettlementDTO;

@Service
public class SettlementServiceImpl implements SettlementService {
	@Inject
	private SettlementDAO dao;

	@Override
	public List<SettlementDTO> SettlementList() throws Exception {
		return dao.SettlementList();
	}

	@Override
	public void SettlementAdd(SettlementDTO DTO) throws Exception {
		dao.SettlementAdd(DTO);
	}

	@Override
	public void SettlementDel(int seq) throws Exception {
		dao.SettlementDel(seq);
	}



	

}
