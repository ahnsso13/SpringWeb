<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function calcApp(){
   
   var xText = document.getElementById("x");
   var yText = document.getElementById("y");
   var addButton = document.getElementById("add-button");
   var resultText = document.getElementById("result");
   
   addButton.onclick = addButtonClick;
   
   function addButtonClick() {

      var x, y;
      x = parseInt(xText.value);
      y = parseInt(yText.value);

      resultText.value = x + y;
      /* btnPrint.type = "text"; */
   }
}

   window.onload = calcApp;
   
   //------------------------------------------------------------------------------------------------------
   
   window.onload=function(){
      var countLabel = document.getElementById("count-label");
      var countButton = document.getElementById("count-button");
      var timerId = null;
      
      var ex1 = document.getElementById("ex1");
      ex1.style.marginTop="0px"
   /*    countButton.onclick = function(){
         setTimeout(test, 3000);
      };
      
      function test(){
         countLabel.textContent = parseInt(countLabel.textContent)-1;
      } */
      
      countButton.onclick = function(){
         if(timerId == null)
           timerId = setInterval(function(){
                var count = parseInt(countLabel.textContent);
                var marginTop = parseInt(ex1.style.marginTop);
                
                if(count <= 0){ //목표치에 도달했을 경우
                   clearInterval(timerId);
                   timerId = null;
                 }
                
                if(marginTop >= 100){ //목표치에 도달했을 경우
                   clearInterval(timerId);
                   timerId = null;
                 }
                
               //countLabel.textContent = count-1;
                ex1.style.marginTop = (marginTop+1)+"px";
            }, 30);
      }; 
   };
   
   //----open a window 예제-------------------------------------------------------------------------------
   window.onload = function(){
      var openButton = document.getElementById("open-button");
      var movButton = document.getElementById("mov-button");
      var transButton = document.getElementById("trans-button");
      var iframe = window.frames[0];
      
      var win =null;
      
      openButton.onclick = function(){
         if(win == null)
            win=open("notice.html", "_blank", "width=500px height=300px");
      };
      
      movButton.onclick = function(){
         if(win != null)
            win.moveBy(-10,0);
      };
      
      transButton.onclick = function(){
         //iframe.location.href="http://www.daum.net";
         iframe.document.write("hello");
      };
   };
   
   
   //----iframe 예제-------------------------------------------------------------------------------
