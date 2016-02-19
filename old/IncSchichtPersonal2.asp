<%
 'JMT = Replace(Request("JMT"), "'", "''")  
 'dS  = Replace(Request("S"), "'", "''")     ' Schicht
%>
<%
JMT = "20060101"  ' Fixer Tag nicht mehr variabel 25.Jan.2005
ds  = 1           ' immer nur Schicht 1 Anzeigen
if 1=2 then 
  response.write "JMT="+JMT+"<br>"
  response.write "Schicht="+dS+"<BR>"
end if  

%>
<%
ohneDB=0
if ohneDB=0 then
Set RSs = Server.CreateObject("ADODB.Recordset")
RSs.ActiveConnection = "dsn=mdsi1;uid=mdsic;pwd=mdsic;"  ' MM_SchichtTAG_STRING
RSs.Source = "SELECT *  FROM mdsi.dat_schichtpersonal WHERE JMT="+JMT
RSs.Open()
end if
%>
<%
if 1=2 then
  response.write "Bett A1 = " + (RSs.Fields.Item("A11").Value) + "<br>"
  response.write "Bett B1 = " + (RSs.Fields.Item("B11").Value) + "<br>"
  response.write "Bett B2 = " + (RSs.Fields.Item("B21").Value) + "<br>"
  response.write "Bett B2 = " + (RSs.Fields.Item("B31").Value) + "<br>"
end if
%>
<%
  pA1 = ""
  pB1 = ""
  pB2 = ""
  pB3 = ""
  pC1 = ""
  pC2 = ""
  pC3 = ""
  pD1 = ""
  pD2 = ""
  pD3 = ""
  pE1 = ""
  pE2 = ""
  pE3 = ""
  pF1 = ""
  pG1 = ""
  pG2 = ""
  pG3 = ""
  pH1 = ""
  pW1 = ""
  pW2 = ""
  pW3 = ""
  pW4 = ""
  pAS11= "" ' Aufgabe Schicht
  pAS12= ""
  pAS13= ""
  pAS21= ""
  pAS22= ""
  pAS23= ""
  pAS31= ""
  pAS32= ""
  pAS33= ""
  pAS41= ""
  pAS42= ""
  pAS43= ""
  pASB1= "" ' Aufgabe SchichtBezogen
  pASB2= ""
  pASB3= ""
  pASB4= ""
  pAW1 = "" ' Aufgabe wöchentlich
  pAW2 = ""
  pAW3 = ""
  pBEKO1 = ""
  pBEKO2 = ""
  pBEKO3 = ""
  pOA1   = ""
  pOA2   = ""
  pOA3   = ""
  pDA1   = ""
  pDA11  = ""
  pDA12  = ""
  pDA13  = ""
  pDA2   = ""
  pDA21  = ""
  pDA22  = ""
  pDA23  = ""
  INFO   = ""
  pDRG   = ""
	p1B3 =""
	p1B4 =""
	p1B1 =""
	p1B2 =""
	p2B2 =""
	p2B1 =""
	p3B3 =""
	p3B4 =""
	p3B2 =""
	p3B1 =""
	p4B1 =""
	p5B1 =""
	p6B1 =""
	p6B2 =""
	p7B1 =""
	p7B2 =""
	p8B1 =""
	p8B2 =""
	p9B1 =""
	p9B2 =""
	p10B1 =""
	p10B2 =""
	pOA21=""
	pOA22=""
	pOA23=""
	pDA31  = ""
	pDA32  = ""
	pDA33  = ""
  pSS1= "" ' Schluck-Screening
  pSS2= ""
  pSS3= ""
  pSS0= ""

