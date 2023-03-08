package model;

public class Stadium {
    private int id;
    private String name;
    private String team;
    private int capacity;

    public Stadium(){

    }
    public Stadium(String name, String team, int capacity){
        this.name = name;
        this.team = team;
        this.capacity = capacity;
    }
    public Stadium(int id, String name, String team, int capacity){
        this.id = id;
        this.name = name;
        this.team = team;
        this.capacity = capacity;
    }
    
    public int getId(){
        return id;
    }

    public void setId(int id){
        this.id = id;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getTeam(){
        return team;
    }

    public void setTeam(String team){
        this.team = team;
    }

    public int getCapacity(){
        return capacity;
    }

    public void setCapacity(int capacity){
        this.capacity = capacity;
    }
}
