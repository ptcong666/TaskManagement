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

import dao.TeamRepository;
import model.Team;

@WebServlet("/team/*")
public class TeamServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;
    private TeamRepository TeamRepository;

    public void init() {
        TeamRepository = new TeamRepository();
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

        request.setAttribute("listTeam", listTeam);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/team.jsp");
		dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Team existingTeam = TeamRepository.getTeam(id);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("team-form.jsp");
//		request.setAttribute("team", existingTeam);
//		dispatcher.forward(request, response);

    }

    private void insertTeam(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        Team newTeam = new Team(name);
        TeamRepository.saveTeam(newTeam);
//		response.sendRedirect("list");
    }

    private void updateTeam(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");

        Team newTeam = new Team(id,name);
        TeamRepository.updateTeam(newTeam);

//		response.sendRedirect("list");
    }

    private void deleteTeam(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        TeamRepository.deleteTeam(id);
//		response.sendRedirect("list");
    }
}
