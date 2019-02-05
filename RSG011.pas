// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FReportesContables
// Fecha de Creación : 10/01/2018
// Autor : Isaac Revilla
// Objetivo : Formulario exportar sustentos contables a Excel y SVC
// HPC_201801_RSG: Creación del reporte
unit RSG011;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdbdatetimepicker, Mask, wwdbedit, Wwdbspin, Buttons,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBGrids, ComCtrls, ShellCtrls;

type
  TFReportesContables = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    gbperiodo: TGroupBox;
    dbseMes: TwwDBSpinEdit;
    dbseAno: TwwDBSpinEdit;
    dtpFecIni: TwwDBDateTimePicker;
    dtpFecFin: TwwDBDateTimePicker;
    edtFecha: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    GroupBox3: TGroupBox;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    rgExportarA: TRadioGroup;
    BitSalir: TBitBtn;
    dbgAExcel: TDBGrid;
    gbruta: TGroupBox;
    stvarc: TShellTreeView;
    procedure BitBtn4Click(Sender: TObject);
    procedure DatosFecha;
    procedure dbseMesExit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitSalirClick(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure rgExportarAClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    xWhereBusqueda: String;
    cLink    : String;
    xPeriodo : String;
    procedure ParametrosPlanilla;
    procedure ParametrosBoleta;
    procedure ParametrosEfectivo;
    procedure ParametrosFondo;
    procedure ParametrosAplicaFPD;
    procedure ParametrosCCI;
    procedure ParametrosCXC;
    procedure ExpSVC(xarchivo:String);
    procedure chktipexp;

  public
    { Public declarations }
  end;

var
  FReportesContables: TFReportesContables;
  wTipoCont, xWhereIncluyeLote:String;
  xMesDes, xfecmes,xfecdia,xfectrim,xfecsem,xfecss,xfecaatri,xfecaasem,xfecaass : String;
  xWhereExcluye:String;
  wTipoCont2:String;
  xArchivo : String;
  xDiaIni, xDiaFin, xMes, xAno : String;
  xTCambio : String;

implementation

uses RSGDM1;{$R *.dfm}

procedure TFReportesContables.BitBtn4Click(Sender: TObject);
Var xSql:String;
begin
   DatosFecha;
   chktipexp;
   ParametrosPlanilla;
   screen.Cursor := crHourglass;
   xSql:=' SELECT  TO_CHAR(A.FREG,''YYYYMM'') PERIODO, A.FREG FEC_REGISTRO,'
   +' CASE  WHEN A.FORPAGABR=''PLA'' THEN ''PLANILLA MINISTERIAL'''
   +'       WHEN A.FORPAGABR=''REG'' THEN ''PLANILLA REGIONAL'''
   +'       WHEN A.FORPAGABR=''CEF'' THEN ''ESCUELA FISCALIZADA'' END AS TIPO_PLA,'
   +' A.UPROID UPRO,  A.UPAGOID UPAG, A.USEID UGEL, A.ASOID, SUBSTR(A.CREDID,9,7) CREDID, A.CREDOCPAG,'
   +' A.CREDOCPAG, A.NROOPE NUM_OPE,  MAX(A.CREANO||''-''||A.CREMES) PERCUO,'
   +' A.ASOCODMOD CODMODULAR, MIN(A.ASOAPENOM) ASOAPENOM, MIN(C.UPRONOM) UPRONOM, MIN(B.USENOM) USENOM,'
   +' MIN(B.CCOSID) CCOSID, MIN(A.TIPCREID) TIPCREID, MIN(D.TIPCREDES) TIPCREDES,'
   +' MIN(nvl(A.BANCOID,''SIN VALOR'')) BANCOID, MIN(NVL(E.BANCONOM,''SIN VALOR'')) BANCONOM,'
   +' MAX(NVL(A.CCBCOID,''SIN VALOR'')) CCBCOID, MIN(A.CREFPAG) FOPERAC,'
   +' SUM(NVL(A.CREMTOCOB,0)) CREMTOCOB, SUM(NVL(A.CREAMORT,0)) CREAMORT, SUM(NVL(A.CREINTERES,0)) CREINTERES,'
   +' SUM(NVL(A.CREFLAT,0)) CREFLAT, SUM(NVL(A.CREMTOEXC,0)) CREMTOEXC, SUM(NVL(A.MONCOBDESGRAV,0)) MONCOBDESGRAV'
   +' FROM CRE310 A, (SELECT UPROID,USEID,MAX(CCOSID) CCOSID,MAX(USENOM) USENOM FROM APO101 GROUP BY UPROID,USEID) B,'
   +' APO102 C, CRE110 D, TGE105 E'
   +' WHERE '+xWhereBusqueda
   +' AND NOT CREESTID IN (''13'',''04'',''99'')'
   +' AND A.UPROID=B.UPROID(+) AND A.USEID=B.USEID(+) and A.UPROID = C.UPROID (+)'
   +' AND A.TIPCREID=D.TIPCREID(+)'
   +' AND A.BANCOID=E.BANCOID (+)'
   +' AND A.CIAID(+)=''02'''
   +' GROUP BY FORPAGABR, TO_CHAR(A.FREG,''YYYYMM''), A.FREG, A.UPROID, A.USEID, A.ASOID, A.CREDID, A.CREDOCPAG, A.ASOCODMOD, A.NROOPE, A.ASOCODMOD, A.UPROID, A.UPAGOID, A.USEID, A.NROOPE'
   +' ORDER BY FORPAGABR, TO_CHAR(A.FREG,''YYYYMM''), A.UPROID, A.USEID, A.CREDOCPAG';
   dm1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames := '';   
   dm1.cdsQry1.DataRequest(xSql);
   dm1.cdsQry1.Open;
   If DM1.cdsQry1.RecordCount<=0 then
   begin
      ShowMessage('No existe información para exportar');
      Screen.Cursor := crDefault;
      Exit;
   end;
   dbgAExcel.DataSource := DM1.dsQry1;
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_SUSPLA',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_SUSPLA');
   Screen.Cursor := crDefault;
end;

procedure TFReportesContables.DatosFecha;
var
   xSQL    : String;
   xFecCnt : String;
