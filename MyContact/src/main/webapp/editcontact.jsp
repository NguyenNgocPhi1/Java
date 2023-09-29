<%-- 
    Document   : addcontact
    Created on : Sep 12, 2023, 3:54:16 PM
    Author     : KHOACNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<jsp:include page="common/header.jsp" />
<jsp:include page="common/nav.jsp" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="dao.ContactDAO" />
<c:if test="${param.id != null}">
    <c:set var="contactid" value="${dao.findById(param.id)}" />
</c:if>
<c:if test="${param.btedit != null}">
    <jsp:useBean id="objcontact" class="dto.Contact" />
    <jsp:setProperty name="objcontact" property="*" />
    <c:set var="kq" value="${dao.update(objcontact)}" />
    <c:if test="${kq > 0}">
        <c:set var="success" value="Contact updated success" scope="request" />
    </c:if>
    <c:if test="${kq == 0}">
        <c:set var="error" value="Contact updated error" scope="request" />
    </c:if>
    <jsp:forward page="listcontact.jsp" />
</c:if>
   
  <div class="container mt-4" id="main-content">
      <div class="row justify-content-center">
          <form action="editcontact.jsp" method="post" style="min-width: 300px;">
          <h5 class="text-center">Edit Contact</h5>
          <input type="hidden" name="id" value="${contactid.id}" />
          <div class="mb-3">
             <label class="form-label">Name</label>
             <input class="form-control" type="text" name="name" value="${contactid.name}" placeholder="Contact name..." />
          </div>

          <div class="mb-3">
              <label class="form-label">Email</label>
              <input class="form-control" type="email" name="email" value="${contactid.email}" placeholder="Contact email..." />
          </div>

          <div class="mb-3">
             <label class="form-label">Phone</label>
             <input class="form-control" type="text" name="phone" value="${contactid.phone}" placeholder="Contact phone..." />
          </div>

          <div class="mb-3">
              <button type="submit" class="btn btn-block btn-primary" name="btedit">
              <i class="fa fa-save"></i> Update
            </button>
          </div>
        </form>
      </div>
    </div>    



<jsp:include page="common/footer.jsp" />
