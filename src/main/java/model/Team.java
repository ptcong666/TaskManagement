package model;
import javax.persistence.*;

@Entity
@Table(name="team")
    public class Team {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id")
    protected int id;

    @Column(name="name")
    protected String name;

    public Team() {}

    public Team(String name) {
        this.name =name;
    }
    public Team(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}

