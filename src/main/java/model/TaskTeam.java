package model;

import java.time.LocalDate;

public class TaskTeam extends Task{
    protected String teamName;

    public TaskTeam(){
        super();
    }
    public TaskTeam(String name, String priority, LocalDate startDate, LocalDate endDate, String status, int devId, String teamName){
        super(name, priority, startDate, endDate, status,devId);
        this.teamName = teamName;
    }
    public TaskTeam(int id,String name, String priority,LocalDate startDate, LocalDate endDate, String status, int devId, String teamName) {
        super(id, name, priority, startDate, endDate, status, devId);
        this.teamName = teamName;
    }

    public String getTeamName() { return teamName; }


}
