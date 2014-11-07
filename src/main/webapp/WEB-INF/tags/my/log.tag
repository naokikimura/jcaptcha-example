<%@ tag pageEncoding="UTF-8" body-content="scriptless" %>
<jsp:doBody var="message" />
<%
    application.log(jspContext.findAttribute("message").toString());
%>
