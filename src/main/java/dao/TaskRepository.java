package dao;

import model.Task;
import model.User;
import model.Team;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import config.HibernateUtil;

public class TaskRepository {
    Session session = null;
    Transaction transaction = null;
    /**
     * Save Task
     * @param task
     */
    public void saveTask(Task task) {
        try {
            session = HibernateUtil.getCurrentSession();
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

    public void updateTask(Task task) {
        try {
            session = HibernateUtil.getCurrentSession();
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
        try {
            session = HibernateUtil.getCurrentSession();
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
        try {
            session = HibernateUtil.getCurrentSession();
            task = session.get(Task.class, id);

        } catch (Exception e) {
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
        try {
            session = HibernateUtil.getCurrentSession();
            listOfTask = session.createQuery("from model.Task").getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
        return listOfTask;
    }

    /**
     * Get Task By Priority
     * @param priority
     * @return
     */
    public List<Task> getTasksByPriority(String priority) {

        List<Task> listOfTask = null;
        try {
            session = HibernateUtil.getCurrentSession();
            listOfTask = session.createQuery("from model.Task where priority="+priority).getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
        return listOfTask;
    }


    public List<Task> getTasksByTeamId(int id ) {

        List<Task> listOfTask = null;
        try {
            session = HibernateUtil.getCurrentSession();
            UserRepository UserRepository = new UserRepository();
            List<User> listOfUsers = session.createQuery("from model.User where team_id="+id).getResultList();

            for(User u: listOfUsers){
               listOfTask.addAll(UserRepository.getTasks(u.getId()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
        return listOfTask;
    }
    public List<Task> getTasks(int devId) {
        List<Task> listOfTask = null;
        try {
            session = HibernateUtil.getCurrentSession();
            listOfTask = session.createQuery("from model.Task where developer_id="+devId).getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
        return listOfTask;
    }
    public List<Integer> getTeamIdsByTask(List<Task> tasks){
        List<Integer> teamIds= null;
        try {
            session = HibernateUtil.getCurrentSession();
            for(Task t: tasks){


             List<User> user = session.createQuery("from model.User where id="+t.getDeveloperId()).getResultList();
             teamIds.add(user.get(0).getTeamId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
        return teamIds;
    }

    public String getTeamId(int teamId) {
        TeamRepository teamRepository = new TeamRepository();
        Team team = teamRepository.getTeam(teamId);
        return team.getName();
    }
}

