package servlets;

import entity.Author;
import entity.Book;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import session.AuthorFacade;
import session.BookFacade;

@WebServlet(name = "BookServlet", urlPatterns = {
    "/BookServlet", "/addBook", "/addAuthor", "/books", "/createBook",
    "/createAuthor"
})
public class BookServlet extends HttpServlet {
    
    @EJB private AuthorFacade authorFacade;
    @EJB private BookFacade bookFacade;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String path = request.getServletPath();
        switch (path) {
            case "/addBook":
                request.setAttribute("authors", authorFacade.findAll());
                request.getRequestDispatcher("WEB-INF/createBook.jsp").forward(request, response);
                break;
            case "/createBook":
                String title = request.getParameter("title");
                String[] authors = request.getParameterValues("authors");
                List<Author> authorList = new ArrayList<>();
                for (int i = 0; i < authors.length; i++) {
                    authorList.add(authorFacade.find(Long.parseLong(authors[i])));
                }
                Book book = new Book();
                book.setTitle(title);
                book.setAuthors(authorList);
                for (int i = 0; i < authorList.size(); i++) {
                    Author author = authorList.get(i);
                    author.getBooks().add(book);
                    authorFacade.edit(author);
                }
                bookFacade.create(book);
                request.setAttribute("bookList", bookFacade.findAll());
                request.setAttribute("success", "Book has been successfully created!");
                request.getRequestDispatcher("WEB-INF/createBook.jsp").forward(request, response);
                break;
            case "/addAuthor":
                request.getRequestDispatcher("WEB-INF/createAuthor.jsp").forward(request, response);
                break;
            case "/createAuthor":
                String name = request.getParameter("name");
                String lastname = request.getParameter("lastname");
                Author author = new Author();
                author.setFirstname(name);
                author.setLastname(lastname);
                authorFacade.create(author);
                request.setAttribute("success", "Author has been successfully created!");
                request.getRequestDispatcher("WEB-INF/createAuthor.jsp").forward(request, response);
                break;
            case "/books":
                request.setAttribute("books", bookFacade.findAll());
                request.getRequestDispatcher("WEB-INF/books.jsp").forward(request, response);
                break;
            case "/BookServlet":
                break;
            default:
                throw new AssertionError();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
