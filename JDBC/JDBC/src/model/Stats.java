package model;

public class Stats {
	private Player player;
	private Match match;
	private int shortPassesCompleted;
	private int shortPassesAttempted;
	private int longPassesCompleted;
	private int longPassesAttempted;
	private int assists;
	private int live;
	private int dead;
	private int freeKick;
	private int tb;
	private int sw;
	private int ti;
	private int ck;
	private int defPen;
	private int def3rd;
	private int mid3rd;
	private int att3rd;
	private int succ;
	private int mis;
	private int dis;
	private int tklDef3rd;
	private int tklMid3rd;
	private int tklAtt3rd;
	private int dribberTkl;
	private int dribberAtt;
	private int inception;
	private int passBlock;
	private int shotBlock;
	private int totalShot;
	private int goal;
	private int shotOnTarget;
	private int penaltyMade;
	private int penaltyAttempted;
	private int averageDistance;

	public Stats() {
		super();
	}

	public Stats(Player player, Match match, int shortPassesCompleted, int shortPassesAttempted,
			int longPassesCompleted, int longPassesAttempted, int assists, int live, int dead, int freeKick, int tb,
			int sw, int ti, int ck, int defPen, int def3rd, int mid3rd, int att3rd, int succ, int mis, int dis,
			int tklDef3rd, int tklMid3rd, int tklAtt3rd, int dribberTkl, int dribberAtt, int inception, int passBlock,
			int shotBlock, int totalShot, int goal, int shotOnTarget, int penaltyMade, int penaltyAttempted,
			int averageDistance) {
		super();
		this.player = player;
		this.match = match;
		this.shortPassesCompleted = shortPassesCompleted;
		this.shortPassesAttempted = shortPassesAttempted;
		this.longPassesCompleted = longPassesCompleted;
		this.longPassesAttempted = longPassesAttempted;
		this.assists = assists;
		this.live = live;
		this.dead = dead;
		this.freeKick = freeKick;
		this.tb = tb;
		this.sw = sw;
		this.ti = ti;
		this.ck = ck;
		this.defPen = defPen;
		this.def3rd = def3rd;
		this.mid3rd = mid3rd;
		this.att3rd = att3rd;
		this.succ = succ;
		this.mis = mis;
		this.dis = dis;
		this.tklDef3rd = tklDef3rd;
		this.tklMid3rd = tklMid3rd;
		this.tklAtt3rd = tklAtt3rd;
		this.dribberTkl = dribberTkl;
		this.dribberAtt = dribberAtt;
		this.inception = inception;
		this.passBlock = passBlock;
		this.shotBlock = shotBlock;
		this.totalShot = totalShot;
		this.goal = goal;
		this.shotOnTarget = shotOnTarget;
		this.penaltyMade = penaltyMade;
		this.penaltyAttempted = penaltyAttempted;
		this.averageDistance = averageDistance;
	}

	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public Match getMatch() {
		return match;
	}

	public void setMatch(Match match) {
		this.match = match;
	}

	public int getShortPassesCompleted() {
		return shortPassesCompleted;
	}

	public void setShortPassesCompleted(int shortPassesCompleted) {
		this.shortPassesCompleted = shortPassesCompleted;
	}

	public int getShortPassesAttempted() {
		return shortPassesAttempted;
	}

	public void setShortPassesAttempted(int shortPassesAttempted) {
		this.shortPassesAttempted = shortPassesAttempted;
	}

	public int getLongPassesCompleted() {
		return longPassesCompleted;
	}

	public void setLongPassesCompleted(int longPassesCompleted) {
		this.longPassesCompleted = longPassesCompleted;
	}

	public int getLongPassesAttempted() {
		return longPassesAttempted;
	}

	public void setLongPassesAttempted(int longPassesAttempted) {
		this.longPassesAttempted = longPassesAttempted;
	}

	public int getAssists() {
		return assists;
	}

	public void setAssists(int assists) {
		this.assists = assists;
	}

	public int getLive() {
		return live;
	}

	public void setLive(int live) {
		this.live = live;
	}

	public int getDead() {
		return dead;
	}

	public void setDead(int dead) {
		this.dead = dead;
	}

	public int getFreeKick() {
		return freeKick;
	}

	public void setFreeKick(int freeKick) {
		this.freeKick = freeKick;
	}

	public int getTb() {
		return tb;
	}

	public void setTb(int tb) {
		this.tb = tb;
	}

	public int getSw() {
		return sw;
	}

	public void setSw(int sw) {
		this.sw = sw;
	}

	public int getTi() {
		return ti;
	}

	public void setTi(int ti) {
		this.ti = ti;
	}

