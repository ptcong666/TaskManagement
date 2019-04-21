package dao;

import model.Task;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import config.HibernateUtil;

public class TaskRepository {
    Session session = HibernateUtil.getCurrentSession();
    Transaction transaction = null;
    /**
     * Save Task
     * @param task
     */
    public void saveTask(Task task) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(task);
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
     * Update Task
     * @param task
     */
    public void updateTask(Task task) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(task);
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
     * Delete Task
     * @param id
     */
    public void deleteTask(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a task object
            Task task = session.get(Task.class, id);
            if (task != null) {
                session.delete(task);
                System.out.println("task is deleted");
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
     * Get Task By ID
     * @param id
     * @return
     */
    public Task getTask(int id) {
        Task task = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an task object
            task = session.get(Task.class, id);
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
        return task;
    }

    /**
     * Get all Tasks
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Task> getAllTask() {
        List<Task> listOfTask = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an task object

            listOfTask = session.createQuery("from Task").getResultList();

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
        return listOfTask;
    }
}