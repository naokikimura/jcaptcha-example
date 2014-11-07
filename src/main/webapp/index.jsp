<!DOCTYPE HTML>
<%@ page contentType="text/html" pageEncoding="UTF-8" import="com.octo.captcha.module.servlet.image.SimpleImageCaptchaServlet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags/my" %>
<%@ taglib prefix="captcha" tagdir="/WEB-INF/tags/captcha" %>
<fmt:setLocale value="${pageContext.request.locale.language}" />
<html lang="${pageContext.request.locale.language}">
<head>
  <meta charset="UTF-8">
  <title><fmt:message key="index.title" /></title>
</head>
<c:set var="captchaPassed"><captcha:validate value="${param.captcha}" /></c:set>
<c:if test="${fn:toUpperCase(pageContext.request.method) == 'POST'}" var="isPost" />
<body>
  <h1><fmt:message key="index.title" /></h1>
  <c:if test="${isPost}">
  <p><fmt:message key="index.result" />: <fmt:message key="index.${captchaPassed ? 'pass' : 'failure'}" /></p>
    <my:log>captcha = { response:'${param.captcha}', validate: ${captchaPassed} }</my:log>
  </c:if>
  <c:if test="${!isPost || !captchaPassed}">
    <form action="" method="post">
      <img src="captcha.jpg" alt="captcha" />
      <input type="text" name="captcha" />
      <input type="submit" />
    </form>
  </c:if>
  <a href="."><fmt:message key="index.retry" /></a>
</body>
</html>
