<% @LANGUAGE = "VBSCRIPT" %>
<% 
 d         = CSTR(DATE)
 aDATUM    = Replace(Request("DATUM"), "'", "''")  
 aTAG      = Replace(Request("TAG"), "'", "''")   ' a=Aktuell, m1=minus 1 Tag, p1=plus 1 Tag
 dS        = Replace(Request("S"), "'", "''")     ' Schicht
 if dS="" then dS="1": end if
 if aDATUM = "" then aDATUM=d: end if
 aTAG      = "a"
 aDATUM    = "01.01.2006"
 aD        = aDATUM  
 aDD       = CDATE(ad)
 'if aTAG="a"  then: aD = d:          end if
 'if aTAG="m1" then aD = CSTR(aDD-1): end if
 'if aTAG="p1" then aD = CSTR(aDD+1): end if
 JMT = MID(aD,7,4)+MID(aD,4,2)+MID(aD,1,2)
 if 1=2 then 
   response.Write("Datum="+aD)+"&nbsp;"
   response.write("+,-Tag="+aTAG)+"&nbsp;"
   response.write("Schicht="+dS)+"&nbsp;"
   response.write("JMT="+JMT)+"<br>"
 end if
%>
<!--#include file="IncSchichtPersonal2.asp" --> <% 'übergibt direkt JMT und dS = Schichtnummer 1,2,3 %>
<%
if 1=2 then 
  response.write "pA1 = " + pA1 + "<br>"
  response.write "pB1 = " + pB1 + "<br>"
end if  
%>

<%'----Holt Patienten vom RS ins Array vom  Bett(30,7) %>
<!--#include file="OibIncPat2.asp" -->
<%
'Dim RS
'Dim RS_numRows
%>

	
<%  'TR,TD höhe LINKS TABELLE
	DIM bg
	bg =  " bgcolor='#990000'"
	DIM sG,sK ' style Gross, Klein
	sG = "style='height: 22px'"
	sK = bg & " style='height: 3px'"
	'response.Write "style schmal= " & sK & "<br>"
	'---------------------------------------------
	'RECHTE TABELLE
	DIM s1,sF,sFk  ' style=1 sF=Font sFk Font klein
	s1 = " style='height: 20px'"
	sF = "<font size = '4px'>"
	sFk= "<font size = '2px' face='Arial'>"
	
	Dim bBett 
	bBett = 0
%>
<!--#include file="Connections/Version.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%=VER%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="refresh" content="500;URL=oib2.asp">
</head>

