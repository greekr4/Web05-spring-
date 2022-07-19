package com.myshop.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class SettlementDTO {
	private int seq,cus_seq,o_seq,price;
	private Date regdate;

	
	
//	insert into settlement (cus_seq,o_seq,price)
//	values(14,20,20000)
//
//	select a.*,b.name,b.email from settlement a
//	inner join customer b
//	on (a.cus_seq = b.seq)
//	order by a.seq desc

}
