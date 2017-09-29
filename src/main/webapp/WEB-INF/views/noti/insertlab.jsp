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
			<div id="notilab" class="col-lg-12">
				<h2>모집공고 연구실</h2>
				<form class="login-form" id="login-form" name="loginform"
					method="post" enctype="multipart/form-data"
					action="${pageContext.servletContext.contextPath }/noti/insert">
					<input type="hidden" name="type" value="연구실" id="type">
				
					<div class=col-lg-8>
						<div class="form-group">
							<label>▣ 광고구분</label> <select id="" name="pchrgYn">
								<option value="Y">유료</option>
								<option value="N">무료</option>
							</select>
							<label>▣ 모집년도</label> 
							<input type="text" name="slctnYycl">
							<label>▣ 모집학기</label> <select id="" name="slctnSemstr">
								<option value="전기">전기</option>
								<option value="후기">후기</option>
								<option value="상시">상시</option>
							</select>
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 제목</label> <input
								class="form-control input-lg" id="slctnTitle" name="slctnTitle"
								type="text" placeholder="예) 하이브레인넷 연구실 모집">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 기관번호</label> <input
								class="form-control input-lg" id="orgnzlabNo" name="orgnzNo"
								type="text" readonly>
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ 기관명</label> <input
								class="form-control input-lg" id="organzinputlab" type="text"
								readonly> <input type="button" value="기관검색하기"
								onclick="openOrganzSearch('연구실')">
						</div>
						<div class="row">
						
							<div class="col-lg-6">
								<label for="inputlg"> ▣ 모집기간(시작) </label> <input
									class="form-control input-lg" id="slctnBeginDt"
									name="slctnBeginDt" type="text" placeholder="예) 2017/08/01">
							</div>
							
							<div class="col-lg-6">
								<label for="inputlg"> ▣ 모집기간(종료) </label> <input
									class="form-control input-lg" id="slctnEndDt" name="slctnEndDt"
									type="text" placeholder="예) 2017/09/01">
							</div>
						</div>
						<hr>
						<p class="contents">
						<div class="form-group">
							<label for="">▣ 연구실 소개</label>
							
							<textarea class="form-control" rows="4" id="" name="slctnText"
								placeholder=" 예) 1. MZnSnO 기반 박막트랜지스터 제작, 전기적 및 광학적 특성 분석, 소자 특성 연구
                              2. SrVO3 및 CaVO3 등의 신개념 전이금속 산화물 투명 전극 제작 및 응용연구
                              3. 플라즈마-표면 상호작용 및 플라즈마 반도체 공정에의 응용 연구"></textarea>
						</div>
						</p>
						<hr>
						<p class="contents">
						<div class="form-group">
							<label for="">▣ 주요 연구 분야</label>
							
							<textarea class="form-control" rows="4" id=""
								name="prmryResrchField"
								placeholder=" 예) 1. MZnSnO 기반 박막트랜지스터 제작, 전기적 및 광학적 특성 분석, 소자 특성 연구
                              2. SrVO3 및 CaVO3 등의 신개념 전이금속 산화물 투명 전극 제작 및 응용연구
                              3. 플라즈마-표면 상호작용 및 플라즈마 반도체 공정에의 응용 연구"></textarea>
						</div>
						</p>
						<hr>
						<p class="contents">
						<div class="form-group">
							<label for=""> ▣ 모집대상</label>
							
							<textarea class="form-control" rows="3" id="slctnNops"
								name="slctnNops" placeholder="예) 석사과정 0명, 박사과정 0명, 석박사통합과정 0명"></textarea>
						</div>
						</p>
						<hr>
						<div class="form-group">
							<div class="form-group">
								<label> ▣ 지원자격 </label>
							
								<textarea class="form-control" rows="2" id="suprtQualf"
									name="suprtQualf"
									placeholder="물리학, 화학, 재료공학, 전자공학 등 관련 이공계열 학과에서 학/석사를 취득하거나 졸업 예정인 사람으로 반도체물리학 및 반도체소자에 관심과 흥미가 있는 자"></textarea>
							</div>
						</div>
						<hr>

						<p class="contents">
						<div class="form-group">
							<label for="">▣ 전형방법</label>
							
							<textarea class="form-control" rows="4" id="slsnMth"
								name="slsnMth"></textarea>
						</div>
						</p>
						<p class="contents">
						<div class="form-group">
							<label for="">▣ 제출서류</label>
							
							<textarea class="form-control" rows="4" id="sbmtDocText"
								name="sbmtDocText"></textarea>
						</div>
						</p>
						<div class="form-group">
							<div class="form-group">
							
								<div class="ui-widget">
									<label for="tags">▣ 전공분야</label> <br> <input id="tags">
									<div id="duplicateMsg" style="display: none">중복입니다 !!</div>
									<div id="cdNmList"></div>
								</div>
								<br>
							</div>
						</div>
						<hr>
						<p class="lead">
							<span class="location"> 담당자 정보 등록 </span>
						</p>
						<div class="form-group">
							<label for="inputlg"> ▣ 담당자 </label>
							
							<input class="form-control input-lg" id="chrgrNm" name="chrgrNm"
								type="text">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 전화번호 </label>
							
							<input class="form-control input-lg" id="chrgrTelNo"
								name="chrgrTelNo" type="text">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ fax </label>
							
							<input class="form-control input-lg" id="" name="" type="text">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ email </label>
							
							<input class="form-control input-lg" id="chrgrEmail"
								name="chrgrEmail" type="text">
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


					</div>
					
					<div class="col-lg-4">
						<div class="well">
							<p class="lead">지원 정보</p>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="bk21EorgnzSuprtYn" type="checkbox" value="Y">bk21
									지원
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="tuitionSuprtYn" type="checkbox" value="Y">등록금 지원
									여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="lvncSuprtYn" type="checkbox" value="Y">생활비 지원 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="incetSuprtYn" type="checkbox" value="Y">인센티브 지원
									여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="dormSuprtYn" type="checkbox" value="Y">기숙사 지원 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="internYn" type="checkbox" value="Y">인턴 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="lrstyJoingYn" type="checkbox" value="Y">학회 참가 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="lrstyJoingfeeSuprtYn" type="checkbox" value="Y">학회
									참가비 지원 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="resrchTaskJoingYn" type="checkbox" value="Y">연구
									과제 참가 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="stdtrOpptySuprtYn" type="checkbox" value="Y">연수기회
									지원 여부
								</label>
							</div>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									name="eduPgmJoingSuprtYn" type="checkbox" value="Y">교육프로그램지원
									여부
								</label>
							</div>
							<div class="form-group">
								<label for="inputlg"> ▣ 기타 지원 내역 </label>
							


								<input class="form-control input-lg" id="suprtFvrText"
									name="suprtFvrText" type="text">
							</div>


							<p class="lead">온라인 지원</p>
							<div class="checkbox">
								<label class="btn-lg btn-default btn-block"> <input
									type="checkbox" name="onlineSuprtYn" value="Y">온라인 지원
									신청
								</label>
							</div>

							<button type="submit" class="btn btn-primary web-volunteer">모집공고
								등록</button>
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