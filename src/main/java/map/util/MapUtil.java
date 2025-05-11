package map.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.json.JsonArray;
import javax.json.JsonObject;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

public class MapUtil {
	
	private static final Logger logger = LogManager.getLogger(MapUtil.class);
	
	public static List<Map<String, Object>> getMapData(String sido, String gugun, String year) throws Exception {
		
		logger.info("================ getMapData ");
		
		String API_KEY = "U7CaYX4DVeuDthe45YsPPDKvZe9%2FsOIvuP3SQ3MFtUXl%2FZl%2F8QzMlMoVuLajSuf0M6OWNdmxMlGU9ZDOajjo3Q%3D%3D";
		String url = "https://apis.data.go.kr/B552061/frequentzoneBicycle/getRestFrequentzoneBicycle?"
				+ "ServiceKey=" + API_KEY
				+ "&searchYearCd=" + year
				+ "&siDo=27"
				+ "&guGun=" +gugun
				+ "&type=json"
				+ "&numOfRows=10"
				+ "&pageNo=1";
		
		logger.debug("================ url : {} ", url);
		
		URL apiUrl = new URL(url); // URL 객체 생성
		InputStream inputStream = apiUrl.openStream(); // InputStream 열기 (API에 접속)
		InputStreamReader reader = new InputStreamReader(inputStream, "UTF-8"); // InputStream → InputStreamReader (문자 단위로 변환)
		BufferedReader br = new BufferedReader(reader); // InputStreamReader → BufferedReader (줄 단위 읽기)
		String result = br.lines().collect(Collectors.joining()); // BufferedReader 읽어서 문자열로 결합
		br.close();

		JSONObject root = new JSONObject(result); // JSON 객체 생성
		JSONObject itemsObject = root.getJSONObject("items"); // items 가져오기
		JSONArray itemArray = itemsObject.getJSONArray("item"); // item 배열 가져오기
		logger.debug("================ 사고 지역 개수 : {} ", itemArray.length());
		
		List<Map<String, Object>> list = new ArrayList<>();
		for (int i = 0; i < itemArray.length(); i++) {
		    JSONObject obj = itemArray.getJSONObject(i);
		    Map<String, Object> map = new HashMap<>();
			map.put("name", obj.getString("spot_nm"));
			map.put("lat", obj.getDouble("la_crd"));
			map.put("lng", obj.getDouble("lo_crd"));
			map.put("count", obj.getInt("occrrnc_cnt"));  // 사고 건수
		    logger.debug("================ 장소: {} | lat : {} | lng : {} | count : {}", obj.getString("spot_nm"),obj.getDouble("la_crd"),obj.getDouble("lo_crd"),obj.getInt("occrrnc_cnt"));
		    
			list.add(map);			 
		}
				
		logger.debug("================ list ");
		return list;
	}

}
