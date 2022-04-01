<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		  <div class="col-md-10">

  			<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý danh mục</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<a href="${pageContext.request.contextPath}/admin/cat/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

					</div>
					<form action="${pageContext.request.contextPath}/admin/cat/search" method="get">
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
								<th>Tên danh mục</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty listCat}">
								<c:forEach items="${listCat}" var="category">
									<tr class="odd gradeX">
										<td>${category.cid}</td>
										<td>${category.cname}</td>
										<td class="center text-center">
											<a href="${pageContext.request.contextPath}/admin/cat/edit/${category.cid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                                    <a onclick="return confirm('Bạn có chắc chắn muốn xoá ${category.cname}?')" href="${pageContext.request.contextPath}/admin/cat/del/${category.cid}" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:choose>
							<c:when test="${not empty listSearch}">
								<c:forEach items="${listSearch}" var="search">
									<tr class="odd gradeX">
										<td>${search.cid}</td>
										<td>${search.cname}</td>
										<td class="center text-center">
											<a href="${pageContext.request.contextPath}/admin/cat/edit/${search.cid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                                    <a onclick="return confirm('Bạn có chắc chắn muốn xoá ${search.cname}?')" href="${pageContext.request.contextPath}/admin/cat/del/${search.cid}" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
										<td colspan="3" style="text-align: center">không có danh mục nào!</td>
									</tr>
							</c:otherwise>
						</c:choose>
							</c:otherwise>
						</c:choose>
							
						</tbody>
					</table>

					<!-- Pagination -->
					<!-- <nav class="text-center" aria-label="...">
					   <ul class="pagination">
					      <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					      <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
					      <li><a href="#">2</a></li>
					      <li><a href="#">3</a></li>
					      <li><a href="#">4</a></li>
					      <li><a href="#">5</a></li>
					      <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
					   </ul>
					</nav> -->
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div><!-- /.content-box-large -->



		  </div>