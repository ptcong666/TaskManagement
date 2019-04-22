package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="users")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	protected int id;

	@Column(name="name")
	protected String name;

	@Column(name="email")
	protected String email;

	@Column(name="password")
	protected String password;

	@Column(name="address")
	protected String address;

	@Column(name="phone")
	protected String phone;

	@Column(name="roles")
	protected String[] roles;

	public User() {

	}

	public User(String email, String password) {
		this.password = password;
		this.email = email;
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
}
