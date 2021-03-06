package com.aowin.controller.vehicle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.aowin.model.card.Card;
import com.aowin.model.repair.Deal;
import com.aowin.model.repair.Deploy;
import com.aowin.model.repair.Info;
import com.aowin.model.repair.Pile;
import com.aowin.service.card.CardService;
import com.aowin.service.vehicle.VehicleService;

@Controller
public class VehicleController {
  @Autowired
  private VehicleService bikeService;
  
  //调出
  
  @RequestMapping("/queryAllPileMessage.do")
  public String queryAllPileMessage(Model model){
	   List<Pile> piles=bikeService.queryAllPileMessage();
	   model.addAttribute("piles", piles);
	   return "vehicle/bike_away_chezhuang.jsp";
	   
  }
  
  /*1 车辆调出 查询在桩  且车辆销毁日期为空的车辆 */
  @RequestMapping("/queryBikeMessageByPileId_status3.do")
  public String queryBikeMessageByPileId_status3(Pile pile,Model model){
	   List<Info> bikes=bikeService.queryBikeMessageByPileId_status3(pile);
	   model.addAttribute("bikes", bikes);
	   return "vehicle/bike_away_bikes.jsp";
  }
  
  //员工卡才能调出  根据卡号判断 判断卡类型是否是4 员工卡
  @RequestMapping("/bike_away.do")
  public String bike_away(Card card,Info info,Pile pile,Deploy deploy,Deal deal,Model model){
	   Card c=bikeService.ifEmployeeCard(card);
	   if(c==null){
		  model.addAttribute("mess","此卡非员工卡,不能调出车辆");
		  //该车桩的所有车辆  因服务器转发  再次回到该页面  数据不再在model里了  需要重新查询
		  model.addAttribute("old_pile_id",pile.getPile_id());
	   }else{
		   try {
			bikeService.bike_away(card,info,pile,deploy,deal);
			model.addAttribute("mess","调出车辆编号"+info.getBicycle_code()+"成功");
		} catch (Exception e) {
			 model.addAttribute("mess","调出车辆编号"+info.getBicycle_code()+"失败");
			 e.printStackTrace();
		}
	}
	   return "vehicle/bike_away_chezhuang.jsp";
  }
  
  
  //调入
  
  //车辆调入首页 显示所有状态是普通调出的车辆
  @RequestMapping("/queryAllBike_status4.do")
  public String queryAllBike_status4(Model model){
	  List<Info> infos= bikeService.queryAllBike_status4();
	  model.addAttribute("infos", infos);
	  return "vehicle/bike_in_bikes.jsp";
  }
  
  //显示所有无车的车桩信息 
  @RequestMapping("/queryAllPileMessage_status2.do")
  public String queryAllPileMessage_status2(Info info,Model model){
	   List<Pile> piles=bikeService.queryAllPileMessage_status2();
	   model.addAttribute("piles", piles);
	   //将要调出的车辆id放入model 以备调入车桩时使用
	   model.addAttribute("bicycle_id", info.getBicycle_id());
	   model.addAttribute("bicycle_code",info.getBicycle_code());
	   return "vehicle/bike_in_chezhuang.jsp";
  }
  
  //员工卡才能调入  根据卡号判断 判断卡类型是否是4 员工卡
  @RequestMapping("/bike_in.do")
  public String bike_in(Card card,Info info,Pile pile,Deploy deploy,Deal deal,Model model){
	  Card getC=bikeService.ifEmployeeCard(card);
	  if(getC==null){
		  model.addAttribute("mess","此卡非员工卡,不能调入车辆");
		  
	  }else{
		  try {
			bikeService.bike_in(card,info,pile,deploy,deal);
			model.addAttribute("mess","调入车辆编号"+info.getBicycle_code()+"成功");
		} catch (Exception e) {
			model.addAttribute("mess","调入车辆编号"+info.getBicycle_code()+"失败");
			e.printStackTrace();
		}
	 }
	  return "vehicle/bike_in_bikes.jsp";
  }
  
  
  
  public VehicleService getBikeService() {
	return bikeService;
  }

  public void setBikeService(VehicleService bikeService) {
	this.bikeService = bikeService;
  }

  
}
