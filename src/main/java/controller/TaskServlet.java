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
import model.Task;

@WebServlet("/task/*")
public class TaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TaskRepository TaskRepository;

    public void init() {
        TaskRepository = new TaskRepository();
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
                case "/task/new":
                    showNewForm(request, response);
                    break;
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

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//		RequestDispatcher dispatcher = request.getRequestDispatcher("task-form.jsp");
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

        Task newTask = new Task(name, priority,startDate,endDate,status);
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

        Task newTask = new Task(id,name, priority,startDate,endDate,status);
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