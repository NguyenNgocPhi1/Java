<%-- 
    Document   : logout
    Created on : Sep 21, 2023, 1:24:59 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.user!=null}">
    <c:remove var="user" scope="session" />
    <c:redirect url="login.jsp" />
</c:if>