package model;

public class Lyear {
	private int id;
	private String season;
	private int numOfSquad;
	private String champion;
	private int championPoint;
	private String topScorer;
	private int goals;

	public Lyear() {
	}

	public Lyear(int id, String season, int numOfSquad, String champion, int championPoint, String topScorer,
			int goals) {
		this.id = id;
		this.season = season;
		this.numOfSquad = numOfSquad;
		this.champion = champion;
		this.championPoint = championPoint;
		this.topScorer = topScorer;
		this.goals = goals;
	}

	@Override
	public String toString() {
		return "Lyear [id=" + id + ", season=" + season + ", numOfSquad=" + numOfSquad + ", champion=" + champion
				+ ", championPoint=" + championPoint + ", topScorer=" + topScorer + ", goals=" + goals + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public int getNumOfSquad() {
		return numOfSquad;
	}

	public void setNumOfSquad(int numOfSquad) {
		this.numOfSquad = numOfSquad;
	}

	public String getChampion() {
		return champion;
	}

	public void setChampion(String champion) {
		this.champion = champion;
	}

	public int getChampionPoint() {
		return championPoint;
	}

	public void setChampionPoint(int championPoint) {
		this.championPoint = championPoint;
	}

	public String getTopScorer() {
		return topScorer;
	}

	public void setTopScorer(String topScorer) {
		this.topScorer = topScorer;
	}

	public int getGoals() {
		return goals;
	}

	public void setGoals(int goals) {
		this.goals = goals;
	}

}
