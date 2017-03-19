package com.aowin.dao.card;

import java.util.List;

import com.aowin.model.card.Card;
import com.aowin.model.card.CardInfoRecord;
import com.aowin.model.card.CardRecord;

public interface ICardDao {
	/*1.办卡时先判断该卡号是否已存在  2.修改前先查询出该卡号的所有信息  
	 * 3点注销  查出月票余额  钱包余额  冻结余额  如果不为0 清空账户余额，提示填写清空原因*/
	public Card queryByCardCode(Card card);       
	//填写办卡信息
	/**
	 * 
	 */
	public int addCard(Card card);              
	/* 1 办卡后写入办卡记录表    2 卡挂失写入卡记录信息表  3 注销    */
	public int addInfoRecord(CardInfoRecord info) throws Exception;    
	//获取卡号
	public int selNextCardCode();     
	//查询所有办卡信息
	public List<Card> queryCards(Card card);   
	//修改办卡信息
	public int updateOneCard(Card card);    
	//卡挂失
    public int reportLossCard(CardInfoRecord info) throws Exception;   

    //卡注销
    public int cancellation_card(CardRecord record) throws Exception;
    public int addCard_record(CardRecord record) throws Exception;
     



}
