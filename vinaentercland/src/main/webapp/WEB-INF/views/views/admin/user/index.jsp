<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <div class="col-md-10">

  			<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý người dùng</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<a href="${pageContext.request.contextPath}/admin/user/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>
					</div>
					<form action="${pageContext.request.contextPath}/admin/user/search" method="get">
	                	<div class="col-md-4">
	                 	 <div class="input-group form">
	                       <input name="search" type="text" class="form-control" placeholder="Search...">
	                       <span class="input-group-btn">
	                        <input type="submit" value="Search" class="btn btn-primary" />
	                       </span>
	                  	 </div>
	                  	</div>
                  	</form>
				</div>
				<c:if test="${not empty msg}">
					<div class="row">
						<div class="col-md-12">
							<div class="alert alert-success" role="alert">${msg}</div>
						</div>
					</div>
				</c:if>
		<div class="row">
  				<div class="panel-body">
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th>ID</th>
								<th>Tên đăng nhập</th>
								<th>Họ tên</th>
								<th>Role</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty listUser}">
								<c:forEach items="${listUser}" var="user">
									<tr class="odd gradeX">
										<td>${user.id}</td>
										<td>${user.username}</td>
										<td>${user.full_name}</td>
										<td>${user.role.roleName}</td>
										<td class="center text-center">
											<a href="${pageContext.request.contextPath}/admin/user/edit/${user.id}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                                    <a onclick="return confirm('Bạn có chắc chắn muốn xoá ${user.username}')" href="${pageContext.request.contextPath}/admin/user/del/${user.id}" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
										</td>
									</tr>
								</c:forEach>
								</c:when>
								<c:otherwise>
									<c:choose>
							<c:when test="${not empty listSearch}">
								<c:forEach items="${listSearch}" var="user">
									<tr class="odd gradeX">
										<td>${user.id}</td>
										<td>${user.username}</td>
										<td>${user.full_name}</td>
										<td>${user.role.roleName}</td>
										<td class="center text-center">
											<a href="${pageContext.request.contextPath}/admin/user/edit/${user.id}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                                    <a onclick="return confirm('Bạn có chắc chắn muốn xoá ${user.username}')" href="${pageContext.request.contextPath}/admin/user/del/${user.id}" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
										</td>
									</tr>
								</c:forEach>
								</c:when>
								<c:otherwise>
								<tr>
									<td colspan="5" style="text-align: center">
										không có người dùng nào!
									</td>
								</tr>
								</c:otherwise>
							</c:choose>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>

					<!-- Pagination -->
					
					<nav class="text-center" aria-label="...">
					   <ul class="pagination">
					   <c:choose>
					   	<c:when test="${page == 1}">
					   		<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					   	</c:when>
					   	<c:otherwise>
					   		<li><a href="${pageContext.request.contextPath}/admin/user/index?page=${page - 1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					   	</c:otherwise>
					   </c:choose>
					      
					      <c:forEach begin="1" end="${numberOfPage}" step="1" varStatus="loop">
					      	<c:choose>
					      		<c:when test="${loop.count == page}">
					      			<li class="active"><a href="${pageContext.request.contextPath}/admin/user/index?page=${loop.count}">${loop.count} <span class="sr-only">(current)</span></a></li>
					      		</c:when>
					      		<c:otherwise>
					      			<li><a href="${pageContext.request.contextPath}/admin/user/index?page=${loop.count}">${loop.count} <span class="sr-only">(current)</span></a></li>
					      		</c:otherwise>
					      	</c:choose>
					      	
					      </c:forEach>
					      <c:choose>
						   	<c:when test="${page == numberOfPage}">
						   		<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						   	</c:when>
						   	<c:otherwise>
						   		<li><a href="${pageContext.request.contextPath}/admin/user/index?page=${page + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
						   	</c:otherwise>
					   	</c:choose>
					      
					     
					   </ul>
					</nav>
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div><!-- /.content-box-large -->



		  </div>