<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
/* ����������(����) css�Դϴ� */
/* content���� ��ü */
    .outer{
           margin-top:50px;
           margin-left:50px;
           width:1000px;
           font-family: 'Nanum Gothic', sans-serif; 

    }
/* content_bottom������ ���� �������� ���� */
    #content_bottom>div{float:left;height:100%;}
    #content_bottom1{
        width:40%;
        }
    #content_bottom2{
        width:50%;
    }
    #content_bottom2_1{
        float:right;
        line-height:10px;
    }
    
        
/* content_top ������ ���� ���� ��Ÿ�� */
    #content_top{
        border:3px solid black;
        padding:10px;
        width: 800px;
        height:220px;
        margin-left:100px;
    }
    #content_top1{
        width:20%;
        height:100%;
        float:left;
        margin-left:40px;
        margin-top:10px;
    }
    #content_top1 label {
        float:right;
        background:lightgray;
        padding: 3px 25px;
        border-radius:5px;
        cursor:pointer;
        margin-top:5px;
    }
    #content_top2{
        width:50%;
        height:100%;
        float:left;
        padding:10px;
        margin-left:20px;
    }
    #content_top3{
        height:100%;
        float:left;
        line-height:20px;
        margin-top:50px;
    }
    #content_top2>span{
        float:left; 
        padding:10px;
        font-size:30px;
        margin-top:40px;
       
    }
    #content_top2 a{color:orange;}

    /* content_bottom������ ���� ���ν�Ÿ�� */
    #content_bottom1{
    margin-left:50px;
    border: 3px solid gray;
    }
    #content_bottom1>table{
    font-size:20px;
    margin-top:50px;
    margin-bottom:50px;
    margin-left:100px;
    }
    td{
    width:90px;
    height:45px;
    }
    #content_bottom2{
    padding:30px;
    font-size:20px;
    }
    #content_bottom2{
    margin:auto;
    padding:50px;
    }
    #content_bottom2_2{
    margin:20px;
    }
    #content_bottom2_3{
        float:right;
    }
    #updateButton{
        float:right;
        margin-right:100px;
    }
</style>
</head>
<body>
	<!--��ܹ�, �޴���, Ǫ�� -->
	<%@ include file= "../common/commonNavbar.jsp"%>
	<%@ include file= "../common/mypageMenubar.jsp" %>
	<%@ include file= "../common/footerbar.jsp" %>

	<div class="outer">
    <br>
    <h2>ȸ�� ����</h2>
     <hr color="gray">
     <br><br>
     <!-- content������ ���κ� -->
     <div id="content_top">
         <!-- ������ ���� -->
        <div id="content_top1">
                <div id="fileArea">
                <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" required>
                </div>
                <img id="profileImg" width="150" height="150" style="border-radius:1500px; border:1px solid lightgray;">
                <br>
                <label for="file1">�����ʺ���</label>
        </div>

        <script>
            $(function(){
                $("#fileArea").hide();

                $("#profileImg").click(function(){
                    $("#file1").click();
                });
            });
            function loadImg(inputFile, num){
                if(inputFile.files.length == 1){
                  
                    var reader = new FileReader();

                    reader.readAsDataURL(inputFile.files[0]);

                
                    reader.onload = function(e){
                      
                        switch(num){
                            case 1: $("#profileImg").attr("src", e.target.result); break;
                        }
                    };
                }else{ 
                    switch(num){
                        case 1: $("#profileImg").attr("src", null); break;
 
                    }

                }

            }
        </script>




        <!-- 3���� �Ǽ� ����κ� -->
        <div id="content_top2">
            <span align="center"><h4><b>����/�Ǹ�</b></h4><a href="">2</a> ��</span>
            <span align="center"><h4><b>��������</b></h4><a href="">3</a> ��</span>
            <span align="center"><h4><b>����</b></h4><a href="">1</a>��</span>    
        </div>
        <!-- ��ư 2�� �κ� -->
       <div id="content_top3">
        <button type="button"class="btn btn-secondary ">ȸ�� ���� ����</button><br><br>
        <button type="button" class="btn btn-secondary ">��й�ȣ ����</button>
       </div>
    </div>
    <br><br><br><br>
    <!-- content������ �Ʒ��κ� (ȸ������, ���������) -->
    <div id="content_bottom">
            <!--ȸ������ -->
     <div id="content_bottom1">
        <table>
            <tr>
                <td>���̵�</td>
                <td>xxxx</td>
            </tr>
            <tr>
                <td>����</td>
                <td>xxx</td>
            </tr>
            <tr>
                <td>����</td>
                <td>xx</td>
            </tr>
            <tr>
                <td>�������</td>
                <td>xxxx-xx-xx</td>
            </tr>
            <tr>
                <td>�г���</td>
                <td>xx</td>
            </tr>
            <tr>
                <td>����ó</td>
                <td>xxxxxx</td>
            </tr>
            <tr>
                <td>�ּ�</td>
                <td>xxxxxxxx</td>
            </tr>
            <tr>
                <td>E-Mail</td>
                <td>xxxxxx</td>
            </tr>
        </table>
        </div>
        <!-- ����� ����  -->
        <div id="content_bottom2">
            <h3><b>����� ��� ����</b></h3> 
            <br>
            <div id = "content_bottom2_1">
                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#addAdressForm">���</button>
                <button type="button" class="btn btn-secondary btn-sm"  data-toggle="modal" data-target="#deleteAddress">����</button>    
            </div>
         <br><br>
            <div id="content_bottom2_2">
            <input type="checkbox" style="height:24px; width:24px;" name="delivery" id="address1" value="address1">
            &nbsp;&nbsp;�����1 )

            
            <!----------------------�⺻����� ���� �� ������ ����---------------------->

            <div id="content_bottom2_3">
                <p style="color:blue;">�⺻�����</p>
            </div>
            
            <!------------------------------------------------------------------------>

            <br>
            ����Ư���� xxx xxx xxx xxxxssssssssdddddddddddddddd

            <br><br><input type="checkbox" style="height:24px; width:24px;" name="delivery" id="address2" value="address2">
            &nbsp;&nbsp; �����2 )
            
            
            <br>
            ��⵵ xxxx xxxxx xxxxxx

            
            <br><br><input type="checkbox" style="height:24px; width:24px;" name="delivery" id="address3" value="address3">
            &nbsp;&nbsp; �����3 )
            
            
            
            <br>
            ��õ������ xxx xxxxxx xxxxx
        </div>
        </div>


    </div>

    <div id="updateButton" align="center">
        
        <button type="submit" class="btn btn-primary ">�����ϱ�</button>
       
    </div>
    
