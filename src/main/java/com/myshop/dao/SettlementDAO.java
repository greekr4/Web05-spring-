package com.myshop.dao;

import java.util.List;

import com.myshop.dto.SettlementDTO;

public interface SettlementDAO {
	//정산 리스트
	public List<SettlementDTO> SettlementList() throws Exception;
	//정산 추가
	public void SettlementAdd(SettlementDTO DTO) throws Exception;
	//정산 삭제
	public void SettlementDel(int seq) throws Exception;
	
}
