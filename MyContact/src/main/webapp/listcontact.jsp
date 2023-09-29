<%-- 
    Document   : list
    Created on : Sep 12, 2023, 3:45:16 PM
    Author     : KHOACNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="common/header.jsp" />

<jsp:include page="common/nav.jsp" />
<jsp:useBean id="dao" class="dao.ContactDAO" />
<c:if test="${param.btsearch != null}">
    <c:set var="kq" value="${dao.search(param.txtname)}" />
</c:if>
<c:if test="${param.btsearch == null}">
    <c:set var="kq" value="${dao.readAll()}" />
</c:if>
<div class="container mt-4" id="main-content">
            <div class="row">
                <div class="col-md-6">
                    <form <form action="listcontact.jsp" method="post">
                        <div class="row">
                        <div class="col-md-8"> 
                            <input class="form-control" type="search" name="txtname" placeholder="Search by name ..." />
                        </div>
                        <div class="col-md-4">
                            <button class="btn btn-primary" type="submit" name="btsearch">
                                <i class="fa fa-search"></i> Search
                            </button>
                        </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-6 text-end">
                    <a href="addcontact.jsp" class="btn btn-success float-right">
                        <i class="fa fa-plus-square"></i> New contact
                    </a>
                </div>
            </div>
             
            <div class="row mt-4">
                <c:if test="${requestScope.success != null}">
                    <div class="alert alert-success mt-2 mb-2">
                        <h5>${requestScope.success}</h5>
                    </div>
                </c:if>
                <c:if test="${requestScope.error != null}">
                    <div class="alert alert-danger mt-2 mb-2">
                        <h5>${requestScope.error}</h5>
                    </div>
                </c:if>
                <div class="table-responsive">
                    <h5>List of contacts</h5>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="x" items="${kq}">
                            <tr>
                                <th scope="row">${x.id}</th>
                                <td>${x.name}</td>
                                <td>${x.email}</td>
                                <td>${x.phone}</td>
                                <td>
                                    <a href="editcontact.jsp?id=${x.id}" class="mr-sm-2 text-primary"><i class="fa fa-pencil"></i></a>
                                    <a href="deletecontact.jsp?id=${x.id}" onclick="return confirm('Are you sure to deleted ?') " class="text-danger"><i class="fa fa-trash"></i></a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div><!-- /.container -->



  <jsp:include page="common/footer.jsp" />