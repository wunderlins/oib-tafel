 <%@ Language=VBScript %>
<%
 DIM heute, oraDatum, DienstX(150,2), OKDaten
  heute = CStr(Date)
  oraDatum = mid(heute,7,4) & "-" & mid(heute,4,2) & "-" & mid(heute,1,2) ' ergiebt: 2001-06-21 00:00:00
  wnr = WeekDay(Date)
  if wnr=1 then wt="So": end if
  if wnr=2 then wt="Mo": end if
  if wnr=3 then wt="Di": end if
  if wnr=4 then wt="Mi": end if
  if wnr=5 then wt="Do": end if
  if wnr=6 then wt="Fr": end if
  if wnr=7 then wt="Sa": end if
if 1=2 then  
  Response.write heute & "<br>"
  response.write "Select Datum = " & oraDatum & "<br>"
end if  

  SQL =      "SELECT PL.DATUM, PL.KNOTEN_ID, PL.PA_CODE, MA.KUERZEL, MA.NACHNAME, MA.VORNAME"
  SQL = SQL +"FROM ECBERN.DIENST D, ECBERN.MITARBEITER MA, ECBERN.PLANUNG PL "
  SQL = SQL +"FROM ECBERN.MITARBEITER MA, ECBERN.PLANUNG PL "
  SQL = SQL +"WHERE (MA.ID = PL.MITARBEITER_ID) "
  'SQL = SQL +"AND D.PA_CODE = PL.PA_CODE "
  'SQL = SQL +"AND (PL.KNOTEN_ID=14411 "
  'SQL = SQL +"OR   PL.KNOTEN_ID=14412 "
  'SQL = SQL +"OR   PL.KNOTEN_ID=14413 "
  'SQL = SQL +"OR   PL.KNOTEN_ID=14414 "
  'SQL = SQL +"OR   PL.KNOTEN_ID=14415 "
  'SQL = SQL +"OR   PL.KNOTEN_ID=16805 "
  'SQL = SQL +"OR   PL.KNOTEN_ID=18019 "
  'SQL = SQL +"OR   PL.KNOTEN_ID=18062) "
  
  SQL = SQL +"AND (PL.KNOTEN_ID=99999 "
  SQL = SQL +"OR   PL.KNOTEN_ID=18019 "
  SQL = SQL +"OR   PL.KNOTEN_ID=18062 "
  SQL = SQL +"OR   PL.KNOTEN_ID=16805 "
  SQL = SQL +"OR   PL.KNOTEN_ID=14415 "
  SQL = SQL +"OR   PL.KNOTEN_ID=14411 "
  SQL = SQL +"OR   PL.KNOTEN_ID=14412 "
  SQL = SQL +"OR   PL.KNOTEN_ID=14413) "
  
  
  
  SQL = SQL +"AND (PL.DATUM={ts '" & oraDatum & "'}) "
  'SQL = SQL +"AND (PL.DATUM={ts '2003-12-03 00:00:00'})) "
  SQL = SQL +"ORDER BY PL.PA_CODE,MA.VORNAME,MA.NACHNAME ASC"



  set DBconnection=server.createobject("adodb.connection")
  DATENBANK = "dsn=PEPUSB;uid=buelow;pwd=buelow"
  DBconnection.open DATENBANK
  set RS=DBconnection.execute(SQL)

IF RS.eof THEN
  OKDaten = "False"' Daten nicht vorhanden
  response.write "<font color='#FF0000'><b><font size='6'>" & "Keine Daten  erhalten vom PEP " & "</font></b></font>" &"<br>"
ELSE
  OKDaten = "True"
END IF

'response.write "OKDaten: " & OKDaten & "<br>"

'---Array mit Daten Füllen--------------------------------------
DIM y
y = 0
IF OKDaten="True" THEN  ' Daten vorhanden
  RS.MoveFirst()
  DO UNTIL RS.eof  OR (y>=150)
       y=y+1
       DienstX(y,1) = RS("PA_CODE")
	   DienstX(y,2) = RS("VORNAME")  & " "& RS("NACHNAME")
       'response.Write y & " / " & DienstX(y,1) & " - " & DienstX(y,2) & "<br>"
    RS.MoveNext()
  LOOP
END IF
'---Array-Ausgabe--------------------------------------------------
if OKDaten="True" then
   'response.Write "Augabe Dienst Personanen " & "<br>"
   'response.write " Anzahl Zeilen = " & y & "<br>"
   '-----AUSGABE-----------------------
   sub HTML_Ausgabe(Dienst,Person,Farbe)
     %><tr>
	   <td bgcolor="<%=Farbe%>">&nbsp;<%=Dienst%></td>
	   <td>&nbsp;<%=Person%></td>
	 </tr><%
   end sub
   '----SCHAUFE------------------------
   sub Schlaufe(Nr,Bez,Farbe)
     for i = 1 to y 
       if TRIM(DienstX(i,1)) = TRIM(Nr) then  HTML_Ausgabe Bez ,  DienstX(i,2) , Farbe : end if
     next
   end sub
   '----TITEL--------------------------
   sub Titel(sName,Farbe,cSchrift)
     %><tr bgcolor="<%=Farbe%>">
	   <td>&nbsp;</td>
	   <td><font face="Arial" color="<%=cSchrift%>"><b>&nbsp;<b><%=sName%></font></b></td>
	 </tr><%
   end sub
   '------------------------------------ %>
     <table width="25%" border="1" cellspacing="0" cellpadding="0">
	 <tr><td>&nbsp;</td><td>&nbsp;<font size="5"><b><%=wt%>.&nbsp;<%= Heute%></b></font></td></tr>
	 <%
     Titel "Tagdienst",  "#aaFFaa" , "#003399"
     Schlaufe "149" ,    "BEKO" ,    "#aaFFaa"
     Schlaufe "157" ,    "IPS" ,     "#aaFFaa"
     Schlaufe "148" ,    "AKP" ,     "#aaFFaa"
     Titel "Spätdienst",   "#FFFF99" , "#003399"
     Schlaufe "177" ,    "BEKO" ,    "#FFFF99"
     Schlaufe "202" ,    "IPS" ,     "#FFFF99"
     Schlaufe "176" ,    "AKP" ,     "#FFFF99"
     Titel "Nachtdienst", "#FFAAAA" , "#FFFFFF"
     Schlaufe "225" ,    "BEKO" ,    "#FFAAAA"
     Schlaufe "233" ,    "IPS" ,     "#FFAAAA"
     Schlaufe "223" ,    "AKP" ,     "#FFAAAA"
     Titel "Loginstik",  "#FFFFFF" ,  "#000000"
     Schlaufe "161" ,     "A" ,     "#FFFFFF"
     Schlaufe "118" ,     "I" ,     "#FFFFFF"
     Schlaufe "119" ,     "M" ,     "#FFFFFF"
   %></table>
<%
end if 
%>


<html>
<!--#include file="Connections/Version.asp" -->
<head>
<title><%=VER%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
</body>
</html>

