package spring.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Contact {
	private int vid;
	@NotEmpty
	private String fullname;
	@Email
	private String email;
	@NotEmpty
	private String subject;
	@NotEmpty
	private String content;

}
