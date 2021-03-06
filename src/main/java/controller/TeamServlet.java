package controller;


import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import dao.TeamRepository;
import dao.UserRepository;
import model.Team;
import model.User;

@WebServlet(urlPatterns = {"/team", "/team/*"})
public class TeamServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;
    private TeamRepository TeamRepository;
    private dao.UserRepository UserRepository;

    public void init() {
        TeamRepository = new TeamRepository();
        UserRepository = new UserRepository();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getRequestURI();
        try {
            switch (action) {
                case "/team/insert":
                    insertTeam(request, response);
                    break;
                case "/team/delete":
                    deleteTeam(request, response);
                    break;
                case "/team/edit":
                    showEditForm(request, response);
                    break;
                case "/team/update":
                    updateTeam(request, response);
                    break;
                default:
                    listTeam(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listTeam(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        List<Team> listTeam = TeamRepository.getAllTeam();
        if(listTeam!=null){
            request.setAttribute("listTeam", listTeam);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/team.jsp");
		dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
       if(request.getParameter("id")!=null){
            int id = Integer.parseInt(request.getParameter("id"));
            Team existingTeam = TeamRepository.getTeam(id);
//            request.setAttribute("team", existingTeam);
           String json = new Gson().toJson(existingTeam);
           response.setContentType("application/json");
           response.setCharacterEncoding("UTF-8");
           response.getWriter().write(json);
        }
//		RequestDispatcher dispatcher = request.getRequestDispatcher("team-form.jsp");
//		request.setAttribute("team", existingTeam);
//		dispatcher.forward(request, response);

    }

    private void insertTeam(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        Team newTeam = new Team(name);
        TeamRepository.saveTeam(newTeam);
//		response.sendRedirect("list");
        request.getRequestDispatcher("WEB-INF/team.jsp").forward(request, response);
    }

    private void updateTeam(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        if(request.getParameter("editId")!=null){
            System.out.println("TEAM ID :" +request.getParameter("editId")+":------");
            int id = Integer.parseInt(request.getParameter("editId"));
            String name = request.getParameter("editName");
            Team newTeam = new Team(id,name);
            TeamRepository.updateTeam(newTeam);
            request.getRequestDispatcher("WEB-INF/team.jsp").forward(request, response);
        }

//		response.sendRedirect("list");
    }

    private void deleteTeam(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        TeamRepository.deleteTeam(id);
//		response.sendRedirect("list");
    }
}