begin
   xDiaIni := '01/'+dbseMes.Text+'/'+dbseAno.Text;
   xMes := DM1.strZero(inttostr(strtoint(dbseMes.Text)+1),2);
   if strtoint(xMes)>12 then
      xDiaFin := '31/12/'+dbseAno.Text
   else
   begin
      xDiaFin := datetostr(strtodate('01/'+xMes+'/'+dbseAno.Text)-1);
   end;
   edtFecha.Text:=xDiaFin;
   xFecCnt      :=xDiaFin;
   xPeriodo     :=dbseAno.Text+dbseMes.Text;
   if xPeriodo='200703' then
   begin
      if (wTipoCont2='EFE') or (wTipoCont2='BOL') then
         xDiaFin := '11/04/2007';
   end;
   if xPeriodo='200704' then
   begin
      if (wTipoCont2='EFE') or (wTipoCont2='BOL') then
         xDiaIni := '12/04/2007';
      if (wTipoCont2='PLA') or (wTipoCont2='EFE') or (wTipoCont2='BOL') then
         xDiaFin := '19/05/2007';
   end;
   if xPeriodo='200705' then
   begin
      if wTipoCont2='PLA' then
      begin
         xDiaIni := '20/05/2007';
         xDiaFin := '31/05/2007';
      end;
      if (wTipoCont2='EFE') or (wTipoCont2='BOL') then
      begin
         xDiaIni := '20/05/2007';
         xDiaFin := '11/06/2007';
      end;
   end;
   if xPeriodo='200706' then
   begin
      if (wTipoCont2='EFE') or (wTipoCont2='BOL') then
      begin
         xDiaIni := '12/06/2007';
         xDiaFin := '30/06/2007';
      end;
   end;
   if xPeriodo='200902' then
   begin
      if (wTipoCont2='REFI') then
      begin
         xDiaIni := '01/10/2008';
         xDiaFin := '28/02/2009';
      end;
   end;
   dtpFecIni.Date:=StrToDate(xDiaIni);
   dtpFecFin.Date:=StrToDate(xDiaFin);
   xSQL := 'SELECT * FROM TGE181 WHERE MESIDR='+quotedstr(dbseMes.Text);
   DM1.cdsQry.close;
   DM1.cdsQry.DataRequest(Xsql);
   DM1.cdsQry.open;
   xMesDes:=dm1.cdsQry.FieldByName('MESDESL').AsString;
   xSQL := 'SELECT * FROM TGE114 WHERE TO_CHAR(FECHA,''DD/MM/YYYY'') = '+quotedstr( xFecCnt );
   DM1.cdsQry.close;
   DM1.cdsQry.DataRequest(Xsql);
   DM1.cdsQry.open;
   xfecmes  := dm1.cdsQry.FieldByName('FECMES').AsString;
   xfecdia  := dm1.cdsQry.FieldByName('FECDIA').AsString;
   xfectrim := dm1.cdsQry.FieldByName('FECTRIM').AsString;
   xfecsem  := dm1.cdsQry.FieldByName('FECSEM').AsString;
   xfecss   := dm1.cdsQry.FieldByName('FECSS').AsString;
   xfecaatri:= dm1.cdsQry.FieldByName('FECAATRI').AsString;
   xfecaasem:= dm1.cdsQry.FieldByName('FECAASEM').AsString;
   xfecaass := dm1.cdsQry.FieldByName('FECAASS').AsString;
   xSQL := 'SELECT * FROM TGE107 WHERE TO_CHAR(FECHA,''DD/MM/YYYY'') = '+quotedstr( xFecCnt );
   DM1.cdsQry.close;
   DM1.cdsQry.DataRequest(Xsql);
   DM1.cdsQry.open;
   xTCambio := dm1.cdsQry.fieldbyname('TCAMVBC').AsString;
   if xTCambio = '' then
      ShowMessage('No hay Tipo de cambio para el ' + xdiafin);
end;

procedure TFReportesContables.dbseMesExit(Sender: TObject);
begin
   dbseMes.Text := DM1.StrZero(dbseMes.Text,2);
end;

procedure TFReportesContables.ParametrosPlanilla;
begin
   wTipoCont := 'PL';
   wTipoCont2:= 'PLA';
   dbseMes.Text := DM1.StrZero(dbseMes.Text,2);
   DatosFecha;
   xWhereBusqueda:=' A.FREG BETWEEN '+QuotedStr(dtpFecIni.Text)+' AND '+QuotedStr(dtpFecFin.Text)+' '
                  +' and A.TIPOCONT='+quotedstr( wTipoCont2 )+' ';
   xWhereIncluyeLote:=' ';
end;

procedure TFReportesContables.BitBtn5Click(Sender: TObject);
var xSql:String;
begin
   DatosFecha;
   chktipexp;
   ParametrosBoleta;   
   screen.Cursor := crHourglass;
   xSql:='SELECT A.CREFPAG FOPERAC, TO_CHAR(MIN(A.CREFPAG), ''YYYYMM'') PER_OPERAC,'
   +' A.FREG FEC_REGISTRO, A.UPROID, A.UPAGOID, A.USEID UGEL, A.ASOCODMOD, A.ASOID,'
   +' A.CREDID CREDID, F.CREANO||F.CREMES PER_CUOTA, A.CREDOCPAG, MIN(A.ASOAPENOM) ASOAPENOM, '
   +' MIN(C.UPRONOM) UPRONOM, MIN(B.USENOM) USENOM, MIN(B.CCOSID) CCOSID, MIN(A.TIPCREID) TIPCREID, '
   +' MIN(D.TIPCREDES) TIPCREDES, MIN(A.BANCOID) BANCOID, MIN(E.BANCONOM) BANCONOM, MAX(A.CCBCOID) CCBCOID, '
   +' SUM(NVL(A.CREMTOCOB, 0)) CREMTOCOB, SUM(NVL(A.CREAMORT, 0)) CREAMORT, SUM(NVL(A.CREINTERES, 0)) CREINTERES, '
   +' SUM(NVL(A.CREFLAT, 0)) CREFLAT, SUM(NVL(A.CREMTOEXC, 0)) CREMTOEXC, SUM(NVL(A.MONCOBDESGRAV, 0)) MONCOBDESGRAV '
   +' FROM CRE310 A,'
   +' (SELECT UPROID, USEID, MAX(CCOSID) CCOSID, MAX(USENOM) USENOM FROM APO101 GROUP BY UPROID,USEID) B,'
   +' APO102 C, CRE110 D, TGE105 E, CRE302 F  '
   +' WHERE '+xWhereBusqueda
   +' AND A.CREDOCPAG IS NOT NULL'
   +' AND NOT A.CREESTID IN (''13'')'
   +' AND A.BANCOID IS NOT NULL AND A.CCBCOID IS NOT NULL'
   +' AND A.UPROID = B.UPROID(+) and A.USEID = B.USEID(+) AND A.UPROID = C.UPROID(+)'
   +' AND A.TIPCREID = D.TIPCREID(+)'
   +' AND A.BANCOID = E.BANCOID(+) AND A.CIAID = ''02'''
   +' AND F.CREDID = A.CREDID AND A.ASOID = F.ASOID AND A.CRECUOTA = F.CRECUOTA'
   +' GROUP BY A.CREFPAG, A.UPROID, A.USEID, A.ASOID, A.CREDID, A.CREDOCPAG,A.FREG,A.ASOCODMOD,A.UPAGOID,F.CREANO,F.CREMES,A.CCBCOID, A.CREDOCPAG'
   +' ORDER BY TO_CHAR(A.CREFPAG, ''MM/YYYY''), A.CCBCOID, A.CREDOCPAG';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames := 'PER_OPERAC;CCBCOID';
   DM1.cdsQry1.DataRequest(xSql);
   DM1.cdsQry1.Open;
   If DM1.cdsQry1.RecordCount<=0 Then
   Begin
      ShowMessage('No existe información para exportar');
      Screen.Cursor := crDefault;
      Exit;
   End;
   dbgAExcel.DataSource := DM1.dsQry1;
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_SUSBOLDEP',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_SUSBOLDEP');
   Screen.Cursor := crDefault;
