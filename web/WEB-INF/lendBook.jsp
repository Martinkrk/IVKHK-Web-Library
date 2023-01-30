<%-- 
    Document   : lendBook
    Created on : Jan 30, 2023, 10:24:56 AM
    Author     : pupil
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lend a book to a reader</h1>
        <form action="createHistory" method="POST">
            <p>Reader list:</p>
            <p>
            <select name="readerId">
                <c:forEach var="reader" items="${readers}">
                    <option value="${reader.id}">
                        ${reader.firstname} ${reader.lastname}
                    </option>
                </c:forEach>
            </select>
            </p>
            <p>
                <select name="bookId">
                    <c:forEach var="book" items="${books}">
                        <option value="${book.id}">
                            ${book.title}
                            <p>Authors:</p>
                            <c:forEach var="author" items="${book.authors}">
                                <p>${author.firstname} ${author.lastname}</p>
                            </c:forEach>
                        </option>
                    </c:forEach>
                </select>
            </p>
            <input type="submit" value="Lend!">
        </form>
    </body>
</html>
