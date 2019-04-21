package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

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
        protected LocalDateTime startDate;

        @Column(name="endDate")
        protected LocalDateTime endDate;

        @Column(name="status")
        protected String status;


    public Task() {
        }

        public Task(String name, String priority,LocalDateTime startDate, LocalDateTime endDate, String status) {
            super();
            this.name = name;
            this.priority=priority;
            this.startDate=startDate;
            this.endDate=endDate;
            this.status=status;
        }



    public int getId() { return id; }

    public String getName() { return name; }

    public String getPriority() { return priority; }

    public LocalDateTime getStartDate() { return startDate; }

    public LocalDateTime getEndDate() { return endDate; }

    public String getStatus() { return status; }

    public void setName(String name) { this.name = name; }

    public void setPriority(String priority) { this.priority = priority; }

    public void setStartDate(LocalDateTime startDate) { this.startDate = startDate; }

    public void setEndDate(LocalDateTime endDate) { this.endDate = endDate; }

    public void setStatus(String status) { this.status = status; }

}
