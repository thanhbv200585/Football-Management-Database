package model;

import java.util.Set;

public class Player {
	private int id;
	private String name;
	private String nation;
	private String position;
	private int age;
	private Set<IsMember> isMembers;

	public Player() {
	}

	public Player(int id, String name, String nation, String position, int age, Set<IsMember> isMembers) {
		super();
		this.id = id;
		this.name = name;
		this.nation = nation;
		this.position = position;
		this.age = age;
		this.isMembers = isMembers;
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

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Set<IsMember> getIsMembers() {
		return isMembers;
	}

	public void setIsMembers(Set<IsMember> isMembers) {
		this.isMembers = isMembers;
	}

	@Override
	public String toString() {
		return "Player [id=" + id + ", name=" + name + ", nation=" + nation + ", position=" + position + ", age=" + age
				+ ", isMembers=" + isMembers + "]";
	}

}
