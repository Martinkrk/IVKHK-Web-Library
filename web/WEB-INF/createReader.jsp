<%-- 
    Document   : createReader
    Created on : Jan 30, 2023, 9:06:38 AM
    Author     : pupil
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1>Add a book</h1>
        <p>${success}</p>
        <form action="createReader" method="POST">
            <label for="firstname">Reader's firstname</label>
            <input type="text" id="firstname" name="firstname" required>
            <br>
            <label for="lastname">Reader's lastname</label>
            <input type="text" id="lastname" name="lastname" required>
            <br>
            <label for="phone">Reader's phone number</label>
            <input type="text" id="phone" name="phone" required>
            <br>
            <input type="submit" value="+Add">
        </form>
