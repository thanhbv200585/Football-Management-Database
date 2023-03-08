package model;

public class Standing {
	private Lyear lyear;
	private Club club;
	private int match_play;
	private int points;
	private int pts;
	private int goal;
	private int goal_against;
	public Standing() {
	}
	public Standing(Lyear lyear, Club club, int match_play, int points, int pts, int goal, int goal_against) {
		super();
		this.lyear = lyear;
		this.club = club;
		this.match_play = match_play;
		this.points = points;
		this.pts = pts;
		this.goal = goal;
		this.goal_against = goal_against;
	}
	public Lyear getLyear() {
		return lyear;
	}
	public void setLyear(Lyear lyear) {
		this.lyear = lyear;
	}
	public Club getClub() {
		return club;
	}
	public void setClub(Club club) {
		this.club = club;
	}
	public int getMatch_play() {
		return match_play;
	}
	public void setMatch_play(int match_play) {
		this.match_play = match_play;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public int getPts() {
		return pts;
	}
	public void setPts(int pts) {
		this.pts = pts;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
	public int getGoal_against() {
		return goal_against;
	}
	public void setGoal_against(int goal_against) {
		this.goal_against = goal_against;
	}
	@Override
	public String toString() {
		return "Standing [lyear=" + lyear + ", club=" + club + ", match_play=" + match_play + ", points=" + points
				+ ", pts=" + pts + ", goal=" + goal + ", goal_against=" + goal_against + "]";
	}
	
	
}
