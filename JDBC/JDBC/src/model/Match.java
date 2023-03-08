package model;

public class Match {
	private int id;
	private Club home;
	private Club away;
	private Lyear lyear;
	private String score;
	private int attendance;
	private String referee;

	public Match() {
	}

	public Match(int id, Club home, Club away, Lyear lyear, String score, int attendance, String referee) {
		super();
		this.id = id;
		this.home = home;
		this.away = away;
		this.lyear = lyear;
		this.score = score;
		this.attendance = attendance;
		this.referee = referee;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Club getHome() {
		return home;
	}

	public void setHome(Club home) {
		this.home = home;
	}

	public Club getAway() {
		return away;
	}

	public void setAway(Club away) {
		this.away = away;
	}

	public Lyear getLyear() {
		return lyear;
	}

	public void setLyear(Lyear lyear) {
		this.lyear = lyear;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public int getAttendance() {
		return attendance;
	}

	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}

	public String getReferee() {
		return referee;
	}

	public void setReferee(String referee) {
		this.referee = referee;
	}

	@Override
	public String toString() {
		return "Match [id=" + id + ", home=" + home + ", away=" + away + ", lyear=" + lyear + ", score=" + score
				+ ", attendance=" + attendance + ", referee=" + referee + "]";
	}

}