End;

procedure TFReportesContables.ParametrosBoleta;
begin
   wTipoCont := 'BO';
   wTipoCont2:= 'BOL';
   dbseMes.Text := DM1.StrZero(dbseMes.Text,2);
   DatosFecha;
   xWhereBusqueda:=' A.FREG BETWEEN '+QuotedStr(dtpFecIni.Text)+' AND '+QuotedStr(dtpFecFin.Text)+' '
                  +' and A.TIPOCONT='+quotedstr( wTipoCont2 )+' ';
   if xPeriodo='200703' then
   begin
   xWhereExcluye := ' and A.FREG<=''15/04/2007'' '
                  + ' and ( not CREESTID in (''13'',''04'') OR (ASOID=''0000279277'') ) ';
   xWhereBusqueda:=xWhereBusqueda+xWhereExcluye
   end;
   if xPeriodo='200704' then
   begin
   xWhereExcluye :=' and not ( '
                  +    ' A.CREFPAG BETWEEN '+QuotedStr('01/04/2007')+' AND '+QuotedStr('11/04/2007')+' '
                  +' and A.TIPOCONT='+quotedstr( wTipoCont2 )+' '
                  +' and A.FREG<=''15/04/2007'' '
                  +' and ( not CREESTID in (''13'',''04'') OR (ASOID=''0000279277'') ) '
                  +    ' ) ';
   xWhereBusqueda:=xWhereBusqueda+xWhereExcluye
   end;
   xWhereIncluyeLote:=' ';
end;

procedure TFReportesContables.BitBtn6Click(Sender: TObject);
Var xSQL:String;
begin
   DatosFecha;
   chktipexp;
   ParametrosEfectivo;
   Screen.Cursor := crHourGlass;
   xSQL := 'SELECT A.FREG FEC_REGISTRO,A.USUARIO,A.ASOCODMOD,A.ASOAPENOM,MIN(A.TIPCREID) TIPCREID,MIN(A.BANCOID) BANCOID,'
   +' MAX(A.CCBCOID) CCBCOID,A.CREDID CREDID,A.NROOPE,A.FOPERAC,F.CREANO||F.CREMES PER_CUOTA,A.UPROID,A.UPAGOID,A.USEID UGEL,'
   +' B.USERNOM, A.CREFPAG, SUM(NVL(A.CREMTOCOB, 0)) CREMTOCOB, SUM(NVL(A.CREAMORT, 0)) CREAMORT, SUM(NVL(A.CREINTERES, 0)) CREINTERES,'
   +' SUM(NVL(A.CREFLAT, 0)) CREFLAT, SUM(NVL(A.CREMTOEXC, 0)) CREMTOEXC, SUM(NVL(A.MONCOBDESGRAV, 0)) MONCOBDESGRAV,'
   +' ''COBRANZAS EN EFECTIVO DEL MES DE '+xMesDes+' DEL '+dbseAno.Text+''' PERIODO'
   +' FROM CRE310 A, USERTABLE B, CRE302 F'
   +' WHERE '+xWhereBusqueda
   +' AND A.CREESTID <> ''13'' AND A.CREESTID <> ''99'' AND A.CREESTID <> ''04'''
   +' AND A.USUARIO = B.USERID(+) AND F.CREDID = A.CREDID AND A.ASOID = F.ASOID AND A.CRECUOTA = F.CRECUOTA'
   +' GROUP BY A.USUARIO, B.USERNOM, A.CREFPAG, A.FREG, A.ASOCODMOD, A.ASOAPENOM, A.TIPCREID, A.BANCOID, A.CREDID, F.CREANO, F.CREMES, A.UPROID,'
   +' A.UPAGOID, A.USEID, A.CCBCOID, A.NROOPE, A.FOPERAC'
   +' ORDER BY A.USUARIO, B.USERNOM, A.CREFPAG';
   dm1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames := '';   
   dm1.cdsQry1.DataRequest(xSQL);
   dm1.cdsQry1.Open;
   If DM1.cdsQry1.RecordCount<=0 then
   begin
      ShowMessage('No existe información para exportar');
      Screen.Cursor := crDefault;
      Exit;
   end;
   dbgAExcel.DataSource := DM1.dsQry1;
   xArchivo:='ReporteSustentoCuotasEfectivo';
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_SUSCOBEFE',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_SUSCOBEFE');
   Screen.Cursor := crDefault;
end;

procedure TFReportesContables.ParametrosEfectivo;
begin
   wTipoCont := 'EF';
   wTipoCont2 := 'EFE';
   dbseMes.Text := DM1.StrZero(dbseMes.Text,2);
   DatosFecha;
   xWhereBusqueda:=' A.FREG BETWEEN '+QuotedStr(dtpFecIni.Text)+' AND '+QuotedStr(dtpFecFin.Text)+' '
                  +' and A.TIPOCONT='+quotedstr( wTipoCont2 )+' ';
   xWhereIncluyeLote := ' and ( CNTLOTE>=''EF01'' and CNTLOTE<=''EF99'' ) ';
