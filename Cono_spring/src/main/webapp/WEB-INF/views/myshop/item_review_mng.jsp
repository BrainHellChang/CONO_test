<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myshop/item_review_mng.jsp</title>
<style type="text/css">
img {
	width: 100px;
}
#review_wrap {
	width: 1200px;
	margin: 0 350px;
	margin-top: 25px;
	margin-bottom: 25px;
}
#progress_div {
	width: 700px;
}
#progress_div progress {
	width: 100%;
    height: 20px;
}
.progress::-webkit-progress-bar {
    background:#CDF0EA;
    border-radius:10px;
    box-shadow: inset 3px 3px 10px #CDF0EA;
}
.progress::-webkit-progress-value {
    border-radius:10px;
    background: #1D976C;
/*     background: -webkit-linear-gradient(to right, #93F9B9, #1D976C); */
/*     background: linear-gradient(to right, #93F9B9, #1D976C); */

}
#review_score_div { 
 	float: left; 
} 
#selected_review_img_div { 
 	float: left; 
} 
#item_review_list {
	background: #cdf0ea;
	padding: 30px 30px 10px 30px;
	border-radius: 10px;
	border-collapse: collapse;
	line-height: 75px;
}
#review_list tr {
	background: #e1f3f0;
 	height: 20px; 
}

/*  paging  */
.paging  {  
   margin-top: 30px;  
   text-align: center;   
   margin-left: 10px;
}  


.paging input:not(.btn){ 
  width: 30px;  
    height: 30px;   
    background-repeat:no-repeat; 
    border-radius:100px;  
    border-style: none;  
  overflow: hidden;   
  font-size: 13px;
  font-weight: bold;
} 

.paging input:not(.btn):hover{
   background-color: #999;
} 

.paging a:hover{
   text-decoration: underline;
}
#selected_review_img_div {
	width: 500px;
}
#selected_review_img_div img {
	width: 200px;
	height: 200px;
	float: right;
	margin: 0 50%;
}
</style>
</head>
<body>
	
	<!-- 상단 부분 -->
	<div>
		<jsp:include page="../header_footer/header.jsp" />
	</div>
	
	
	<!------ 사이드바 ------>
	<div>
		<jsp:include page="./myshop_sidebar.jsp"/>
	</div>
	
	<div id="review_wrap">
		<div id="review_top">
			<h3>상품 후기 관리</h3>
			<hr style="height: 3px;">
			<div id="review_score_div">
				
				<div class="storeIndication">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
		  				<path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
					</svg>
					<span> ${itemAvg.get('avg') } / 5 </span> <br>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
			 			<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
			 			<path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z" />
					</svg>
					<span> ${itemAvg.get('item_idx') } 개</span>
				</div>
			
				<div id="progress_div">
					<table style="width: 100%;">
						<!-- 막대 표현 어떻게 할지 고민..!! -->
						<tr>
							<td width="10%">5점</td>
							<td width="80%">
								<progress class="progress" value="${itemScore.get('5')/itemAvg.get('item_idx')*100 }" max="100"></progress>
							</td>
							<td>${itemScore.get('5') }</td>
						</tr>
						<tr>
							<td>4점</td>
							<td>
								<progress class="progress" value="${itemScore.get('4')/itemAvg.get('item_idx')*100 }" max="100"></progress>
							</td>
							<td>${itemScore.get('4') }</td>
						</tr>
						<tr>
							<td>3점</td>
							<td>
								<progress class="progress" value="${itemScore.get('3')/itemAvg.get('item_idx')*100 }" max="100"></progress>
							</td>
							<td>${itemScore.get('3') }</td>
						</tr>
						<tr>
							<td>2점</td>
							<td>
								<progress class="progress" value="${itemScore.get('2')/itemAvg.get('item_idx')*100 }" max="100"></progress>
							</td>
							<td>${itemScore.get('2') }</td>
						</tr>
						<tr>
							<td>1점</td>
							<td>
								<progress class="progress" value="${itemScore.get('1')/itemAvg.get('item_idx')*100 }" max="100"></progress>
							</td>
							<td>${itemScore.get('1') }</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div id="selected_review_img_div">
				<c:if test="${param.item_idx ne null }">
					<img alt="" src="resources/upload/file/${img }">
				</c:if>
			</div>
		</div>
		
		<div style="clear: both;"></div>
		
		<hr>
		
		<div id="item_img_slide">
			<!-- &lang: 왼쪽 방향 화살표
		      &rang: 오른쪽 방향 화살표 -->
		    <span class="prev">&lang;</span>  
			<table>
				<!-- 페이징 처리 처럼 옆으로 누르면 넘어가는 방식(한 칸씩 이동..! 부드럽게) -->
				<!-- URL 파라미터로 구분(상품 번호?) -->
				<tr>
					<c:forEach items="${imgNameList }" var="imgName">
						<td onclick="location.href='ItemReviewMng.shop?item_idx=${imgName.get('item_idx') }'">
							<c:choose>
								<c:when test="${imgName.get('img_name') ne null }">
									<img alt="" src="resources/upload/file/${imgName.get('img_name') }">
								</c:when>
								<c:otherwise>
									<img alt="" src="<spring:url value='/resources/default_img.png'/>">
								</c:otherwise>
							</c:choose>
							<span>${imgName.get('item_idx') }</span>
						</td>
					</c:forEach>
				</tr>
			</table>
			<span class="next">&rang;</span>
		</div>
	
	
		<div id="item_review_list">
			<!-- URL 파라미터로 구분(sort) -->
<!-- 			추천순&nbsp;최신순&nbsp;평점순 -->
			<table id="review_list" style="width: 100%;">
				<c:forEach items="${reviewList }" var="review">
					<tr>
						<td width="100px">${review.get('review_score') }</td>
						<td width="300px">${review.get('review_content') }</td>
						<td width="100px">${review.get('review_date') }</td>
						<td>${review.get('member_id') }</td>
					</tr>
					<tr>
					</tr>
				</c:forEach>
			</table>
		</div>
	
	
		<!-- 페이징 처리 -->
		<section class="paging">
			<!-- [이전] 링크 동작 -->
			<c:choose>
				<c:when test="${pageNum > 1}">
					<input type="button" value=" < " onclick="location.href='selectReviewList?page=${pageNum - 1}'">
				</c:when>
				<c:otherwise>
					<input type="button" value=" < " disabled="disabled">
				</c:otherwise>
			</c:choose>
				
			<!-- 페이지 번호 --> 
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${pageNum eq i}">
						${i }
					</c:when>
					<c:otherwise>
						<a href="selectReviewList?page=${i }">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	
			<!-- [다음] 링크 동작 -->
			<c:choose>
				<c:when test="${pageNum < maxPage}">
					<input type="button" value=" > " onclick="location.href='selectReviewList?page=${pageNum + 1}'">
				</c:when>
				<c:otherwise>
					<input type="button" value=" > " disabled="disabled">
				</c:otherwise>
			</c:choose>
		</section>
		
	</div>
	
	<!-- 하단 부분 -->
	<div>
		<jsp:include page="../header_footer/footer.jsp" />
	</div>
</body>
</html>