</div>



<!-------------------------------- ����� ��� ��ư Ŭ���� ������ modal------------------>
    <div class="modal fade" id="addAdressForm">
      <div class="modal-dialog">
        <div class="modal-content">
        
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">����� �߰�</h4>
            <button type="button" class="close" data-dismiss="modal">��</button>
          </div>
          
          <!-- Modal body -->
          <div class="modal-body" align="center">
            <form action="" method="post">
                <table>
                    <tr>
                        <th>������</th>
                        <td><input type="text" name="userName" required></td>
                    </tr>
                    <tr>
                        <th>�����</th><br>
                        <td>
                            <select id="Address_1" style="width:110px;" required>
                                <option value=''>�����ϼ���</option>
                                <option value='����Ư����'>����Ư����</option>
                                <option value='��õ������'>��õ������</option>
                                <option value='��⵵'>��⵵</option>
                            </select>
                            <select id="Address_2" style="width:110px;" required>
                                <option value=''>�����ϼ���</option>
                                <option value='���ϱ�'>���ϱ�</option>
                                <option value='���ϱ�'>���ϱ�</option>
                                <option value='������'>������</option>
                            </select>
                            <br>
                            <input type="text" style="width:300px;" name="address" required>
                        </td>
                            
                    </tr>
                    <tr>
                        <th>����ó</th>
                        <td><input type="text" name= "phone" required></td>
                    </tr>
                         
                </table>
                <br>
                <!-- Modal footer -->
            <div class="modal-footer">
                <input id="default" type="checkbox" name="defaultAddress" value="defalutAddress">&nbsp;
                <label for="default">�⺻ ������� ���</label>
            </div>
       
                <br>
                <button type="submit" class="btn btn-primary">���</button>

            </form>
          </div>
          
        </div>
      </div>
    </div>
    
  </div>
  
<!------------------------------------------------------------------------------- -->

<!----------------------������ư Ŭ���� ������ modal---------------------------------------->


 <div class="modal" id="deleteAddress">
    <div class="modal-dialog">
    <div class="modal-content"> 
    
        <!-- Modal body -->
        <div class="modal-body" align="center">
           �����Ͻðڽ��ϱ�?
           <br><br>
           <button type="button" class="btn btn-primary">Ȯ��</button>
           
        </div>
        
    </div>
    </div>
</div>


</body>
</html>