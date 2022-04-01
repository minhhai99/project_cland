<%@page import="string.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
				<div class="clearfix sidebar_container floatright">
					<div class="clearfix sidebar">
						<div class="clearfix single_sidebar category_items">
							<h2>Danh mục bất động sản</h2>
							<ul>
							<c:choose>
								<c:when test="${not empty categories}">
									<c:forEach items="${categories}" var="category">
									<li class="cat-item"><a href="${pageContext.request.contextPath}/danh-muc/${StringUtil.makeSlug(category.cname)}-${category.cid}">${category.cname}</a>(${landDAO.countItemByCategoryId(category.cid)})</li>
										
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li class="cat-item"><a href="">không có danh mục nào!</a>(12)</li>
								</c:otherwise>
							</c:choose>
							</ul>
						</div>

						<div class="clearfix single_sidebar">
							<div class="popular_post">
								<div class="sidebar_title"><h2>Xem nhiều</h2></div>
								<ul>
								<c:choose>
									<c:when test="${not empty landViews}">
										<c:forEach items="${landViews}" var="landView">
											<li><a href="${pageContext.request.contextPath}/${StringUtil.makeSlug(landView.lname)}-${landView.lid}.html" >${landView.lname} </a></li>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<li><a href="#">Không có tin nào </a></li>
									</c:otherwise>
								</c:choose>
								</ul>
							</div>
							</div>
						
						<div class="clearfix single_sidebar">
							<h2>Danh mục hot</h2>
							<ul>
							<c:choose>
									<c:when test="${not empty landHot}">
										<c:forEach items="${landHot}" var="landH">
											<li><a href="${pageContext.request.contextPath}/danh-muc/${StringUtil.makeSlug(landH.category.cname)}-${landH.category.cid}">${landH.category.cname} <span>(${landH.count})</span></a></li>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<li><a href="#">Không có tin nào <span>(0)</span></a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>