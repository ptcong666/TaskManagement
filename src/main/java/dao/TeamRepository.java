package dao;

import config.HibernateUtil;
import model.Task;
import model.User;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class TeamRepository {
    Session session = null;
    Transaction transaction = null;
    public List<User> getDevelopers(String teamId) {
        List<User> listOfUser = null;
        try {
            session = HibernateUtil.getCurrentSession();
            listOfUser = session.createQuery("from model.User where team_id="+teamId).getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
        return listOfUser;
    }

    public List<Task> getTasks(String teamId) {
        List<Task> listOfTasks = new ArrayList<>();
        UserRepository userRepository = new UserRepository();
        for (User user : getDevelopers(teamId)) {
            listOfTasks.addAll(userRepository.getTasks(user.getId()));
        }
        return listOfTasks;
    }
}
