<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javachip.carrotcountry.shMarketBoard.mainPage.model.vo.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.javachip.carrotcountry.shMarketBoard.townMarket.model.vo.CommentHY" %>
<%@ page import="com.javachip.carrotcountry.shMarketBoard.townMarket.model.vo.PhotoBoardVo" %>
<%
PostBoard pb = (PostBoard)request.getAttribute("pb");
//String 게시글번호,String 카테고리번호,int member번호, String 시역 ex 서울시 송파구 , 닉네임 , 게시글번호 , 게시글 제목, 내용 , 카테고리 이름, 상품상태, 거래유형,거래지역, 썸네일 패스, 썸네일 이름, 썸내일 로드패스, 조회수, likes,가격,게시일.
ArrayList<CommentHY> list = (ArrayList)request.getAttribute("list");
//댓글식별값,닉네임,게시일,내용,공개비공개 체크,보드넘버.
ArrayList<PhotoBoardVo> pList = (ArrayList)request.getAttribute("pList");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
    width: 800px;
    min-height:100%;
    margin:auto;
    border:2px solid rgb(255, 166, 0);
    border-radius: 15px;
    box-shadow: 3px 3px 0.5px 0.5px rgb(255, 189, 35);
    background-color: whitesmoke;
}
.carousel-item.active > img {
    border-radius: 10px;
}
.carousel-inner{
    width:100%;
    height:100%;
}
.userInfo_display {
    height:75px;
    width:100%;
    background-color: aliceblue;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding:0px 30px 0px 30px;
}
/* like 버튼 CSS */
.like_button{
   cursor: pointer;
   background-color: green;
}
.like_button:active {
    background-color:red;
}
.like_button > i {
    color:orange;
    font-size: larger;
}
.like_button:active , i:active {
    font-size:1.5rem;
    color:white;
}
.userContent {
    text-align: center;
    min-height: 200px;
}
/* Comment CSS 구간. */
.comment_display {
    width:750px;
    margin: auto;
    display: flex;
    padding-left: 26px;
    margin-top: 10px;
}
.comment_content {
    min-height: 100px;
    width:81.8%;
    background-color: white;
    padding:0px 10px 0px 10px;
}
.comment_control_button {
    display:flex;
    justify-content: space-between;
}
.left_date {
    font-size: 1rem;
    color:darkgray;
}
.comment_user_info {margin:0px;}
.right_icons > i {
    font-size: 1.5rem;
    margin-left: 15px;
}
.comment_condition {
    display: flex;
    align-items: center;
}
.comment_condition > i {
    font-size:1.5rem;
    margin-left: 10px;
}

