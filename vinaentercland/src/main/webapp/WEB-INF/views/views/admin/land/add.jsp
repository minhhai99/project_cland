<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		  <div class="col-md-10">

	  			<div class="row">
	  				<div class="col-md-12 panel-info">
			  			<div class="content-box-header panel-heading">
		  					<div class="panel-title ">Thêm tin mới</div>
			  			</div>
			  			<div class="content-box-large box-with-header">
			  			<form action="${pageContext.request.contextPath}/admin/land/add" method="post" enctype="multipart/form-data">
				  			<div>
								<div class="row mb-10"></div>
								
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="lname">Tên BĐS</label>
											<input name="lname" type="text" class="form-control" placeholder="Nhập tên BĐS">
											<form:errors cssStyle="color: red;" path="land.lname"/>
										</div>
										<div class="form-group">
											<label for="area">Diện tích</label>
											<input name="area" type="text" class="form-control" placeholder="Nhập diện tích BĐS">
											
										</div>
										<div class="form-group">
											<label>Danh mục</label>
											<select name="categoryId" class="form-control">
											<c:choose>
												<c:when test="${not empty categories }">
													<c:forEach items="${categories}" var="category">
														<option value="${category.cid}">${category.cname}</option>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option>không có danh mục nào!</option>
												</c:otherwise>
											</c:choose>
											   
											</select>
										</div>

										<div class="form-group">
											<label>Thêm hình ảnh</label>
											<input name="image" type="file" class="btn btn-default" id="exampleInputFile1">
											<p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
										</div>
										
										
										<div class="form-group">
										   <label for="description">Địa chỉ</label>
										   <textarea name="address" class="form-control" rows="2"></textarea>
										   <form:errors cssStyle="color: red;" path="land.address"/>
										</div>

										<div class="form-group">
										   <label>Mô tả</label>
										   <textarea name="description" class="form-control" rows="3"></textarea>
										   <form:errors cssStyle="color: red;" path="land.description"/>
										</div>
									</div>

									<div class="col-sm-6"></div>

									<div class="col-sm-12">
										<div class="form-group">
										   <label for="detail_text">Chi tiết</label>
										   <textarea name="detail_text" class="form-control" rows="7"></textarea>
										</div>
									</div>
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