end;

procedure TFReportesContables.BitBtn7Click(Sender: TObject);
Var xSQL:String;
begin
   DatosFecha;
   chktipexp;
   ParametrosFondo;
   Screen.Cursor := crHourGlass;
   xSQL:= 'SELECT A.FREG FEC_REGISTRO, A.USUARIO, A.ASOCODMOD, A.ASOAPENOM, A.CREDID, C.CREFOTORG, C.CREMTONABO, A.CREFPAG, A.NROOPE,'
   +' A.FOPERAC, SUM(NVL(A.CREMTOCOB, 0)) CREMTOCOB, SUM(NVL(A.CREAMORT, 0)) CREAMORT, SUM(NVL(A.CREINTERES, 0)) CREINTERES,'
   +' SUM(NVL(A.CREFLAT, 0)) CREFLAT, SUM(NVL(A.CREMTOEXC, 0)) CREMTOEXC, SUM(NVL(A.MONCOBDESGRAV, 0)) MONCOBDESGRAV'
   +' FROM CRE310 A, USERTABLE B, CRE301 C'
   +' WHERE '+xWhereBusqueda
   +' AND A.CREESTID NOT IN (''04'',''13'',''99'')'
   +' AND A.ASOID = C.ASOID(+) AND A.CREDID = C.CREDID(+) AND C.CREESTID NOT IN (''04'', ''13'')'
   +' AND A.USUARIO = B.USERID(+)'
   +' GROUP BY A.NROOPE, A.FOPERAC, A.FREG, A.USUARIO, A.CREFPAG, C.CREFOTORG, A.CREDID, A.ASOCODMOD, A.ASOAPENOM, C.CREMTONABO'
   +' ORDER BY A.FOPERAC';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames := '';   
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;
   If DM1.cdsQry1.RecordCount<=0 then
   Begin
      ShowMessage('No existe información para exportar');
      Screen.Cursor := crDefault;
      Exit;
   End;
   dbgAExcel.DataSource := DM1.dsQry1;
   Screen.Cursor := crHourglass;
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_SUSFSC',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_SUSFSC');
   Screen.Cursor := crDefault;
end;

procedure TFReportesContables.ParametrosFondo;
begin
   wTipoCont := 'FS';
   wTipoCont2 := 'FSC';
   dbseMes.Text := DM1.StrZero(dbseMes.Text,2);
   DatosFecha;
   xWhereBusqueda:=' A.FREG BETWEEN '+QuotedStr(dtpFecIni.Text)+' AND '+QuotedStr(dtpFecFin.Text)+' '
                  +' and A.TIPOCONT='+quotedstr( wTipoCont2 )+' ';
   xWhereIncluyeLote:=' ';
end;

procedure TFReportesContables.BitBtn8Click(Sender: TObject);
Var xSQL:String;
begin
   DatosFecha;
   chktipexp;
   ParametrosAplicaFPD;
   Screen.Cursor := crHourglass;
   xSQL := 'SELECT C.CREFOTORG,A.FREG FEC_REGISTRO,A.USUARIO, B.USERNOM, A.CREFPAG, A.ASOCODMOD, A.ASOAPENOM, A.CREDID CREDID,A.NROOPE,A.FOPERAC,'
   +' SUM(NVL(A.CREMTOCOB,0)) CREMTOCOB, SUM(NVL(A.CREAMORT,0)) CREAMORT, SUM(NVL(A.CREINTERES,0)) CREINTERES,'
   +' SUM(NVL(A.CREFLAT,0)) CREFLAT, SUM(NVL(A.CREMTOEXC,0)) CREMTOEXC, SUM(NVL(A.MONCOBDESGRAV,0)) MONCOBDESGRAV,'
   +' ''APLICA FONDO DE PROTECCION DE DESGRAVAMEN DEL MES DE '+xMesDes+' DEL '+dbseAno.Text+''' PERIODO'
   +' FROM CRE310 A, USERTABLE B, CRE301 C'
   +' WHERE '+xWhereBusqueda
   +' AND A.CREESTID NOT IN (''13'',''99'',''04'')'
   +' AND A.ASOID = C.ASOID(+) AND A.CREDID = C.CREDID(+) AND C.CREESTID NOT IN (''04'', ''13'')'
   +' AND A.USUARIO=B.USERID'
   +' GROUP BY A.USUARIO, B.USERNOM, A.CREFPAG, A.ASOCODMOD, A.ASOAPENOM, C.CREFOTORG, A.FREG, A.CREDID, A.NROOPE, A.FOPERAC'
   +' ORDER BY USUARIO,USERNOM,CREFPAG, ASOCODMOD, ASOAPENOM';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames := '';   
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;
   If DM1.cdsQry1.RecordCount<=0 then
   Begin
      ShowMessage('No existe información para exportar');
      Screen.Cursor := crDefault;
      Exit;
   End;
   dbgAExcel.DataSource := DM1.dsQry1;
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_SUSFPD',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_SUSFPD');
   Screen.Cursor := crDefault;
End;

Procedure TFReportesContables.ParametrosAplicaFPD;
Begin
   wTipoCont := 'FD';
   wTipoCont2 := 'FD';
   dbseMes.Text := DM1.StrZero(dbseMes.Text,2);
   DatosFecha;
   xWhereBusqueda:=' A.FREG BETWEEN '+QuotedStr(dtpFecIni.Text)+' AND '+QuotedStr(dtpFecFin.Text)+' '
                  +' and A.TIPOCONT LIKE '+quotedstr( wTipoCont2+'%' )+' ';
   xWhereIncluyeLote:=' ';
End;

Procedure TFReportesContables.BitBtn9Click(Sender: TObject);
Var xSQL:String;
Begin
   DatosFecha;
   chktipexp;
   ParametrosCCI;
   Screen.Cursor := crHourglass;
   xSQL := 'SELECT A.FREG FEC_REGISTRO, A.USUARIO, A.ASOCODMOD,A.ASOAPENOM,A.CREDID,C.CREFOTORG, A.CREFPAG,A.NROOPE,A.FOPERAC,'
   +' SUM(NVL(A.CREMTOCOB,0)) CREMTOCOB, SUM(NVL(A.CREAMORT,0)) CREAMORT, SUM(NVL(A.CREINTERES,0)) CREINTERES, SUM(NVL(A.CREFLAT,0)) CREFLAT,'
   +' SUM(NVL(A.CREMTOEXC,0)) CREMTOEXC, SUM(NVL(A.MONCOBDESGRAV,0)) MONCOBDESGRAV,'
   +' ''CANCELACIONES CONTRA CUENTA INDIVIDUAL DEL MES DE '+xMesDes+' DEL '+dbseAno.Text+''' PERIODO'
   +' FROM CRE310 A, USERTABLE B, CRE301 C'
   +' WHERE '+xWhereBusqueda
   +' AND A.CREESTID NOT IN (''04'', ''13'', ''99'')'
   +' AND A.ASOID = C.ASOID(+) AND A.CREDID = C.CREDID(+) AND C.CREESTID NOT IN (''04'', ''13'')'
   +' AND A.USUARIO = B.USERID(+)'
   +' GROUP BY A.NROOPE, A.FOPERAC, A.FREG, A.USUARIO, A.CREFPAG, C.CREFOTORG, A.CREDID, A.ASOCODMOD, A.ASOAPENOM, C.CREMTONABO'
   +' ORDER BY ASOAPENOM, FOPERAC';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames := '';   
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;
   If DM1.cdsQry1.RecordCount<=0 then
   Begin
      ShowMessage('No existe información para exportar');
      Exit;
   End;
   dbgAExcel.DataSource := DM1.dsQry1;
   Screen.Cursor := crHourglass;
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_SUSCCI',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_SUSCCI');
   Screen.Cursor := crDefault;
