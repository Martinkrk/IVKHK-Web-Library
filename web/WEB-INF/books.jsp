<%-- 
    Document   : books
    Created on : Jan 26, 2023, 3:07:38 PM
    Author     : pupil
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Library - Books list</title>
    </head>
    <body>
        <h1>Books in library:</h1>
        <ol>
            <c:forEach var="book" items="${bookList}">
                <li>
                    ${book.title}<br>
                    authors: <br>
                    <c:forEach var="author" items="${authorList}">
                        ${author.firstname} ${author.lastname}<br>
                    </c:forEach>
                </li>
            </c:forEach>
        </ol>
    </body>
</html>
