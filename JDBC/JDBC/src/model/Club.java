package model;

import java.util.Set;

public class Club {
    private int id;
    private String name;
    private String country;
    private Stadium stadium;
    private Set<Match> matches;
    private Set<IsMember> isMembers;
    
    public Club(){
    }


    public Club(int id, String name, String country, Stadium stadium, Set<Match> matches, Set<IsMember> isMembers) {
		this.id = id;
		this.name = name;
		this.country = country;
		this.stadium = stadium;
		this.matches = matches;
		this.isMembers = isMembers;
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

    public String getCountry(){
        return country;
    }

    public void setCountry(String country){
        this.country = country;
    }

	public Stadium getStadium() {
		return stadium;
	}


	public void setStadium(Stadium stadium) {
		this.stadium = stadium;
	}


	public Set<Match> getMatches() {
		return matches;
	}


	public void setMatches(Set<Match> matches) {
		this.matches = matches;
	}


	public Set<IsMember> getIsMembers() {
		return isMembers;
	}


	public void setIsMembers(Set<IsMember> isMembers) {
		this.isMembers = isMembers;
	}


	@Override
	public String toString() {
		return "Club [id=" + id + ", name=" + name + ", country=" + country + ", stadium=" + stadium + ", matches="
				+ matches + ", isMembers=" + isMembers + "]";
	}
    
    
}
