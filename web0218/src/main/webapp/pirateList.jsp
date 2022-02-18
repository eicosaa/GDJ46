<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "vo.Pirate" %>
<%
	// Pirate[] list = null;
	ArrayList<Pirate> list = null;
	list = new ArrayList<Pirate>();
	
	//루피
		Pirate luffy = new Pirate();
		luffy.team = "밀짚모자해적단";
		luffy.name= "몽키D.루피";
		luffy.blood="F";
		luffy.reward=1500000000L;
		luffy.devilFruit=true;
		luffy.ability = new ArrayList<String>();
		luffy.ability.add("패왕색");
		luffy.ability.add("무장색");
		luffy.ability.add("견문색");
		//위의 정보를 list에 저장
		list.add(luffy);
		
		//조로
		Pirate zoro = new Pirate();
		zoro.team = "밀짚모자해적단";
		zoro.name= "롤로노아조로";
		zoro.blood="XF";
		zoro.reward=320000000L;
		zoro.devilFruit=false;
		zoro.ability = new ArrayList<String>();
		zoro.ability.add("패왕색");
		zoro.ability.add("무장색");
		zoro.ability.add("견문색");
		//위의 정보를 list에 저장
		list.add(zoro);
		
		//나미
		Pirate nami = new Pirate();
		nami.team = "밀짚모자해적단";
		nami.name= "나미";
		nami.blood="X";
		nami.reward=66000000L;
		nami.devilFruit=false;
		nami.ability = null;
		//위의 정보를 list에 저장
		list.add(nami);
		
		//우솝
		Pirate usopp = new Pirate();
		usopp.team = "밀짚모자해적단";
		usopp.name= "우솝";
		usopp.blood="S";
		usopp.reward=200000000L;
		usopp.devilFruit=false;
		usopp.ability = new ArrayList<String>();
		usopp.ability.add("견문색");
		//위의 정보를 list에 저장
		list.add(usopp);
		
		//상디
		Pirate sanji = new Pirate();
		sanji.team = "밀짚모자해적단";
		sanji.name= "상디";
		sanji.blood="S";
		sanji.reward=330000000L;
		sanji.devilFruit=false;
		sanji.ability = new ArrayList<String>();
		sanji.ability.add("무장색");
		sanji.ability.add("견문색");
		//위의 정보를 list에 저장
		list.add(sanji);
		
		//쵸파
		Pirate chopper = new Pirate();
		chopper.team = "밀짚모자해적단";
		chopper.name= "토니토니쵸파";
		chopper.blood="X";
		chopper.reward=100L;
		chopper.devilFruit=true;
		chopper.ability = null;
		//위의 정보를 list에 저장
		list.add(chopper);
		
		//로빈
		Pirate robin = new Pirate();
		robin.team = "밀짚모자해적단";
		robin.name= "니코로빈";
		robin.blood="S";
		robin.reward=130000000L;
		robin.devilFruit=true;
		robin.ability = null;
		//위의 정보를 list에 저장
		list.add(robin);
		
		//프랑키
		Pirate franky = new Pirate();
		franky.team = "밀짚모자해적단";
		franky.name= "프랑키";
		franky.blood="XF";
		franky.reward=94000000L;
		franky.devilFruit=false;
		franky.ability = null;
		//위의 정보를 list에 저장
		list.add(franky);
		
		//브룩
		Pirate brook = new Pirate();
		brook.team = "밀짚모자해적단";
		brook.name= "브룩";
		brook.blood="X";
		brook.reward=83000000L;
		brook.devilFruit=true;
		brook.ability = null;
		//위의 정보를 list에 저장
		list.add(brook);
		
		//징베
		Pirate jinbe = new Pirate();
		jinbe.team = "밀짚모자해적단";
		jinbe.name= "징베";
		jinbe.blood="F";
		jinbe.reward=438000000L;
		jinbe.devilFruit=false;
		jinbe.ability = new ArrayList<String>();
		jinbe.ability.add("무장색");
		jinbe.ability.add("견문색");
		//위의 정보를 list에 저장
		list.add(jinbe);
	
	//티치
	Pirate teach = new Pirate();
	teach.team = "검은수염해적단";
	teach.name= "마샬D.티치";
	teach.blood="F";
	teach.reward=2247600000L;
	teach.devilFruit=true;
	teach.ability = new ArrayList<String>();
	teach.ability.add("무장색");
	teach.ability.add("견문색");
	//위의 정보를 list에 저장
	list.add(teach);
	
	//바제스
	Pirate burgess = new Pirate();
	burgess.team = "검은수염해적단";
	burgess.name= "지저스바제스";
	burgess.blood="F";
	burgess.reward=20000000L;
	burgess.devilFruit=false;
	burgess.ability = new ArrayList<String>();
	burgess.ability.add("무장색");
	burgess.ability.add("견문색");
	//위의 정보를 list에 저장
	list.add(burgess);
	
	//시류
	Pirate shiryu = new Pirate();
	shiryu.team = "검은수염해적단";
	shiryu.name= "시류";
	shiryu.blood="X";
	shiryu.reward=0L;
	shiryu.devilFruit=true;
	shiryu.ability = null;
	//위의 정보를 list에 저장
	list.add(shiryu);
	
	//반오거
	Pirate augur = new Pirate();
	augur.team = "검은수염해적단";
	augur.name= "반오거";
	augur.blood="X";
	augur.reward=64000000L;
	augur.devilFruit=false;
	augur.ability = null;
	//위의 정보를 list에 저장
	list.add(augur);
	
	//피사로
	Pirate pizarro = new Pirate();
	pizarro.team = "검은수염해적단";
	pizarro.name= "아발로피사로";
	pizarro.blood="X";
	pizarro.reward=0L;
	pizarro.devilFruit=false;
	pizarro.ability = null;
	//위의 정보를 list에 저장
	list.add(pizarro);
	
	//라피트
	Pirate laffitte = new Pirate();
	laffitte.team = "검은수염해적단";
	laffitte.name= "라피트";
	laffitte.blood="X";
	laffitte.reward=42200000L;
	laffitte.devilFruit=false;
	laffitte.ability = null;
	//위의 정보를 list에 저장
	list.add(laffitte);
	
	//데본
	Pirate catarina = new Pirate();
	catarina.team = "검은수염해적단";
	catarina.name= "카타리나데본";
	catarina.blood="F";
	catarina.reward=0L;
	catarina.devilFruit=true;
	catarina.ability = null;
	//위의 정보를 list에 저장
	list.add(catarina);
	
	//산후안
	Pirate sanjuan = new Pirate();
	sanjuan.team = "검은수염해적단";
	sanjuan.name= "산후안울프";
	sanjuan.blood="S";
	sanjuan.reward=0L;
	sanjuan.devilFruit=true;
	sanjuan.ability = null;
	//위의 정보를 list에 저장
	list.add(sanjuan);
	
	//바스코
	Pirate vasco = new Pirate();
	vasco.team = "검은수염해적단";
	vasco.name= "바스코샷";
	vasco.blood="X";
	vasco.reward=0L;
	vasco.devilFruit=false;
	vasco.ability = null;
	//위의 정보를 list에 저장
	list.add(vasco);
	
	//도크
	Pirate doc = new Pirate();
	doc.team = "검은수염해적단";
	doc.name= "도크Q";
	doc.blood="S";
	doc.reward=72000000L;
	doc.devilFruit=false;
	doc.ability = null;
	//위의 정보를 list에 저장
	list.add(doc);
	
	System.out.println(list.size() + " <-- list.size()"); //20
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pirateList</title>
	<style type="text/css">
		table, th, td {
			border : 1px solid #A465FD;
		}
	</style>
