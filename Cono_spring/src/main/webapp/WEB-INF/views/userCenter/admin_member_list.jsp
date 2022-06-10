<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<title>회원 관리</title>
<link rel="stylesheet" href="selectbox.css" />
<link rel="stylesheet" href="search.css" />
<link rel="stylesheet" href="table.css" />

<script type="text/javascript">



	// 회원 탈퇴
	function confirmExit(member_id, page){
		var exitConfirm = confirm("탈퇴를 진행하시겠습니까?" + '\n' + "탈퇴한 아이디는 복원하실 수 없습니다.");
		
		if(exitConfirm){
			location.href="AdminMemberExit.admin?member_id=" + member_id + "&page=" + page;
		} 
	}

</script>
</head>
<body>

	<!-- JSTL 사용해 PageInfo 객체 값을 변수에 저장 -->
	<c:set var="pageNum" value="${pageInfo.getPageNum() }" />
	<c:set var="maxPage" value="${pageInfo.getMaxPage() }" />
	<c:set var="startPage" value="${pageInfo.getStartPage() }" />
	<c:set var="endPage" value="${pageInfo.getEndPage() }" />
	<c:set var="listCount" value="${pageInfo.getListCount() }" />

	<!-- 헤더 -->
	<div>
		<jsp:include page="../admin_css/sidebar.jsp"/>
	</div>
	
	<div class="body">
		<h2>가입 회원</h2>
			
	<!-- 검색 기능 -->
		<div id="member_search">
			<form>
				<select name="searchType" class="ssearch">
					<option value="id_nick_">전체</option>
<!-- 					<option value="id" >아이디</option> -->
<!-- 					<option value="nick">닉네임</option> -->
<!-- 					<option value="s.shop_idx">Cono 온도</option> -->
					<option value="m.member_id" >아이디</option>
					<option value="m.member_nick">닉네임</option>
					<option value="s.shop_idx">Cono 온도</option>
				</select>
				<input type="text" name="search" value="${search }" placeholder="검색어를 입력하세요">
				<input type="submit" id="search_btn" value="검색">
			</form>
		</div>
	
		<!-- 회원리스트 테이블 -->
		<table class="type04">
			<tr>
				<th width="50">All<input type="checkbox" name="check_all" id="check_all" onclick="checkAll()"></th>
				<th width="100" >아이디</th>
				<th width="100" >닉네임</th>
				<th width="100" >Cono 온도</th>
				<th width="150" >Coin Total</th>
				<th width="200" >Phone</th>	
				<th width="200" >E-Mail</th>
				<th width="150" >가입일</th>
				<th width="150" >회원상태</th>
				<th width="100" >관 리</th>
			</tr>
			<c:if test="${not empty memberList and pageInfo.getListCount() > 0}">
					<c:forEach var="member" items="${memberList }">
						<tr> 
							<td><input type="checkbox" name="chk"></td> 
							<td>${member[0] }</td>
							<td>${member[1] }</td>
							<td>${member[2] }</td>
							<td>${member[3] }</td>
							<td>${member[4] }</td>
		 					<td>${member[5] }</td>
							<td>${member[6] }</td>
							<td>${member[7] }</td>
							<td>
								<input type="button" class="search_btn" value="탈퇴" onclick="confirmExit('${member[0] }', '${pageInfo.getPageNum() }' )">
							</td> 
						</tr> 
					</c:forEach>
				</c:if>
		</table>


	<section>
		<!-- 페이징 처리 -->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" id="search_btn2" value="이전" onclick="location.href='AdminMemberList?page=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" id="search_btn2" value="이전">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 --> 
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="AdminMemberList?page=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < maxPage}">
				<input type="button" id="search_btn2" value="다음" onclick="location.href='AdminMemberList?page=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" id="search_btn2" value="다음">
			</c:otherwise>
		</c:choose>
	</section>
	
	
</div>	<!-- .body -->

</body>
</html>