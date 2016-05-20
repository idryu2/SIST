package com.sist.sist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.train.TrainDAO;
import com.sist.train.TrainVO;

@Controller
public class MainController {
	@Autowired
	private TrainDAO dao;
   @RequestMapping("main.do")
   public String main_list(String id,Model model)
   {
	   	id="admin"; // �α��� ����� ������
		List<TrainVO> list=dao.trainAllData(id);
		model.addAttribute("list",list);
	   return "main";
   }
   
   @RequestMapping("songChange.do")
   public String songChange()
   {
	   return "tiles/footer";
   }
   
}
