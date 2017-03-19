package com.aowin.model.card;

public class Card {
	//办卡信息
	private Integer card_id;		//卡id
	private String card_code;		//卡号
	private Integer card_type;		//卡类型
	private String name;			//姓名
	private String idcard;			//身份证号
	private String sex;			//性别
	private String telphone;		//联系电话
	private String mobile;			//手机
	private String email;			//邮箱
	private String address;			//地址
	private String work;			//工作单位
	private String zxbj;			//注销标识
	private Double monthly_money;	//月票金额
	private Double frozen_money;	//冻结金额	
	private Double wallet_money;	//钱包余额
	private Integer status;			//卡状态
	
	
	public Card() {
		super();
	}
	
	public Integer getCard_id() {
		return card_id;
	}
	public void setCard_id(Integer cardId) {
		card_id = cardId;
	}
	public String getCard_code() {
		return card_code;
	}
	public void setCard_code(String cardCode) {
		card_code = cardCode;
	}
	
	public Integer getCard_type() {
		return card_type;
	}
	public void setCard_type(Integer cardType) {
		card_type = cardType;
	}
	/*public void setCard_type(String cardType) {
		if("A卡".equals(cardType)){
			card_type ="1";
		}else if("D卡".equals(cardType)){
			card_type ="2";
		}else if("市民卡/社保卡".equals(cardType)){
			card_type ="3";
		}else if("员工卡".equals(cardType)){
			card_type ="4";
		}else if("调度卡".equals(cardType)){
			card_type ="5";
		}
	}*/
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getZxbj() {
		return zxbj;
	}
	public void setZxbj(String zxbj) {
		this.zxbj = zxbj;
	}
	public Double getMonthly_money() {
		return monthly_money;
	}
	public void setMonthly_money(Double monthlyMoney) {
		monthly_money = monthlyMoney;
	}
	public Double getFrozen_money() {
		return frozen_money;
	}
	public void setFrozen_money(Double frozenMoney) {
		frozen_money = frozenMoney;
	}
	public Double getWallet_money() {
		return wallet_money;
	}
	public void setWallet_money(Double walletMoney) {
		wallet_money = walletMoney;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}

	
	
}