/*    window.onload = function(){
      var navButton = document.getElementById("nav-button");
      var win = window.frames[0];
      
      navButton.onclick = function(){
         win.location.href="http://www.newlecture.com";
      };
   
   }; */
   
   //----노드 순회 예제-------------------------------------------------------------------------------
   window.onload = function(){
      var chButton = document.getElementById("ch-button");
      var p = document.getElementById("p");
      
      chButton.onclick = function(){
         //p.style.background ="blue";
         //p.firstElementChild.style.border ="1px solid blue";
         
         //alert(p.firstChild.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling)
         for(var node=p.firstChild; node !=null; node = node.nextSibling)
            alert(node.nodeType);
      };
   };
   
   //----Selector API 예제-------------------------------------------------------------------------------
   window.onload = function(){
      var chButton = document.querySelector("#ch-button1");
      //var p = document.querySelector("#module1 > div:first-child + div > div");
      var divs = document.querySelectorAll("#module1 > div");
      var p = divs[1].querySelector("div");
      
      chButton.onclick = function(){
         p.style.border ="1px solid red";
         
      };
   };
   
   //----속성 변경 예제-------------------------------------------------------------------------------
   window.onload = function(){
      var chImgButton = document.querySelector("#ch-img-button");
      var container = document.querySelector("#img-container");
      var img = container.querySelector("img");
      
      chImgButton.onclick = function(){
         img.src ="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjflWCHejV7BvcSgvHCBoDAbfS0cZPQ61_k9ye0GVDj7TZhP5t";
         
      };
   };
   
   //----자식 노드 변경 예제-------------------------------------------------------------------------------
   
    window.addEventListener("load", function (){
            
            var chNodeButton = document.querySelector("#ch-node-button");
            var container = document.querySelector("#ch-node-container");
            
            chNodeButton.onclick = function(){
                //container.textContent = "<h1>hoho</h1>"; //textContent 는 쓰는 그대로 나옴 <h1>hoho</h1>
                container.innerHTML = "<h1>hoho</h1>";
               };
         });
         
     //----텍스트 노드 추가 예제-------------------------------------------------------------------------------
        
     window.onload = function (){
                
               var addTextNodeButton = document.querySelector("#add-text-node-button");
                 var addImgNodeButton = document.querySelector("#add-img-node-button");
                var removeNodeButton = document.querySelector("#remove-node-button");
               var container = document.querySelector("#node-container");
               
               var remove11 = function(e){
                  container.removeChild(e.target);
               };
               
               var idx = 0;
               
               addTextNodeButton.onclick = function(){
                     var span = document.createElement("span");
                     //1. text 노드 생성
                     var txt = document.createTextNode("안녕하세요" + idx++);
                     
                     //2. container(부모)를 얻기
                     
                     //3. 부모에 자식을 추가
                     //container.appendChild(txt);
                     span.appendChild(txt);
                     container.appendChild(span);
                     
                     span.onclick = remove11;
                     };
                  
                addImgNodeButton.onclick = function(){
                  // 방법 1
                  /* 
                  var img = document.createElement("img");
                  img.src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp45QewRHWqu8XIu4-RxLCHrvK5PS6OzrjIOOZkIYKH8F8915U4Q"
                  container.appendChild(img); */
                  
                  // 방법 2 (성능 문제 있을 수 있음.)
                  container.innerHTML += '<img onclick="remove11()" src="http://mblogthumb3.phinf.naver.net/20160511_126/joaeng_1462898367781eCzVR_JPEG/%B9%D929.jpg?type=w2" />'
                     
                 };
                 
               removeNodeButton.onclick = function(e){
                
                 // 1. 내정된 노드를 지우기 - ex) 막내지우기
                 //container.parentNode // container.parentElement
                 //container.removeChild(container.lastChild);
                 
                 
                 // 2. 선택된 노드를 지우기
                 alert(e.target);
                            
                };
          };
          
         //----노드 바꾸기 예제-------------------------------------------------------------------------------
           
         window.addEventListener("load", function (){
                    
                  var swapNodeButton = document.querySelector("#swap-node-button");
                  var container = document.querySelector("#node-swap-container");   
                  
                  swapNodeButton.onclick = function(){
                      //var node1 = container.querySelector("img:first-child");
                      var nodes = container.getElementsByTagName("img");
                      
                      var node1 = nodes[0];
                      var node3 = nodes[2];
                      var nodeNext = node1.nextElementSibling;
                      
                      var oldNode = container.replaceChild(node1, node3); // (새로운, 원래있던)
                      container.insertBefore(node3, nodeNext); 
                                 
                };
          });
          
       //----노드 바꾸기 예제 2-------------------------------------------------------------------------------
         
         window.addEventListener("load", function() {
      
            var moveUpButton = document.querySelector("#move-up-button");
            var container = document.querySelector("#move-up-container");
            var checkedId = 0;
            var tbody = container.querySelector("tbody");
            //var td = tbody.querySelector("tr:first-child td:last-child");
            var td = tbody.firstElementChild.lastElementChild;
            var tr = null;
      
            td.addEventListener('click', function(e){
               //e.stopPropagation();     
               console.log("td");
               e.target.style.background = "green";
            }, true);
            
            tbody.addEventListener('click', function(e){   
               //console.log("tbody");
               //alert("tbody");
               //alert("target : " + e.target.nodeName + ", current : " + e.currentTarget.nodeName)
               //e.target.style.background = "pink";
               /* if(e.target.nodeName == "INPUT" );
                  var tr = e.target.parentNode.parentNode;
                  tr.style.background = "pink"; */
                  
               if(e.target.nodeName == "INPUT" ){                
                  tr = e.target.parentNode.parentNode;
               }
            }, true);
      
            /* var trs = container.querySelectorAll("tbody tr");
            
            for(var i=0;i<trs.length;i++)
               trs[i].onclick=function(e){
                  e.target.style.background = "pink";
               }; */
      
            moveUpButton.onclick = function() {
                  
                  if(tr == null)
                     return;
                  if(tr == firstChild)

                  var bf = tr.previousElementSibling;
                  var af = tr.nextElementSibling;
                  var container = tr.parentNode;
                  
                  container.replaceChild(tr,bf);
                   container.insertBefore(bf, af);
            };
         });
       
       //----기본 행위 막기 예제-------------------------------------------------------------------------------
       
       window.addEventListener("load", function(){
          var titleText = document.querySelector("form input[name]");
          var submitButton = document.querySelector("form input[type='submit']");
          var cancelButton = document.querySelector("form a")
          
          submitButton.onclick = function(e){
             if(titleText.value == ""){
                alert("제목을 입력하세요.");
                e.preventDefault();
             }
          };

          cancelButton.onclick = function(e){
             if(titleText.value != ""){
                if(!confirm("작성중이던 입력을 취소하시겠습니까?"))
                   e.preventDefault();
             }
          };
       });
       
     //----노드복제 예제------------------
     
      window.addEventListener("load", function(){
          var cloneButton = document.querySelector("#ex-clone input[value='단순복제']");
          var tbody = document.querySelector("#ex-clone tbody");
          
          cloneButton.onclick = function(e){
                var tr = tbody.querySelector("tr");
                var clone = tr.cloneNode(true);
                tbody.appendChild(clone);                
          };
       });  
     
      //----Template 태그를 이용한 노드복제 예제------------------      
      window.addEventListener("load", function(){
          var cloneButton = document.querySelector("#ex2-clone input[value='단순복제']");
          var ajaxButton = document.querySelector("#ex2-clone input[value='Ajax요청']");
          var tbody = document.querySelector("#ex2-clone tbody");
          var template = document.querySelector("#ex2-clone template");
          var container = document.querySelector("#ex2-clone div:first-child");
          
          var data = [
              {id:"1", title:"자바", writerId:"newlec"},
              {id:"2", title:"자바스크립트", writerId:"newlec"},
              {id:"3", title:"둘다", writerId:"newlec"}
           ];
          
          cloneButton.onclick = function(e){
             //현재 브라우저가 Template 태그를 지원하는지에 대한 확인
             if('content' in template){
                //1. template의 content에 값을 설정하고 노드를 복제하는 경우
                /* var tds = template.content.querySelectorAll("td");
                tds[0].appendChild(document.createTextNode("1")); //자식노드 만들어주기
                tds[1].textContent = "test title";
                tds[2].textContent = "newlec";
             
             //값이 설정된 content를 복제
             var clone = document.importNode(template.content, true); */
             
             //2. 복제를 한 후에 content를 설정하는 경우
             for(var i=0; i<data.length; i++)
                {
                var clone = document.importNode(template.content, true);
                 
                 var tds = clone.querySelectorAll("td");
                tds[0].appendChild(document.createTextNode(data[i].id)); //자식노드 만들어주기
                tds[1].textContent = data[i].title;
                tds[2].textContent = data[i].writerId;
                
                 tbody.appendChild(clone);
                }
             
             //복제된 tr을 노드 트리에 추가
             //tbody.appendChild(clone);
             }                        
             /* var obj = {kor:30, eng:40, math:50};
             obj.com = 60;
             if('com' in obj)
                alert(obj.kor + obj.com); */    
          };
          
         // http://localhost/SpringWeb/resource/js/script.html
          //http://localhost/SpringWeb/customer/notice-ajax
          
            ajaxButton.onclick = function(e){   
             /*1.  동기형으로 문서를 요청한 방식 */
               /* var xhr = new XMLHttpRequest();
               xhr.open("GET", "../../customer/notice-ajax", false);
               xhr.send();
               data = eval(xhr.responseText); */
               
             /*2. 비 동기형으로 문서를 요청한 방식 */
               var xhr = new XMLHttpRequest();
               /* xhr.onreadystatechange = function(e){
                  if(xhr.readyState == 4)
                    data = eval(xhr.responseText);                             
               }; */
               xhr.onload = function(){
                  data = JSON.parse(xhr.responseText);
                  // 2. ajax icon 제거
                  container.removeChild(container.lastChild);
               };
               xhr.onerror = function(e){
                  alert("예기치 못한 오류가 발생하였습니다.");
               };
             xhr.open("GET", "../../customer/notice-ajax", true);
             xhr.send();
             
             // 1. ajax icon 추가
             var img = document.createElement("img");
             img.src = "../images/ajax-loader.gif";
             container.appendChild(img);          
            };
       }); 
      //----Ajax로 파일 전송하기와 트리거 & 파일 목록 뷰어------------------ 
     window.addEventListener("load", function(){     
        var fileInput = document.querySelector("#ex3-upload input");
        var submitButton = document.querySelector("#ex3-upload span");
        var progressBar = document.querySelector("#ex3-upload #progress-bar");
        progressBar.style.width="0px";
        

   		var fileViewer = document.querySelector("#ex3-upload ul");
       
        //파일 목록 초기화 
        var xhr = new XMLHttpRequest();
        xhr.onload = function(e){
        	
        	 var files = JSON.parse(e.target.responseText); //"[\"file1.txt\",\"file2.txt\"]"
        	 
             for(var i=0; i<files.length; i++){
     	        var li = document.createElement("li");
     	        li.textContent = files[i];
     	        fileViewer.appendChild(li); //추가하기
             }
        	
        };
        
        xhr.open("GET", "../../file-list");
        xhr.send();
        
        //var a = document.createElement("a");
      
        
        submitButton.onclick = function(e){
           var event = new MouseEvent("click",{
              'view':window,
              'bubbles':true,
              'canselable':true
           });          
           
           fileInput.dispatchEvent(event);
           fileInput.onchange = function(){
                 var file =  fileInput.files[0];
                 var formData = new FormData();
                  formData.append("title", "테스트");
                  formData.append("file", file);
                  
                  var xhr = new XMLHttpRequest();
                  xhr.upload.onprogress = function(e){
                      //console.log(e.loaded + "/" + e.total);
                     var percentage = Math.round(e.loaded *100/e.total);   
                     progressBar.textContent = percentage + '%';
                     progressBar.style.width = percentage + "px";
                   };
                   
                        xhr.onload = function(){ 

                        };
                       xhr.onerror = function(e){
                         alert("예기치 못한 오류가 발생하였습니다.");
                      };
                      xhr.open("POST", "../../upload?${_csrf.parameterName}=${_csrf.token}");
                      xhr.send(formData);
                      
           };
       };
    });
   </script>
