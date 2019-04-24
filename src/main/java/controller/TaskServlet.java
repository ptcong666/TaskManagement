package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import dao.TaskRepository;
import dao.UserRepository;
import model.Task;
import model.User;
import model.Team;
import util.AppUtils;

@WebServlet(urlPatterns = {"/task", "/task/*"})
public class TaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TaskRepository TaskRepository;
    private UserRepository UserRepository;

    public void init() {
        TaskRepository = new TaskRepository();
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
                case "/task/retrieve":
                    retrieveTask(request, response);
                    break;
                case "/task/complete":
                    completeTask(request,response);
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
        List<Team> team = TaskRepository.getTeamsByTask(listTask);
        request.setAttribute("teams", team);
        request.setAttribute("listTask", listTask);
        List<User> listUser = UserRepository.getAllUser();
        List<User> developerUser = UserServlet.filterDeveloper(listUser);
        request.setAttribute("listDevelopers", developerUser);
        System.out.println(developerUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/tasks.jsp");
		dispatcher.forward(request, response);
    }


    private void listUserTasks(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        User user = AppUtils.getLoginedUser(request.getSession());
        List<Task> listTask = TaskRepository.getTasks(user.getId());
        request.setAttribute("listTask", listTask);
        request.setAttribute("user", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/developer.jsp");
		dispatcher.forward(request, response);
    }

    private void retrieveTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Task> listTask = new ArrayList<>();

        if(request.getParameter("priority")!=null){
            String priority = request.getParameter("priority");
            listTask = TaskRepository.getTasksByPriority(priority);
        }
        else if(request.getParameter("team_id")!=null && request.getParameter("team_id")!="") {
            System.out.println("Team Id : "+request.getParameter("team_id"));

            int id = Integer.parseInt(request.getParameter("team_id"));
            listTask = TaskRepository.getTasksByTeamId(id);
        }
        else if(request.getParameter("user_id")!=null){
            int id = Integer.parseInt(request.getParameter("user_id"));
                        listTask = TaskRepository.getTasks(id);
        }
        if(listTask!=null){

            request.setAttribute("listTask", listTask);
        }
        else{
            System.out.println("no retrieved task");
        }
        request.getRequestDispatcher("/WEB-INF/tasks.jsp").forward(request, response);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("task-list.jsp");
//		dispatcher.forward(request, response);
    }

    private void completeTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int task_id = Integer.parseInt(request.getParameter("task_id"));
        System.out.println(task_id);
        String status = request.getParameter("status");
        Task task = TaskRepository.getTask(task_id);
        task.setStatus(status);
        TaskRepository.updateTask(task);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("task-list.jsp");
//		dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Task existingTask = TaskRepository.getTask(id);
        String json = new Gson().toJson(existingTask);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("task-form.jsp");
//		request.setAttribute("task", existingTask);
//		dispatcher.forward(request, response);

    }

    private void insertTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException{
        String name = request.getParameter("name");
        String priority = request.getParameter("priority");

        LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));
        String status = request.getParameter("status");
        String dev_id =request.getParameter("dev_id");

        int devId = Integer.parseInt(dev_id);

        Task newTask = new Task(name, priority,startDate,endDate,status, devId);
        TaskRepository.saveTask(newTask);

//		response.sendRedirect("WEB-INF/tasks.jsp");
        request.getRequestDispatcher("WEB-INF/tasks.jsp").forward(request, response);
    }

    private void updateTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException{
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String priority = request.getParameter("priority");

        LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));

        String status = request.getParameter("status");
        int devId = Integer.parseInt(request.getParameter("developerId"));
        Task newTask = new Task(id,name, priority,startDate,endDate,status, devId);
        TaskRepository.updateTask(newTask);

//		response.sendRedirect("list");
        request.getRequestDispatcher("WEB-INF/tasks.jsp").forward(request, response);
    }

    private void deleteTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        TaskRepository.deleteTask(id);
//		response.sendRedirect("list");
    }
}
