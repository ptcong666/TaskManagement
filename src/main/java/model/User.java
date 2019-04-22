package model;

import javax.persistence.*;
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

	public User (int id, String email, String password){
		this.id=id;
		this.password=password;
		this.email=email;
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

	public List<String> getRoles() {
		List<String> res = new ArrayList<>();
		for (String role : roles) {
			res.add(role);
		}
		return res;
	}

	
}
