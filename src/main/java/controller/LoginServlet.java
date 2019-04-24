package controller;

import model.User;
import util.AppUtils;
import dao.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import util.SecurityConfig;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserRepository UserRepository;

    public void init() {
        UserRepository = new UserRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        redirect(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User userAccount = UserRepository.login(email, password);
        if (userAccount == null) {
            String errorMessage = "Invalid user email or password";
            request.setAttribute("errorMessage", errorMessage);

            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }
        AppUtils.storeLoginedUser(request.getSession(), userAccount);
        redirect(request, response);
    }

    private void redirect(HttpServletRequest request, HttpServletResponse response) {
        try {
            User userAccount = AppUtils.getLoginedUser(request.getSession());
            if (userAccount == null) {
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
                return;
            }
            int redirectId = request.getParameter("redirectId") == null ? -1 : Integer.parseInt(request.getParameter("redirectId"));
            String requestUri = AppUtils.getRedirectAfterLoginUrl(request.getSession(), redirectId);
            if (requestUri != null) {
                response.sendRedirect(requestUri);
            } else {
                // Default after successful login
                // redirect to /userInfo page
                String role = userAccount.getRoles().get(0);
                switch (role) {
                    case SecurityConfig.ROLE_ADMIN:
                        response.sendRedirect(request.getContextPath() + "/user");
                        break;
                    case SecurityConfig.ROLE_MANAGER:
                        response.sendRedirect(request.getContextPath() + "/task/manager");
                        break;
                    case SecurityConfig.ROLE_DEVELOPER:
                        response.sendRedirect(request.getContextPath() + "/task/developer");
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
