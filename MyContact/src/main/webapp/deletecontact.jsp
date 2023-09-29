<%-- 
    Document   : delete.jsp
    Created on : Sep 15, 2023, 4:03:47 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.ContactDAO" />

<c:if test="${param.id != null}">
    <c:set  var="kq" value="${dao.delete(param.id)}"/>
    <c:if test="${kq > 0}">
        <c:set var="success" value="Contact deleted success" scope="request" />
        <jsp:forward page="listcontact.jsp" />
    </c:if>
    
</c:if>