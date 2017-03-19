package com.aowin.dao.card;

import java.util.List;

import com.aowin.model.card.Card;
import com.aowin.model.card.CardRecord;

public interface IChargeDao {
	//月票首充不低于50元   判断是否是当月首充
    public List<CardRecord> ifFirstMonthly(String card_id);
    //月票充值 
    public int updateMoney(Card card) throws Exception;
    public int chargeAddCard_record(CardRecord record) throws Exception;
    
    
    
    
    
}
