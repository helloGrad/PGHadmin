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
<style type="text/css">
.ui-autocomplete {
	max-height: 100px;
	overflow-y: auto;
	overflow-x: hidden;
	padding-right: 20px;
}
</style>

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

			<form class="updateform" id="updateform" name="updateform"
				method="post" enctype="multipart/form-data"
				action="${pageContext.servletContext.contextPath }/organz/insert">

				<div class="form-group">
					<input type="hidden" id="type" name="type" value="${param.type }">
					<label>기관구분:</label> <select id="hmnbrdDstnct" name="hmnbrdDstnct">
						<option value="국내">국내</option>
						<option value="국외">국외</option>
					</select> <input type="text" class="form-control" id="orgnzDstnct"
						name="orgnzDstnct" value="${param.type }" readonly>

					<c:if test="${param.type == '대학원' }">
						<br>
						<label>대학원구분:</label>
						<select id="grschDstnct" name="grschDstnct">
							<option value="일반대학원">일반대학원</option>
							<option value="전문대학원">전문대학원</option>
							<option value="특수대학원">특수대학원</option>
						</select>
					</c:if>

					<br> <br> <label>기관명:</label> <input type="text"
						class="form-control" id="orgnzNm" name="orgnzNm"> <br>
					<label>기관영문명:</label> <input type="text" class="form-control"
						id="engOrgnzNm" name="engOrgnzNm"><br> <label>홈페이지주소:</label>
					<input type="text" class="form-control" id="hmpageUrl"
						name="hmpageUrl"> <br> <label>전화번호:</label> <input
						type="text" class="form-control" id="telNo" name="telNo">
					<br> <label>팩스번호:</label> <input type="text"
						class="form-control" id="faxNo" name="faxNo"><br> <label>주소:</label>
					<input type="text" class="form-control" id="addr" name="addr"><br>
					<label>상세주소:</label> <input type="text" class="form-control"
						id="detailAddr" name="detailAddr"> <br> <label>상징색상명:</label>
					<input type="text" class="form-control" id="symbolColorNm"
						name="symbolColorNm"><br>

					<c:if test="${param.type == '학과' || param.type == '대학원'}">

						<div class="form-group">
							<label for="inputlg"> ▣ 부모기관번호</label> <input
								class="form-control input-lg" id="orgnzNo1" name="prntsOrgnzStr"
								type="text" readonly>
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 부모기관명</label> <input
								class="form-control input-lg" id="organzinput"
								name="orgnzFullNm" type="text" readonly>

							<c:choose>
								<c:when test="${param.type=='대학원' }">
									<input type='button' value='기관검색하기'
										onclick="openOrganzSearch('대학교');">
								</c:when>
								<c:when test="${param.type=='학과' }">
									<input type='button' value='기관검색하기'
										onclick="openOrganzSearch('대학원');">
								</c:when>
							</c:choose>

						</div>
					</c:if>
					<c:if test="${param.type == '대학원' }">
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
					</c:if>

					<c:if test="${param.type == '학과' }">

					</c:if>

					<c:choose>
						<c:when test="${param.type == '학과' }">
							<br>												
							<div class="ui-widget">
								<label for="tags">학과/학부코드 : </label> <input id="tags">
								<div id="duplicateMsg" style="display: none">중복입니다 !!</div>
								<div id="cdNmList"></div>
							</div>
							<br>						
							<div class="ui-widget">
								<label for="tags2">세부전공코드 : </label> <input id="tags2">
								<div id="duplicateMsg2" style="display: none">중복입니다 !!</div>
								<div id="cdNmList2"></div>
							</div>
			
							<br>
							<label><input name="aboltYn" type="checkbox" value="Y">폐지여부</label>
							<br>
							<br>
						</c:when>
						<c:otherwise>
							<input type='hidden' name='codes2[0].cdId' value='-1'>
							<input type='hidden' name='codes[0].cdId' value='-1'>
						</c:otherwise>
					</c:choose>
					
					<table id="filetable" cellpadding="5" cellspacing="0">
						<tr name="tr_attach_file">
							<th>첨부파일</th>
							<td><input id="file" type="file" name="attachFile" multiple /></td>
						</tr>						
					</table>
					<div id='apndngfiles'></div>
				</div>

				<button type="submit" class="btn btn-primary btn-lg">입력</button>
			</form>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/file.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/search.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/autoCompleteSroll.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad2.js"></script>

</body>
</html>