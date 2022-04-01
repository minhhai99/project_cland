<%@page import="string.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
				<div class="clearfix main_content floatleft">
				
					
					<div class="clearfix content">
						<div class="content_title"><h2>${category.cname}</h2></div>
						
						<div class="clearfix single_work_container">
						<c:choose>
							<c:when test="${not empty lands}">
								<c:forEach items="${lands}" var="land">
									<div class="clearfix single_work">
										<img class="img_top" src="${pageContext.request.contextPath}/resources/files/${land.picture}" alt=""/>
										<img class="img_bottom" src="${pageContext.request.contextPath}/resources/files/${land.picture}" alt=""/>
										<h2>${land.lname}</h2>
										<a href="${pageContext.request.contextPath}/${StringUtil.makeSlug(land.lname)}-${land.lid}.html"><p class="caption">${land.description}</p></a>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p style="color: red;" align="center"> không có tin nào!</p>
							</c:otherwise>
						</c:choose>
							
							
							<div class="clearfix work_pagination">
								<nav>
								 <c:choose>
									<c:when test="${not empty categoryDef}">
										<a class="newer floatleft" href="${pageContext.request.contextPath}/danh-muc/${StringUtil.makeSlug(categoryDef.cname)}-${categoryDef.cid}"> < -- Bài trước</a>
									</c:when>
									<c:otherwise>
										không có tin nào!
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${not empty categoryNext}">
										<a class="older floatright" href="${pageContext.request.contextPath}/danh-muc/${StringUtil.makeSlug(categoryNext.cname)}-${categoryNext.cid}">Bài kế -- ></a>
									</c:when>
									<c:otherwise>
										không có tin nào!
									</c:otherwise>
								</c:choose>
									
								</nav>
							</div>

						</div>
					</div>
					
				</div>
				