<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <div class="col-md-10">

  			<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý liên hệ</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
					</div>
                	<div class="col-md-4">
                 	 <div class="input-group form">
                       <input type="text" class="form-control" placeholder="Search...">
                       <span class="input-group-btn">
                         <button class="btn btn-primary" type="button">Search</button>
                       </span>
                  	 </div>
                  	</div>
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
								<th>Họ tên</th>
								<th>Email</th>
								<th>Phòng/Ban</th>
								<th>Nội dung</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty listContact}">
								<c:forEach items="${listContact}" var="contact">
									<tr class="odd gradeX">
										<td>${contact.vid}</td>
										<td>${contact.fullname}</td>
										<td>${contact.email}</td>
										<td class="center"> ${contact.subject}</td>
										<td class="center text-center">
											${contact.content}
										</td>
										<td class="center text-center">
		                                    <a onclick="return confirm('Bạn có chắc chắn muốn xoá ${contact.fullname}')" href="${pageContext.request.contextPath}/admin/contact/del/${contact.vid}" title="" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
										</td>
									</tr>
								</c:forEach>
								</c:when>
								<c:otherwise>
								<tr>
									<td colspan="3" style="text-align: center">không có danh
										mục nào!</td>
								</tr>
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
					   		<li class=""><a href="${pageContext.request.contextPath}/admin/contact?page=${page - 1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					   	</c:otherwise>
					   </c:choose>
					      
					    <c:forEach begin="1" end="${numberOfPages}" step="1" varStatus="loop">
					     <c:choose>
					     	<c:when test="${loop.count == page}">
					     			<li class="active"><a href="${pageContext.request.contextPath}/admin/contact?page=${loop.count}">${loop.count} <span class="sr-only">(current)</span></a></li>
					     	</c:when>
					     	<c:otherwise>
					     		<li class=""><a href="${pageContext.request.contextPath}/admin/contact?page=${loop.count}">${loop.count}<span class="sr-only">(current)</span></a></li>
					     	</c:otherwise>
					     </c:choose>
					    </c:forEach>
					    <c:choose>
					   	<c:when test="${page == numberOfPages}">
					   		<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
					   	</c:when>
					   	<c:otherwise>
					   		<li><a href="${pageContext.request.contextPath}/admin/contact?page=${page + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
					   	</c:otherwise>
					   </c:choose>
					      
					   </ul>
					</nav>
					<!-- /.pagination -->
					
  				</div>
  				</div><!-- /.row -->
  			</div><!-- /.content-box-large -->



		  </div>