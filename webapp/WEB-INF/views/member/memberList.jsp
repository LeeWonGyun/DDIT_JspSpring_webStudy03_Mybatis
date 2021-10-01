<%@page import="java.util.Objects"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.PagingVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page = "/includee/preScript.jsp"/>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>회원아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>이메일</th>
			<th>주소(상위주소만)</th>
			<th>마일리지</th>
		</tr>
	</thead>
	<tbody id="listBody">

	</tbody>
	<tfoot>
		<tr>
			<td colspan = "6">
				<div id = "pagingArea">

				</div>
				<div id = "searchUI">
					<select name = "searchType">
						<option value>전체</option>
						<option value = "name">이름</option>
						<option value = "address">지역</option>
					</select>
					<input type = "text" name = "searchWord"/>
					<input type = "button" value = "검색" id = "searchBtn"/>
				</div>
			</td>
		</tr>
	</tfoot>
</table>

<form id="searchForm">
	<input type = "text" name = "searchType" />
	<input type = "text" name = "searchWord" />
	<input type = "text" name = "page"/>
</form>
<script type="text/javascript">
	let searchUI = $("#searchUI");
	let listBody = $("#listBody").on("click","tr",function(){
		let member = $(this).data("member");
		if(!member) return false;
		let memId = member.memId;
		location.href="<%=request.getContextPath()%>/member/memberView.do?who="+memId;
	});
		
	let searchForm = $("#searchForm").ajaxForm({
		dataType:"json",
		success:function(resp){
// 			console.log(resp);
			listBody.empty();
			pagingArea.empty();
			searchForm.find("[name='page']").val("");
			let memberList = resp.dataList;
			let pagingHTML = resp.pagingHTML;
			let trTags = [];
			if(memberList){
				$.each(memberList, function(idx, member){
					let trTag = $("<tr>").append(
						$("<td>").text(member.memId),
						$("<td>").text(member.memName),
						$("<td>").text(member.memHp),
						$("<td>").text(member.memAdd1),
						$("<td>").text(member.memMail),
						$("<td>").text(member.memMileage)
					).data("member",member)
					.css("cursor",pointer);
					trTags.push(trTag);
				});
			}else{
				let trTag = $("<tr>").html(
								$("<td>").attr({
									colspan:"6"
								}).text("조건에 맞는 표현이 없음")
							);
				trTags.push(trTag);
			}
			
			listBody.append(trTags);
			pagingArea.html(pagingHTML);
		},
		error:function(xhr, jQuery, error){
			console.log(jQuery);
			console.log(error);
		}
	}).submit();
	
	$("#searchBtn").on("click", function(){
		searchUI.find(":input[name]").each(function(idx, input){
			let value = $(input).val();
			let formInput = searchForm.find("[name='" + input.name + "']");
			$(formInput).val(value);
			
		});
		searchForm.submit();
	});
	
	let pagingArea = $("#pagingArea").on("click", "a", function(){
		event.preventDefault();
		let page = $(this).data("page");
		if(!page) return false;
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
	});
</script>
</body>
</html>