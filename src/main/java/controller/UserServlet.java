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

import com.google.gson.Gson;
import dao.UserRepository;
import model.User;

@WebServlet(urlPatterns = {"/user", "/user/*"})
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
					listDeveloper(request, response);
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
	}

	private void listDeveloper(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<User> listUser=null,developerUser=null;
		listUser = UserRepository.getAllUser();
		System.out.println(listUser);
		if(listUser!=null){
			developerUser = UserRepository.filterDeveloper(listUser);
			if(developerUser!=null){
				request.setAttribute("listUser", developerUser);
				System.out.println(developerUser.size());
			}
			else {
				System.out.println("Developer user is not found");
			}
		}
		else{
			System.out.println("User not found");
		}
		request.getRequestDispatcher("/WEB-INF/manager.jsp").forward(request, response);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
//		dispatcher.forward(request, response);
	}


	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		User existingUser = UserRepository.getUser(id);
		String json = new Gson().toJson(existingUser);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	private void insertUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		User newUser = new User();
		newUser.setEmail(email);
		newUser.setPassword(password);
		newUser.setName(name);
		newUser.setPhone(phone);
		newUser.setAddress(address);
		newUser.setRolesByString(request.getParameter("roles"));
		UserRepository.saveUser(newUser);
        request.getRequestDispatcher("/user").forward(request, response);
	}

	private void updateUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		User user = new User(id, name, email, password, address, phone);
		user.setRolesByString(request.getParameter("roles"));
		UserRepository.updateUser(user);
		request.getRequestDispatcher("/user").forward(request, response);
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		UserRepository.deleteUser(id);
	}

	private void listTask(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		UserRepository.getTasks(id);
	}


}
