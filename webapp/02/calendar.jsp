<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int day = cal.get(Calendar.DAY_OF_MONTH);
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int min = cal.get(Calendar.MINUTE);
	int sec = cal.get(Calendar.SECOND);
	int ap = cal.get(Calendar.AM_PM);
	String apStr = "";
	if(ap==1){
		apStr = "오후";
	}else{
		apStr = "오전";
	}

	System.out.println("현재 시각은 " + year + "년도 " + month + "월 " + day + "일 " + hour + "시 " + min + "분 " + sec + "초입니다.");
	
	int[] MAX_DAYS = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	if((year%4==0 && year%100!=0)||(year%400==0)) //윤년 => 2월 29일
		MAX_DAYS[1]=29;
    else
    	MAX_DAYS[1]=28;

	int total=(year-1)*365
            +(year-1)/4
            -(year-1)/100
            +(year-1)/400;
	for(int i=0;i<month-1;i++)
    {
        total+=MAX_DAYS[i];
    }
    //1일자의 요일
    total++;
    
    int week=total%7;
    
    String inputYear = request.getParameter("yearName");
	String inputMonth = request.getParameter("monthName");
	
	int int_year = year;
	int int_month = month;

	if(inputYear!=null && inputMonth!=null){
		int_year = Integer.parseInt(inputYear); 
		int_month = Integer.parseInt(inputMonth);
		
		total=(int_year-1)*365
	            +(int_year-1)/4
	            -(int_year-1)/100
	            +(int_year-1)/400;
		for(int i=0;i<int_month-1;i++)
	    {
	        total+=MAX_DAYS[i];
	    }
	    //1일자의 요일
	    total++;
	    
	    week=total%7;
	}
	
	String sub_pre = request.getParameter("pre");
	if(sub_pre != null){
		int int_sub_pre = Integer.parseInt(sub_pre); 
		int_month = int_sub_pre;
		if(int_month == 0){
			int_month = 12;
			int_year = year-1;
		}
		total=(int_year-1)*365
	            +(int_year-1)/4
	            -(int_year-1)/100
	            +(int_year-1)/400;
		for(int i=0;i<int_month-1;i++)
	    {
	        total+=MAX_DAYS[i];
	    }
	    //1일자의 요일
	    total++;
	    
	    week=total%7;
	}
	String sub_next = request.getParameter("next");
	if(sub_next != null){
		int int_sub_next = Integer.parseInt(sub_next); 
		int_month = int_sub_next;
		if(int_month == 13){
			int_month = 1;
			int_year = year+1;
		}
		total=(int_year-1)*365
	            +(int_year-1)/4
	            -(int_year-1)/100
	            +(int_year-1)/400;
		for(int i=0;i<int_month-1;i++)
	    {
	        total+=MAX_DAYS[i];
	    }
	    //1일자의 요일
	    total++;
	    
	    week=total%7;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
현재시간 <%=apStr %> <%=hour %> : <%=min %> : <%= sec %>
<hr>
	
	<table border=1 width="500"; height="50">
		<%=int_year%>년 <%=int_month%>월	
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<form><input type="submit" value="이전 달">
		<input type="hidden" name="pre" value="<%=int_month-1%>"/></form>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<form><input type="submit"  value="다음 달">
		<input type="hidden" name="next" value="<%=int_month+1%>"/></form>
		<tr>
			<td>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
		<tr>
		<%	
			for(int i=1; i<=MAX_DAYS[int_month-1]; i++){
		%>	
		<% 
				if(i==1){
					for(int j=0; j<week; j++){
		%>
						<td></td>
		<% 			}
				}
		%>		
				<td><%=String.format("%2d",i)%></td>
		<%		week++;
				if(week>6){
					week=0;
		%>				
					</tr>
		<% 
				}
			}
		%>
		
	</table>
	
	<form>
	연도 입력<input type="text" id="yearId" name="yearName" value="<%=int_year%>"/>
	월 입력<input type="text" id="monthId" name="monthName" value="<%=int_month%>"/>
	<input type="submit" value="조회"/>
	</form>
	
</body>
</html>
