package model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="users",
uniqueConstraints = {
	@UniqueConstraint(columnNames = "email")
})
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	protected int id;

	@Column(name="name")
	protected String name;

	@Column(name="email", unique = true)
	protected String email;

	@Column(name="password")
	protected String password;

	@Column(name="address")
	protected String address;

	@Column(name="phone")
	protected String phone;

	@Column(name="roles")
	protected String[] roles = new String[3];

	@Column(name="team_id")
	protected int teamId;


	public User() {
	}

	public User (int id, String email, String password){
		this.id=id;
		this.password=password;
		this.email=email;
	}

	public User(int id, String name, String email, String password, String address, String phone) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.phone = phone;
	}

	public User(int id, String name, String email, String password, String address, String phone,int teamId){
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.phone = phone;
		this.teamId=teamId;
	}

	public void setRolesByString(String roles) {
		this.roles = roles.split(",");
	}

	public String getEmail() {
		return email;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public String getPhone() {
		return phone;
	}

	public List<String> getRoles() {
		List<String> res = new ArrayList<>();
		for (String role : roles) {
			res.add(role);
		}
		return res;
	}

	public String[] getRoles2() {
		return this.roles;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public int getTeamId() {
		return teamId;
	}

	public String getPassword() {
		return password;
	}

	public void setRoles(String[] roles) {
		this.roles = roles;
	}
}
