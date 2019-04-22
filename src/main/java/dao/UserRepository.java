package dao;

import model.User;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import config.HibernateUtil;
import org.hibernate.query.Query;

public class UserRepository {
    Session session = null;
    Transaction transaction = null;
    /**
     * Save User
     * @param user
     */
    public void saveUser(User user) {
        try {
            session = HibernateUtil.getCurrentSession();
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(user);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
    }

    /**
     * Update User
     * @param user
     */
    public void updateUser(User user) {
        try {
            session = HibernateUtil.getCurrentSession();
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(user);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
    }

    /**
     * Delete User
     * @param id
     */
    public void deleteUser(int id) {
        try  {
            session = HibernateUtil.getCurrentSession();
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            User user = session.get(User.class, id);
            if (user != null) {
                session.delete(user);
                System.out.println("user is deleted");
            }

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
    }

    /**
     * Get User By ID
     * @param id
     * @return
     */
    public User getUser(int id) {
        User user = null;
        try {
            session = HibernateUtil.getCurrentSession();
            // get an user object
            user = session.get(User.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
        return user;
    }

    /**
     * Get all Users
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<User> getAllUser() {
        List<User> listOfUser = null;
        try {
            session = HibernateUtil.getCurrentSession();
            listOfUser = session.createQuery("from model.User").getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
        return listOfUser;
    }

    /**
     * Login email, password
     * @param email, password
     * @return
     */
    public User login(String email, String password) {
        User user = null;
        try {
            session = HibernateUtil.getCurrentSession();
            String qstr = "from model.User U where U.email = :email AND U.password = :password";
            Query query = session.createQuery(qstr);
            query.setParameter("email", email);
            query.setParameter("password", password);
            user = (User)query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
        return user;
    }

    public Task[] getTasks(String devId) {
        return TaskRepository.getTasksByUserId(devId);
    }
}