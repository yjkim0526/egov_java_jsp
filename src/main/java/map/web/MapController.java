package map.web;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;

import map.util.MapUtil;

@Controller
public class MapController {
	
	private static final Logger logger = LogManager.getLogger(MapController.class);
	
	@RequestMapping("/bikeMap.do")
	public String bikeMap( // 대구광역시 : 27, 동구 : 140
			@RequestParam(value = "sido", required = false, defaultValue = "27") String sido,
	        @RequestParam(value = "gugun", required = false, defaultValue = "140") String gugun,
	        @RequestParam(value = "year", required = false, defaultValue = "2023") String year,
	        ModelMap model
	) throws Exception {
		
		logger.info("================ bikeMap.do ");
		
        List<Map<String, Object>> resultList = MapUtil.getMapData(sido, gugun, year);

        ObjectMapper mapper = new ObjectMapper(); // Jackson 사용
        String jsonData = mapper.writeValueAsString(resultList); // List → JSON 문자열
        model.addAttribute("jsonData", jsonData); // JS용 JSON 문자열
        model.addAttribute("jsonDataObj", resultList); // JSP 목록 출력용
        model.addAttribute("sido", sido);
        model.addAttribute("gugun", gugun);
        model.addAttribute("year", year);
        
		return "map/bikeMap";
	}

}
