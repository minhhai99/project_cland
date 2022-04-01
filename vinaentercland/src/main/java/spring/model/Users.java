package spring.model;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
	private int id;
	@NotEmpty
	@Length(min = 6, max = 32)
	private String username;
	@NotEmpty
	private String full_name;
	@NotEmpty
	@Length(min = 6)
	private String password;
	private Roles role;
}
