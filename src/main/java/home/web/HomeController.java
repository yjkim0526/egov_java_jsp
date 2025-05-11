package home.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import map.web.MapController;

@Controller
public class HomeController {
	
	private static final Logger logger = LogManager.getLogger(MapController.class);
	
    @RequestMapping("/home.do")
    public String mainPage() {
    	logger.info("================ home.do ");	
        return "home/home";
    }
}
