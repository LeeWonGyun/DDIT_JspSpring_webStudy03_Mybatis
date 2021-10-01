<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp"></jsp:include>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>일련번호</th>
			<th>상품명</th>
			<th>분류명</th>
			<th>거래처명</th>
			<th>구매가</th>
			<th>마일리지</th>
		</tr>
	</thead>
	<tbody>
		<%
			PagingVO<ProdVO> pagingVO = (PagingVO) request.getAttribute("pagingVO");
			List<ProdVO> prodList = pagingVO.getDataList();
			if(!prodList.isEmpty()){
				for(ProdVO prod:prodList){
		%>
		<tr>
					<td><%=prod.getRnum() %></td>
					<td><%=prod.getProdName() %></td>
					<td><%=prod.getLprodNm() %></td>
					<td><%=prod.getBuyerName() %></td>
					<td><%=prod.getProdCost() %></td>
					<td><%=prod.getProdMileage() %></td>
		</tr>
		<%
				}
			}else{
				%>
					<tr>
						<td colspan="6">상품 없음</td>
					</tr>
				<%
			}
		%>
	</tbody>
	<tfoot>
		<tr>
			<td colspan = "6">
				<div id="pagingArea">
					<%=pagingVO.getPagingHTML() %>
				</div>
				<div id="searchUI">
					<select name = "searchType">
						<option value>전체</option>
						<option value = "name">상품명</option>
						<option value = "buyer">분류명</option>
						<option value = "lprod">거래처명</option>
					</select>
					<input type = "text" name = "searchWord"/>
					<input type = "button" value ="검색" id="searchBtn"/>
				</div>	
			</td>
		</tr>
	</tfoot>
</table>
<form id="searchForm">
	<input type="hidden" name="page" />
	<input type="hidden" name="searchType"/>
	<input type="hidden" name="searchWord"/>
</form>
<script type="text/javascript">
	$("[name='searchType']").val("${pagingVO.searchVO.searchType}");
	$("[name='searchWord']").val("${pagingVO.searchVO.searchWord}");
	
	let searchUI = $("#searchUI");
	let searchForm = $("#searchForm");
	let searchBtn = $("#searchBtn").on("click",function(){
		searchUI.find(":input[name]").each(function(idx, input){
			let name = input.name;
			let value = $(input).val();
			let form = searchForm.get(0);
			form[name].value = value;
		});
		searchForm.submit();
	});
	let pagingArea = $("#pagingArea").on("click","a",function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(!page) return false;
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
		return false;
	});
</script>
</body>
</html>
