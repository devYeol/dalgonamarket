package com.dal.dalgona.model.vo;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Memberrrr {
	
	@Id
	private String memberId;
	
	private String memberPwd;
	
	private String memberName;
	
	private String memberBirth;
	
	private String memberGender;
	
	private String memberPhone;
	
	private String memberEmail;
	
	private Date memberEnrollDate;
	
	@ManyToMany
	@JoinTable(name="likes",
				joinColumns=@JoinColumn(name="memberId"),
				inverseJoinColumns=@JoinColumn(name="productCode")
			)
	private List<Product> products;
	
//	@OneToMany(mappedBy="memberId")
//	private List<DeliveryLocation> memberdelivery=new ArrayList();

}
