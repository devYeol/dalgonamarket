package com.dal.dalgona.common.model.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
public class Member implements UserDetails {
	
	@Id
	private String memberId;
	
	private String memberPwd;
	
	private String memberName;
	
	private String memberBirth;
	
	private String memberGender;
	
	private String memberPhone;
	
	@Column(unique=true)
	private String memberEmail;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date memberEnrollDate;
	
//	@Column(name="roles", nullable = true, columnDefinition = "varchar2(255) default 'USER'")
	@Column(name="roles")
	@Enumerated(EnumType.STRING) // DB에도 String type으로 저장
	private Roles roles;
	
	@PrePersist // insert 실행 전 메소드
	public void setRoles() {
		
		if(roles == null) {
			this.roles=Roles.USER;
		}
		
	}
	
//	@PostPersist // insert 실행 후 메소드
//	public void setRoles() {
//		
//		this.roles=Roles.ROLE_USER;
//		
////		if(roles == null) {
////			this.roles=Roles.ROLE_USER;
////		}
//		
//		System.out.println("가입 > USER 등급 부여");
//		
//	}
	
	
	// 찜
//	@ManyToMany
//	@JoinTable(name="likes",
//				joinColumns=@JoinColumn(name="memberId"),
//				inverseJoinColumns=@JoinColumn(name="productCode")
//			)
//	private List<Product> products;
	
	// 찜
	@OneToMany(mappedBy="member")
	private List<Likes> likes=new ArrayList();
	
	// 상문문의
	@OneToMany(mappedBy="product")
	private List<Qna> qna=new ArrayList();
	
	// 장바구니
//	@ManyToMany
//	@JoinTable(name="cart",
//				joinColumns=@JoinColumn(name="memberId"),
//				inverseJoinColumns=@JoinColumn(name="productCode")
//			)
//	private List<Product> productCart;
	
	// 장바구니
	@OneToMany(mappedBy="member")
	private List<Cart> cart=new ArrayList();
	
	
	// security
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		
		List<GrantedAuthority> auth=new ArrayList();
		auth.add(new SimpleGrantedAuthority(this.roles.getKey()));
		
		return auth;
	}
	
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.memberId;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	// 배송주소 양방향
	//	@OneToMany(mappedBy="memberId")
	//	private List<DeliveryLocation> memberdelivery=new ArrayList();

}
