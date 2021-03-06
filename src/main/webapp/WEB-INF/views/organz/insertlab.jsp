<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminform.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>



<style>
textarea {
	width: 300px;
	overflow: visible
}

#organzinfo {
	visibility: visible;
}

.ui-autocomplete {
	max-height: 100px;
	overflow-y: auto;	
	overflow-x: hidden;	
	padding-right: 20px;
}

</style>


<script>
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (20 + obj.scrollHeight) + "px";
	}
</script>

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">

		<div class="row">
			<a id="gradBtn" class="btn btn-info"
				href="${pageContext.servletContext.contextPath }/organz/list">기관
				목록으로 가기</a>
		</div>
		<hr class="nav-line">


		<div class="row">
			<div id="lab" class="col-lg-12">
				<form class="login-form" id="login-form" name="loginform"
					method="post"
					action="${pageContext.servletContext.contextPath }/organz/insert?type=연구실">
					<div class="form-group">
						<input type="hidden" id="tabnm" name="tabnm" value="lab">
						<input type="hidden" id="type" name="type" value="${param.type }">

						<label>기관구분:</label> 
						 <select id="hmnbrdDstnct" name="hmnbrdDstnct">
							<option value="국내">국내</option>
							<option value="국외">국외</option> 
						</select><br>
							<input type="text" class="form-control" id="orgnzDstnct"
							name="orgnzDstnct" value="연구실" readonly> <br> <br>
						
						 <label>기관명:</label> <input type="text" class="form-control"
							id="orgnzNm" name="orgnzNm"> <br> <label>
							기관영문명 :</label> <input type="text" class="form-control"
							id="engOrgnzNm" name="engOrgnzNm"> <br> 
						<label>홈페이지 주소 :</label> <input type="text"
							class="form-control" id="hmpageUrl" name="hmpageUrl"> <br>
						<label>전화번호 :</label> <input type="text" class="form-control"
							id="telNo" name="telNo"> <br> <label>
							팩스번호 :</label> <input type="text" class="form-control" id="faxNo"
							name="faxNo"> <br> <label> 주소 :</label> <input
							type="text" class="form-control" id="addr" name="addr"> <br>
						<label>상세주소 :</label> <input type="text" class="form-control"
							id="detailAddr" name="detailAddr"> <br> <label>상징색상명:</label>
						<input type="text" class="form-control" id="symbolColorNm"
							name="symbolColorNm"> <br>
						<div id="organzinfo">
							<div class="form-group">
								<label for="inputlg"> ▣ 부모기관번호</label> <input
									class="form-control input-lg" id="orgnzNo1" name="prntsOrgnzNo"
									"
									type="text" readonly>
							</div>
							<div class="form-group">
								<label for="inputlg"> ▣ 부모기관명</label> <input
									class="form-control input-lg" id="organzinput"
									name="orgnzFullNm" type="text" readonly> <input
									type="button" value="기관검색하기" onclick="openOrganzSearch('학과')">
							</div>
						</div>
						<br> <label>지도교수명:</label> <input type="text"
							class="form-control" id="mapProfNm" name="mapProfNm"> <br>
						<label> 연구실 소개:</label>
						<textarea class="form-control" onkeydown="resize(this)"
							onkeyup="resize(this)" id="labIntro" name="labIntro"></textarea>
						<br> <label>연구원 수(박사/석박사/석사):</label> <input type="text"
							class="form-control" id="rsrchrInfoText" name="rsrchrInfoText">
						<br>  
					</div>
					<div class="form-group">
						<label for="inputlg"> 지역</label> <input type="checkbox"
							name="cdlist" value="AR00001">서울&nbsp; <input
							type="checkbox" name="cdlist" value="AR00002">세종&nbsp; <input
							type="checkbox" name="cdlist" value="AR00003">인천&nbsp; <input
							type="checkbox" name="cdlist" value="AR00004">대전&nbsp; <input
							type="checkbox" name="cdlist" value="AR00005">대구&nbsp; <input
							type="checkbox" name="cdlist" value="AR00006">부산&nbsp; <input
							type="checkbox" name="cdlist" value="AR00007">울산&nbsp; <input
							type="checkbox" name="cdlist" value="AR00008">광주&nbsp; <input
							type="checkbox" name="cdlist" value="AR00009">경기&nbsp; <input
							type="checkbox" name="cdlist" value="AR00010">충북&nbsp; <input
							type="checkbox" name="cdlist" value="AR00011">충남&nbsp; <input
							type="checkbox" name="cdlist" value="AR00012">강원&nbsp; <input
							type="checkbox" name="cdlist" value="AR00013">경북&nbsp; <input
							type="checkbox" name="cdlist" value="AR00014">경남&nbsp; <input
							type="checkbox" name="cdlist" value="AR00015">전북&nbsp; <input
							type="checkbox" name="cdlist" value="AR00016">전남&nbsp; <input
							type="checkbox" name="cdlist" value="AR00017">제주&nbsp; <input
							type="checkbox" name="cdlist" value="AR00018">국외&nbsp;
					</div>
					<div class="form-group">
						<label for="inputlg"> 학위</label> <input type="checkbox"
							name="cdlist" value="DE00001">석사&nbsp; <input
							type="checkbox" name="cdlist" value="DE00002">박사&nbsp; <input
							type="checkbox" name="cdlist" value="DE00003">석박사통합&nbsp;
					</div>

					<!-- 맞춤정보 입력란 -->
					<div class="ui-widget">
						<label for="tags">연구분야: </label> <input id="tags">
						<div id="duplicateMsg" style="display: none">중복입니다 !!</div>
						<div id="cdNmList"></div>
					</div>
					
					
					<button type="submit" class="form-control">입력</button>
				</form>

				<hr>

				<form class="resrch-form" id="resrch-form" name="resrch-form"
					method="post"
					action="${pageContext.servletContext.contextPath }/organz/insert">
					<input type="hidden" id="orgnzDstnct" name="orgnzDstnct"
						value="연구실">
					<div id="organzinfo">
						<div class="form-group">
							<label for="inputlg"> ▣ 연구실번호</label> <input
								class="form-control input-lg" id="orgnzlabNo" name="orgnzNo"
								type="text" readonly>
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 연구실명</label> <input
								class="form-control input-lg" id="organzinputlab" type="text"
								readonly> <input type="button" value="기관검색하기"
								onclick="openOrganzSearch('연구실')">
						</div>
					</div>
					<br> <label> 실적구분 :</label> <select name="acrsltDstnct">
						<option value=""> 실적구분</option>
						<option value="논문">논문</option>
						<option value="세미나">세미나</option>
						<option value="학회">학회</option>
						<option value="특허">특허</option>
						<option value="프로젝트">프로젝트</option>
						<option value="기타">기타</option>
					</select> <br> <br> <label>연구년도 :</label><input type="text"
						class="form-control" id="resrchYycl" name="resrchYycl"> <br>
					<label> 연구내용:</label>
					<textarea class="form-control" onkeydown="resize(this)"
						onkeyup="resize(this)" id="resrchText" name="resrchText"></textarea>
					<br>
					<button type="submit" class="form-control">입력</button>
				</form>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/organzlist.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/search.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/autoCompleteSroll.js"></script>
</body>
</html>