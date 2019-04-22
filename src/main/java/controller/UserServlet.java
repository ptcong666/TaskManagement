package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserRepository;
import model.User;

@WebServlet("/user/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserRepository UserRepository;

	public void init() {
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
				case "/user/insert":
					insertUser(request, response);
					break;
				case "/user/delete":
					deleteUser(request, response);
					break;
				case "/user/edit":
					showEditForm(request, response);
					break;
				case "/user/update":
					updateUser(request, response);
					break;
				case "/user/admin":
					listUser(request, response);
					break;
				case "/user/manager":
					listUser(request, response);
					break;
				case "/user/developer":
					listTask(request, response);
					break;
				default:
					listUser(request, response);
					break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<User> listUser = UserRepository.getAllUser();
		request.setAttribute("listUser", listUser);
		request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
//		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		User existingUser = UserRepository.getUser(id);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
//		request.setAttribute("user", existingUser);
//		dispatcher.forward(request, response);

	}

	private void insertUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		User newUser = new User(name, email, password, address, phone);
		newUser.setRolesByString(request.getParameter("roles"));
		UserRepository.saveUser(newUser);
//		response.sendRedirect("list");
	}

	private void updateUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String tasks = request.getParameter("task_id");
		String team = request.getParameter("team_id");
		User user = new User(id, name, email);
//		user.setTaskId(tasks);
//		user.setTeamId(team);
		UserRepository.updateUser(user);
//		response.sendRedirect("list");
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		UserRepository.deleteUser(id);
//		response.sendRedirect("list");
	}

	private void listTask(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		UserRepository.getTasks(id);
//		response.sendRedirect("list");
	}
}