End;

procedure TFReportesContables.ParametrosCCI;
begin
   wTipoCont := 'CC';
   wTipoCont2 := 'CCI';
   dbseMes.Text := DM1.StrZero(dbseMes.Text,2);
   DatosFecha;
   xWhereBusqueda:=' A.FREG BETWEEN '+QuotedStr(dtpFecIni.Text)+' AND '+QuotedStr(dtpFecFin.Text)+' '
                  +' and A.TIPOCONT='+quotedstr( wTipoCont2 )+' ';
   xWhereIncluyeLote:=' ';
end;

Procedure TFReportesContables.BitBtn10Click(Sender: TObject);
Var xSQL:String;
Begin
   DatosFecha;
   chktipexp;
   ParametrosCXC;
   Screen.Cursor := crHourglass;
	 xSQL := 'SELECT A.FREG FEC_REGISTRO, A.USUARIO, A.ASOCODMOD, A.ASOAPENOM, A.CREDID, C.CREFOTORG, C.CREMTONABO, A.CREFPAG,'
   +' A.NROOPE, A.FOPERAC, SUM(NVL(A.CREMTOCOB, 0)) CREMTOCOB, SUM(NVL(A.CREAMORT, 0)) CREAMORT, SUM(NVL(A.CREINTERES, 0)) CREINTERES,'
   +' SUM(NVL(A.CREFLAT, 0)) CREFLAT, SUM(NVL(A.CREMTOEXC, 0)) CREMTOEXC, SUM(NVL(A.MONCOBDESGRAV, 0)) MONCOBDESGRAV'
   +' FROM CRE310 A, USERTABLE B, CRE301 C'
   +' WHERE '+xWhereBusqueda
   +' AND A.CREESTID NOT IN (''04'', ''13'', ''99'')'
   +' AND A.ASOID = C.ASOID(+) AND A.CREDID = C.CREDID(+) AND C.CREESTID NOT IN (''04'', ''13'')'
   +' AND A.USUARIO = B.USERID(+)'
   +' GROUP BY A.NROOPE, A.FOPERAC, A.FREG, A.USUARIO, A.CREFPAG, C.CREFOTORG, A.CREDID, A.ASOCODMOD, A.ASOAPENOM, C.CREMTONABO'
   +' ORDER BY A.FOPERAC';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames := '';   
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;
   If DM1.cdsQry1.RecordCount<=0 then
   Begin
      ShowMessage('No existe información para exportar');
      Screen.Cursor := crDefault;
      Exit;
   End;
   dbgAExcel.DataSource := DM1.dsQry1;
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_SUSCXC',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_SUSCXC');
   Screen.Cursor := crDefault;
End;

procedure TFReportesContables.ParametrosCXC;
begin
   wTipoCont := 'CX';
   wTipoCont2 := 'CXC';
   dbseMes.Text := DM1.StrZero(dbseMes.Text,2);
   DatosFecha;
   xWhereBusqueda:=' A.FREG BETWEEN '+QuotedStr(dtpFecIni.Text)+' AND '+QuotedStr(dtpFecFin.Text)+' '
                  +' and A.TIPOCONT='+quotedstr( wTipoCont2 )+' ';
   xWhereIncluyeLote:=' ';
end;

Procedure TFReportesContables.BitBtn3Click(Sender: TObject);
Var xSql:String;
Begin
   DatosFecha;
   chktipexp;
   Screen.Cursor := crHourglass;
   xSql := 'SELECT A.UPROID,A.UPAGOID,A.USEID UGEL,A.FEC_CRE_COB_FSC FREG,A.ASOID,A.ASOCODMOD,A.ASOAPENOM,A.NUM_DEU,A.NROOPE,FEC_COB_DEU FOPERAC,SUM(NVL(A.IMP_COB_DEU,0))IMP_COB_DEU,SUM(NVL(A.IMP_EXC_DEU,0))IMP_EXC_DEU,'
   +' MIN(D.BANCONOM) BANCONOM, MAX(A.CCBCOID) CCBCOID, MIN(C.UPRONOM) UPRONOM, MIN(B.USENOM) USENOM'
   +' FROM COB_FSC_PAGOS_AL_FSC A, (SELECT UPROID, USEID, MAX(CCOSID) CCOSID, MAX(USENOM) USENOM FROM APO101 GROUP BY UPROID,USEID) B, APO102 C, TGE105 D'
   +' WHERE A.FORPAGID = ''02'' AND A.FEC_CRE_COB_FSC BETWEEN TO_DATE ('+QuotedStr(DateToStr(DtpFecIni.Date))+',''DD/MM/YYYY'') AND'
   +' TO_DATE('+QuotedStr(DateToStr(DtpFecFin.Date))+',''dd/mm/yyyy'') AND A.EST_COB_COD NOT IN (''04'',''13'') AND'
   +' A.UPROID = B.UPROID(+) AND A.USEID = B.USEID(+) AND A.UPROID = C.UPROID(+) AND D.BANCOID = ''15'''
   +' GROUP BY A.FEC_CRE_COB_FSC,A.FEC_COB_DEU, A.UPROID, A.USEID, A.ASOID, A.ASOAPENOM, A.NUM_DEU, A.NROOPE,A.ASOCODMOD,A.UPAGOID'
   +' ORDER BY TO_CHAR(FEC_COB_DEU,''MM/YYYY''), CCBCOID, FEC_COB_DEU';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames := '';   
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;
   If DM1.cdsQry1.RecordCount<=0 then
   begin
      ShowMessage('No existe información para exportar');
      Screen.Cursor := crDefault;
      Exit;
   end;
   dbgAExcel.DataSource := DM1.dsQry1;
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_DEVFSCEFE',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_DEVFSCEFE');
   Screen.Cursor := crDefault;