.comment_textarea {min-height: 50px;}
.navbar.navbar-8 .navbar-toggler-icon {background-image: url('https://mdbootstrap.com/img/svg/hamburger4.svg?color=1729B0');}
.nav-item {
    border-radius: 5px;
    background-color: whitesmoke;
}
.nav-link {color:black;}
</style>
</head>
<body>
  <!-- ↓ 토글버튼. + 신고버튼 부모 div ↓ -->
  
  <%@ include file="../common/commonNavbar.jsp"%>
  
    <div class="button_wrapper" 
         style="width:1000px;
                max-height: 0px;
                margin:auto;            
                " >
                <% if(loginMember!=null) {%>
        <nav class="navbar navbar-light navbar-8 white"
             style="display: inline-flex;
                    position: relative;
                    top:45px;
                    left:888px;
                    z-index: 1;">
 <%if(loginMember.getMemNickname().equals(pb.getMemNickname())){%>
            <button class="navbar-toggler" 
                    type="button" 
                    data-toggle="collapse" 
                    data-target="#navbarSupportedContent15"
                    aria-controls="navbarSupportedContent15" 
                    aria-expanded="false" 
                    aria-label="Toggle navigation"
                    style="border:2px solid orange;">
            <span class="navbar-toggler-icon"></span></button>
          
           
            <div class="collapse navbar-collapse" id="navbarSupportedContent15"  >

              <ul class="navbar-nav mr-auto" >
                <li class="nav-item active" style="background-color: orange;">
                  <a class="nav-link" href="#">게시글 수정 <span class="sr-only">(current)</span></a>
                </li>
                
                <li class="nav-item" style="background-color: rgb(219, 91, 91);">
                  <a class="nav-link" onclick="askFunction();" style="cursor:pointer;">게시글 삭제</a>
                </li>
                <li class="nav-item" style="background-color:lightskyblue;">
                  <a class="nav-link" style="cursor:pointer" onclick="statusUpdate();">판매완료</a>
                </li>
                <li class="nav-item" style="background-color: lightgray; ">
                    <a class="nav-link" href="#">끌어올리기</a>
                  </li>        
              </ul>
              <% } %>
            </div>
          </nav>
          <% } %>
          <!-- 신고버튼 -->       
    </div>
    <div class="outer" style="margin-top:15px">
        <% if(loginMember!=null&&!loginMember.getMemNickname().equals(pb.getMemNickname())) {%>
        <i  
        class="fas fa-exclamation-triangle" 
        data-toggle="modal" 
        data-target="#myModal"
        style="position: relative;
        left:750px;
        top:40px;
        z-index: 3;
        font-size: 2rem;
        color:rgb(255, 55, 55);
       ">
     </i>
     <% } %>
        <!-- ↓ 사진 코드. ↓ -->
     <div class="image_section" style="width:100%; ">
         <div id="carouselExampleIndicators" 
              class="carousel slide" 
              data-ride="carousel" 
              style="height: 600px; 
                   width:100%;
                   margin:auto;
                   ">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
				<% for(int i = 1 ; i<pList.size(); i++) {%>	
					<li data-target="#carouselExampleIndicators" data-slide-to="<%=i%>"></li>
					<% } %>
				</ol>
				<div class="carousel-inner">
				
					<div class="carousel-item active">
						<img class="d-block w-100" style="object-fit: contain" src="<%=contextPath%>/<%=pList.get(0).getPhotoPath() + pList.get(0).getPhotoFileName()%>" >
					</div>
					<% for(int i = 1 ; i<pList.size() ; i++ ){ %>
					<div class="carousel-item">
						<img class="d-block w-100" style="object-fit: contain" src="<%=contextPath%>/<%=pList.get(i).getPhotoPath() + pList.get(i).getPhotoFileName()%>">
					</div>
					<% } %>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next"
					href="#carouselExampleIndicators" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
     </div>

     <!-- ↓ 유저 정보및 가격 ↓ -->
     <div class="userInfo_display">
         <div class="left_section" 
            style="width:30%; 
            height:80%;display: flex; 
            align-content: center;">
             <div class="user_icon" ><i class="fas fa-user" style="font-size: 3.5rem; margin-right: 15px;"></i></div>
             <div class="user_info_text">
                <h4 style="margin-bottom: 0px; margin-top: 5px;"><%=pb.getMemNickname()%></h4>
                <p style="margin-top: 0px;"><%=pb.getLocalNo() %></p>
             </div>
         </div>
         <div class="right_price" 
              style="font-size: 1.5rem; 
              font-weight: bold;"><%=pb.getProdPrice() %> 원</div>
     </div>
     
     <!-- ↓ 본문 제목 ↓ -->
     <div class="title_section">
         <h4 align="center" style="margin-top:15px">
             <%=pb.getPostName() %>
         </h4>
         <p align="center" style="font-size:small;"><%=pb.getCategoryName() %></p>
         <hr style="border-bottom: 2px solid gray;"> 
     </div>
     
     <!-- ↓ 본문 내용 ↓ -->  
     <div class="userContent">
     <%=pb.getPostContent() %>
          </div>
    
          <!-- ↓ 조회수 + 찜버튼 ↓ -->   
     <div class="view_counter_wrapper" style="display: flex; 
          justify-content: space-between; 
          align-items: center;
          padding:0px 30px 0px 30px;">
         <div class="view_counter_display" style="color:darkgray">
             조회:<%=pb.getPostViews() %> 찜:<%= pb.getPostLikes() %>
         </div>
    
         <div class="like_button" 
              style="width:40px; 
                     height:40px; 
                     display: flex; 
                     justify-content: center; 
                     align-items: center;
                     border-radius: 5px;
                     "
                     id="like_button"
                     >
                
             <i class="fas fa-heart">      
             </i>
           
         </div>
     </div>
     <hr style="border-bottom: 2px solid gray;"> 
     <!-- ↓ 댓글 입력 구간↓ --> 
     <div class="comment_area" style="width:100%;">
         <div style="display:flex; 
                                 justify-content: center;">
            <input type="text" 
                   class="form-control" 
                   name="userComment" 
                   id="exampleInputPassword1" 
                   placeholder="댓글을 입력해주세요"
                   style="width:500px;
                          ">
            <button type="button" 
                    class="btn btn-warning" 
                    id="insert_comment"
                    style="font-weight: bold;
                    ">댓글입력</button>
                    <div class="comment_check_wrapper" style=
                    "
                    height:40px; 
                    width:40px; 
                    margin-left: 10px; 
                    ">
                    <p style="font-size: 0.4rem; 
                              margin:3px 0px 0px 0px;
                              font-weight: bold;"> 비공개</p>
                    <input type="checkbox" name="comment_condition" style="margin-left: 10px;" value="">
                    </div>
         </div>      
    
          <!-- ↓ 댓글 출력 구간↓ -->
         <div id="comment_display_outer">
         <% for(int i =0 ; i<list.size(); i++ ) { 
         if(loginMember==null) { // 로그인이 안돼있을경우 조건문 실행
        	 if(list.get(i).getSecretCheck().equals("N")) {   		 
         %>
         <div class="comment_display">
             <div class="comment_icon"><i class="fas fa-user" style="font-size: 2rem;"></i></div>
             <div class="comment_content">
                 <div class="comment_textarea">[<%=list.get(i).getUserNickName()%>]</div>
                 <p class="comment_user_info"><%=list.get(i).getContent() %></p>
                 <!-- ↓ 코멘트 버튼  div if 문 달아야함 나중에 ↓ -->
                 <div class="comment_control_button">
                     <div class="left_date"><%=list.get(i).getEnrollDate()%></div>
                     
                 </div>
             </div>   
         </div>
       <% } else if(list.get(i).getSecretCheck().equals("Y")){%>        
         <div class="comment_display">
            <div class="comment_icon"><i class="fas fa-user" style="font-size: 2rem;"></i></div>
            <div class="comment_content" style="padding:0;">
                <div class="secret_Comment" 
                     style="width:100%; 
                            height:100%; 
                            background-color:rgb(255, 235, 197); 
                            box-sizing: border-box;
                            display: flex;
                            justify-content: center;
                            align-items: center;">
                    <i class="fas fa-carrot">비밀댓글입니다!</i>    
                </div>           
            </div>
            <div class="comment_condition"><i class="fas fa-lock"></i></div>
        </div>        
       			<%} %>
            <% } else if (loginMember!=null) { %>                  
           <% if(!list.get(i).getSecretCheck().equals("Y")||loginMember.getManagerCheck().equals("Y")||pb.getMemNo()==loginMember.getMemNo()||list.get(i).getUserNickName().equals(loginMember.getMemNickname())) { %>       
            <div class="comment_display">
             <div class="comment_icon"><i class="fas fa-user" style="font-size: 2rem;"></i></div>
             <div class="comment_content">
                 <p class="comment_user_info">[<%=list.get(i).getUserNickName()%>]</p>
                 <div class="comment_textarea"><%=list.get(i).getContent() %></div>
                 <!-- ↓ 코멘트 버튼  div if 문 달아야함 나중에 ↓ -->
                 <div class="comment_control_button">
                     <div class="left_date"><%=list.get(i).getEnrollDate()%></div>
                     <div class="right_icons">
                     <%if(loginMember.getMemNickname().equals(list.get(i).getUserNickName())){ %>
                         <i class="fas fa-pen" title="댓글 수정"></i>
                         <%} %>
                      <%if(loginMember.getMemNickname().equals(list.get(i).getUserNickName())||loginMember.getManagerCheck().equals("Y")){ %>   
                         <i class="fas fa-trash" title="댓글 삭제"></i>
                         <%} %>
                         <i class="fas fa-exclamation" title="댓글 신고"></i>
                     </div>
                 </div>
             </div>   
         </div>
            <% } else { %>        
            <div class="comment_display">
            <div class="comment_icon"><i class="fas fa-user" style="font-size: 2rem;"></i></div>
            <div class="comment_content" style="padding:0;">
                <div class="secret_Comment" 
                     style="width:100%; 
                            height:100%; 
                            background-color:rgb(255, 235, 197); 
                            box-sizing: border-box;
                            display: flex;
                            justify-content: center;
                            align-items: center;">
                    <i class="fas fa-carrot">비밀댓글입니다!</i>  
                </div>           
            </div>
            <div class="comment_condition"><i class="fas fa-lock"></i></div>
        </div>       
            <% } %>
         <% } %>
       <%} %>
           
        	</div>                    
     	</div>
   </div>
     
     <br>
     <div align="center">목록으로</div>
     <br>
     <!-- 신고 버튼 모달 -->
       <!-- The Modal -->   
       <div class="modal" id="myModal">
           
        <div class="modal-dialog">
          <div class="modal-content">
            <form action="">
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">유저신고</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body">
              <label for="">신고유형:</label>
              <select name="report_type" style="border:1px solid black; border-radius: 3px;">
                  <option value="사기">사기</option>
              </select>
              <br><br>
              <label for="">신고 사유</label>
              <br><textarea name="" id="" cols="61" rows="10" style="resize: none; border:1px solid black; border-radius: 3px;"></textarea>
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">신고하기</button>
            </div>
            </form>
          </div>
        </div>
      </div>
 