	public int getCk() {
		return ck;
	}

	public void setCk(int ck) {
		this.ck = ck;
	}

	public int getDefPen() {
		return defPen;
	}

	public void setDefPen(int defPen) {
		this.defPen = defPen;
	}

	public int getDef3rd() {
		return def3rd;
	}

	public void setDef3rd(int def3rd) {
		this.def3rd = def3rd;
	}

	public int getMid3rd() {
		return mid3rd;
	}

	public void setMid3rd(int mid3rd) {
		this.mid3rd = mid3rd;
	}

	public int getAtt3rd() {
		return att3rd;
	}

	public void setAtt3rd(int att3rd) {
		this.att3rd = att3rd;
	}

	public int getSucc() {
		return succ;
	}

	public void setSucc(int succ) {
		this.succ = succ;
	}

	public int getMis() {
		return mis;
	}

	public void setMis(int mis) {
		this.mis = mis;
	}

	public int getDis() {
		return dis;
	}

	public void setDis(int dis) {
		this.dis = dis;
	}

	public int getTklDef3rd() {
		return tklDef3rd;
	}

	public void setTklDef3rd(int tklDef3rd) {
		this.tklDef3rd = tklDef3rd;
	}

	public int getTklMid3rd() {
		return tklMid3rd;
	}

	public void setTklMid3rd(int tklMid3rd) {
		this.tklMid3rd = tklMid3rd;
	}

	public int getTklAtt3rd() {
		return tklAtt3rd;
	}

	public void setTklAtt3rd(int tklAtt3rd) {
		this.tklAtt3rd = tklAtt3rd;
	}

	public int getDribberTkl() {
		return dribberTkl;
	}

	public void setDribberTkl(int dribberTkl) {
		this.dribberTkl = dribberTkl;
	}

	public int getDribberAtt() {
		return dribberAtt;
	}

	public void setDribberAtt(int dribberAtt) {
		this.dribberAtt = dribberAtt;
	}

	public int getInception() {
		return inception;
	}

	public void setInception(int inception) {
		this.inception = inception;
	}

	public int getPassBlock() {
		return passBlock;
	}

	public void setPassBlock(int passBlock) {
		this.passBlock = passBlock;
	}

	public int getShotBlock() {
		return shotBlock;
	}

	public void setShotBlock(int shotBlock) {
		this.shotBlock = shotBlock;
	}

	public int getTotalShot() {
		return totalShot;
	}

	public void setTotalShot(int totalShot) {
		this.totalShot = totalShot;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public int getShotOnTarget() {
		return shotOnTarget;
	}

	public void setShotOnTarget(int shotOnTarget) {
		this.shotOnTarget = shotOnTarget;
	}

	public int getPenaltyMade() {
		return penaltyMade;
	}

	public void setPenaltyMade(int penaltyMade) {
		this.penaltyMade = penaltyMade;
	}

	public int getPenaltyAttempted() {
		return penaltyAttempted;
	}

	public void setPenaltyAttempted(int penaltyAttempted) {
		this.penaltyAttempted = penaltyAttempted;
	}

	public int getAverageDistance() {
		return averageDistance;
	}

	public void setAverageDistance(int averageDistance) {
		this.averageDistance = averageDistance;
	}

	@Override
	public String toString() {
		return "Stats [player=" + player + ", match=" + match + ", shortPassesCompleted=" + shortPassesCompleted
				+ ", shortPassesAttempted=" + shortPassesAttempted + ", longPassesCompleted=" + longPassesCompleted
				+ ", longPassesAttempted=" + longPassesAttempted + ", assists=" + assists + ", live=" + live + ", dead="
				+ dead + ", freeKick=" + freeKick + ", tb=" + tb + ", sw=" + sw + ", ti=" + ti + ", ck=" + ck
				+ ", defPen=" + defPen + ", def3rd=" + def3rd + ", mid3rd=" + mid3rd + ", att3rd=" + att3rd + ", succ="
				+ succ + ", mis=" + mis + ", dis=" + dis + ", tklDef3rd=" + tklDef3rd + ", tklMid3rd=" + tklMid3rd
				+ ", tklAtt3rd=" + tklAtt3rd + ", dribberTkl=" + dribberTkl + ", dribberAtt=" + dribberAtt
				+ ", inception=" + inception + ", passBlock=" + passBlock + ", shotBlock=" + shotBlock + ", totalShot="
				+ totalShot + ", goal=" + goal + ", shotOnTarget=" + shotOnTarget + ", penaltyMade=" + penaltyMade
				+ ", penaltyAttempted=" + penaltyAttempted + ", averageDistance=" + averageDistance + "]";
	}

}