End;

Procedure TFReportesContables.BitBtn2Click(Sender: TObject);
Var xSql:String;
Begin
   DatosFecha;
   chktipexp;
   Screen.Cursor := crHourglass;
   xSql:= 'SELECT A.UPROID,A.UPAGOID,A.USEID UGEL,A.FEC_CRE_COB_FSC FREG,A.ASOID,A.ASOCODMOD,A.ASOAPENOM,A.NUM_DEU,A.NROOPE,FEC_COB_DEU FOPERAC,'
   +' SUM(NVL(A.IMP_COB_DEU,0))IMP_COB_DEU, SUM(NVL(A.IMP_EXC_DEU,0))IMP_EXC_DEU, MIN(D.BANCONOM) BANCONOM, MAX(A.CCBCOID) CCBCOID,'
   +' MIN(C.UPRONOM) UPRONOM, MIN(B.USENOM) USENOM'
   +' FROM COB_FSC_PAGOS_AL_FSC A, (SELECT UPROID, USEID, MAX(CCOSID) CCOSID, MAX(USENOM) USENOM FROM APO101 GROUP BY UPROID,USEID) B, APO102 C, TGE105 D'
   +' WHERE  A.FORPAGID IN (''01'',''09'',''22'') AND A.FEC_CRE_COB_FSC BETWEEN To_Date('+QuotedStr(DateToStr(DtpFecIni.Date))+',''DD/MM/YYYY'')'
   +' AND TO_DATE('+QuotedStr(DateToStr(DtpFecFin.Date))+',''DD/MM/YYYY'') AND A.EST_COB_COD NOT IN (''04'',''13'')'
   +' AND A.UPROID = B.UPROID(+) AND A.USEID = B.USEID(+) AND A.UPROID = C.UPROID(+) AND A.BANCOID=D.BANCOID(+)'
   +' GROUP BY A.FEC_CRE_COB_FSC,A.FEC_COB_DEU, A.UPROID, A.USEID, A.ASOID, A.ASOAPENOM, A.NUM_DEU, A.NROOPE,A.ASOCODMOD,A.UPAGOID'
   +' ORDER BY TO_CHAR(FEC_COB_DEU,''MM/YYYY''), CCBCOID, FEC_COB_DEU';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames := '';   
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;
   If DM1.cdsQry1.RecordCount<=0 then
   begin
      ShowMessage('No existe información para exportar');
      Screen.Cursor := crDefault;
      Exit;
   end;
   dbgAExcel.DataSource := DM1.dsQry1;
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_DEVFSCPLA',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_DEVFSCPLA');
   Screen.Cursor := crDefault;
End;

Procedure TFReportesContables.BitBtn1Click(Sender: TObject);
Var xSql:String;
Begin
   DatosFecha;
   chktipexp;
   Screen.Cursor := crHourGlass;
   xSql := 'SELECT A.UPROID,A.UPAGOID,A.USEID UGEL,A.FEC_CRE_COB_FSC FREG,A.ASOID,A.ASOCODMOD,A.ASOAPENOM,A.NUM_DEU,A.NROOPE,FEC_COB_DEU FOPERAC,SUM(NVL(A.IMP_COB_DEU,0))IMP_COB_DEU,SUM(NVL(A.IMP_EXC_DEU,0))IMP_EXC_DEU,'
   +' MIN(D.BANCONOM) BANCONOM, MAX(A.CCBCOID) CCBCOID, MIN(C.UPRONOM) UPRONOM, MIN(B.USENOM) USENOM'
   +' FROM COB_FSC_PAGOS_AL_FSC A, (SELECT UPROID, USEID, MAX(CCOSID) CCOSID, MAX(USENOM) USENOM FROM APO101 GROUP BY UPROID,USEID) B, APO102 C, TGE105 D'
   +' WHERE A.FORPAGID = ''03'' AND A.FEC_CRE_COB_FSC BETWEEN TO_DATE ('+QuotedStr(DateToStr(DtpFecIni.Date))+',''DD/MM/YYYY'')'
   +' AND TO_DATE('+QuotedStr(DateToStr(DtpFecFin.Date))+',''dd/mm/yyyy'') AND A.EST_COB_COD NOT IN (''04'',''13'')'
   +' AND A.UPROID = B.UPROID(+) AND A.USEID = B.USEID(+) AND A.UPROID = C.UPROID(+)'
   +' AND A.BANCOID = D.BANCOID(+)'
   +' GROUP BY A.FEC_CRE_COB_FSC,A.FEC_COB_DEU, A.UPROID, A.USEID, A.ASOID, A.ASOAPENOM, A.NUM_DEU, A.NROOPE,A.ASOCODMOD,A.UPAGOID'
   +' ORDER BY TO_CHAR(FEC_COB_DEU,''MM/YYYY''), CCBCOID, FEC_COB_DEU';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames := '';   
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;
   If DM1.cdsQry1.RecordCount<=0 then
   begin
      ShowMessage('No existe información para exportar');
      Screen.Cursor := crDefault;
      Exit;
   end;
   dbgAExcel.DataSource := DM1.dsQry1;
   xArchivo:='ReporteSustentoDevolucionesFSC(Bancos)';
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_DEVFSCBCO',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_DEVFSCBCO');
   Screen.Cursor := crDefault;
end;

