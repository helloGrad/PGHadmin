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

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		
		<div class="row">
			<a id="gradBtn" class="btn btn-info"
				href="${pageContext.servletContext.contextPath }/noti/list">모집공고
				목록으로 가기</a>
		</div>

		<hr class="nav-line">

		<div class="row">
			<div id="notilab" class="col-lg-12">
				<h2>모집공고 연구실</h2>
				<form class="login-form" id="login-form" name="loginform"
					method="post"
					action="${pageContext.servletContext.contextPath }/noti/update">
					<input type="hidden" name="tabnm" value="lab"> <input
						type="hidden" name="slctnNotiNo" value="${vo.slctnNotiNo }">
					<input type="hidden" name="adminNo" value="${authUser.mbNo }">
					
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
								type="text" value="${vo.slctnTitle }">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 기관번호</label> <input
								class="form-control input-lg" id="orgnzlabNo" name="orgnzNo"
								type="text" value="${vo.orgnzNo }" readonly>
						</div>

						<div class="form-group">
							<label for="inputlg"> ▣ 기관명</label> <input
								class="form-control input-lg" id="organzinputlab" type="text"
								value="${vo.orgnzFullNm }" readonly> <input
								type="button" value="기관검색하기" onclick="openOrganzSearch('연구실')">
						</div>
						<div class="row">
							
							<div class="col-lg-6">
								<label for="inputlg"> ▣ 모집기간(시작) </label> <input
									class="form-control input-lg" id="slctnBeginDt"
									name="slctnBeginDt" type="text" value="${vo.slctnBeginDt }">
							</div>
							
							<div class="col-lg-6">
								<label for="inputlg"> ▣ 모집기간(종료) </label> <input
									class="form-control input-lg" id="slctnEndDt" name="slctnEndDt"
									type="text" value="${vo.slctnEndDt }">
							</div>
						</div>
						<hr>
						<p class="contents">
						<div class="form-group">
							<label for="">▣ 연구실 소개</label>
						
							<textarea class="form-control" rows="4" id="" name="slctnText">${vo.slctnText }</textarea>
						</div>
						</p>
						<hr>
						<p class="contents">
						<div class="form-group">
							<label for="">▣ 주요 연구 분야</label>
							
							<textarea class="form-control" rows="4" id=""
								name="prmryResrchField">${vo.prmryResrchField }</textarea>
						</div>
						</p>
						<hr>
						<p class="contents">
						<div class="form-group">
							<label for=""> ▣ 모집대상</label>
							
							<textarea class="form-control" rows="3" id="slctnNops"
								name="slctnNops">${vo.slctnNops }</textarea>
						</div>
						</p>
						<hr>
						<div class="form-group">
							<div class="form-group">
								<label> ▣ 지원자격 </label>
								
								<textarea class="form-control" rows="2" id="suprtQualf"
									name="suprtQualf">${vo.suprtQualf }</textarea>
							</div>
						</div>
						<hr>

						<p class="contents">
						<div class="form-group">
							<label for="">▣ 전형방법</label>
							
							<textarea class="form-control" rows="4" id="slsnMth"
								name="slsnMth">${vo.slsnMth }</textarea>
						</div>
						</p>
						<p class="contents">
						<div class="form-group">
							<label for="">▣ 제출서류</label>
							
							<textarea class="form-control" rows="4" id="sbmtDocText"
								name="sbmtDocText">${vo.sbmtDocText }</textarea>
						</div>
						</p>
						<div class="form-group">
							<div class="form-group">
								<label> ▣ 전공분야 </label>
								<div class="ui-widget">
				  					<label for="tags">연구분야 : </label>
				  					<input id="tags">
				  					<div id="duplicateMsg" style="display: none">중복입니다 !!</div>
				  					<div id="cdNmList">
				  					</div>
									</div>
									<br> <br>
							</div>
						</div>
						<hr>
						<p class="lead">
							<span class="location"> 담당자 정보 등록 </span>
						</p>
						<div class="form-group">
							<label for="inputlg"> ▣ 담당자 </label>
							
							<input class="form-control input-lg" id="chrgrNm" name="chrgrNm"
								type="text" value="${vo.chrgrNm }">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 전화번호 </label>
							
							<input class="form-control input-lg" id="chrgrTelNo"
								name="chrgrTelNo" type="text" value="${vo.chrgrTelNo }">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ email </label>
							
							<input class="form-control input-lg" id="chrgrEmail"
								name="chrgrEmail" type="text" value="${vo.chrgrEmail }">
						</div>
						<div class="form-group">
							<label for="inputlg"> ▣ 첨부파일 </label> 
							
							<input
								class="form-control input-lg" id="" name="" type="text">
						</div>
					</div>
					
					<div class="col-lg-4">
						<div class="well">
							<p class="lead">지원 정보</p>

							<div class="checkbox">
								<c:choose>
									<c:when test="${vo.bk21EorgnzSuprtYn=='Y' }">
										<label class="btn-lg btn-default btn-block"> <input
											name="bk21EorgnzSuprtYn" type="checkbox" checked=checked
											value="Y">bk21 지원
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn-lg btn-default btn-block"> <input
											name="bk21EorgnzSuprtYn" type="checkbox" value="Y">bk21
											지원
										</label>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="checkbox">
								<c:choose>
									<c:when test="${vo.tuitionSuprtYn=='Y' }">
										<label class="btn-lg btn-default btn-block"> <input
											name="tuitionSuprtYn" type="checkbox" checked="checked"
											value="Y">등록금 지원 여부
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn-lg btn-default btn-block"> <input
											name="tuitionSuprtYn" type="checkbox" value="Y">등록금
											지원 여부
										</label>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="checkbox">
								<c:choose>
									<c:when test="${vo.lvncSuprtYn=='Y' }">
										<label class="btn-lg btn-default btn-block"> <input
											name="lvncSuprtYn" type="checkbox" checked="checked"
											value="Y">생활비 지원 여부
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn-lg btn-default btn-block"> <input
											name="lvncSuprtYn" type="checkbox" value="Y">생활비 지원
											여부
										</label>
									</c:otherwise>
								</c:choose>

							</div>
							<div class="checkbox">
								<c:choose>
									<c:when test="${vo.incetSuprtYn=='Y' }">
										<label class="btn-lg btn-default btn-block"> <input
											name="incetSuprtYn" type="checkbox" checked="checked"
											value="Y">인센티브 지원 여부
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn-lg btn-default btn-block"> <input
											name="incetSuprtYn" type="checkbox" value="Y">인센티브 지원
											여부
										</label>
									</c:otherwise>
								</c:choose>

							</div>
							<div class="checkbox">
								<c:choose>
									<c:when test="${vo.dormSuprtYn=='Y' }">
										<label class="btn-lg btn-default btn-block"> <input
											name="dormSuprtYn" type="checkbox" checked="checked"
											value="Y">기숙사 지원 여부
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn-lg btn-default btn-block"> <input
											name="dormSuprtYn" type="checkbox" value="Y">기숙사 지원
											여부
										</label>
									</c:otherwise>
								</c:choose>

							</div>
							<div class="checkbox">
								<c:choose>
									<c:when test="${vo.internYn=='Y' }">
										<label class="btn-lg btn-default btn-block"> <input
											name="internYn" type="checkbox" checked="checked" value="Y">인턴
											여부
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn-lg btn-default btn-block"> <input
											name="internYn" type="checkbox" value="Y">인턴 여부
										</label>
									</c:otherwise>
								</c:choose>

							</div>
							<div class="checkbox">
								<c:choose>
									<c:when test="${vo.lrstyJoingYn=='Y' }">
										<label class="btn-lg btn-default btn-block"> <input
											name="lrstyJoingYn" type="checkbox" checked="checked"
											value="Y">학회 참가 여부
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn-lg btn-default btn-block"> <input
											name="lrstyJoingYn" type="checkbox" value="Y">학회 참가
											여부
										</label>
									</c:otherwise>
								</c:choose>

							</div>
							<div class="checkbox">
								<c:choose>
									<c:when test="${vo.lrstyJoingfeeSuprtYn=='Y' }">
										<label class="btn-lg btn-default btn-block"> <input
											name="lrstyJoingfeeSuprtYn" type="checkbox" checked="checked"
											value="Y">학회 참가비 지원 여부
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn-lg btn-default btn-block"> <input
											name="lrstyJoingfeeSuprtYn" type="checkbox" value="Y">학회
											참가비 지원 여부
										</label>
									</c:otherwise>
								</c:choose>

							</div>
							<div class="checkbox">
								<c:choose>
									<c:when test="${vo.resrchTaskJoingYn=='Y' }">
										<label class="btn-lg btn-default btn-block"> <input
											name="resrchTaskJoingYn" type="checkbox" checked="checked"
											value="Y">연구 과제 참가 여부
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn-lg btn-default btn-block"> <input
											name="resrchTaskJoingYn" type="checkbox" value="Y">연구
											과제 참가 여부
										</label>
									</c:otherwise>
								</c:choose>

							</div>
							<div class="checkbox">
								<c:choose>
									<c:when test="${vo.stdtrOpptySuprtYn=='Y' }">
										<label class="btn-lg btn-default btn-block"> <input
											name="stdtrOpptySuprtYn" type="checkbox" checked="checked"
											value="Y">연수기회 지원 여부
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn-lg btn-default btn-block"> <input
											name="stdtrOpptySuprtYn" type="checkbox" value="Y">연수기회
											지원 여부
										</label>
									</c:otherwise>
								</c:choose>

							</div>
							<div class="checkbox">
								<c:choose>
									<c:when test="${vo.eduPgmJoingSuprtYn=='Y' }">
										<label class="btn-lg btn-default btn-block"> <input
											name="eduPgmJoingSuprtYn" type="checkbox" checked="checked"
											value="Y">교육프로그램지원 여부
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn-lg btn-default btn-block"> <input
											name="eduPgmJoingSuprtYn" type="checkbox" value="Y">교육프로그램지원
											여부
										</label>
									</c:otherwise>
								</c:choose>

							</div>
							<div class="form-group">
								<label for="inputlg"> ▣ 기타 지원 내역 </label>
							


								<input class="form-control input-lg" id="suprtFvrText"
									name="suprtFvrText" type="text" value="${vo.suprtFvrText }">
							</div>


							<p class="lead">온라인 지원</p>
							<div class="checkbox">
								<c:choose>
									<c:when test="${vo.onlineSuprtYn=='Y' }">
										<label class="btn-lg btn-default btn-block"> <input
											type="checkbox" name="onlineSuprtYn" checked="checked"
											value="Y">온라인 지원 신청
										</label>
									</c:when>
									<c:otherwise>
										<label class="btn-lg btn-default btn-block"> <input
											type="checkbox" name="onlineSuprtYn" value="Y">온라인 지원
											신청
										</label>
									</c:otherwise>
								</c:choose>

							</div>

							<button type="submit" class="btn btn-primary web-volunteer">모집공고
								수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/search.js"></script>
</body>
</html>