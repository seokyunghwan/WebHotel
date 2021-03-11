<%@page import="kajastayVO.MemVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="register.css">
<% if(session.getAttribute("login1") != null) {
   MemVo mvo = (MemVo)session.getAttribute("login1");
   if(mvo.getType().equals("사장")) {%>
<link rel="stylesheet" href="register.css">
<link rel="stylesheet" href="../css/room_register.css">
<link rel="stylesheet" href="../js/jquery-ui-1.10.4.custom.min.css">
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/jquery-ui-1.10.4.custom.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
   function categoryChange(e) {
      var good_a = ["종로구","중구","용산구","성동구","광진구","동대문구","중랑구","성북구","강북구"
         ,"도봉구","노원구","은평구","서대문구","마포구","양천구","강서구","구로구","금천구","영등포구"
         ,"동작구","관악구","서초구","강남구","송파구","강동구"];
      var good_b = ["중구","동구","미추홀구","연수구","남동구","부평구","계양구","서구","강화군","옹진군"];
      var good_c = ["유성구","대덕구","동구","중구","서구"];
      var good_d = ["중구","서구","동구","영동구","부산진구","동래구","남구","북구","해운대구","사하구"
         ,"금정구","강서구","연제구","수영구","시상구","기장군"];
      var good_e = ["광산구","북구","서구","동구","남구"];
      var good_f = ["울주군","북구","중구","남구","동구"];
      var good_g = ["북구","동구","서구","중구","달서구","수성구","남구","달성군"];
      var good_h = ["가평군","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시"
         ,"동두천시","부천시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","여주시"
         ,"연천군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시"
         ,"화성시"];
      var good_i = ["춘천시","원주시","강릉시","동해시","태백시","속초시","삼척시","홍천군","횐성군","영월군"
         ,"평창군","정선군","철원군","화천군","양구군","인제군","고성군","양양군"];
      var good_j = ["청주시","충주시","제천시","보은군","옥천군","영동군","증평군","진천군","괴산군"
         ,"움성군","단양군"];
      var good_k = ["천안시","공주시","보령시","아산시","서산시","논산시","계룡시","당진시","금산군"
         ,"부여군","서천군","청양군","홍성군","예산군","태안군"];
      var good_l = ["경산시","경주시","고령군","김천시","봉화군","상주시","성주군","안동시","영덕군"
         ,"영양군","영주시","예천군","울릉군","청도군","칠곡군"];
      var good_m = ["창원시","진주시","통영시","사천시","김해시","밀양시","거제시","양산시","의령군"
         ,"함안군","창녕군","고성군","남해군","하동군","산청군","함양군","거창군","합천군"]
      var good_n = ["김제시","군산시","고창군","남원시","무주군","부안군","순창군","완주군","익산시"
         ,"임실군","장수군","전주시","정읍시","진안군"];
      var good_o = ["강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군"
         ,"보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군"
         ,"함평군","해남군","화수군"];
      var good_p =["제주시","서귀포시"];
      
      
      var target = document.getElementById("good");
      
      if(e.value == "서울특별시") var d = good_a;
      else if(e.value == "인천광역시") var d = good_b;
      else if(e.value == "대전광역시") var d = good_c;
      else if(e.value == "부산광역시") var d = good_d;
      else if(e.value == "광주광역시") var d = good_e;
      else if(e.value == "울산광역시") var d = good_f;
      else if(e.value == "대구광역시") var d = good_g;
      else if(e.value == "경기도") var d = good_h;
      else if(e.value == "강원도") var d = good_i;
      else if(e.value == "충청북도") var d = good_j;
      else if(e.value == "충청남도") var d = good_k;
      else if(e.value == "경상북도") var d = good_l;
      else if(e.value == "경상남도") var d = good_m;
      else if(e.value == "전라북도") var d = good_n;
      else if(e.value == "전라남도") var d = good_o;
      else if(e.value == "제주도") var d = good_p;
   
      target.options.length = 0;
      
      for (x in d){
         var opt = document.createElement("option");
         opt.value = d[x];
         opt.innerHTML = d[x];
         target.appendChild(opt);
      }
      document.getElementById("good").style.display = "block";
   }
   $(function(){

		$('#add').click(function() {
			var div = document.createElement('div');

			div.innerHTML = document.getElementById('room_list').innerHTML;

			document.getElementById('field').appendChild(div);

		});
		$('#remove').click(function() {
			var field = document.getElementById('field');
			field.removeChild(field.lastChild);

		});
		$('#btn_sub').on('click', function(){
	    	//값들의 갯수 -> 배열 길이를 지정
			var grpl = $("input[name=img]").length;
			//배열 생성
			var grparr = new Array(grpl);
			//배열에 값 주입
			for(var i=0; i<grpl; i++){     
				var fileValue = $("input[name=img]").eq(i).val().split("\\");
				grparr[i] = fileValue[fileValue.length-1];
		    }
			$('#imgname').val(grparr);
			$('#form_ac').submit();
		});
	});
</script>
</head>
<body>
   <div id="register">
      <form action="UploadImg.do" enctype="multipart/form-data" method="post" id="form_ac">
         <div id="title">
            <strong>업소등록</strong><br>
         </div>
            <input type="hidden" name="mvoid" value="<%=mvo.getId()%>">
         <div>
            <b>업소명</b><br><br>
            <input type="text" id="name" name="upso_name" placeholder="필요한 정보입니다" required>
            <br>
         </div>
            
         <div>
            <b>업소 사진</b><br><br>
            <input type="file" name="upsoImg" accept="image/*"><br>
         </div>
         
         <div>
            <b>분류</b><br><br>
            <select name="upsoJong">
               <option value="모텔" selected="selected">모텔</option>
               <option value="호텔">호텔</option>
               <option value="펜션">펜션</option>
               <option value="리조트">리조트</option>
               <option value="게스트하우스">게스트하우스</option>
            </select><br>
         </div>
         
         <div>
            <b>주소</b><br><br>
            <select onchange="categoryChange(this)" name="address">
               <option>선택해주세요</option>
               <option value="서울특별시">서울특별시</option>
               <option value="인천광역시">인천광역시</option>
               <option value="대전광역시">대전광역시</option>
               <option value="부산광역시">부산광역시</option>
               <option value="광주광역시">광주광역시</option>
               <option value="울산광역시">울산광역시</option>
               <option value="대구광역시">대구광역시</option>
               <option value="경기도">경기도</option>
               <option value="강원도">강원도</option>
               <option value="충청북도">충청북도</option>
               <option value="충청남도">충청남도</option>
               <option value="경상북도">경상북도</option>
               <option value="경상남도">경상남도</option>
               <option value="전라북도">전라북도</option>
               <option value="전라남도">전라남도</option>
               <option value="제주도">제주도</option>
            </select>
            
            <select id="good" name="address2">
               
            </select><br><br>
            <h4>상세주소입력</h4>
            <input type="text" id="location" name="location" placeholder="필요한 정보입니다" required><br>
         </div>
         
         <div>
            <b>내부시설</b><br><br>
            <textarea rows="10" cols="50" placeholder="(주차장,편의시설,pc게임기노래방기계등)" name="info1"></textarea><br>
         </div>
         
         <div>
            <b>주변 정보</b><br><br>
            <textarea rows="10" cols="50" placeholder="(어디서 몇분거리, 번화가주변 )" name="info2"></textarea><br>
         </div>
         <input type="hidden" name="name55" value="id">
			
			<div id="room_list">
				<div>
					<b>룸 번호</b><br> <input type="text" id="num" name="romnum"	>
				</div>

				<div>
					<b>룸 종류</b><br> <input type="text" id="name" name="romtype">
				</div>
				
				<div>
					<b>룸 사진</b><br> <input type="file" id="upload"
						name="img" accept="image/*" required>
					<input type="hidden" name="imgname" id="imgname">
				</div>
				<div>
					<b>룸 가격</b><br>
					<br> <b>대실 가격</b><input type="text" id="price1" name="price1"><br>

					<b>숙박 가격</b><input type="text" id="price2" name="price2"><br> <b>
				</div>
			</div>
			<input type="button" value="추가 " id="add"> 
			<input type="button" value="삭제" id="remove">

			<div id="field"></div>

			<input type="button" value="등록" id="btn_sub"> 
			<input type="reset" value="취소" id="reset">
      </form>
   </div>
</body>
<%   } else { %>
   <script>
      alert("사장님만 접근 가능한 페이지입니다.\n처음화면으로 이동합니다.")
      location.href = "../MainPage/mainFrame.jsp";
   </script>
<%   }
   
} else {%>
   <script>
      alert("로그인이 필요한 페이지 입니다.\n로그인페이지로 이동합니다.")
      location.href = "../loginPage/login.jsp";
   </script>
<% }%>