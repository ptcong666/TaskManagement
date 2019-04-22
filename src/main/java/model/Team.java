package model;
import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="team")
    public class Team {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="team_id")
    protected int id;

    @Column(name="name")
    protected String name;


    @Column(name="developers")
    protected String[] developerIds;


    public Team(String name) {
        this.name =name;
    }
    public Team(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Team(int id, String name, String[] developerIds){
        this.id = id;
        this.name=name;
        this.developerIds=developerIds;

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String[] getDeveloperIds() {
        return developerIds;
    }

    public void setDeveloperIds(String[] developerIds) {
        this.developerIds = developerIds;
    }

}