</head>
<body>
	<h1>해적 리스트</h1>
	<table>
		<theard>
			<tr>
				<th>소속</th>
				<th>이름</th>
				<th>혈액형</th>
				<th>현상금</th>
				<th>악마의 열매</th>
				<th>능력</th>
			</tr>
		</theard>
		<tbody>
			<%
				for(Pirate p : list) { // 20번 <-- list.size()
			%>
					<tr>
						<td><%= p.team %></td>
						<td><%= p.name %></td>
						<td><%= p.blood %></td>
						<td>
							<%
									if (p.reward == 0) {
							%>
										<span> 미공개 </span>	
							<%
									} else {
							%>
										<span><%= (double)p.reward / 100000000 %>억</span>
							<%
									}
							%>
						</td>
						<td>
							<%
									if(p.devilFruit == true) {
							%>
									<span><img src="./img/fruit.jpg" weight="50" height="50"></span>	
							<%
									}
							%>
						</td>
						<td>
							<%
								if(p.ability == null) {
							%>
									<span>無</span>
							<% 
								} else {
									for(String s : p.ability) {
							%>
										<span><%= s %></span> &nbsp;
							<% 
									}
								}
							%>
						</td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<!-- 1. 현상금 억단위로 출력 / 2. 악마의 열매를 먹었으면 이미지로 표현, 먹지않았으면 공백 -->
</body>
</html>