package model;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name="task")
public class Task {

    @Id
        @GeneratedValue(strategy= GenerationType.IDENTITY)
        @Column(name="id")
        protected int id;

    @Column(name="name")
        protected String name;

    @Column(name="priority")
        protected String priority;

    @Column(name="startDate")
        protected LocalDate startDate;

    @Column(name="endDate")
        protected LocalDate endDate;

    @Column(name="status")
        protected String status;

    @Column(name="developer_id")
    private int developerId;


    public Task() {
        }

        public Task(String name, String priority,LocalDate startDate, LocalDate endDate, String status, int devId) {
            super();
            this.name = name;
            this.priority=priority;
            this.startDate=startDate;
            this.endDate=endDate;
            this.status=status;
            this.developerId = devId;
        }
        public Task(int id,String name, String priority,LocalDate startDate, LocalDate endDate, String status, int devId) {
            super();
            this.id=id;
            this.name = name;
            this.priority=priority;
            this.startDate=startDate;
            this.endDate=endDate;
            this.status=status;
            this.developerId = devId;
        }

        public void print(){
            System.out.println("Id :"+this.id+" name : "+ this.name + " priority : " + this.priority);
        }



    public int getId() { return id; }

    public String getName() { return name; }

    public String getPriority() { return priority; }

    public LocalDate getStartDate() { return startDate; }

    public LocalDate getEndDate() { return endDate; }

    public String getStatus() { return status; }

    public void setName(String name) { this.name = name; }

    public void setPriority(String priority) { this.priority = priority; }

    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }

    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }

    public void setStatus(String status) { this.status = status; }

    public int getDeveloperId() {
        return developerId;
    }

    public void setDeveloperId(int developerId) {
        this.developerId = developerId;
    }
}
