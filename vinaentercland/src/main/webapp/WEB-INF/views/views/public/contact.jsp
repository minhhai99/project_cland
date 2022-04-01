<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
				<div class="clearfix main_content floatleft">
				
					
					<div class="clearfix content">
						
						<div class="contact_us">
						
							<h1>Liên hệ với chúng tôi</h1>
							
							<p>
							TRUNG TÂM ĐÀO TẠO LẬP TRÌNH VINAENTER EDU<br />
							Trụ sở: 154 Phạm Như Xương, Liên Chiểu, Đà Nẵng<br />
							Web: <a href="http://vinaenter.edu.vn" title="">www.vinaenter.edu.vn</a>
							</p>
							<c:if test="${not empty msg}">
								<p style="color: red;">${msg}</p>
							</c:if>
							<form action="${pageContext.request.contextPath}/lien-he" method="post">
								<p><input name="fullname" type="text" class="wpcf7-text" placeholder="Họ tên *"/></p>
								<form:errors cssStyle="color: red;" path="contact.fullname"/>
								<p><input name="email" type="text" class="wpcf7-email" placeholder="Email *"/></p>
								<form:errors cssStyle="color: red;" path="contact.email"/>
								<p><input name="subject" type="text" class="wpcf7-text" placeholder="Subject*"/></p>
								<form:errors cssStyle="color: red;" path="contact.subject"/>
								<p><textarea name="content" class="wpcf7-textarea" placeholder="Nội dung *"></textarea></p>
								<form:errors cssStyle="color: red;" path="contact.content"/>
								<p><input type="Submit" class="wpcf7-submit" value="Gửi liên hệ"/></p>
							</form>
							
						</div>
						
					</div>
					
					
				</div>
				