<%@page import="string.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <section id="header_area">
			<div class="wrapper header">
				<div class="clearfix header_top">
					<div class="clearfix logo floatleft">
						<a href="${pageContext.request.contextPath}/index"><h1><span>C</span>Land</h1></a>
					</div>
					<div class="clearfix search floatright">
						<form action="${pageContext.request.contextPath}/search" method="get">
							<input oninput="searchByName(this)" value="${search}" name="search" type="text" placeholder="Search"/>
							<input type="submit" />
						</form>
					</div>
				</div>
				<div class="header_bottom">
					<nav>
						<ul id="nav">
							<li><a href="${pageContext.request.contextPath}/index">Trang chủ</a></li>
							<li id="dropdown"><a href="#">Bất động sản</a>
								<ul>
								<c:choose>
									<c:when test="${not empty categories}">
										<c:forEach items="${categories}" var="category">
											<li><a href="${pageContext.request.contextPath}/danh-muc/${StringUtil.makeSlug(category.cname)}-${category.cid}">${category.cname}</a></li>
										</c:forEach>
									</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose>
								</ul>
							</li>
							<li><a href="${pageContext.request.contextPath}/lien-he">Liên hệ</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</section>