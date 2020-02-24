<%-- 
    Document   : contact
    Created on : Mar 30, 2017, 4:43:46 PM
    Author     : Phan Tuan Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>contact</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <div class="contact">                   
                    <div class="col-md-6 contact-top">
                        <h3>Thông tin liên hệ</h3>
                        <div class="left-content">
                            <div class="row">
                                <p><strong>Trụ sở chính và Nhà máy xe máy thứ nhất, thứ hai:</strong><br> Phường Phúc Thắng, thị xã Phúc Yên, tỉnh Vĩnh Phúc, Việt Nam<br> Tel: (84) 211 3868888<br> Fax: (84) 211 3868910</p>
                                <p>&nbsp;</p>
                                <p><strong>Nhà máy thứ 3:</strong></p>
                                <p>Khu công Đồng Văn II, Duy Tiên, Hà Nam<br> Tel: (84) 3 51396 6666<br> Fax: (84) 3 513572 666</p>
                                <p>&nbsp;</p>
                                <p><strong>Văn phòng đại diện Hà Nội:</strong><br> Tầng 7, Việt Tower, 1 Thái Hà, Đống Đa, Hà Nội<br> Tel: (84) 4 6256 7567<br> Fax: (84) 4 3836 0001</p>
                                <p>&nbsp;</p>
                                <p><strong>Văn phòng đại diện Hồ Chí Minh:</strong><br> Tầng 8, Zen Plaza, 54-56 Nguyễn Trãi, Quận 1, Hồ Chí Minh<br> Tel: (84) 8 3925 6949<br> Fax: (84) 8 3925 6948</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 contact-top">
                        <h3>Hãy điền vào mẫu bên dưới để được chúng tôi giải đáp thắc mắc của bạn sớm nhất!</h3>
                        <div>
                            <span>Họ Tên </span>		
                            <input type="text" value="" >						
                        </div>
                        <div>
                            <span>Email </span>		
                            <input type="text" value="" >						
                        </div>
                        <div>
                            <span>Số Điện Thoại</span>		
                            <input type="text" value="" >	
                        </div>
                        <div>
                            <span>Nội Dung</span>		
                            <textarea> </textarea>	
                        </div>
                        <input type="submit" value="Gửi" >	
                    </div>
                    <div class="clearfix"> </div>
                </div>
            <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
