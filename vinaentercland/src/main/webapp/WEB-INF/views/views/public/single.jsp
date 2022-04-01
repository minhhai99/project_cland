<%@page import="string.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
				<div class="clearfix main_content floatleft">
				
					
					<div class="clearfix content">
						
						<h1>${land.lname}</h1>
						<div class="clearfix post-meta">
							<p><span><i class="fa fa-clock-o"></i> Địa chỉ: ${land.address}</span> <span><i class="fa fa-folder"></i> Diện tích: ${land.area}m2</span>
							<span><i class="fa fa-eye"></i> lượt xem: ${land.count_views}</span></p>
						</div>
						
						<div class="vnecontent">
							<p>${land.detail_text}</p>
						</div>
						<c:choose>
							<c:when test="${not empty landIdBefor}">
								<a class="btn"
									href="${pageContext.request.contextPath}/${StringUtil.makeSlug(landIdBefor.lname)}-${landIdBefor.lid}.html">Bài
									trước</a>
							</c:when>
							<c:otherwise>
								không có tin nào!
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${not empty landIdNext}">
							<a class="btn" href="${pageContext.request.contextPath}/${StringUtil.makeSlug(landIdNext.lname)}-${landIdNext.lid}.html">Bài kế</a>
							</c:when>
							<c:otherwise>
								không có tin nào!
							</c:otherwise>
						</c:choose>

		
					
					</div>
					
						<div class="more_themes">
							<h2>Bất động sản liên quan <i class="fa fa-thumbs-o-up"></i></h2>
							<div class="more_themes_container">
							<c:choose>
								<c:when test="${not empty lands}">
									<c:forEach items="${lands}" var="land">
										<div class="single_more_themes floatleft">
											<img src="${pageContext.request.contextPath}/resources/files/${land.picture}" alt=""/>
											<a href="${pageContext.request.contextPath}/${StringUtil.makeSlug(land.lname)}-${land.lid}.html"><h2>${land.lname}</h2></a>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
								
								</c:otherwise>
							</c:choose>

							</div>
						</div>
					
				</div>
				