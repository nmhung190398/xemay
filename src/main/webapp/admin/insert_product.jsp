

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Product</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        <script src="ckeditor/ckeditor.js"></script>
<script src="ckfinder/ckfinder.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h2>Thêm sản phẩm</h2>
                    <form action="/web/ManagerProductServlet" method="post">                   
                    <table width="95%">
                        <tr><td width="150px"><b>Tên sản phẩm</b></td><td><input type="text" name="tensp" class="pendek"></td></tr>
                        <tr><td><b>Giá</b></td><td><input type="number" name="gia" class="sedang"></td></tr>                       
                        <tr><td><b>Loại</b></td><td>
                                <select name="loai">
                                    <option selected value="1" >-- Xe số --</option>
                                    <option value="2">Xe ga</option>
                                    <option value="2">Xe côn tay</option>
                                    <option value="2">Phụ Tùng</option>
                                </select>
                            </td></tr>
                        <tr><td><b>Hình ảnh</b></td><td><input type="file" name="hinhanh" class="panjang"></td></tr>
                        <script type="text/javascript">
var editor = CKEDITOR.replace( 'NoiDung',{
  filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?Type=Images',
  filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?Type=Flash',
  filebrowserImageUploadUrl : 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
  filebrowserFlashUploadUrl : 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash',
	height: '500px',
  toolbar:[
  { name: 'document', items : [ 'Source','-','Templates' ] },
  { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
  { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
  { name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton',
        'HiddenField' ] },
  '/',
  { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
  { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',
  '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
  { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
  { name: 'insert', items : [ 'Image','MediaEmbed','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ] },
  '/',
  { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
  { name: 'colors', items : [ 'TextColor','BGColor' ] },
  { name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
  ]
});
</script>
                        <tr><td><b>Mô tả</b></td><td><textarea name="mota" id="motaa"></textarea></td></tr>
                        <script>    CKEDITOR.replace( 'motaa' );</script>
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="insert">
                                <input type="submit" class="button" value="Thêm">
                                
                            </td></tr>
                    </table>
                        </form>
                </div>
                <div class="clear"></div>

            

        </div>


    </body>
</html>