<body>
<form name="form1" method="post" action="">
  <table width="1200" border="2" cellpadding="0" cellspacing="8">
    <tr> 
      <td width="264" valign="top">
	  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#990000" valign="top" >
          <tr bgcolor="#FFFFCC" valign="top"> 
            <td width="3%"><font face="Arial" size="2">&nbsp;Zi</font></td>
            <td width="33%"><font face="Arial" size="2">&nbsp;Name</font></td>
            <td width="2%"><font face="Arial" size="2">&nbsp;int</font></td>
            <td width="4%"><font face="Arial" size="2">&nbsp;Spr.</font></td>
            <td width="4%"><font face="Arial" size="2">&nbsp;Kat</font></td>
            <td width="6%"><font face="Arial" size="2">&nbsp;Abt</font></td>
            <td width="48%"><font face="Arial" size="2">&nbsp;Pflegeperson</font></td>
          </tr>
		  <% bBett = 22 %>
		  <tr <%=sG%>>
            <td><font size="2">1B1</font></td>
            <td>&nbsp;<%=Bett(23,1)%></td>
            <td>&nbsp;<%=Bett(23,4)%></td>
            <td>&nbsp;<%=Bett(23,5)%></td>
            <td>&nbsp;<%=Bett(23,2)%></td>
            <td>&nbsp;<%=Bett(23,6)%></td>
            <td>&nbsp;<%=p1B1%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sG%>>
            <td><font size="2">1B2</font></td>
            <td>&nbsp;<%=Bett(24,1)%></td>
            <td>&nbsp;<%=Bett(24,4)%></td>
            <td>&nbsp;<%=Bett(24,5)%></td>
            <td>&nbsp;<%=Bett(24,2)%></td>
            <td>&nbsp;<%=Bett(24,6)%></td>
            <td>&nbsp;<%=p1B2%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sG%>>
            <td><font size="2">1B3</font></td>
            <td>&nbsp;<%=Bett(25,1)%></td>
            <td>&nbsp;<%=Bett(25,4)%></td>
            <td>&nbsp;<%=Bett(25,5)%></td>
            <td>&nbsp;<%=Bett(25,2)%></td>
            <td>&nbsp;<%=Bett(25,6)%></td>
            <td>&nbsp;<%=p1B3%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sG%>>
            <td><font size="2">1B4</font></td>
            <td>&nbsp;<%=Bett(26,1)%></td>
            <td>&nbsp;<%=Bett(26,4)%></td>
            <td>&nbsp;<%=Bett(26,5)%></td>
            <td>&nbsp;<%=Bett(26,2)%></td>
            <td>&nbsp;<%=Bett(26,6)%></td>
            <td>&nbsp;<%=p1B4%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		   <tr <%=sK%>> 
            <td colspan="7" style="font-size: 1px">&nbsp;</font></td>
          </tr>
		   <tr <%=sG%> bgcolor="#DDDDDD">
            <td><font size="2">2B1</font></td>
            <td>&nbsp;<%=Bett(27,1)%></td>
            <td>&nbsp;<%=Bett(27,4)%></td>
            <td>&nbsp;<%=Bett(27,5)%></td>
            <td>&nbsp;<%=Bett(27,2)%></td>
            <td>&nbsp;<%=Bett(27,6)%></td>
            <td>&nbsp;<%=p2B1%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sG%> bgcolor="#DDDDDD">
            <td><font size="2">2B2</font></td>
            <td>&nbsp;<%=Bett(28,1)%></td>
            <td>&nbsp;<%=Bett(28,4)%></td>
            <td>&nbsp;<%=Bett(28,5)%></td>
            <td>&nbsp;<%=Bett(28,2)%></td>
            <td>&nbsp;<%=Bett(28,6)%></td>
            <td>&nbsp;<%=p2B2%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sK%>> 
            <td colspan="7" style="font-size: 1px">&nbsp;</font></td>
          </tr>
		   <tr <%=sG%>>
            <td><font size="2">3B1</font></td>
            <td>&nbsp;<%=Bett(29,1)%></td>
            <td>&nbsp;<%=Bett(29,4)%></td>
            <td>&nbsp;<%=Bett(29,5)%></td>
            <td>&nbsp;<%=Bett(29,2)%></td>
            <td>&nbsp;<%=Bett(29,6)%></td>
            <td>&nbsp;<%=p3B1%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sG%>>
            <td><font size="2">3B2</font></td>
            <td>&nbsp;<%=Bett(30,1)%></td>
            <td>&nbsp;<%=Bett(30,4)%></td>
            <td>&nbsp;<%=Bett(30,5)%></td>
            <td>&nbsp;<%=Bett(30,2)%></td>
            <td>&nbsp;<%=Bett(30,6)%></td>
            <td>&nbsp;<%=p3B2%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		 <tr <%=sG%>>
            <td><font size="2">3B3</font></td>
            <td>&nbsp;<%=Bett(31,1)%></td>
            <td>&nbsp;<%=Bett(31,4)%></td>
            <td>&nbsp;<%=Bett(31,5)%></td>
            <td>&nbsp;<%=Bett(31,2)%></td>
            <td>&nbsp;<%=Bett(31,6)%></td>
            <td>&nbsp;<%=p3B3%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sG%>>
            <td><font size="2">3B4</font></td>
            <td>&nbsp;<%=Bett(32,1)%></td>
            <td>&nbsp;<%=Bett(32,4)%></td>
            <td>&nbsp;<%=Bett(32,5)%></td>
            <td>&nbsp;<%=Bett(32,2)%></td>
            <td>&nbsp;<%=Bett(32,6)%></td>
            <td>&nbsp;<%=p3B4%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		   <tr <%=sK%>> 
            <td colspan="7" style="font-size: 1px">&nbsp;</font></td>
          </tr>
		   <tr <%=sG%>  bgcolor="#DDDDDD">
            <td><font size="2">4B1</font></td>
            <td>&nbsp;<%=Bett(33,1)%></td>
            <td>&nbsp;<%=Bett(33,4)%></td>
            <td>&nbsp;<%=Bett(33,5)%></td>
            <td>&nbsp;<%=Bett(33,2)%></td>
            <td>&nbsp;<%=Bett(33,6)%></td>
            <td>&nbsp;<%=p4B1%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sK%>> 
            <td colspan="7" style="font-size: 1px">&nbsp;</font></td>
          </tr>
		   <tr <%=sG%>>
            <td><font size="2">5B1</font></td>
            <td>&nbsp;<%=Bett(34,1)%></td>
            <td>&nbsp;<%=Bett(34,4)%></td>
            <td>&nbsp;<%=Bett(34,5)%></td>
            <td>&nbsp;<%=Bett(34,2)%></td>
            <td>&nbsp;<%=Bett(34,6)%></td>
            <td>&nbsp;<%=p5B1%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sK%>> 
            <td colspan="7" style="font-size: 1px">&nbsp;</font></td>
          </tr>
		    <tr <%=sG%> bgcolor="#DDDDDD">
            <td><font size="2">6B1</font></td>
            <td>&nbsp;<%=Bett(35,1)%></td>
            <td>&nbsp;<%=Bett(35,4)%></td>
            <td>&nbsp;<%=Bett(35,5)%></td>
            <td>&nbsp;<%=Bett(35,2)%></td>
            <td>&nbsp;<%=Bett(35,6)%></td>
            <td>&nbsp;<%=p6B1%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		   <tr <%=sG%> bgcolor="#DDDDDD">
            <td><font size="2">6B2</font></td>
            <td>&nbsp;<%=Bett(36,1)%></td>
            <td>&nbsp;<%=Bett(36,4)%></td>
            <td>&nbsp;<%=Bett(36,5)%></td>
            <td>&nbsp;<%=Bett(36,2)%></td>
            <td>&nbsp;<%=Bett(36,6)%></td>
            <td>&nbsp;<%=p6B2%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sK%>> 
            <td colspan="7" style="font-size: 1px">&nbsp;</font></td>
          </tr>
		   <tr <%=sG%>>
            <td><font size="2">7B1</font></td>
            <td>&nbsp;<%=Bett(37,1)%></td>
            <td>&nbsp;<%=Bett(37,4)%></td>
            <td>&nbsp;<%=Bett(37,5)%></td>
            <td>&nbsp;<%=Bett(37,2)%></td>
            <td>&nbsp;<%=Bett(37,6)%></td>
            <td>&nbsp;<%=p7B1%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		   <tr <%=sG%>>
            <td><font size="2">7B2</font></td>
            <td>&nbsp;<%=Bett(38,1)%></td>
            <td>&nbsp;<%=Bett(38,4)%></td>
            <td>&nbsp;<%=Bett(38,5)%></td>
            <td>&nbsp;<%=Bett(38,2)%></td>
            <td>&nbsp;<%=Bett(38,6)%></td>
            <td>&nbsp;<%=p7B2%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sK%>> 
            <td colspan="7" style="font-size: 1px">&nbsp;</font></td>
          </tr>
		  <tr <%=sG%> bgcolor="#DDDDDD">
            <td><font size="2">8B1</font></td>
            <td>&nbsp;<%=Bett(39,1)%></td>
            <td>&nbsp;<%=Bett(39,4)%></td>
            <td>&nbsp;<%=Bett(39,5)%></td>
            <td>&nbsp;<%=Bett(39,2)%></td>
            <td>&nbsp;<%=Bett(39,6)%></td>
            <td>&nbsp;<%=p8B1%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		   <tr <%=sG%> bgcolor="#DDDDDD">
            <td><font size="2">8B2</font></td>
            <td>&nbsp;<%=Bett(40,1)%></td>
            <td>&nbsp;<%=Bett(40,4)%></td>
            <td>&nbsp;<%=Bett(40,5)%></td>
            <td>&nbsp;<%=Bett(40,2)%></td>
            <td>&nbsp;<%=Bett(40,6)%></td>
            <td>&nbsp;<%=p8B2%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sK%>> 
            <td colspan="7" style="font-size: 1px">&nbsp;</font></td>
          </tr>
		  <tr <%=sG%>>
            <td><font size="2">9B1</font></td>
            <td>&nbsp;<%=Bett(41,1)%></td>
            <td>&nbsp;<%=Bett(41,4)%></td>
            <td>&nbsp;<%=Bett(41,5)%></td>
            <td>&nbsp;<%=Bett(41,2)%></td>
            <td>&nbsp;<%=Bett(41,6)%></td>
            <td>&nbsp;<%=p9B1%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		   <tr <%=sG%>>
            <td><font size="2">9B2</font></td>
            <td>&nbsp;<%=Bett(42,1)%></td>
            <td>&nbsp;<%=Bett(42,4)%></td>
            <td>&nbsp;<%=Bett(42,5)%></td>
            <td>&nbsp;<%=Bett(42,2)%></td>
            <td>&nbsp;<%=Bett(42,6)%></td>
            <td>&nbsp;<%=p9B2%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		  <tr <%=sK%>> 
            <td colspan="7" style="font-size: 1px">&nbsp;</font></td>
          </tr>
		  <tr <%=sG%> bgcolor="#DDDDDD">
            <td><font size="2">10B1</font></td>
            <td>&nbsp;<%=Bett(43,1)%></td>
            <td>&nbsp;<%=Bett(43,4)%></td>
            <td>&nbsp;<%=Bett(43,5)%></td>
            <td>&nbsp;<%=Bett(43,2)%></td>
            <td>&nbsp;<%=Bett(43,6)%></td>
            <td>&nbsp;<%=p10B1%></td>
          </tr>
		   <% bBett= bBett + 1 %>
		   <tr <%=sG%> bgcolor="#DDDDDD">
            <td><font size="2">10B2</font></td>
            <td>&nbsp;<%=Bett(44,1)%></td>
            <td>&nbsp;<%=Bett(44,4)%></td>
            <td>&nbsp;<%=Bett(44,5)%></td>
            <td>&nbsp;<%=Bett(44,2)%></td>
            <td>&nbsp;<%=Bett(44,6)%></td>
            <td>&nbsp;<%=p10B2%></td>
          </tr>
		   <% bBett= bBett + 1%>
        </table>
		<% 
		Dim fBett,tBett
		tBett=22
		fBett=tBett - bBett
		%>
		<!--font face="Arial" size="1">Total Betten:<b><%=tBett %></b>&nbsp;&nbsp;&nbsp;&nbsp;Belegte Betten:<b><%=bBett %></b>&nbsp;&nbsp;&nbsp;&nbsp;Freie Betten:<b><%=fBett %></b></font-->
      <td width="878">
      <% =Date() & "&nbsp;" & Time()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="#" onClick="Javascript:window.print();"><font face="Arial"><font size="2" color="#FF0000"><b>D</b></font><font color="#FF0000"><b><font size="2">rucken</font></b></font></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <strong><font color="#0000CC" face="Arial" size="2"><a href="oib2.asp">Refresh</a></font>
      </strong>
	  <table width="496" border="1" cellpadding="0" cellspacing="0" bordercolor="#000099" align="top">
          <tr bgcolor="#FFFFCC" <%=s1%>> 
            <td width="257"><font face="Arial" size="2"><%=sF%>Aufgaben<%=sFk%> in jeder Schicht</font></td>
            <td width="1"><%=sF%>
              <div align="center">T</div></font>
            </td>
            <td width="121"><%=sF%>
              <div align="center">V</div></font>
            </td>
            <td width="150"><%=sF%>
              <div align="center">N</div></font>
            </td>
          </tr>
          <tr <%=s1%>> 
            <td width="257"><font face="Arial" size="2"><%=sFk%>Aufenthaltsraum</font></td>
            <td width="1">&nbsp;&nbsp;<%=sFk%><b><%=pAS11%></font></td>
            <td width="121">&nbsp;&nbsp;<%=sFk%><b><%=pAS12%></font></td>
            <td width="150">&nbsp;&nbsp;<%=sFk%><b><%=pAS13%></font></td>
          </tr>
          <tr <%=s1%>> 
            <td width="257"><font face="Arial" size="2"><%=sFk%>Beatmungsger&auml;te</font></td>
            <td width="1">&nbsp;&nbsp;<%=sFk%><b><%=pAS21%></font></td>
            <td width="121">&nbsp;&nbsp;<%=sFk%><b><%=pAS22%></font></td>
            <td width="150">&nbsp;&nbsp;<%=sFk%><b><%=pAS23%></font></td>
          </tr>
          <tr <%=s1%>> 
            <td width="257"><font face="Arial" size="2"><%=sFk%>Herzpatienten vorbereiten</font></td>
            <td width="1">&nbsp;&nbsp;<%=sFk%><b><%=pAS31%></font></td>
            <td width="121">&nbsp;&nbsp;<%=sFk%><b><%=pAS32%></font></td>
            <td width="150">&nbsp;&nbsp;<%=sFk%><b><%=pAS33%></font></td>
          </tr>

		  <tr <%=s1%>>
		  <td width="257"><font face="Arial" size="2">PEER</font><%=sFk%>&nbsp;<b><%=pAW2%></b></td>
		  <td width="110"><font face="Arial" size="2">WundManager</font>&nbsp;<%=sFk%>&nbsp;<b><%=pAS41%></b></td>
		  <td width="100"><font face="Arial" size="2">Höfa</font>&nbsp;<%=sFk%><b><%=pAS42%></b></td>
		  <td width="14">&nbsp;</td></tr>
		  
		  
		  <tr <%=s1%>>
		  <td width="257"><font face="Arial" size="2">Ordnung OIB</font></b></td>
		  <td width="110"><font face="Arial" size="2"><%=pSS1%></font></b></td>
		  <td width="100"><font face="Arial" size="2"><%=pSS2%></font></b></td>
		  <td width="14"><%=pSS3%></td></tr>
		  
		  
		  <tr <%=s1%>>
		  <td width="257"><font face="Arial" size="2">Angehörige &nbsp;<b><%=pDRG%></b></font></td>
		  <td width="110"><font face="Arial" size="2">Pain&nbsp;</font><%=sFk%><b><%=pAS43%></b></td>
		  <td width="100"><font face="Arial" size="2">Delir&nbsp;</font><%=sFk%><b><%=pAS42%></b></td>
		  <td width="14"><font face="Arial" size="2">Beatmung&nbsp;</font><%=sFk%><b><%=pBEATM%></b></td></tr>
        </table>
        <table width="496" border="1" cellpadding="0" cellspacing="0" bordercolor="#000099">
          <tr bgcolor="#FFFFCC" <%=s1%>> 
            <td colspan="3" width="492"><%=sF%><font face="Arial" size="2"><%=sF%>Aufgaben <%=sFk%>schichtbezogen</font></td>
          </tr>
          <tr <%=s1%>> 
            <td width="216"><font face="Arial" size="2"><%=sFk%>BTM bestellt /+kontrolliert</font><br><font face="Arial" size="1">(Nachtdienst Samstag)</font></td>
            
            <td width="192" colspan="2">&nbsp;&nbsp;<%=sFk%><b><%=pASB1%></b></font></td>
          </tr>
          <tr <%=s1%>> 
            <td width="216"><font face="Arial" size="2"><%=sFk%>Rea-Wagen / Notfallabsaugung</font></td>
            <td width="90">&nbsp;&nbsp;<%=sFk%>Tag</td>
            <td width="184">&nbsp;&nbsp;<%=sFk%><b><%=pASB3%></td>
          </tr>
		  <tr><td colspan="3" width="492"><font face="Arial" size="1">&nbsp</font></td></tr>
        </table>
        <table width="496" border="1" cellpadding="0" cellspacing="0" bordercolor="#000099">
          <tr bgcolor="#FFFFCC" <%=s1%>> 
            <td colspan="2" width="492"><font face="Arial" size="2"><%=sF%>Aufgaben <%=sFk%>w&ouml;chentlich</font></td>
          </tr>
          <tr <%=s1%>> 
            <td width="216"><%=sFk%><font face="Arial" size="2">CT-Wagen </font> <font face="Arial" size="1"> (Spätdienst Samstag)</font></td>
            <td width="270">&nbsp;&nbsp;<%=sFk%><b><%=pAW1%></b></Font></td>
          </tr>
          <tr <%=s1%>> 
            <td width="216"><%=sFk%><font face="Arial" size="2">Intubationtaschen</font> <font face="Arial" size="1"> (Spätdienst Samstag)</font></td>
            <td width="270">&nbsp;&nbsp;<font face="Arial"><%=sF%><%=pAW3%></Font></td>
          </tr>
          
          <tr <%=s1%>> 
            <td width="216"><%=sFk%><font face="Arial" size="2">Schluck-screening</font> <font face="Arial" size="1"></font></td>
            <td width="270">&nbsp;&nbsp;<font face="Arial"><%=sF%><%=pSS0%></Font></td>
          </tr>
          
		  <tr><td colspan="2" width="492"><font size="1">&nbsp</font></td></tr>
        </table>
        <table width="496" border="1" cellpadding="0" cellspacing="0" bordercolor="#000099" align="top">
          <tr bgcolor="#FFFFCC" <%=s1%>> 
            <td width="216">&nbsp;</td>
            <td width="80"><%=sF%> <div align="center">T</div></td>
            <td width="94"><%=sF%> <div align="center">V</div></td>
            <td width="96"><%=sF%> <div align="center">N</div></td>
          </tr>
          <tr <%=s1%>> 
            <td width="216"><font face="Arial" size="2"><%=sFk%>Beko: 87300</font></td>
            <td width="80">&nbsp;&nbsp;<%=sFk%><%=pBEKO1%></td>
            <td width="94">&nbsp;&nbsp;<%=sFk%><%=pBEKO2%></td>
            <td width="96">&nbsp;&nbsp;<%=sFk%><%=pBEKO3%></td>
          </tr>
          <tr <%=s1%>> 
            <td width="216"><font face="Arial" size="2"><%=sFk%>Oberarzt 85 200</font></td>
            <td width="174" colspan="2">&nbsp;&nbsp;<%=sFk%><%=pOA1%></td>
            <!--<td width="94">&nbsp;&nbsp;<%=sFk%><%=pOA2%></td>-->
            <td width="96">&nbsp;&nbsp;<%=sFk%><%=pOA3%></td>
          </tr>
		  <tr <%=s1%>> 
            <td width="216"><font face="Arial" size="2"><%=sFk%>2. Oberarzt</font></td>
            <td width="174" colspan="2">&nbsp;&nbsp;<%=sFk%><%=pOA21%></td>
            <!--<td width="94">&nbsp;&nbsp;<%=sFk%><%=pOA22%></td>-->
            <td width="96">&nbsp;&nbsp;<%=sFk%><%=pOA23%></td>
          </tr>
          <tr <%=s1%>> 
            <td width="216"><font face="Arial" size="2"><%=sFk%>1. Assistenzarzt 85 400</font></td>
            <td width="80">&nbsp;&nbsp;<%=sFk%><%=pDA11%></td>
            <td width="94">&nbsp;&nbsp;<%=sFk%><%=pDA12%></td>
            <td width="96">&nbsp;&nbsp;<%=sFk%><%=pDA13%></td>
          </tr>
          <tr <%=s1%>> 
            <td width="216"><%=sFk%> <font face="Arial" size="2"> 2. Assistenzarzt 87 200</font></td>
            <td width="80">&nbsp;&nbsp;<%=sFk%><%=pDA21%></td>
            <td width="94">&nbsp;&nbsp;<%=sFk%><%=pDA22%></td>
            <td width="96">&nbsp;&nbsp;<%=sFk%><%=pDA23%></td>
          </tr>
		  <tr <%=s1%>> 
            <td width="216"><%=sFk%> <font face="Arial" size="2"> 3. Assistenzarzt 85 170</font></td>
            <td width="174" colspan="2">&nbsp;&nbsp;<%=sFk%><%=pDA31%></td>
            <!--<td width="94">&nbsp;&nbsp;<%=sFk%><%=pDA32%></td>-->
            <td width="96">&nbsp;&nbsp;<%=sFk%><%=pDA33%></td>
          </tr>
		  <tr><td colspan="4" width="492"><font size="1">&nbsp</font></td></tr>
        </table>
        <textarea name="Info" cols="60" rows="9" id="Info"><%=INFO%></textarea> </td>
    </tr>
  </table>
</form>
</body>
</html>
<%
RS.Close()
Set RS = Nothing
%>