<script>
         $(function(){
        	 let $scContent = $("#exampleInputPassword1")
        	 let $sCheck = $(".comment_check_wrapper input[name=comment_condition]");
        	 
        	 $("#insert_comment").click(function(){
  		
        		 <%if(loginMember!=null) {%>
        		 
        		 $.ajax({
        			url:"insertComment.sh",
        			type:"post",
        			data:{
					      cContent:$scContent.val(),
					      sCheck:$('input[name="comment_condition"]').is(":checked")?'Y':'N',
					      userNick:"<%=loginMember.getMemNickname()%>",
					      postNo:"<%=pb.getPostNo()%>",
					      memNo:"<%=loginMember.getMemNo()%>"
        			     },
        			success:function(){

        			}, 
        			error:function(){
        				
        			}  	 
        		 })
        		 
        		 <%} else {%>
        			
        		 if(confirm("댓글은 회원만 작성할수 있습니다 로그인 페이지로 이동하시겠습니까?")){
        			 location.href="<%=contextPath%>/loginPage.me.ng";
        		 }
        		 <% } %>
        	 })
         }) 
         
         function askFunction(){
       	 
        	 if(confirm("게시글을 삭제하시겠습니까?")){
        		 location.href="<%=contextPath%>/shMarketDeleteForm.sh?bno=<%=pb.getPostNo()%>"
        	 }      	 
         } 
         
         function statusUpdate(){
        	 
        	 if(confirm("판매완료시 게시글은 게시판에서 조회하실수 없습니다.")){
        		 location.href="<%=contextPath%>/shMarketStatusUpdate.sh?bno=<%=pb.getPostNo()%>"
        	 }       	 
         } 
         $(function(){
        	 
        	 $("#like_button").click(function(){
        		 <%if(loginMember!=null) {%>  
        		 
        		 if(confirm("찜목록에 추가하시겠습니까?")) {
        		 
        			 $.ajax({
        				 url:"dibsbtn.sh",
        				 data:{bno:"<%=pb.getPostNo()%>",
        					   userNo:"<%=loginMember.getMemNo()%>"},
        			     type:"post",
        			  	 success:function(result){
        			  		 alert(result);
        			  	 },	
        				 error:function(){      					 
        				 }
        			 })
        		 }
        		 <%} else { %>
        		 
        		 alert("찜은 회원만 가능합니다.")
        		<% }%>
    		 
        	 })
        	 
         })
        
         </script>
      
      <%@ include file="../common/footerbar.jsp"%>   
         
</body>
</html>