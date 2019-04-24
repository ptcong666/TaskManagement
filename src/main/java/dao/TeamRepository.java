package dao;

import config.HibernateUtil;
import model.Team;
import model.User;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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

    public void saveTeam(Team team) {
        try {
            session = HibernateUtil.getCurrentSession();
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(team);
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
     * Update Team
     * @param team
     */
    public void updateTeam(Team team) {
        try {
            session = HibernateUtil.getCurrentSession();
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(team);
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
     * Delete Team
     * @param id
     */
    public void deleteTeam(int id) {
        try {
            session = HibernateUtil.getCurrentSession();
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a team object
            Team team = session.get(Team.class, id);
            if (team != null) {
                session.delete(team);
                System.out.println("team is deleted");
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
     * Get Team By ID
     * @param id
     * @return
     */
    public Team getTeam(int id) {
        Team team = null;
        try {
            session = HibernateUtil.getCurrentSession();
            team = session.get(Team.class, id);

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
        return team;
    }

    /**
     * Get all Teams
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Team> getAllTeam() {
        List<Team> listOfTeam = null;
        try {
            session = HibernateUtil.getCurrentSession();
            Query query = session.createQuery("from model.Team");
            listOfTeam = query.list();
            for (Team team: listOfTeam){
                System.out.println(team.getId()+" "+team.getName());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            HibernateUtil.closeSession(session);
        }
        return listOfTeam;
    }


}
