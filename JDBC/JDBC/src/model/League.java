package model;

import java.util.Set;

public class League {
	private int id;
	private String name;
	private String first_season;
	private Club wonMostTilteClub;
	private Set<Lyear> lyears;

	public League() {
	}

	public League(int id, String name, String first_season, Club wonMostTilteClub, Set<Lyear> lyears) {
		super();
		this.id = id;
		this.name = name;
		this.first_season = first_season;
		this.wonMostTilteClub = wonMostTilteClub;
		this.lyears = lyears;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFirst_season() {
		return first_season;
	}

	public void setFirst_season(String first_season) {
		this.first_season = first_season;
	}

	public Club getWonMostTilteClub() {
		return wonMostTilteClub;
	}

	public void setWonMostTilteClub(Club wonMostTilteClub) {
		this.wonMostTilteClub = wonMostTilteClub;
	}

	public Set<Lyear> getLyears() {
		return lyears;
	}

	public void setLyears(Set<Lyear> lyears) {
		this.lyears = lyears;
	}

	@Override
	public String toString() {
		return "League [id=" + id + ", name=" + name + ", first_season=" + first_season + ", wonMostTilteClub="
				+ wonMostTilteClub + ", lyears=" + lyears + "]";
	}
}
