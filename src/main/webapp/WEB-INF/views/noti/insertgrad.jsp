<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

		<hr class="nav-line">

		<div class="row">
			<div id="notigrad" class="col-lg-12">
				<h2>모집공고 대학원</h2>
				<form class="login-form" id="login-form" name="loginform"
					method="post" enctype="multipart/form-data"
					action="${pageContext.servletContext.contextPath }/noti/insert">
					<input type="hidden" name="type" value="대학원" id="type">
					

					<div class=col-lg-8>

						<div class="form-group">
							<label>▣ 광고구분</label> <select id="" name="pchrgYn">
								<option value="Y">유료</option>
								<option value="N">무료</option>
							</select> <label>▣ 모집년도</label> <input type="text" name="slctnYycl">
							<label>▣ 모집학기</label> <select id="" name="slctnSemstr">
								<option value="전기">전기</option>
								<option value="후기">후기</option>
								<option value="상시">상시</option>
							</select>
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 제목</label> <input
								class="form-control input-lg" id="slctnTitle" name="slctnTitle"
								type="text">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 기관번호</label> <input
								class="form-control input-lg" id="orgnzNo1" name="orgnzNo"
								type="text" readonly>
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ 기관명</label> <input
								class="form-control input-lg" id="organzinput" type="text"
								readonly> <input type="button" value="기관검색하기"
								onclick="openOrganzSearch('대학원')">
						</div>

						<div class="form-group">
							<label> ▣ 모집내용 </label>
							<textarea class="form-control" rows="2" id="slctnText"
								name="slctnText" placeholder="원서접수 유의사항"></textarea>
						</div>
						
						<div class="form-group">
							<label for="inputlg"> ▣ 대학원 모집 url</label> <input
								class="form-control input-lg" id="slctnNotiUrl"
								name="slctnNotiUrl" type="text"">
						</div>
						<div class="row">
							
							<div class="col-lg-6">
								<label for="inputlg"> ▣ 접수기간(시작) </label> <input
									class="form-control input-lg" id="slctnBeginDt"
									name="slctnBeginDt" type="text">
							</div>
							
							<div class="col-lg-6">
								<label for="inputlg"> ▣ 접수기간(종료) </label> <input
									class="form-control input-lg" id="slctnEndDt" name="slctnEndDt"
									type="text">
							</div>
						</div>

						<hr>
						<p class="contents">
						<div class="form-group">
							<label for="">▣ 지원자격</label>
							<textarea class="form-control" rows="4" id="suprtQualf"
								name="suprtQualf"></textarea>
						</div>
						</p>

						<hr>

						<div class="form-group">
							<label for=""> ▣ 전형방법</label>
							<textarea class="form-control" rows="3" id="slsnMth"
								name="slsnMth" placeholder="서류 및 면접"></textarea>
						</div>

						<div class="form-group">
							<label for=""> ▣ 제출서류</label>
							<textarea class="form-control" rows="2" id="sbmtDocText"
								name="sbmtDocText" placeholder="원서접수 유의사항"></textarea>
						</div>

						<hr>

						<div class="form-group">
							<label> ▣ 원서접수 </label>
						
							<textarea class="form-control" rows="2" id="rcpMth" name="rcpMth"
								placeholder="접수방법"></textarea>
						</div>

						<div class="form-group">
							<label for=""> ▣ 전형일 </label> <br>
							<div class="row">
								<div class="col-xs-3">
									<label for="ex1">시작일</label> <input class="form-control"
										id="slsnBeginDd" name="slsnBeginDd" type="text"
										placeholder="2017/08/01">
								</div>

								<div class="col-xs-3">
									<label for="ex2">종료일</label> <input class="form-control"
										id="slsnEndDd" name="slsnEndDd" type="text"
										placeholder="2017/08/01">
								</div>
							</div>

							<Br>
							<textarea class="form-control" rows="2" id="slsnPlac"
								name="slsnPlac" placeholder="본 대학원 원우회실 (웨스트민스터홀 653호)"></textarea>
						</div>

						<div class="form-group">
							<label for=""> ▣ 합격자 발표 </label>
							<div class="row">
								<div class="col-xs-3">
									<label for="ex1">발표일</label> <input class="form-control"
										id="sccnAncmDd" name="sccnAncmDd" type="text"
										placeholder="2017/08/01">
								</div>
							</div>

							<br>

							<textarea class="form-control" rows="2" id="sccnAncmMth"
								name="sccnAncmMth" placeholder="한양대학교 입학처 홈페이지에서 발표"></textarea>
						</div>

						<div class="form-group">
							<label for=""> ▣ 등록기간 </label>
							<div class="row">
								<div class="col-xs-3">
									<label for="ex1">시작일</label> <input class="form-control"
										id="regstBeginDd" name="regstBeginDd" type="text"
										placeholder="2017/08/01">
								</div>

								<div class="col-xs-3">
									<label for="ex2">종료일</label> <input class="form-control"
										id="regstEndDd" name="regstEndDd" type="text"
										placeholder="2017/08/01">
								</div>
							</div>

							<br>

							<textarea class="form-control" rows="2" id="regstMth"
								name="regstMth" placeholder="한양대학교 지정은행에 등록금 차액 납부"></textarea>
						</div>
						
						<div class="ui-widget">
							<label for="tags">▣학문코드</label> <br> <input id="tags">
							<div id="duplicateMsg" style="display: none">중복입니다 !!</div>
							<div id="cdNmList"></div>
						</div>
						<br>
						<hr>


					</div>

					
					<div class="col-lg-4">
						<p class="lead">추가 정보</p>
						<div class="form-group">
							<label for="inputlg"> ▣ 모집인원 </label> <input
								class="form-control input-sm" id="slctnNops" name="slctnNops"
								type="text">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 담당자 </label> <input
								class="form-control input-sm" id="chrgrNm" name="chrgrNm"
								type="text">
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ 전화번호 </label> <input
								class="form-control input-sm" id="chrgrTelNo" name="chrgrTelNo"
								type="text">
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ email </label> <input
								class="form-control input-sm" id="chrgrEmail" name="chrgrEmail"
								type="text">
						</div>

						<div class="form-group">
							
							<label for="inputlg"> ▣ 로고등록 </label>
							
							<table id="filetable" cellpadding="5" cellspacing="0">
								<tr name="tr_attach_file">
									<th>첨부파일</th>
									<td><input id="file" type="file" name="attachFile" multiple /></td>
								</tr>
		
								
							</table>
							
							<div id='apndngfiles'></div>
							
							
						</div>
						<button type="submit" class="btn btn-primary web-volunteer">모집공고
							등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>



	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/search.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/notijs/insertnoti.js"></script>
</body>
</html>