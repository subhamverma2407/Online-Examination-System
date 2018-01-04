import java.io.IOException;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

/**
 * Servlet implementation class studlogin
 */
@WebServlet("/studlogin")
public class studlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public studlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
		String uid=request.getParameter("uid");
		String pass=request.getParameter("pass");
		if(uid.equals(pass))
		{
			RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
			rd.forward(request,response);
		}
		else
		{
			pw.print("<script>alert('Wrong Id or Password');</script>");
			RequestDispatcher rd=request.getRequestDispatcher("studentpanel.jsp");
			rd.include(request,response);
		}
	}
}
