<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		  <div class="col-md-10">

  			<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý bất động sản</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<a href="${pageContext.request.contextPath}/admin/land/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

					</div>
					<form action="${pageContext.request.contextPath}/admin/land/search" method="get">
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
								<th>Tên tin</th>
								<th>Mô tả</th>
								<th>Diện tích</th>
								<th>Ngày đăng</th>
								<th>Danh mục</th>
								<th>Hình ảnh</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty listLands}">
								<c:forEach items="${listLands}" var="land">
									<tr class="odd gradeX">
										<td>${land.lid}</td>
										<td>${land.lname}</td>
										<td class="center">
										<c:choose>
											<c:when test="${land.description.length() > 100}">
												${land.description.substring(0, 100)} ...
											</c:when>
											<c:otherwise>
												${land.description}
											</c:otherwise>
										</c:choose>
										</td>
										<td class="center">${land.area}</td>
										<td class="center">${land.date_create}</td>
										<td>${land.category.cname}</td>
										<td class="center text-center">
										<c:url value="/resources/files" var="img"></c:url>
											<img style="width: 100px" src="${img}/${land.picture}" />
										</td>
										<td class="center text-center">
											<a href="${pageContext.request.contextPath}/admin/land/edit/${land.lid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                                    <a onclick="return confirm('Bạn có chắc chắn muốn xoá ${land.lname}')" href="${pageContext.request.contextPath}/admin/land/del/${land.lid}" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
										</td>
									</tr>
								</c:forEach>							
								</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty landSearch}">
										<c:forEach items="${landSearch}" var="land">
											<tr class="odd gradeX">
												<td>${land.lid}</td>
												<td>${land.lname}</td>
												<td class="center">
												<c:choose>
													<c:when test="${land.description.length() > 100}">
														${land.description.substring(0, 100)} ...
													</c:when>
													<c:otherwise>
														${land.description}
													</c:otherwise>
												</c:choose>
												</td>
												<td class="center">${land.area}</td>
												<td class="center">${land.date_create}</td>
												<td>${land.category.cname}</td>
												<td class="center text-center">
												<c:url value="/resources/files" var="img"></c:url>
													<img style="width: 100px" src="${img}/${land.picture}" />
												</td>
												<td class="center text-center">
													<a href="${pageContext.request.contextPath}/admin/land/edit/${land.lid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
				                                    <a onclick="return confirm('Bạn có chắc chắn muốn xoá ${land.lname}')" href="${pageContext.request.contextPath}/admin/land/del/${land.lid}" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
												</td>
											</tr>
										</c:forEach>							
										</c:when>
									<c:otherwise>
										<tr>
											<td colspan="8" style="text-align: center">không có tin tức nào!</td>
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
					   		<li><a href="${pageContext.request.contextPath}/admin/land/index?page=${page - 1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					   	</c:otherwise>
					   </c:choose>
					      <c:forEach begin="1" end="${numberOfPages}" step="1" varStatus="loop">
					      	<c:choose>
					      	<c:when test="${loop.count == page}">
					      		<li class="active"><a href="${pageContext.request.contextPath}/admin/land/index?page=${loop.count}">${loop.count} <span class="sr-only">(current)</span></a></li>
					      	</c:when>
					      	<c:otherwise>
					      		<li><a href="${pageContext.request.contextPath}/admin/land/index?page=${loop.count}">${loop.count}<span class="sr-only">(current)</span></a></li>
					      	</c:otherwise>
					      </c:choose>
					      </c:forEach>
							<c:choose>
							   	<c:when test="${page == numberOfPages}">
							   		<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
							   	</c:when>
							   	<c:otherwise>
							   		<li><a href="${pageContext.request.contextPath}/admin/land/index?page=${page + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
							   	</c:otherwise>
						   </c:choose>					      
					      
					   </ul>
					</nav>
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div><!-- /.content-box-large -->



		  </div>