if ohneDB=0 then
  pA1 = (RSs.Fields.Item("A11").Value)
  pB1 = (RSs.Fields.Item("B11").Value)
  pB2 = (RSs.Fields.Item("B21").Value)
  pB3 = (RSs.Fields.Item("B31").Value)
  pC1 = (RSs.Fields.Item("C11").Value)
  pC2 = (RSs.Fields.Item("C21").Value)
  pC3 = (RSs.Fields.Item("C31").Value)
  pD1 = (RSs.Fields.Item("D11").Value)
  pD2 = (RSs.Fields.Item("D21").Value)
  pD3 = (RSs.Fields.Item("D31").Value)
  pE1 = (RSs.Fields.Item("E11").Value)
  pE2 = (RSs.Fields.Item("E21").Value)
  pE3 = (RSs.Fields.Item("E31").Value)
  pF1 = (RSs.Fields.Item("F11").Value)
  pG1 = (RSs.Fields.Item("G11").Value)
  pG2 = (RSs.Fields.Item("G21").Value)
  pG3 = (RSs.Fields.Item("G31").Value)
  pH1 = (RSs.Fields.Item("H11").Value)
  pW1 = (RSs.Fields.Item("W11").Value)
  pW2 = (RSs.Fields.Item("W21").Value)
  pW3 = (RSs.Fields.Item("W31").Value)
  pW4 = (RSs.Fields.Item("W41").Value)
 
  pAS11= (RSs.Fields.Item("AS11").Value)
  pAS12= (RSs.Fields.Item("AS12").Value)
  pAS13= (RSs.Fields.Item("AS13").Value)
  pAS21= (RSs.Fields.Item("AS21").Value)
  pAS22= (RSs.Fields.Item("AS22").Value)
  pAS23= (RSs.Fields.Item("AS23").Value)
  pAS31= (RSs.Fields.Item("AS31").Value)
  pAS32= (RSs.Fields.Item("AS32").Value)
  pAS33= (RSs.Fields.Item("AS33").Value)
  pAS41= (RSs.Fields.Item("AS41").Value)
  pAS42= (RSs.Fields.Item("AS42").Value)
  pAS43= (RSs.Fields.Item("AS43").Value)
  pASB1= (RSs.Fields.Item("ASB11").Value)
  pASB2= (RSs.Fields.Item("ASB21").Value)
  pASB3= (RSs.Fields.Item("ASB31").Value)
  pASB4= (RSs.Fields.Item("ASB41").Value)
  pAW1 = (RSs.Fields.Item("AW1").Value)
  pAW2 = (RSs.Fields.Item("AW2").Value)
  pAW3 = (RSs.Fields.Item("AW3").Value)
  pBEKO1 = (RSs.Fields.Item("BEKO1").Value)
  pBEKO2 = (RSs.Fields.Item("BEKO2").Value)
  pBEKO3 = (RSs.Fields.Item("BEKO3").Value)
  pOA1   = (RSs.Fields.Item("OA1").Value)
  pOA2   = (RSs.Fields.Item("OA2").Value)
  pOA3   = (RSs.Fields.Item("OA3").Value)
  pOA21   = (RSs.Fields.Item("OA21").Value)
  pOA22   = (RSs.Fields.Item("OA22").Value)
  pOA23   = (RSs.Fields.Item("OA23").Value)
  pDA1   = (RSs.Fields.Item("DA1").Value)
  pDA11  = (RSs.Fields.Item("DA11").Value)
  pDA12  = (RSs.Fields.Item("DA12").Value)
  pDA13  = (RSs.Fields.Item("DA13").Value)
  pDA2   = (RSs.Fields.Item("DA2").Value)
  pDA21  = (RSs.Fields.Item("DA21").Value)
  pDA22  = (RSs.Fields.Item("DA22").Value)
  pDA23  = (RSs.Fields.Item("DA23").Value)
  pDA31  = (RSs.Fields.Item("DA31").Value)
  pDA32  = (RSs.Fields.Item("DA32").Value)
  pDA33  = (RSs.Fields.Item("DA33").Value)
  
  pSS1   = (RSs.Fields.Item("SS1").Value)
  pSS2   = (RSs.Fields.Item("SS2").Value)
  pSS3   = (RSs.Fields.Item("SS3").Value)
  pSS0   = (RSs.Fields.Item("SS0").Value)

  
  pDRG   = (RSs.Fields.Item("DRG").Value)
  pBEATM   = (RSs.Fields.Item("BEATM").Value)
	p1B1 =(RSs.Fields.Item("1B1").Value)
	p1B2 =(RSs.Fields.Item("1B2").Value)
	p1B3 =(RSs.Fields.Item("1B3").Value)
	p1B4 =(RSs.Fields.Item("1B4").Value)
	p2B1 =(RSs.Fields.Item("2B1").Value)
	p2B2 =(RSs.Fields.Item("2B2").Value)
	p3B1 =(RSs.Fields.Item("3B1").Value)
	p3B2 =(RSs.Fields.Item("3B2").Value)
	p3B3 =(RSs.Fields.Item("3B3").Value)
	p3B4 =(RSs.Fields.Item("3B4").Value)
	p4B1 =(RSs.Fields.Item("4B1").Value)
	p5B1 =(RSs.Fields.Item("5B1").Value)
	p6B1 =(RSs.Fields.Item("6B1").Value)
	p6B2 =(RSs.Fields.Item("6B2").Value)
	p7B1 =(RSs.Fields.Item("7B1").Value)
	p7B2 =(RSs.Fields.Item("7B2").Value)
	p8B1 =(RSs.Fields.Item("8B1").Value)
	p8B2 =(RSs.Fields.Item("8B2").Value)
	p9B1 =(RSs.Fields.Item("9B1").Value)
	p9B2 =(RSs.Fields.Item("9B2").Value)
	p10B1 =(RSs.Fields.Item("10B1").Value)
	p10B2 =(RSs.Fields.Item("10B2").Value)
'  if IsNull(RSs.Fields.Item("INFO")) Then
'  if IsEmpty(RSs.Fields.Item("INFO").Value) Then
'	  INFO   = ""
'	else
	  INFO   = RSs.Fields.Item("INFO").Value
'	  INFO   = ""
'	End if
	
end if ' ohne DB
%>
