<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자전거 사고 다발지역 지도</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/map/map_style.css'/>"/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpKeyId=ngptfedx3l"></script>
</head>
<body>

<div class="container">

    <form action="bikeMap.do" method="get" class="search-form">
        <label for="gugun">구군 선택</label>
        <select name="gugun" id="gugun">
            <option value="">구군선택</option>
            <option value="110" <c:if test="${gugun == '110'}">selected</c:if>>중구</option>
            <option value="140" <c:if test="${gugun == '140'}">selected</c:if>>동구</option>
            <option value="170" <c:if test="${gugun == '170'}">selected</c:if>>서구</option>
            <option value="200" <c:if test="${gugun == '200'}">selected</c:if>>남구</option>
            <option value="230" <c:if test="${gugun == '230'}">selected</c:if>>북구</option>
            <option value="260" <c:if test="${gugun == '260'}">selected</c:if>>수성구</option>
            <option value="290" <c:if test="${gugun == '290'}">selected</c:if>>달서구</option>
        </select>

        <label for="year">연도 선택</label>
        <select name="year" id="year">
            <option value="2023" <c:if test="${year == '2023'}">selected</c:if>>2023</option>
            <option value="2022" <c:if test="${year == '2022'}">selected</c:if>>2022</option>
            <option value="2021" <c:if test="${year == '2021'}">selected</c:if>>2021</option>
            <option value="2020" <c:if test="${year == '2020'}">selected</c:if>>2020</option>
        </select>
        <button type="submit">조회</button>
    </form>
	
    <!-- 지도 영역 -->
    <div class="map-area" id="map" style="width:100%; height:500px;"></div>

    <!-- 마커 클릭 시 상세 정보 -->
    <div id="info-panel">
        <strong>마커를 클릭해 정보를 확인하세요</strong>
        <div id="marker-info" style="margin-top:10px;"></div>
    </div>

    <!-- 사고 다발지역 목록 테이블 -->
    <div class="list-area">
        <h2>사고 다발 지역 목록</h2>
        <table class="accident-table">
            <thead>
                <tr>
                    <th>위치</th>
                    <th>발생 건수</th>
                    <th>위도</th>
                    <th>경도</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${jsonDataObj}">
                    <tr>
                        <td>${item.name}</td>
                        <td>${item.count}</td>
                        <td>${item.lat}</td>
                        <td>${item.lng}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
	//사용자 정의 오버레이 클래스
	function TooltipOverlay(position, content) {
	    this._position = position;
	    this._content = content;
	    this._element = null;
	    this.setMap(map); // map 변수는 바깥에서 접근 가능해야 함
	}
	
	TooltipOverlay.prototype = new naver.maps.OverlayView();
	TooltipOverlay.prototype.constructor = TooltipOverlay;
	
	TooltipOverlay.prototype.onAdd = function () {
	    var div = document.createElement('div');
	    div.innerHTML = this._content;
	    div.className = "custom-tooltip";
	    this._element = div;
	
	    var panes = this.getPanes();
	    panes.overlayLayer.appendChild(div);
	};
	
	TooltipOverlay.prototype.draw = function () {
	    var projection = this.getProjection();
	    var position = projection.fromCoordToOffset(this._position);
	    var div = this._element;
	    if (div) {
	        div.style.position = 'absolute';
	        div.style.left = (position.x - div.offsetWidth / 2) + 'px';
	        div.style.top = (position.y - 50) + 'px';
	    }
	};
	
	TooltipOverlay.prototype.onRemove = function () {
	    if (this._element) {
	        this._element.parentNode.removeChild(this._element);
	        this._element = null;
	    }
	};


    var locations = ${jsonData};

    if (!locations || locations.length === 0) {
        alert("데이터가 없습니다.");
    } else {
        // 지도 중심을 첫 번째 마커로 설정
        var mapCenter = new naver.maps.LatLng(locations[0].lat, locations[0].lng);

        var map = new naver.maps.Map('map', {
            center: mapCenter,
            zoom: 13
        });

        locations.forEach(function(loc) {
            var latlng = new naver.maps.LatLng(loc.lat, loc.lng);

            // 마커 생성
            var marker = new naver.maps.Marker({
                position: latlng,
                map: map,
                title: loc.name
            });

            // 툴팁 오버레이 표시
            var tooltip = new TooltipOverlay(latlng, loc.name);

            // 마커 클릭 시 상세 정보 표시
            naver.maps.Event.addListener(marker, "click", function () {
                $("#marker-info").html(
                    "<h3>" + loc.name + "</h3>" +
                    "<p>사고 건수: " + loc.count + "</p>" +
                    "<p>위도: " + loc.lat + "<br>경도: " + loc.lng + "</p>"
                );
            });
        });
    }
</script>

</body>
</html>
