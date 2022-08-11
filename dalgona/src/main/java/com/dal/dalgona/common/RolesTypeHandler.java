//package com.dal.dalgona.common;
//
//import java.sql.CallableStatement;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import org.apache.ibatis.type.BaseTypeHandler;
//import org.apache.ibatis.type.JdbcType;
//
//import com.dal.dalgona.common.model.vo.Roles;
//
//public class RolesTypeHandler extends BaseTypeHandler<Roles> {
//
//	@Override
//	public void setNonNullParameter(PreparedStatement ps, int i, Roles parameter, JdbcType jdbcType)
//			throws SQLException {
//		ps.setString(i, parameter.getValue());
//	}
//
//	@Override
//	public Roles getNullableResult(ResultSet rs, String columnName) throws SQLException {
//		// TODO Auto-generated method stub
//		return Roles.valueOf(rs.getString(columnName));
//	}
//
//	@Override
//	public Roles getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
//		// TODO Auto-generated method stub
//		return Roles.valueOf(rs.getString(columnIndex));
//	}
//
//	@Override
//	public Roles getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
//		// TODO Auto-generated method stub
//		return Roles.valueOf(cs.getString(columnIndex));
//	}
//	
//	
//
//}
