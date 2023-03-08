package model;

public class IsMember {
	private Player player;
	private Club club;
	private String season;
	private int match_played;
	private int goal;
	private int assist;

	public IsMember() {
	}

	public IsMember(Player player, Club club, String season, int match_played, int goal, int assist) {
		super();
		this.player = player;
		this.club = club;
		this.season = season;
		this.match_played = match_played;
		this.goal = goal;
		this.assist = assist;
	}

	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public Club getClub() {
		return club;
	}

	public void setClub(Club club) {
		this.club = club;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public int getMatch_played() {
		return match_played;
	}

	public void setMatch_played(int match_played) {
		this.match_played = match_played;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public int getAssist() {
		return assist;
	}

	public void setAssist(int assist) {
		this.assist = assist;
	}

	@Override
	public String toString() {
		return "IsMember [player=" + player + ", club=" + club + ", season=" + season + ", match_played=" + match_played
				+ ", goal=" + goal + ", assist=" + assist + "]";
	}

}