procedure TFReportesContables.BitSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFReportesContables.BitBtn13Click(Sender: TObject);
Var xSql:String;
begin
   DatosFecha;
   chktipexp;
   Screen.Cursor := crHourGlass;
   xSql := 'SELECT  A.FECANULA FEC_EXTORNO, A.UPROID, A.UPAGOID, A.USEID UGEL, A.ASOID, A.CREDID CREDID, A.CREDOCPAG,'
   +' TO_CHAR(MIN(A.FECANULA),''YYYYMM'') PER_EXTORN, A.ASOCODMOD, MIN(A.ASOAPENOM) ASOAPENOM, MIN(C.UPRONOM) UPRONOM,'
   +' MIN(B.USENOM) USENOM, MIN(B.CCOSID) CCOSID, MIN(A.TIPCREID) TIPCREID, MIN(D.TIPCREDES) TIPCREDES, F.CREANO||F.CREMES PER_CUOTA,'
   +' MIN(A.BANCOID) BANCOID, MIN(E.BANCONOM) BANCONOM, MAX(A.CCBCOID) CCBCOID, SUM(NVL(A.CREMTOCOB,0)) CREMTOCOB, SUM(NVL(A.CREAMORT,0)) CREAMORT,'
   +' SUM(NVL(A.CREINTERES,0)) CREINTERES, SUM(NVL(A.CREFLAT,0)) CREFLAT, SUM(NVL(A.MONCOBDESGRAV,0)) MONCOBDESGRAV, SUM(NVL(A.CREMTOEXC,0)) CREMTOEXC'
   +' FROM COB901 A, (SELECT UPROID,USEID,MAX(CCOSID) CCOSID,MAX(USENOM) USENOM FROM APO101 GROUP BY UPROID,USEID) B, APO102 C, CRE110 D, TGE105 E, CRE302 F'
   +' WHERE A.FORPAGID = ''03'' AND TO_CHAR(A.FECANULA,''YYYYMM'') = '+quotedstr(dbseAno.text+dbseMes.text)
   +' AND A.CREESTID = ''04'' AND TRIM(A.CREMENANU) <> ''EXTORNO DE CUOTA'' AND A.CREDOCPAG IS NOT NULL AND A.BANCOID IS NOT NULL AND A.CCBCOID IS NOT NULL'
   +' AND A.UPROID=B.UPROID(+) AND A.USEID=B.USEID(+) AND A.UPROID = C.UPROID (+) AND A.TIPCREID = D.TIPCREID (+)'
   +' AND A.BANCOID = E.BANCOID(+) AND A.CREDID = F.CREDID (+) AND A.ASOID = F.ASOID (+) AND A.CRECUOTA = F.CRECUOTA(+)'
   +' GROUP BY A.FECANULA, A.UPROID,A.USEID,A.ASOID,A.CREDID,A.CREDOCPAG,A.ASOCODMOD,A.UPAGOID,F.CREANO,F.CREMES'
   +' ORDER BY TO_CHAR(A.FECANULA,''YYYYMM''),CCBCOID,CREDOCPAG';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames:='PER_EXTORN;CCBCOID';
   DM1.cdsQry1.DataRequest(xSql);
   DM1.cdsQry1.Open;
   If DM1.cdsQry1.RecordCount<=0 then
   begin
      ShowMessage('No existe información para exportar');
      Screen.Cursor := crDefault;
      Exit;
   end;
   dbgAExcel.DataSource := DM1.dsQry1;
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_EXTBCO',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_EXTBCO');
   Screen.Cursor := crDefault;
end;

procedure TFReportesContables.BitBtn12Click(Sender: TObject);
Var xSql:String;
begin
   DatosFecha;
   chktipexp;
   Screen.Cursor := crHourglass;
   xSql := 'SELECT  A.FECANULA FEC_EXTORNO, A.UPROID, A.UPAGOID, A.USEID UGEL, A.ASOID, A.CREDID CREDID, A.CREDOCPAG,'
   +' TO_CHAR(MIN(A.FECANULA),''YYYYMM'') PER_EXTORN, A.ASOCODMOD, MIN(A.ASOAPENOM) ASOAPENOM, MIN(C.UPRONOM) UPRONOM,'
   +' MIN(B.USENOM) USENOM, MIN(B.CCOSID) CCOSID, MIN(A.TIPCREID) TIPCREID, MIN(D.TIPCREDES) TIPCREDES, F.CREANO||F.CREMES PER_CUOTA,'
   +' MIN(A.BANCOID) BANCOID, MIN(E.BANCONOM) BANCONOM, MAX(A.CCBCOID) CCBCOID, SUM(NVL(A.CREMTOCOB,0)) CREMTOCOB, SUM(NVL(A.CREAMORT,0)) CREAMORT,'
   +' SUM(NVL(A.CREINTERES,0)) CREINTERES, SUM(NVL(A.CREFLAT,0)) CREFLAT, SUM(NVL(A.MONCOBDESGRAV,0)) MONCOBDESGRAV, SUM(NVL(A.CREMTOEXC,0)) CREMTOEXC'
   +' FROM COB901 A, (SELECT UPROID,USEID,MAX(CCOSID) CCOSID,MAX(USENOM) USENOM FROM APO101 GROUP BY UPROID,USEID) B, APO102 C, CRE110 D, TGE105 E, CRE302 F'
   +' WHERE A.FORPAGID = ''99'' AND TO_CHAR(A.FECANULA,''YYYYMM'') = '+quotedstr(dbseAno.text+dbseMes.text)
   +' AND A.CREESTID = ''04'' AND  TRIM(A.CREMENANU) <> ''EXTORNO DE CUOTA'''
   +' AND A.CREDOCPAG IS NOT NULL AND A.BANCOID IS NOT NULL AND A.CCBCOID IS NOT NULL AND A.UPROID=B.UPROID(+) AND A.USEID=B.USEID(+)'
   +' AND A.UPROID = C.UPROID(+) AND A.TIPCREID = D.TIPCREID(+) AND A.BANCOID = E.BANCOID (+) AND A.CREDID = F.CREDID(+)'
   +' AND A.ASOID = F.ASOID (+) AND A.CRECUOTA = F.CRECUOTA (+)'
   +' GROUP BY A.FECANULA, A.UPROID,A.USEID,A.ASOID,A.CREDID,A.CREDOCPAG,A.ASOCODMOD,A.UPAGOID,F.CREANO,F.CREMES'
   +' ORDER BY TO_CHAR(FECANULA,''YYYYMM''),CCBCOID,CREDOCPAG';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames:='PER_EXTORN;CCBCOID';
   DM1.cdsQry1.DataRequest(xSql);
   DM1.cdsQry1.Open;
   If DM1.cdsQry1.RecordCount=0 Then
   Begin
      ShowMessage('No existe información para exportar');
      Screen.Cursor:=crDefault;
      exit;
   End;
   dbgAExcel.DataSource := DM1.dsQry1;
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_EXTCCI',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_EXTCCI');
   Screen.Cursor := crDefault;
