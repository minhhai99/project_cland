<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		  <div class="col-md-10">

	  			<div class="row">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Thêm người dùng</div>
			  			</div>
			  			<div class="content-box-large box-with-header">
			  			<form action="${pageContext.request.contextPath}/admin/user/add" method="post">
				  			<div>
				  			
								<div class="row mb-10"></div>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="username">Tên đăng nhập</label>
												<input  name="username" type="text" class="form-control" placeholder="Nhập tên đăng nhập"><br />
												<form:errors cssStyle="color: red;" path="user.username" />
											</div>
											<div class="form-group">
												<label for="full_name">Họ tên</label>
												<input  name="full_name" type="text" class="form-control" placeholder="Nhập họ tên"><br />
												<form:errors cssStyle="color: red;" path="user.full_name" />
											</div>
											
											<div class="form-group">
												<label for="password">Mật khẩu</label>
												<input  name="password" type="password" class="form-control" placeholder="Nhập mật khẩu"><br />
												<form:errors cssStyle="color: red;" path="user.password" />
											</div>

											<div class="form-group">
												<label for="roleId" >Role</label> 
												<select name="roleId" class="form-control">
												<c:choose>
													<c:when test="${not empty roles}">
														<c:forEach items="${roles}" var="role">
															<option value="${role.rid}">${role.roleName}</option>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<option>không có quyền nào</option>
													</c:otherwise>
												</c:choose>
												</select>
											</div>
										</div>
										<div class="col-sm-6"></div>
	
									</div>
	
									<hr>
	
									<div class="row">
										<div class="col-sm-12">
											<input type="submit" value="Thêm" class="btn btn-success" />
											<input type="reset" value="Nhập lại" class="btn btn-default" />
										</div>
									</div>

							</div>
							</form>
						</div>
			  		</div>
	  			</div><!-- /.row col-size -->
	  		
		  </div>