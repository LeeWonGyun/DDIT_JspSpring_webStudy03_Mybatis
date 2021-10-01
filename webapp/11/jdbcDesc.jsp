<%@page import="kr.or.ddit.mybatis.ConnectionFactory"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.DBVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11/jdbcDesc.jsp</title>
</head>
<body>
<h4>JDBC(Java DataBase Connectivity)</h4>
<pre>
	1. 벤더가 제공하는 드라이버를 빌드패스에 추가
	2. 드라이버 로딩
	<%
		Object obj = new Object();
		
		List<DBVO> dataList = new ArrayList<>();
		String[] headers = null;
		try(
			Connection conn = ConnectionFactory.getConnection();
			Statement stmt = conn.createStatement();
		){
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT PROPERTY_NAME, PROPERTY_VALUE, DESCRIPTION");
			sql.append(" FROM DATABASE_PROPERTIES ");
			ResultSet rs = stmt.executeQuery(sql.toString());
			ResultSetMetaData rsmd = rs.getMetaData();
			int colCnt = rsmd.getColumnCount();
			headers = new String[colCnt];
			
			for(int i=1; i<=colCnt; i++){
				headers[i-1] = rsmd.getColumnName(i);
			}
			
			while(rs.next()){
				DBVO vo = new DBVO();
				dataList.add(vo);
				vo.setPropertyName(rs.getString("PROPERTY_NAME"));
				vo.setPropertyValue(rs.getString("PROPERTY_VALUE"));
				vo.setDescription(rs.getString("DESCRIPTION"));
			}
		}catch(SQLException e){
			
		}
	%>
	4. 쿼리 객체 생성
		1)Statement : 동적 쿼리 생성에 활용.
		2)PreparedStatement(선컴파일된 쿼리 객체)
		3)CallableStatement(프로시저나 함수를 호출하는 쿼리 객체)
	5. 질의 수행(SQL)
		1)ResultSet executeQuery : SELECT
		2)int(rowcnt) executeUpdate : INSERT/UPDATE/DELETE
	6. 질의 수행 결과 사용
	7. release(close)
</pre>
<table>
	<thead>
		<tr>
			<%
				for(String header : headers){
					%>
					<th><%=header %></th>
					<%
				}
			%>
		</tr>
	</thead>
	<tbody>
		<%
			for(DBVO tmp : dataList){
				%>
				<tr>
					<td><%=tmp.getPropertyName() %></td>
					<td><%=tmp.getPropertyValue() %></td>
					<td><%=tmp.getDescription() %></td>
				</tr>
				<%
			}
		%>
	</tbody>
</table>
</body>
</html>









