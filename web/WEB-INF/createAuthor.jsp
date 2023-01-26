<%-- 
    Document   : createAuthor
    Created on : Jan 26, 2023, 2:11:51 PM
    Author     : pupil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <h1>Add an author</h1>
        <p>${success}</p>
        <form action="createAuthor" method="POST">
            <label for="name">Author's name</label>
            <input type="text" id="name" name="name" required><br>
            <label for="lastname">Author's last name</label>
            <input type="text" id="lastname" name="" required><br>
            <input type="submit" value="+Add">
        </form>