<%-- 
    Document   : login
    Created on : Sep 21, 2023, 1:09:03 PM
    Author     : PC
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:include page="common/header.jsp" />
<jsp:useBean id="dao" class="dao.UserDAO" />
<c:if test="${param.btlogin!=null}">
    <c:set var="user" value="${dao.checkLogin(param.username, param.password)}" scope="session" />
    
    <c:if test="${user!=null}">
        <c:redirect url="listcontact.jsp" />
    </c:if>
    <c:if test="${user==null}">
        <c:set var="error" value="Login failed for username or password not correct" />
    </c:if>
</c:if>
   
  <div class="container mt-4" id="main-content">
      <div class="row justify-content-center">
          <form style="min-width: 300px;" action="login.jsp" method="post">
          <h5 class="text-center">Login Form</h5>

          <div class="mb-3">
             <label class="form-label">Username</label>
             <input class="form-control" type="text" name="username" placeholder="Contact username..." />
          </div>

          <div class="mb-3">
              <label class="form-label">Password</label>
              <input class="form-control" type="password" name="password" placeholder="Contact password..." />
          </div>

        

          <div class="mb-3">
              <button type="submit" class="btn btn-block btn-primary" name="btlogin">
                <i class="fa fa-save"></i> Login
            </button>
          </div>
          <div class="mb-3">
              <button type="submit" class="btn btn-block btn-secondary" name="btreset">
                Reset
            </button>
          </div>
        </form>
          <c:if test="${error!=null}">
              <h4>
                  ${error}
              </h4>
          </c:if>
      </div>
    </div>    



<jsp:include page="common/footer.jsp" />

