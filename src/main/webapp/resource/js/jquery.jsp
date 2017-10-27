<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
//--------------------- 노드 순회 예제 -----------------------------------------------
	//window.addEventListener("load", function(){
	 $(function() {
		//DOM 객체를
		//var chButton = document.getElementById("ch-button");
		
		//jQuery 객체로 바꾸는 방법  1: jQuery 함수 이용하기
		//var chButton = jQuery(_chButton);
		
		//jQuery 객체로 바꾸는 방법 2: $ 함수 이용하기
		//var chButton = $(_chButton);
		
		//jQuery 객체로 바꾸는 방법 3: CSS Selector 이용하기(가장 많이 이용)
		var chButton = $("#ch-button");
		
		//이벤트 바인딩 두가지 옵션 - 1. 범용 이벤트 바인딩 함수 on()
		/* chButton.on("click" = function(){
			alert("aa");
		}); */
		
		//이벤트 바인딩 두가지 옵션 - 2. 특수 이벤트 바인딩 함수 click/keydown...-클릭할 땐 더 간단한 이 방법으로
		chButton.click(function(){
			// 여러개의 스타일을 설정해야하는 경우 -방법1
			//$("#p").css("background", "red");
			//$("#p").css("font-size", "13px");
			
			// 여러개의 스타일을 설정해야하는 경우 -방법2
			$("#p").css({
				background : "red",
				"font-size" : "13px"
			}); // {} : json 표현식으로 만든 객체
		});
		
	});
	
// ----------------- 속성 변경 예제 ------------------------------------------------
	   $(function() {
	      var chImgButton = $("#ch-img-button");
	      var container = $("#img-container");   
	      var img = $("img");
	      var imgSrc = $("#img-src");

	      chImgButton.click(function() {
	         img.attr("src", imgSrc.val());
	      });
	   });
 // valu 속성에 접근할 때 : imgSrc.attr("value")가 아니고 imgSrc.val() 이용	   
 
 //-------------------자식노드변경예제 ---------------------------------------------
	  $(function() {
		   var chNodeButton = $("#ch-node-button");
		   var container = $("#ch-node-container");   
		   chNodeButton.click(function() {
		       // 1. 텍스트 노드 추가 (script, jquery)
		       //container.textContent = "<h1>testtesttest</h1>"
		       container.text("<h1>test test text</h1>");
		       // 2. 엘리먼트 노드 추가 (script, jquery)
			   //container.innerHTML = "<h1>testtestset</h1>"
			   //container.html("<h1>test test testt</h1>") 
			   
			   
		   });
		   
});

//---------------------텍스트 노드 추가 예제------------------------------------------

	  $(function() {
		   var addTextNodeButton = $("#add-text-node-button");
		   var addImgNodeButton = $("#add-img-node-button");
		   var removeNodeButton = $("#remove-node-button");
		   var container = $("#node-container");   
		   
		   var remove = function(e){
		      //container.removeChild(e.target);
		      container.removeChild(this);
		   }
		   var idx = 0;
		   addTextNodeButton.click(function() {
		      //1.TextNode 생성: jquery-텍스트는 텍스트로 두면 된다.
		      var span = $('<span />');  // < />를 써주면 객체를 만들어준다.
		      var txt = '안녕하세여'+ idx++;
		      //2. container(부모) 얻기
		      //3. 부모에 자식을 추가
		      span.append(txt);
		      container.append(span);
		      
		      span.click(remove);
		      
		   });
		   addImgNodeButton.click(function() {
		      //How to 1(성능에 좋음)
		      //1 Element 생성 
		      // 1) 이 방법은 너무 DOM을 사용하는 스타일로 구현한 코드
		     /*  var img = $('<img />');
		      img.attr("src", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROK9fC09r3bTT-7OEL6XefUqFcPeBB5gHNV2H_Nk_23ND7oJWGXA");
		      container.append(img);
		      img.click(remove); */
		      // 2) jQuery로 구현한 코드
		      $("<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROK9fC09r3bTT-7OEL6XefUqFcPeBB5gHNV2H_Nk_23ND7oJWGXA' />")
		      .appendTo(container /* 부모 */) //자식입장에서 부모를 지정할 수 있게 해주는 함수 appendTo(부모)
		      .click(remove);
		      
		      //How to 2 (성능에 좋지 않지만 편리함.-> 한두개 넣는 상황의 성능에 영향을 주지 않을 거라면 이를 사용)
		      container.innerHTML += '<img onClick="remove()" src="http://t1.daumcdn.net/thumb/R1024x0/?fname=http://cfile1.uf.tistory.com/image/2134514F579B4C7D165741" />';
		      
		      
		   });
		   removeNodeButton.click(function() {
		      // 1. 내정된 노드를 지우기
		      if(container.hasChildNodes()){
		         container.removeChild(container.lastChild);
		      }
		      // 2. 선택된 노드를 지우기
		      
		   });
		});
</script>
</head>

<body> 
   <!--텍스트 노드 추가 예제 -->
   <input id="add-text-node-button" type="button" value="텍스트노드 추가" />
   <input id="add-img-node-button" type="button" value="이미지노드 추가" />
   <input id="remove-node-button" type="button" value="노드 삭제" />
   <div id="node-container"></div>
   <hr />

   <!--자식노드변경예제 -->
   <input id="ch-node-button" type="button" value="자식노드 변경" />
   <div id="ch-node-container">hello</div>
   <hr />

   <!--속성변경예제 -->
   <input type="text" id="img-src" />
   <input id="ch-img-button" type="button" value="이미지 변경" />
   <div id="img-container">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuCn6rSMMjvQ6_n63kIWoxxoxhAWSr2twZq48__rJuL7UFLtgB" />
   </div>
   <hr />
   
   <!-- 노드 순회 예제------------------------------------------------------------------------------------ -->
   <input id="ch-button" type="button" value="배경색 변경" />
   <div>
      <div>1</div>
      <div id="p">
         <div>2</div>
         
      </div>
      <div>3</div>
   </div>
   <hr />

</body>
</html>

<!-- jQuery -->
<!-- DOM - jQuery 객체로 바꾸는 작업 -->