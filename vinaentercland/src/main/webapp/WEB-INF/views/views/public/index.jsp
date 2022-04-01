<%@page import="string.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			
				<div class="clearfix main_content floatleft">
				
					<div class="clearfix slider">
						<ul class="pgwSlider">
							<li><img src="${pageContext.request.contextPath}/publicUrl/images/thumbs/megamind_07.jpg" alt="Paris, France" data-description="Eiffel Tower and Champ de Mars" data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/megamind_07.jpg"/></li>
							<li><img src="${pageContext.request.contextPath}/publicUrl/images/thumbs/wall-e.jpg" alt="Montréal, QC, Canada" data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/wall-e.jpg" data-description="Eiffel Tower and Champ de Mars"/></li>
							<li>
								<img src="${pageContext.request.contextPath}/publicUrl/images/thumbs/up-official-trailer-fake.jpg" alt="Shanghai, China" data-large-src="${pageContext.request.contextPath}/publicUrl/images/slides/up-official-trailer-fake.jpg" data-description="Shanghai ,chaina">
							</li>


						</ul>
					</div>
					
					<div  class="clearfix content">
						<div class="content_title"><h2>Bài viết mới</h2></div>
						<c:choose>
							<c:when test="${not empty lands}">
								<c:forEach items="${lands}" var="land">
										<div id="clearfix single_content" class="clearfix single_content">
											<div class="clearfix post_date floatleft">
												<div class="date">
													<h3>
														<fmt:formatDate value="${land.date_create}" pattern="dd"/>
													</h3>
													<p>Tháng <fmt:formatDate value="${land.date_create}" pattern="M"/></p>
												</div>
											</div>
											<div class="clearfix post_detail">
												<h2><a href="${pageContext.request.contextPath}/${StringUtil.makeSlug(land.lname)}-${land.lid}.html">${land.lname} </a></h2>
												<div class="clearfix post-meta">
													<p><span><i class="fa fa-clock-o"></i> Địa chỉ: ${land.address}</span> <span><i class="fa fa-folder"></i> Diện tích: ${land.area}m2</span> 
													<span><i class="fa fa-eye"></i> lượt xem: ${land.count_views}</span></p>
												</div>
												<div class="clearfix post_excerpt">
													<img src="${pageContext.request.contextPath}/resources/files/${land.picture}" alt=""/>
													<p>${land.description} </p>
												</div>
												<a href="${pageContext.request.contextPath}/${StringUtil.makeSlug(land.lname)}-${land.lid}.html">Đọc thêm</a>
											</div>
										</div>	
								</c:forEach>
							</c:when>
							<c:otherwise>
							<%-- <c:choose>
								<c:when test="${not empty landSearch}">
									<c:forEach items="${landSearch}" var="land">
											<div class="clearfix single_content">
												<div class="clearfix post_date floatleft">
													<div class="date">
														<h3>
															<fmt:formatDate value="${land.date_create}" pattern="dd"/>
														</h3>
														<p>Tháng <fmt:formatDate value="${land.date_create}" pattern="M"/></p>
													</div>
												</div>
												<div class="clearfix post_detail">
													<h2><a href="${pageContext.request.contextPath}/${StringUtil.makeSlug(land.lname)}-${land.lid}.html">${land.lname} </a></h2>
													<div class="clearfix post-meta">
														<p><span><i class="fa fa-clock-o"></i> Địa chỉ: ${land.address}</span> <span><i class="fa fa-folder"></i> Diện tích: ${land.area}m2</span> 
														<span><i class="fa fa-eye"></i> lượt xem: ${land.count_views}</span></p>
													</div>
													<div class="clearfix post_excerpt">
														<img src="${pageContext.request.contextPath}/resources/files/${land.picture}" alt=""/>
														<p>${land.description} </p>
													</div>
													<a href="${pageContext.request.contextPath}/${StringUtil.makeSlug(land.lname)}-${land.lid}.html">Đọc thêm</a>
												</div>
											</div>	
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div>
										không có tin tức nào!
									</div>
								</c:otherwise>
							</c:choose> --%>
							</c:otherwise>
						</c:choose>

						
					</div>
					
					<div class="pagination">
						<nav>
							<ul>
							<c:choose>
								<c:when test="${page ==  1}">
									<li class="active"><a href="#"> << </a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.request.contextPath}/index?page=${page - 1}"> << </a></li>
								</c:otherwise>
							</c:choose>
								
								<c:forEach begin="1" end="${numberOfPages}" step="1" varStatus="loop">
									<c:choose>
										<c:when test="${loop.count == page}">
											<li class="active"><a href="${pageContext.request.contextPath}/index?page=${loop.count}">${loop.count}</a></li>
										</c:when>
										<c:otherwise>
											<li class=""><a href="${pageContext.request.contextPath}/index?page=${loop.count}">${loop.count}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
								<c:when test="${page ==  numberOfPages}">
									<li class="active"><a href="#"> >> </a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.request.contextPath}/index?page=${page + 1}"> >> </a></li>
								</c:otherwise>
							</c:choose>
								
							</ul>
						</nav>
					</div>
				</div>
<script type="text/javascript">
	function searchByName(param) {
		 var txtSearch = param.value;
		$.ajax({
			url: '${pageContext.request.contextPath}/search',
			type: 'get',
			cache: false,
			data: {
				search: txtSearch
			},
			success: function (data){
				alert(data);
				/* $('.clearfix single_content').html(data); */
				 var row = document.getElementById("clearfix single_content");
				row.innerHTML = data; 
			},
			error: function (){
				
			}
		});
		 return false; 
	}
</script>