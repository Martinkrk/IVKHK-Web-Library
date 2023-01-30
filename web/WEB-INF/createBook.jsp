<%-- 
    Document   : createBook
    Created on : Jan 26, 2023, 2:48:27 PM
    Author     : pupil
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1>Add a book</h1>
        <p>${success}</p>
        <form action="createBook" method="POST">
            <label for="title">Book's title</label>
            <input type="text" id="title" name="title" required>
            <br>
            <label for="authors">Authors</label>
            <select type="text" id="authors" name="authors" multiple="true">
                <c:forEach var="author" items="${authors}">
                    <option value="${author.id}" name="">
                        ${author.firstname} ${author.lastname}
                    </option>
                </c:forEach>
            </select>
            <br>
            <input type="submit" value="+Add">
        </form>
