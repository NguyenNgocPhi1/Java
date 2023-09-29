<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">MyContact App</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collaps navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="listcontact.jsp" >Home</a>
                </li>
            </ul>
            <ul class="navbar-nav w-100 justify-content-end">
                <li class="nav-item">
                    <c:if test="${sessionScope.user!=null}">
                        <a class="nav-link" href="logout.jsp">Welcome :${sessionScope.user.email} - Logout</a>
                    </c:if>
                    <c:if test="${sessionScope.user==null}">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </c:if>
                </li>
            </ul>
        </div>
    </div>
</nav>
<c:if test="${sessionScope.user==null}">
    <jsp:forward page="../login.jsp" />
</c:if>