</head>
<body>
   <!-- ---------------------Ajax로 파일 전송하기와 트리거 그리고 파일목록 뷰어---------------------------------->
   <div id="ex3-upload">
   <input type="file" style="display: none"/>
   <span style="border:1px solid #999; border-radius:5px; background:pink; padding:3px; cursor:pointer;">파일선택</span>
   <span id="progress-bar" style="background: aqua; display: inline-block;"></span>
   <%-- <form action="../../upload?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
      <div>
         <input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
         <input type="submit" value="전송" />
         <input type="button" value="" />
      </div>
      <div id="clone-container"> 
         <table border="1"> 
            <tbody>
               <tr>
                  <td>제목</td>
                  <td><input type="text" name="title" /></td>
               </tr>
               <tr>
                  <td>첨부파일</td>
                  <td><input type="file" name="file" /></td>
               </tr>
            </tbody>
         </table>
      </div> 
   </form> --%>
         <div>
            <ul>
               <!-- <li>ajax-icon.gif</li> -->
               
            </ul>
         </div>
   </div>
   <hr />
   <!-- ---------------------Template 태그를 이용한 노드복제 and Ajax 요청 예제 ---------------------------------->
   <div id="ex2-clone">
      <div>
         <input type="button" value="단순복제" />
         <input type="button" value="Ajax요청" />
      </div>
      <div id="clone-container">
         <table border="1">
            <thead>
               <tr>
                  <td></td>
                  <td>코드</td>
                  <td>제목</td>
               </tr>
            </thead>
            <tbody>
            </tbody>
         </table>
         <template>
               <tr>
                  <td><input name="id" type="radio" value="1" /></td>
                  <td></td>
                  <td></td>
               </tr>   
         </template>
      </div>
   </div>
   <hr />
   <!-- ---------------------노드복제 예제 ---------------------------------->
   <div id="ex-clone">
      <div>
         <input type="button" value="단순복제" />
      </div>
      <div id="clone-container">
         <table border="1">
            <thead>
               <tr>
                  <td></td>
                  <td>코드</td>
                  <td>제목</td>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td><input name="id" type="radio" value="1" /></td>
                  <td>1</td>
                  <td>아현이</td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <hr />
   <!-- ---------------------기본 행위 막기 예제 ---------------------------------->
   <form>
      <input type="text" name="title" /><br /> <input type="submit"
         value="전송" /> <a href="">취소</a>
   </form>

   <!-- ---------------------노드 바꾸기 예제 2 + 이벤트 심화 : 버블링과 캡처링 ---------------------------------->
   <input id="move-up-button" type="button" value="위로 옮기기">
   <div id="move-up-container">
      <table border="1">
         <thead>
            <tr>
               <td></td>
               <td>코드</td>
               <td>제목</td>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td><input name="id" type="radio" value="1" /></td>
               <td>1</td>
               <td>아현이</td>
            </tr>
            <tr>
               <td><input name="id" type="radio" value="2" /></td>
               <td>2</td>
               <td>네오1</td>
            </tr>
            <tr>
               <td><input name="id" type="radio" value="3" /></td>
               <td>3</td>
               <td>네오2</td>
            </tr>
            <tr>
               <td><input name="id" type="radio" value="4" /></td>
               <td>4</td>
               <td>네오3</td>
            </tr>
            <tr>
               <td><input name="id" type="radio" value="5" /></td>
               <td>5</td>
               <td>네오4</td>
            </tr>
         </tbody>
      </table>
   </div>
   <hr />

   <!-- ---------------------노드 바꾸기 예제 ---------------------------------->
   <input id="swap-node-button" type="button" value="노드 바꾸기">
   <div id="node-swap-container">
      <img src="../images/answeris.png" /> <img src="../images/w3c.png" /> <img
         src="../images/microsoft.png" />
   </div>
   <hr />

   <!-- ---------------------텍스트 노드 추가 예제 ---------------------------------->
   <input id="add-text-node-button" type="button" value="텍스트노드 추가">
   <input id="add-img-node-button" type="button" value="이미지노드 추가">
   <input id="remove-node-button" type="button" value="노드 삭제">
   <div id="node-container"></div>
   <hr />

   <!-- ---------------------자식 노드 변경 예제 ---------------------------------->
   <input id="ch-node-button" type="button" value="자식노드 변경">
   <div id="ch-node-container">hello</div>
   <hr />

   <!-- 속성 변경 예제------------------------------------------------------------------------------------ -->
   <input type="text" id="img-src" />
   <input id="ch-img-button" type="button" value="이미지 변경" />
   <div id="img-container">
      <img
         src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp45QewRHWqu8XIu4-RxLCHrvK5PS6OzrjIOOZkIYKH8F8915U4Q" />
   </div>
   <hr />

   <!-- Selector API 예제------------------------------------------------------------------------------------ -->
   <input id="ch-button1" type="button" value="배경색 변경" />
   <div id="module1">
      <div>1</div>
      <div>
         <div>2</div>
         <!-- comment -->
      </div>
      <div>3</div>
   </div>
   <hr />
   <!-- 노드 순회 예제------------------------------------------------------------------------------------ -->
   <input id="ch-button" type="button" value="배경색 변경" />
   <div>
      <div>1</div>
      <div id="p">
         <div>2</div>
         <!-- comment -->
      </div>
      <div>3</div>
   </div>
   <hr />
   <!-- iframe 예제------------------------------------------------------------------------------------ -->
   <div>
      <input id="nav-button" type="button" value="페이지 전환" />
      <iframe src="notice.html" style="width: 500px; height: 300px;"></iframe>
   </div>
   <hr />
   <!-- open a window 예제------------------------------------------------------------------------------------ -->
   <div>
      <input id="open-button" type="button" value="새창띄우기" /> <input
         id="mov-button" type="button" value="왼쪽으로 이동" /> <input
         id="trans-button" type="button" value="페이지 이동" />
   </div>
   <hr />
   <!-- Timer 예제------------------------------------------------------------------------------------ -->
   <p>
      남은시간 <span id="count-label">60</span>초 <input type="button"
         id="count-button" value="카운트 시작" />
   </p>
   <hr />
   <!-- Calculator 예제------------------------------------------------------------------------------------ -->
   <div id="ex1">
      <input type="text" id="x" placeholder="x값을 입력하세요" /> <input
         type="text" id="y" placeholder="y값을 입력하세요" /> = <input type="button"
         value="더하기" id="add-button" /> <input type="text" value=""
         id="result" />
   </div>
</body>
</html>