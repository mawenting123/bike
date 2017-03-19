package com.aowin.controller.card;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.aowin.model.card.Card;
import com.aowin.model.card.CardInfoRecord;
import com.aowin.model.card.CardRecord;
import com.aowin.service.card.CardService;

@Controller
   
public class CardController {
	@Autowired
    private CardService CardService;

	@RequestMapping("/addCard.do")
	public String addCard(Card card,CardInfoRecord info,Model model){
		Card c=CardService.checkCardCode(card);
		if(c!=null){
			model.addAttribute("mess", "卡号已经存在");
		}else{
			try {
				CardService.addCard(card,info);
				model.addAttribute("mess", "开卡成功");
			} catch (Exception e) {
				model.addAttribute("mess", "开卡失败");
				e.printStackTrace();
			}
		}
		return "card/addCard.jsp";
	}
	
	//一进入新增页面就显示下一个卡号
	@RequestMapping("/selCardCode.do")
	@ResponseBody
	public String selCardCode(){
		int cardCode=CardService.selCardCode();
		return cardCode+"";
	}
	
	//根据条件查询办卡信息
	@RequestMapping("/queryCondition.do")
	public String selCardCode(Card card,Model model){
		List<Card> cards=CardService.queryCards(card);
		model.addAttribute("cards",cards);
		//查询条件再放回queryCard页面
		model.addAttribute("card_code",card.getCard_code());
		model.addAttribute("card_type",card.getCard_type());
		model.addAttribute("idcard",card.getIdcard());
		model.addAttribute("name",card.getName());
		model.addAttribute("sex",card.getSex());
		
		return "card/queryCard2.jsp";
	}
	
	/*1 修改前先查询出该卡号的所有信息
	 *2 注销前先查询出该卡号的所有信息
	*/
	@RequestMapping("/queryByCode.do")
	@ResponseBody
	public String queryByCode(String card_code){
		Card card=CardService.queryByCode(card_code);
		String json=JSONObject.toJSONString(card);
		return json;
	}
	//修改办卡信息--删除原有 再新增
	@RequestMapping("/updateCardMess.do")
	public String updateOneCard(Card card,Model model){
		if(CardService.updateOneCard(card)){
			model.addAttribute("mess","修改成功");
		}else{
			model.addAttribute("mess","修改失败");
		}
		return "card/updateCardMess.jsp";
	}
	
	
	//挂失
	@RequestMapping("/reportLossCard.do")
	public String  reportLossCard(CardInfoRecord info,Model model){
		try {
			CardService.reportLossCard(info);
			model.addAttribute("mess","挂失成功");
		} catch (Exception e) {
			model.addAttribute("mess","挂失失败");
			e.printStackTrace();
		}
		return "card/queryCard2.jsp";
	}
	
	//卡注销
	@RequestMapping("/cancellationCard.do")
	 public String cancellationCard(CardRecord record,CardInfoRecord info,Model model){
		 try {
			CardService.cancellationCard(record, info);
			model.addAttribute("mess","注销成功");
		} catch (Exception e) {
			model.addAttribute("mess","注销失败");
			e.printStackTrace();
		}
		 return "card/queryCard2.jsp";
	 }
	
	
	
	
	
	
	
	
	
	
	
	
	public CardService getCardService() {
		return CardService;
	}

	public void setCardService(CardService cardService) {
		CardService = cardService;
	}
	
	
	
	
	
	
	
	

}
