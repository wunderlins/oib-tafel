<!--#include file="Connections/MDSi.asp" -->
<%
Dim RS
Dim RS_numRows
DIM Bett(45,7)
Set RS = Server.CreateObject("ADODB.Recordset")
RS.ActiveConnection = MM_MDSi_STRING
RS.Source = "SELECT *  FROM mdsi.dat_patfall  WHERE LOCT_01 = 'J'  ORDER BY PD_Bett"
RS.CursorType = 0
RS.CursorLocation = 2
RS.LockType = 1
RS.Open()
if 1=2 then
  y=0
  while (not rs.eof)
    y=y+1
	response.write RS.Fields.Item("PD_Name") & " - >" & RS.Fields.Item("PD_Bett") & "<<br>"
	RS.MoveNext()
  wend
  'RS.MoveFirst()
end if
RS_numRows = 0
%>
<%
' gVB  = Vorbelegt
' gKat = Kategorie
' gIt  = Intubiert
' gSP  = Sprache
' gAbt = Abteilung
IF NOT RS.EOF THEN  ' kein Datensatz'
	While (NOT RS.EOF)
	    gKA   = "" ' Klammer auf bei vorbelegt
		gKZ   = "" ' Klammer zu bei vorbelegt
	    gID   = RS.Fields.Item("FID")
        gVB   = RS.Fields.Item("LOCT_02")
		gCe  = "</strong></font>"
		if gVB="J" then gC="<font color='#000000'><strong>": gBC="": else:  gC="<font color='#000000'><strong>":  gBC = "bgcolor='#ffddaa'":	end if
		gKat =  RS.Fields.Item("LOCT_03")
		gIt  =  RS.Fields.Item("LOCT_04")
		gSP  =  RS.Fields.Item("LOCT_05")
		gAbt =  RS.Fields.Item("LOCT_06")
	    gBett = RS.Fields.Item("PD_Bett")
	    'response.write gBett+"<br>"
		if gVB="J" then gKA = "(": gKZ = ")": end if
		gName =gKA + RS.Fields.Item("PD_Name") + "&nbsp;" + RS.Fields.Item("PD_Vorname") + gKZ + "&nbsp;" + MID(RS.Fields.Item("PD_GebDat"),3,2)
		IF gBett="A1" then Bett(1,1)=gC+gName+gCe: Bett(1,2)=gKat: Bett(1,3)=gBC: Bett(1,4)=gIt: Bett(1,5)=gSP: Bett(1,6)=gAbt: Bett(1,7)=gID: end if
		IF gBett="B1" then Bett(2,1)=gC+gName+gCe: Bett(2,2)=gKat: Bett(2,3)=gBC: Bett(2,4)=gIt: Bett(2,5)=gSP: Bett(2,6)=gAbt: Bett(2,7)=gID: end if
		IF gBett="B2" then Bett(3,1)=gC+gName+gCe: Bett(3,2)=gKat: Bett(3,3)=gBC: Bett(3,4)=gIt: Bett(3,5)=gSP: Bett(3,6)=gAbt: Bett(3,7)=gID: end if
		IF gBett="B3" then Bett(4,1)=gC+gName+gCe: Bett(4,2)=gKat: Bett(4,3)=gBC: Bett(4,4)=gIt: Bett(4,5)=gSP: Bett(4,6)=gAbt: Bett(4,7)=gID: end if
		IF gBett="C1" then Bett(5,1)=gC+gName+gCe: Bett(5,2)=gKat: Bett(5,3)=gBC: Bett(5,4)=gIt: Bett(5,5)=gSP: Bett(5,6)=gAbt: Bett(5,7)=gID: end if
		IF gBett="C2" then Bett(6,1)=gC+gName+gCe: Bett(6,2)=gKat: Bett(6,3)=gBC: Bett(6,4)=gIt: Bett(6,5)=gSP: Bett(6,6)=gAbt: Bett(6,7)=gID: end if
		IF gBett="C3" then Bett(7,1)=gC+gName+gCe: Bett(7,2)=gKat: Bett(7,3)=gBC: Bett(7,4)=gIt: Bett(7,5)=gSP: Bett(7,6)=gAbt: Bett(7,7)=gID: end if
		IF gBett="D1" then Bett(8,1)=gC+gName+gCe: Bett(8,2)=gKat: Bett(8,3)=gBC: Bett(8,4)=gIt: Bett(8,5)=gSP: Bett(8,6)=gAbt: Bett(8,7)=gID: end if
		IF gBett="D2" then Bett(9,1)=gC+gName+gCe: Bett(9,2)=gKat: Bett(9,3)=gBC: Bett(9,4)=gIt: Bett(9,5)=gSP: Bett(9,6)=gAbt: Bett(9,7)=gID: end if
		IF gBett="D3" then Bett(10,1)=gC+gName+gCe: Bett(10,2)=gKat: Bett(10,3)=gBC: Bett(10,4)=gIt: Bett(10,5)=gSP: Bett(10,6)=gAbt: Bett(10,7)=gID: end if
		IF gBett="E1" then Bett(11,1)=gC+gName+gCe: Bett(11,2)=gKat: Bett(11,3)=gBC: Bett(11,4)=gIt: Bett(11,5)=gSP: Bett(11,6)=gAbt: Bett(11,7)=gID: end if
		IF gBett="E2" then Bett(12,1)=gC+gName+gCe: Bett(12,2)=gKat: Bett(12,3)=gBC: Bett(12,4)=gIt: Bett(12,5)=gSP: Bett(12,6)=gAbt: Bett(12,7)=gID: end if
		IF gBett="E3" then Bett(13,1)=gC+gName+gCe: Bett(13,2)=gKat: Bett(13,3)=gBC: Bett(13,4)=gIt: Bett(13,5)=gSP: Bett(13,6)=gAbt: Bett(13,7)=gID: end if
		IF gBett="F1" then Bett(14,1)=gC+gName+gCe: Bett(14,2)=gKat: Bett(14,3)=gBC: Bett(14,4)=gIt: Bett(14,5)=gSP: Bett(14,6)=gAbt: Bett(14,7)=gID: end if
		IF gBett="G1" then Bett(15,1)=gC+gName+gCe: Bett(15,2)=gKat: Bett(15,3)=gBC: Bett(15,4)=gIt: Bett(15,5)=gSP: Bett(15,6)=gAbt: Bett(15,7)=gID: end if
		IF gBett="G2" then Bett(16,1)=gC+gName+gCe: Bett(16,2)=gKat: Bett(16,3)=gBC: Bett(16,4)=gIt: Bett(16,5)=gSP: Bett(16,6)=gAbt: Bett(16,7)=gID: end if
		IF gBett="G3" then Bett(17,1)=gC+gName+gCe: Bett(17,2)=gKat: Bett(17,3)=gBC: Bett(17,4)=gIt: Bett(17,5)=gSP: Bett(17,6)=gAbt: Bett(17,7)=gID: end if
		IF gBett="H1" then Bett(18,1)=gC+gName+gCe: Bett(18,2)=gKat: Bett(18,3)=gBC: Bett(18,4)=gIt: Bett(18,5)=gSP: Bett(18,6)=gAbt: Bett(18,7)=gID: end if
		IF gBett="W1" then Bett(19,1)=gC+gName+gCe: Bett(19,2)=gKat: Bett(19,3)=gBC: Bett(19,4)=gIt: Bett(19,5)=gSP: Bett(19,6)=gAbt: Bett(19,7)=gID: end if
		IF gBett="W2" then Bett(20,1)=gC+gName+gCe: Bett(20,2)=gKat: Bett(20,3)=gBC: Bett(20,4)=gIt: Bett(20,5)=gSP: Bett(20,6)=gAbt: Bett(20,7)=gID: end if
		IF gBett="W3" then Bett(21,1)=gC+gName+gCe: Bett(21,2)=gKat: Bett(21,3)=gBC: Bett(21,4)=gIt: Bett(21,5)=gSP: Bett(21,6)=gAbt: Bett(21,7)=gID: end if
		IF gBett="W4" then Bett(22,1)=gC+gName+gCe: Bett(22,2)=gKat: Bett(22,3)=gBC: Bett(22,4)=gIt: Bett(22,5)=gSP: Bett(22,6)=gAbt: Bett(22,7)=gID: end if
		IF gBett="1B1" then Bett(23,1)=gC+gName+gCe: Bett(23,2)=gKat: Bett(23,3)=gBC: Bett(23,4)=gIt: Bett(23,5)=gSP: Bett(23,6)=gAbt: Bett(23,7)=gID: end if
		IF gBett="1B2" then Bett(24,1)=gC+gName+gCe: Bett(24,2)=gKat: Bett(24,3)=gBC: Bett(24,4)=gIt: Bett(24,5)=gSP: Bett(24,6)=gAbt: Bett(24,7)=gID: end if
		IF gBett="1B3" then Bett(25,1)=gC+gName+gCe: Bett(25,2)=gKat: Bett(25,3)=gBC: Bett(25,4)=gIt: Bett(25,5)=gSP: Bett(25,6)=gAbt: Bett(25,7)=gID: end if
		IF gBett="1B4" then Bett(26,1)=gC+gName+gCe: Bett(26,2)=gKat: Bett(26,3)=gBC: Bett(26,4)=gIt: Bett(26,5)=gSP: Bett(26,6)=gAbt: Bett(26,7)=gID: end if
		IF gBett="2B1" then Bett(27,1)=gC+gName+gCe: Bett(27,2)=gKat: Bett(27,3)=gBC: Bett(27,4)=gIt: Bett(27,5)=gSP: Bett(27,6)=gAbt: Bett(27,7)=gID: end if
		IF gBett="2B2" then Bett(28,1)=gC+gName+gCe: Bett(28,2)=gKat: Bett(28,3)=gBC: Bett(28,4)=gIt: Bett(28,5)=gSP: Bett(28,6)=gAbt: Bett(28,7)=gID: end if
		IF gBett="3B1" then Bett(29,1)=gC+gName+gCe: Bett(29,2)=gKat: Bett(29,3)=gBC: Bett(29,4)=gIt: Bett(29,5)=gSP: Bett(29,6)=gAbt: Bett(29,7)=gID: end if
		IF gBett="3B2" then Bett(30,1)=gC+gName+gCe: Bett(30,2)=gKat: Bett(30,3)=gBC: Bett(30,4)=gIt: Bett(30,5)=gSP: Bett(30,6)=gAbt: Bett(30,7)=gID: end if
		IF gBett="3B3" then Bett(31,1)=gC+gName+gCe: Bett(31,2)=gKat: Bett(31,3)=gBC: Bett(31,4)=gIt: Bett(31,5)=gSP: Bett(31,6)=gAbt: Bett(31,7)=gID: end if
		IF gBett="3B4" then Bett(32,1)=gC+gName+gCe: Bett(32,2)=gKat: Bett(32,3)=gBC: Bett(32,4)=gIt: Bett(32,5)=gSP: Bett(32,6)=gAbt: Bett(32,7)=gID: end if
		IF gBett="4B1" then Bett(33,1)=gC+gName+gCe: Bett(33,2)=gKat: Bett(33,3)=gBC: Bett(33,4)=gIt: Bett(33,5)=gSP: Bett(33,6)=gAbt: Bett(33,7)=gID: end if
		IF gBett="5B1" then Bett(34,1)=gC+gName+gCe: Bett(34,2)=gKat: Bett(34,3)=gBC: Bett(34,4)=gIt: Bett(34,5)=gSP: Bett(34,6)=gAbt: Bett(34,7)=gID: end if
		IF gBett="6B1" then Bett(35,1)=gC+gName+gCe: Bett(35,2)=gKat: Bett(35,3)=gBC: Bett(35,4)=gIt: Bett(35,5)=gSP: Bett(35,6)=gAbt: Bett(35,7)=gID: end if
		IF gBett="6B2" then Bett(36,1)=gC+gName+gCe: Bett(36,2)=gKat: Bett(36,3)=gBC: Bett(36,4)=gIt: Bett(36,5)=gSP: Bett(36,6)=gAbt: Bett(36,7)=gID: end if
		IF gBett="7B1" then Bett(37,1)=gC+gName+gCe: Bett(37,2)=gKat: Bett(37,3)=gBC: Bett(37,4)=gIt: Bett(37,5)=gSP: Bett(37,6)=gAbt: Bett(37,7)=gID: end if
		IF gBett="7B2" then Bett(38,1)=gC+gName+gCe: Bett(38,2)=gKat: Bett(38,3)=gBC: Bett(38,4)=gIt: Bett(38,5)=gSP: Bett(38,6)=gAbt: Bett(38,7)=gID: end if
		IF gBett="8B1" then Bett(39,1)=gC+gName+gCe: Bett(39,2)=gKat: Bett(39,3)=gBC: Bett(39,4)=gIt: Bett(39,5)=gSP: Bett(39,6)=gAbt: Bett(39,7)=gID: end if
		IF gBett="8B2" then Bett(40,1)=gC+gName+gCe: Bett(40,2)=gKat: Bett(40,3)=gBC: Bett(40,4)=gIt: Bett(40,5)=gSP: Bett(40,6)=gAbt: Bett(40,7)=gID: end if
		IF gBett="9B1" then Bett(41,1)=gC+gName+gCe: Bett(41,2)=gKat: Bett(41,3)=gBC: Bett(41,4)=gIt: Bett(41,5)=gSP: Bett(41,6)=gAbt: Bett(41,7)=gID: end if
		IF gBett="9B2" then Bett(42,1)=gC+gName+gCe: Bett(42,2)=gKat: Bett(42,3)=gBC: Bett(42,4)=gIt: Bett(42,5)=gSP: Bett(42,6)=gAbt: Bett(42,7)=gID: end if
		IF gBett="10B1" then Bett(43,1)=gC+gName+gCe: Bett(43,2)=gKat: Bett(43,3)=gBC: Bett(43,4)=gIt: Bett(43,5)=gSP: Bett(43,6)=gAbt: Bett(43,7)=gID: end if
		IF gBett="10B2" then Bett(44,1)=gC+gName+gCe: Bett(44,2)=gKat: Bett(44,3)=gBC: Bett(44,4)=gIt: Bett(44,5)=gSP: Bett(44,6)=gAbt: Bett(44,7)=gID: end if
	    RS.MoveNext()
   WEND
  'RS.MoveFirst()
END IF
%>	

