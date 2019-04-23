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

import dao.TaskRepository;
import dao.UserRepository;
import model.Task;
import model.User;
import util.AppUtils;

@WebServlet("/task/*")
public class TaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TaskRepository TaskRepository;
    private UserRepository userRepository;

    public void init() {
        TaskRepository = new TaskRepository();
        userRepository = new UserRepository();
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
                case "/task/insert":
                    insertTask(request, response);
                    break;
                case "/task/delete":
                    deleteTask(request, response);
                    break;
                case "/task/edit":
                    showEditForm(request, response);
                    break;
                case "/task/update":
                    updateTask(request, response);
                    break;
                case "/task/manager":
                    listTask(request, response);
                    break;
                case "/task/developer":
                    listUserTasks(request, response);
                    break;
                case "/task/retrieve/priority":
                    listUserTasksByPriority(request, response);
                    break;

                case "/task/retrieve/team":
                    listUserTasksByTeam(request, response);
                    break;
                default:
                    listTask(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Task> listTask = TaskRepository.getAllTask();

        for(Task t : listTask){
            t.print();
        }
        request.setAttribute("listTask", listTask);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("task-list.jsp");
//		dispatcher.forward(request, response);
    }
    private void listUserTasks(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        User user = AppUtils.getLoginedUser(request.getSession());
        List<Task> listTask = TaskRepository.getTasks(user.getId());
        request.setAttribute("listTask", listTask);
        String teamName = TaskRepository.getTeamName(user.getTeamId());
        request.setAttribute("teamName", teamName);
        request.setAttribute("user", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/developer.jsp");
		dispatcher.forward(request, response);
    }

    private void listUserTasksByPriority(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String priority = request.getParameter("priority");
        List<Task> listTask = TaskRepository.getTasksByPriority(priority);
        request.setAttribute("listTask", listTask);

//		RequestDispatcher dispatcher = request.getRequestDispatcher("task-list.jsp");
//		dispatcher.forward(request, response);
    }


    private void listUserTasksByTeam(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Task> listTask = TaskRepository.getTasksByTeamId(id);
        request.setAttribute("listTask", listTask);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("task-list.jsp");
//		dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Task existingTask = TaskRepository.getTask(id);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("task-form.jsp");
//		request.setAttribute("task", existingTask);
//		dispatcher.forward(request, response);

    }

    private void insertTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String priority = request.getParameter("priority");
        LocalDateTime startDate = LocalDateTime.parse(request.getParameter("startDate"));
        LocalDateTime endDate = LocalDateTime.parse(request.getParameter("endDate"));
        String status = request.getParameter("status");
        int devId = Integer.parseInt(request.getParameter("dev_id"));

        Task newTask = new Task(name, priority,startDate,endDate,status, devId);
        TaskRepository.saveTask(newTask);

//		response.sendRedirect("list");
    }

    private void updateTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String priority = request.getParameter("priority");

        LocalDateTime startDate = LocalDateTime.parse(request.getParameter("startDate"));
        LocalDateTime endDate = LocalDateTime.parse(request.getParameter("endDate"));

        String status = request.getParameter("status");
        int devId = Integer.parseInt(request.getParameter("dev_id"));
        Task newTask = new Task(id,name, priority,startDate,endDate,status, devId);
        TaskRepository.updateTask(newTask);

//		response.sendRedirect("list");
    }

    private void deleteTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        TaskRepository.deleteTask(id);
//		response.sendRedirect("list");
    }
}