<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%@include file="dbcon.jsp" %>
    <%@include file="top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');
h3{font-family:'Nanum Gothic', 돋움; text-align: center; color:#DB7521;}
a {text-decoration-line:none; color:#DB7521;}
.table, tr, td{font-family:'Nanum Gothic', 돋움; margin-left:auto; margin-right:auto; text-align: center; vertical-align: center; color:#DB7521;}
tr.colored:nth-child(even){
  background-color:#F2D5BF;
  color:#000000;
}
tr.colored:nth-child(odd){
  background-color:#DBCCC0;
  color:#000000;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<h3>도서 현황</h3>
<table width="500" align="center" >
	<tr>
		<th>일련번호</th> <th>도서제목</th> <th>저자</th> <th>출판사</th>
		<th>가격</th> <th>표지</th> <th>비고</th>
	</tr>
	<tr>
		<td colspan="7" style="font-size:0.5em;">저자 혹은 제목을 클릭하면 도서의 상세정보를 열람 가능합니다.</td>
	</tr>
	
	<%
String sql = "select * from book";
pstmt = con.prepareStatement(sql);
res = pstmt.executeQuery();
while(res.next())
{
	String no = res.getString(1);
	String name = res.getString(2);
	String wrt = res.getString(3);
	String com = res.getString(4);
	int price = res.getInt(5);
	String cover = res.getString(6);
	%>
	
	<tr class="colored">
		<td><%=no %></td>
		<td><a href="namede.jsp?no=<%=no%>"><%=name %></a></td>
		<td><a href="wrtde.jsp?no=<%=no%>"><%=wrt %></a></td>
		<td><%=com %></td> <td><%=price %></td> <td><%=cover %></td>	
		<td><a href = "up.jsp?no=<%=no %>">수정</a> &nbsp; 
		<a href = "del.jsp?no=<%=no %>">삭제 </a></td>
	</tr>
	
<%} %>

</table>
</body>
<jsp:include page="footer.jsp" />
</html>