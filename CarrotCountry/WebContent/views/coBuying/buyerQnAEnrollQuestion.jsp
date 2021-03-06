<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="com.javachip.carrotcountry.coBuying.model.vo.*"
%>    

<%
	QnA qa = (QnA)request.getAttribute("qa");
	Product pd = (Product)request.getAttribute("pd");
	PostBoardJY pb = (PostBoardJY)request.getAttribute("pb"); 
	int Bbno = (int)request.getAttribute("bno");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
<style>
/* 전반적인 큰 틀 */
.wrap{width:1200px;height:800px;margin:auto;}
#content{height: 100%;}

#content>div{width: 100%; float: left;}
#content1{height: 10%; padding: 20px;}
#content2{height: 80%;}
#btnArea{height:10%; width:1180px}

/* 타이틀 (content1) */
#title{
    width: 200px;
    height: 40px;
    padding: 5px;
    background: lightgray;
    border-radius: 20px;
    margin-top: 20px;
}
#title>h5{font-weight: 900;}
#content>h4{
    display: inline-block;
    padding: 30px;
    color: gray;
}

/* 질문 에디터 */
#editorTable{margin: 90px;}
#editorTable>thead{
    background: lightgray;
    text-align: center;
    font-weight: 600;
    height: 50px;
}
#writeBtn{
    display: inline-block;
    margin-right:95px;
}
</style>    
</head>
<body>

<%@ include file="../common/commonNavbar.jsp"%>
    
    <div class="wrap">
        <div id="content">
            <div id="content1">
                <div id="title">
                    <h5 align="center">Q & A 질문하기</h5>
                </div>
            </div>
            
        <form id="questionEnrollForm" action="<%= contextPath %>/buyerinsert.qna.jy">
        	<input type="hidden" name="Bbno" value="<%=Bbno%>">
            <br><br><br>
            <div id="btnArea">
                
            </div>
            <div id="content2"  align="center">
            <input type="hidden" name="userNo" value="<%= loginMember.getMemNo() %>">
                   <!-- 에디터 -->
                <table id="editorTable" width="1000" class="table-bordered">
                    <thead>
                        <tr>
                            <td>질문입력</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td> &nbsp;&nbsp;<input name="title" id="textTitle" type="text" name="title" style="height:40px; width:900px;" placeholder="제목을 입력하세요" required></td>
                        </tr>
                        <tr>
                            <td>
                                <textarea name="content" id="editor" style="max-height: 10px;"></textarea>
                            </td>
                        </tr>
                </table>
               <button id="writeBtn" class="btn btn-secondary" style="float: right;">등록하기</button>
            </div>
            </form>
        </div>

    </div>


        <script>
        ClassicEditor
            .create( document.querySelector( '#editor' ) , {
               
                removePlugins: ['ImageUpload']
            } )  
            .catch( error => {
                console.error( error );
            } );

        </script>
        
        
<%@ include file="../common/footerbar.jsp"%>

</body>
</html>