end;

procedure TFReportesContables.BitBtn11Click(Sender: TObject);
Var xSql:String;
begin
   DatosFecha;
   chktipexp;
   Screen.Cursor := crHourglass;
   xSql := 'SELECT  A.FECANULA FEC_EXTORNO, A.UPROID, A.UPAGOID, A.USEID UGEL, A.ASOID, A.CREDID CREDID, A.CREDOCPAG, TO_CHAR(MIN(A.FECANULA),''YYYYMM'') PER_EXTORN, A.ASOCODMOD,'
   +' MIN(A.ASOAPENOM) ASOAPENOM, MIN(C.UPRONOM) UPRONOM, MIN(B.USENOM) USENOM, MIN(B.CCOSID) CCOSID, MIN(A.TIPCREID) TIPCREID, MIN(D.TIPCREDES) TIPCREDES, F.CREANO||F.CREMES PER_CUOTA,'
   +' MIN(A.BANCOID) BANCOID, MIN(E.BANCONOM) BANCONOM, MAX(A.CCBCOID) CCBCOID, SUM(NVL(A.CREMTOCOB,0)) CREMTOCOB, SUM(NVL(A.CREAMORT,0)) CREAMORT,'
   +' SUM(NVL(A.CREINTERES,0)) CREINTERES, SUM(NVL(A.CREFLAT,0)) CREFLAT, SUM(NVL(A.MONCOBDESGRAV,0)) MONCOBDESGRAV, SUM(NVL(A.CREMTOEXC,0)) CREMTOEXC'
   +' FROM COB901 A, (SELECT UPROID,USEID,MAX(CCOSID) CCOSID,MAX(USENOM) USENOM FROM APO101 GROUP BY UPROID,USEID) B, APO102 C, CRE110 D, TGE105 E, CRE302 F'
   +' WHERE A.FORPAGID IN (''01'',''09'',''22'') AND TO_CHAR(A.FECANULA,''YYYYMM'') = '+quotedstr(dbseAno.text+dbseMes.text)
   +' AND A.CREESTID = ''04'''
   +' AND TRIM(A.CREMENANU) <> ''EXTORNO DE CUOTA'' AND A.CREDOCPAG IS NOT NULL AND A.UPROID = B.UPROID(+) AND A.USEID = B.USEID(+) AND A.UPROID = C.UPROID(+)'
   +' AND A.TIPCREID=D.TIPCREID(+) AND A.BANCOID = E.BANCOID(+) AND A.CREDID = F.CREDID(+) AND A.ASOID = F.ASOID(+) AND A.CRECUOTA = F.CRECUOTA(+)'
   +' GROUP BY A.FECANULA, A.UPROID,A.USEID,A.ASOID,A.CREDID,A.CREDOCPAG,A.ASOCODMOD,A.UPAGOID,F.CREANO,F.CREMES'
   +' ORDER BY TO_CHAR(FECANULA,''YYYYMM''),CCBCOID,CREDOCPAG';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.IndexFieldNames:='PER_EXTORN;CCBCOID';
   DM1.cdsQry1.DataRequest(xSql);
   DM1.cdsQry1.Open;
   dbgAExcel.DataSource := DM1.dsQry1;
   If dm1.cdsQry1.RecordCount=0 Then
   Begin
      ShowMessage('No existe información para exportar');
      Screen.Cursor:=crDefault;
      exit;
   End;
   If rgExportarA.ItemIndex = 0 Then
      DM1.HojaExcel('RSG_EXTPLA',DM1.dsQry1, dbgAExcel)
   Else
      ExpSVC('RSG_EXTPLA');
   Screen.Cursor := crDefault;
end;

procedure TFReportesContables.ExpSVC(xarchivo: String);
var
   Stream: TFileStream;
   i: Integer;
   OutLine: string;
   sTemp, xruta, xtiparc: string;
begin
   xruta := stvarc.Path;
   xtiparc := '.CSV';
   Stream := TFileStream.Create(xruta+'\'+xarchivo+xtiparc, fmCreate);
   try
      while not DM1.cdsQry1.Eof do
      begin
         OutLine := '';
         for i := 0 to DM1.cdsQry1.FieldCount - 1 do
         begin
            sTemp := DM1.cdsQry1.Fields[i].AsString;
            OutLine := OutLine + sTemp + ',';
         end;
         SetLength(OutLine, Length(OutLine) - 1);
         Stream.Write(OutLine[1], Length(OutLine) * SizeOf(Char));
         Stream.Write(sLineBreak, Length(sLineBreak));
         DM1.cdsQry1.Next;
      end;
   finally
      Stream.Free;
   end;
   ShowMessage('Se ha creado el archivo '+xarchivo+xtiparc+' en la siguiente ruta : '+xruta);
end;

procedure TFReportesContables.chktipexp;
begin
   If rgExportarA.ItemIndex = -1 Then
   Begin
      ShowMessage('Seleccione tipo de exportación.');
      rgExportarA.SetFocus;
      Exit;
   End;
   If (rgExportarA.ItemIndex = 1) And (Trim(stvarc.Path) = '') Then
   Begin
     ShowMessage('Debe seleccionar una carpeta para grabar el archivo.');
     rgExportarA.SetFocus;
     Exit;
   End;
end;

procedure TFReportesContables.rgExportarAClick(Sender: TObject);
begin
   If rgExportarA.ItemIndex = 0 Then
   Begin
      gbruta.Enabled := False;
      stvarc.Enabled := False;
   End
   Else
   Begin
      gbruta.Enabled := True;
      stvarc.Enabled := True;
   End;
End;

procedure TFReportesContables.FormActivate(Sender: TObject);
begin
   rgExportarA.ItemIndex := 0;
   gbruta.Enabled := False;
   stvarc.Enabled := False;
   dbseAno.SetFocus;
end;

end.
