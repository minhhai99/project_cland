package spring.model;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data


public class Lands {
	private int lid;
	@NotEmpty
	private String lname;
	@NotEmpty
	private String description;
	private String detail_text;
	private Timestamp date_create;
	private String picture;
	@NotEmpty
	@Length(min = 20)
	private String address;
	@NotNull
	private int area;
	private int count_views;
	private Category category;
	private int count;
	
	public Lands(int lid, @NotEmpty String lname, @NotEmpty String description, String detail_text,
			Timestamp date_create, String picture, @NotEmpty @Length(min = 20) String address, @NotNull int area,
			int count_views, Category category) {
		super();
		this.lid = lid;
		this.lname = lname;
		this.description = description;
		this.detail_text = detail_text;
		this.date_create = date_create;
		this.picture = picture;
		this.address = address;
		this.area = area;
		this.count_views = count_views;
		this.category = category;
	}
	
	public Lands() {
		super();
	}

	public Lands(int lid, @NotEmpty String lname, @NotEmpty String description, String detail_text,
			Timestamp date_create, String picture, @NotEmpty @Length(min = 20) String address, @NotNull int area,
			int count_views, Category category, int count) {
		super();
		this.lid = lid;
		this.lname = lname;
		this.description = description;
		this.detail_text = detail_text;
		this.date_create = date_create;
		this.picture = picture;
		this.address = address;
		this.area = area;
		this.count_views = count_views;
		this.category = category;
		this.count = count;
	}
	
}
