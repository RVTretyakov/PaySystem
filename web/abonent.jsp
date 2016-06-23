<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ru.home.dao.Service" %>
<%@ page import="ru.home.utils.DbHelper" %>
<%@ page import="ru.home.dao.Abonent" %><%--
  Created by IntelliJ IDEA.
  User: ivan
  Date: 23.06.16
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payments</title>
</head>
<body>
    <%  Service service = DbHelper.getEm().find(Service.class,Integer.parseInt(request.getParameter("serviceId")));
        Abonent abonent = DbHelper.getEm().find(Abonent.class,Integer.parseInt(request.getParameter("abonentId")));
        pageContext.setAttribute("charges",abonent.getChargesByAbonentId(),PageContext.PAGE_SCOPE);
    %>
    Договор номер <%=abonent.getAbonentId()%> на предоставление услуги "<%=service.getServiceName()%>"
    <h1>Начисления</h1>
    <table>
        <tr>
            <th>Номер договора</th>
            <th>Лицевой счёт</th>

        </tr>
    </table>
    <c:forEach items="${charges}" var="charge" varStatus="status">

        <table>
            <tr>
                <td>${charge.chargeId}</td>
                <td>${charge.chargeAmount}</td>
                <td>${charge.periodBeginDate}</td>
                <td>${charge.periodEndDate}</td>
                <c:if test="${charge.chargePaid == 'true'}">
                    <td>
                        <a href="${pageContext.servletContext.contextPath}/abonent.jsp?serviceId=">Печать</a>
                    </td>
                </c:if>
                <c:if test="${charge.chargePaid == 'false'}">
                    <td>
                        Не оплачено
                    </td>
                </c:if>
            </tr>
        </table>
    </c:forEach>


</body>
</html>
