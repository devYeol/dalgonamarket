package com.dal.dalgona.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import com.dal.dalgona.common.model.vo.Roles;

//public class RolesTypeHandler extends BaseTypeHandler<Roles> {
public class RolesTypeHandler implements TypeHandler<Roles> {

	@Override
	public void setParameter(PreparedStatement ps, int i, Roles roles, JdbcType jdbcType) throws SQLException {
		// TODO Auto-generated method stub
		
		if(roles.getKey() == null) {
			ps.setString(i, roles.getKey());
		}
		
	}

	@Override
	public Roles getResult(ResultSet rs, String columnName) throws SQLException {
		// TODO Auto-generated method stub
		return Roles.valueOf(rs.getString(columnName));
	}

	@Override
	public Roles getResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return Roles.valueOf(rs.getString(columnIndex));
	}

	@Override
	public Roles getResult(CallableStatement cs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return Roles.valueOf(cs.getString(columnIndex));
	}
	
}
