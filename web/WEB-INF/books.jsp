<%-- 
    Document   : books
    Created on : Jan 26, 2023, 3:07:38 PM
    Author     : pupil
--%>

        <h1>Books in library:</h1>
        <ol>
            <c:forEach var="book" items="${books}">
                <li>
                    ${book.title}<br>
                    authors: <br>
                    <c:forEach var="author" items="${book.authors}">
                        ${author.firstname} ${author.lastname}<br>
                    </c:forEach>
                </li>
            </c:forEach>
        </ol>