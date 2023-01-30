<%-- 
    Document   : readers
    Created on : Jan 30, 2023, 9:12:39 AM
    Author     : pupil
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Library - Readers list</title>
    </head>
    <body>
        <h1>Readers:</h1>
        <ol>
            <c:forEach var="reader" items="${readers}">
                <li>
                    ${reader.firstname} ${reader.lastname}. Phone: ${reader.phone}<br>
                </li>
            </c:forEach>
        </ol>
    </body>
</html>
