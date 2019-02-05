// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fSaldosVen
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Saldos Vencidos
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

UNIT RSG003;

INTERFACE

USES
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Mask, wwdbedit, Wwdbspin, Buttons, ComCtrls, Grids,
   Wwdbigrd, Wwdbgrid, Db;

TYPE
   TfSaldosVen = CLASS(TForm)
      grbParametros: TGroupBox;
      lblNomMes01: TLabel;
      BitProcesar: TBitBtn;
      dbsAnoIni01: TwwDBSpinEdit;
      dbsMesIni01: TwwDBSpinEdit;
      dbsAnoIni02: TwwDBSpinEdit;
      dbsMesIni02: TwwDBSpinEdit;
      lblNomMes02: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      PageControl1: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      dtgCabVencidos: TwwDBGrid;
      dtgDetVencidos: TwwDBGrid;
      BitSalir: TBitBtn;
      BitGrafico: TBitBtn;
      BitExporta: TBitBtn;
      BitImpOfi: TBitBtn;
      PROCEDURE BitProcesarClick(Sender: TObject);
      PROCEDURE dbsMesIni01Change(Sender: TObject);
      PROCEDURE dbsMesIni02Change(Sender: TObject);
      PROCEDURE FormActivate(Sender: TObject);
      PROCEDURE dtgCabVencidosDrawDataCell(Sender: TObject;
         CONST Rect: TRect; Field: TField; State: TGridDrawState);
      PROCEDURE PageControl1Change(Sender: TObject);
      PROCEDURE dtgDetVencidosDrawDataCell(Sender: TObject;
         CONST Rect: TRect; Field: TField; State: TGridDrawState);
      PROCEDURE BitSalirClick(Sender: TObject);
      PROCEDURE BitExportaClick(Sender: TObject);
      PROCEDURE dtgCabVencidosDrawTitleCell(Sender: TObject; Canvas: TCanvas;
         Field: TField; Rect: TRect; VAR DefaultDrawing: Boolean);
      PROCEDURE dtgDetVencidosDrawTitleCell(Sender: TObject; Canvas: TCanvas;
         Field: TField; Rect: TRect; VAR DefaultDrawing: Boolean);
      PROCEDURE BitGraficoClick(Sender: TObject);
    procedure dbsAnoIni01Change(Sender: TObject);
    procedure dbsAnoIni02Change(Sender: TObject);
    procedure BitImpOfiClick(Sender: TObject);
   Private
      { Private declarations }
      PROCEDURE LimpiaGrid;
      PROCEDURE MostrarCabecera;
      PROCEDURE MostrarDetalle(xPeriodo01, xPeriodo02, xDptoId: STRING);

   Public
      { Public declarations }

   END;

VAR
   fSaldosVen: TfSaldosVen;
   xCriterio:String;

IMPLEMENTATION

USES RSGDM1, RSG120, RSG114;

{$R *.dfm}

PROCEDURE TfSaldosVen.BitProcesarClick(Sender: TObject);
BEGIN
   PageControl1.ActivePageIndex := 0;
   LimpiaGrid;
   IF dbsAnoIni01.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni01.Text))]) > dbsAnoIni02.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni02.Text))]) THEN
   BEGIN
      MessageDlg(' EL PERIODO INICIAL NO PUEDE SER MAYOR QUE EL PERIODO FINAL ', mtError, [mbOk], 0);
      Exit;
   END;
   Screen.Cursor := crHourGlass;
   MostrarCabecera;
   Screen.Cursor := crDefault;
END;

PROCEDURE TfSaldosVen.dbsMesIni01Change(Sender: TObject);
BEGIN
LimpiaGrid;   lblNomMes01.Caption := DM1.DesMes(StrToInt(dbsMesIni01.Text), 'N');
END;

PROCEDURE TfSaldosVen.dbsMesIni02Change(Sender: TObject);
BEGIN
LimpiaGrid;   lblNomMes02.Caption := DM1.DesMes(StrToInt(dbsMesIni02.Text), 'N');
END;

PROCEDURE TfSaldosVen.FormActivate(Sender: TObject);
BEGIN
   LimpiaGrid;

   dbsAnoIni01.Value:=StrToInt(Copy(DM1.UltCartera,1,4));
   dbsMesIni01.Value:=StrToInt(Copy(DM1.UltCartera,5,2));
   lblNomMes01.Caption := DM1.DesMes(StrToInt(dbsMesIni01.Text), 'N');

   dbsAnoIni02.Value:=StrToInt(Copy(DM1.UltCartera,1,4));
   dbsMesIni02.Value:=StrToInt(Copy(DM1.UltCartera,5,2));
   lblNomMes02.Caption := DM1.DesMes(StrToInt(dbsMesIni02.Text), 'N');
   PageControl1.ActivePageIndex := 0;

END;

PROCEDURE TfSaldosVen.dtgCabVencidosDrawDataCell(Sender: TObject;
   CONST Rect: TRect; Field: TField; State: TGridDrawState);
BEGIN

   IF (Field.FieldName = 'MESANNO') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clNavy;
      //   dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NUMPOT') OR (Field.FieldName = 'PROPOT') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clTeal;
      //   dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'NUMDEF') OR (Field.FieldName = 'DEFICIENTE') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clOlive;
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NUMDUD') OR (Field.FieldName = 'DUDOSO') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clPurple;
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NUMPER') OR (Field.FieldName = 'PERDIDA') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clRed;
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NUMTOT') OR (Field.FieldName = 'TOTAL') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clBlack;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'DPTODES') AND (DM1.cdsConsulta.FieldByName('PERIODO').AsString = dbsAnoIni01.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni01.Text))])) THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clNavy;
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;
END;

PROCEDURE TfSaldosVen.LimpiaGrid;
VAR
   xSQL: STRING;
BEGIN
   xSQL := 'SELECT DPTOID,DPTODES,MESANNO,PERIODO, ' +
      'SUM(NUMPOT) NUMPOT,SUM(PROPOT) PROPOT,SUM(NUMDEF) NUMDEF,SUM(DEFICIENTE) DEFICIENTE,SUM(NUMDUD) NUMDUD,SUM(DUDOSO) DUDOSO, ' +
      'SUM(NUMPER) NUMPER,SUM(PERDIDA) PERDIDA,COUNT(*) NUMTOT,SUM(TOTAL) TOTAL FROM   ' +
      '( SELECT DPTOID,DPTODES,USEID,USENOM,MESANNO,PERIODO, ' +
      'CASE WHEN CFC_F=''0'' THEN SALDOS_FV ELSE 0 END NORMAL,CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR,  ' +
      'CASE WHEN CFC_F=''A'' THEN SALDOS_FV ELSE 0 END PROPOT,CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT,   ' +
      'CASE WHEN CFC_F=''B'' THEN SALDOS_FV ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF, ' +
      'CASE WHEN CFC_F=''C'' THEN SALDOS_FV ELSE 0 END DUDOSO,CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD,   ' +
      'CASE WHEN CFC_F=''D'' THEN SALDOS_FV ELSE 0 END PERDIDA,CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER,SALDOS_FV TOTAL ' +
      'FROM  ' +
      '(SELECT PERIODO,CFC_F,CFCDES_F,B.DPTOID,C.DPTODES,A.UPROID,A.UPAGOID,A.USEID,B.USENOM,DIASTRANS,SALDOS_FV, ' +
      'CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''01'' WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''02''   ' +
      'WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''03'' WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''04''   ' +
      'WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''05'' WHEN DIASTRANS > 123 THEN  ''06''  END IDDIAS, ' +
      'CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''ENTRE 0 Y 8 DIAS'' WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''ENTRE 9 Y 31 DIAS''  ' +
      'WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE 32 Y 62 DIAS'' WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE 63 Y 93 DIAS'' ' +
      'WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE 94 Y 123 DIAS'' WHEN DIASTRANS > 123 THEN  ''MAS DE 123 DIAS''  END DIASDESC, ' +
      '1 ASOCIADOS,MESDESC||''-''||SUBSTR(PERIODO,1,4) MESANNO FROM CFC000 A,APO101 B,APO158 C,TGE181 D ' +
      'WHERE A.PERIODO>=' + QuotedStr('XXXXXX') + ' AND A.PERIODO<=' + QuotedStr('XXXXXX') + '    ' +
      'AND A.UPROID=B.UPROID(+) AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) AND B.DPTOID=C.DPTOID(+) AND NVL(SALDOS_FV,0)>0 AND SUBSTR(PERIODO,5,2)=D.MESIDR ) ' +
      ') ' +
      'GROUP BY DPTOID,DPTODES,MESANNO,PERIODO ORDER BY DPTOID,PERIODO ';
   DM1.cdsConsulta.Close;
   DM1.cdsConsulta.DataRequest(xSQL);
   DM1.cdsConsulta.Open;

END;

PROCEDURE TfSaldosVen.PageControl1Change(Sender: TObject);
BEGIN
   If dtgCabVencidos.DataSource.DataSet.RecordCount=0 Then PageControl1.TabIndex:=0;
   Screen.Cursor := crHourGlass;
   TabSheet2.Caption := DM1.cdsConsulta.FieldByName('DPTODES').AsString;
   IF TabSheet2.Showing THEN MostrarDetalle(dbsAnoIni01.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni01.Text))]), dbsAnoIni02.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni02.Text))]), DM1.cdsConsulta.FieldByName('DPTOID').AsString);
   IF TabSheet1.Showing THEN TabSheet2.Caption := 'Ugeles / Uses  ';
   Screen.Cursor := crDefault;
END;

PROCEDURE TfSaldosVen.dtgDetVencidosDrawDataCell(Sender: TObject;
   CONST Rect: TRect; Field: TField; State: TGridDrawState);
BEGIN
   IF (Field.FieldName = 'MESANNO') THEN
   BEGIN
      dtgDetVencidos.Canvas.Font.Color := clNavy;
      dtgDetVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NUMPOT') OR (Field.FieldName = 'PROPOT') THEN
   BEGIN
      dtgDetVencidos.Canvas.Font.Color := clTeal;
      dtgDetVencidos.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'NUMDEF') OR (Field.FieldName = 'DEFICIENTE') THEN
   BEGIN
      dtgDetVencidos.Canvas.Font.Color := clOlive;
      dtgDetVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NUMDUD') OR (Field.FieldName = 'DUDOSO') THEN
   BEGIN
      dtgDetVencidos.Canvas.Font.Color := clPurple;
      dtgDetVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NUMPER') OR (Field.FieldName = 'PERDIDA') THEN
   BEGIN
      dtgDetVencidos.Canvas.Font.Color := clRed;
      dtgDetVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NUMTOT') OR (Field.FieldName = 'TOTAL') THEN
   BEGIN
      dtgDetVencidos.Canvas.Font.Color := clBlack;
      dtgDetVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgDetVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'USENOM') AND (DM1.cdsCredito.FieldByName('PERIODO').AsString = dbsAnoIni01.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni01.Text))])) THEN
   BEGIN
      dtgDetVencidos.Canvas.Font.Color := clNavy;
      dtgDetVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

END;

PROCEDURE TfSaldosVen.BitSalirClick(Sender: TObject);
BEGIN
   Close;
END;

PROCEDURE TfSaldosVen.MostrarCabecera;
VAR
   xSQL,iSQL,xWhere: String;
BEGIN

Screen.Cursor := crHourGlass ;


xWhere:=' A.PERIODO>=' + QuotedStr(dbsAnoIni01.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni01.Text))])) + ' AND A.PERIODO<=' + QuotedStr(dbsAnoIni02.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni02.Text))])) + '    ' +
        'AND A.UPROID=B.UPROID(+) AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) AND B.DPTOID=C.DPTOID(+) AND B.DPTOID IS NOT NULL AND NVL(SALDOS_FV,0)>0 AND SUBSTR(PERIODO,5,2)=D.MESIDR ';

xSQL:='SELECT DPTOID,DPTODES,MESANNO,PERIODO,NUMPOT,PROPOT,NUMDEF,DEFICIENTE,NUMDUD,DUDOSO,NUMPER,PERDIDA, '+
      'NUMTOT,TOTAL FROM RSG_RES_SAL_VEN WHERE CRITERIO='+QuotedStr(xWhere)+' ORDER BY DPTOID,PERIODO';

If DM1.CountReg(xSQL)=0 Then
   Begin
      xSQL:= 'SELECT DPTOID,DPTODES,MESANNO,PERIODO, ' +
             'SUM(NUMPOT) NUMPOT,SUM(PROPOT) PROPOT,SUM(NUMDEF) NUMDEF,SUM(DEFICIENTE) DEFICIENTE,SUM(NUMDUD) NUMDUD,SUM(DUDOSO) DUDOSO, ' +
             'SUM(NUMPER) NUMPER,SUM(PERDIDA) PERDIDA,COUNT(*) NUMTOT,SUM(TOTAL) TOTAL FROM   ' +
             '( SELECT DPTOID,DPTODES,USEID,USENOM,MESANNO,PERIODO, ' +
             'CASE WHEN CFC_F=''0'' THEN SALDOS_FV ELSE 0 END NORMAL,CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR,  ' +
             'CASE WHEN CFC_F=''A'' THEN SALDOS_FV ELSE 0 END PROPOT,CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT,   ' +
             'CASE WHEN CFC_F=''B'' THEN SALDOS_FV ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF, ' +
             'CASE WHEN CFC_F=''C'' THEN SALDOS_FV ELSE 0 END DUDOSO,CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD,   ' +
             'CASE WHEN CFC_F=''D'' THEN SALDOS_FV ELSE 0 END PERDIDA,CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER,SALDOS_FV TOTAL ' +
             'FROM  ' +
             '(SELECT PERIODO,CFC_F,CFCDES_F,B.DPTOID,C.DPTODES,A.UPROID,A.UPAGOID,A.USEID,B.USENOM,DIASTRANS,SALDOS_FV, ' +
             'CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''01'' WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''02''   ' +
             'WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''03'' WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''04''   ' +
             'WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''05'' WHEN DIASTRANS > 123 THEN  ''06''  END IDDIAS, ' +
             'CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''ENTRE 0 Y 8 DIAS'' WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''ENTRE 9 Y 31 DIAS''  ' +
             'WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE 32 Y 62 DIAS'' WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE 63 Y 93 DIAS'' ' +
             'WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE 94 Y 123 DIAS'' WHEN DIASTRANS > 123 THEN  ''MAS DE 123 DIAS''  END DIASDESC, ' +
             '1 ASOCIADOS,MESDESC||''-''||SUBSTR(PERIODO,1,4) MESANNO FROM CFC000 A,APO101 B,APO158 C,TGE181 D ' +
             ' WHERE '+xWhere+') ) GROUP BY DPTOID,DPTODES,MESANNO,PERIODO ORDER BY DPTOID,PERIODO ';
      iSQL:= 'INSERT INTO RSG_RES_SAL_VEN(DPTOID,DPTODES,MESANNO,PERIODO,NUMPOT,PROPOT,NUMDEF,DEFICIENTE,NUMDUD,DUDOSO,NUMPER,PERDIDA,NUMTOT,TOTAL,CRITERIO ) '+
             'SELECT DPTOID,DPTODES,MESANNO,PERIODO,NUMPOT,PROPOT,NUMDEF,DEFICIENTE,NUMDUD,DUDOSO,NUMPER,PERDIDA,NUMTOT,TOTAL,'+QuotedStr(xWhere)+' FROM ('+xSQL+')';

      DM1.DCOM1.AppServer.EjecutaSQL(iSQL); Screen.Cursor := crDefault;
      xSQL:='SELECT DPTOID,DPTODES,MESANNO,PERIODO,NUMPOT,PROPOT,NUMDEF,DEFICIENTE,NUMDUD,DUDOSO,NUMPER,PERDIDA, '+
            'NUMTOT,TOTAL FROM RSG_RES_SAL_VEN WHERE CRITERIO='+QuotedStr(xWhere)+' ORDER BY DPTOID,PERIODO';
   End;

   xCriterio:='SELECT DPTODES||''-''||PERIODO DPTODES,NUMPOT,PROPOT,NUMDEF,DEFICIENTE,NUMDUD,DUDOSO,NUMPER,PERDIDA, '+
              'NUMTOT,TOTAL FROM ('+xSQL+')';

   DM1.cdsConsulta.Close;
   DM1.cdsConsulta.DataRequest(xSQL);
   DM1.cdsConsulta.Open;
   TNumericField(DM1.cdsConsulta.FieldByName('NUMPOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsConsulta.FieldByName('PROPOT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsConsulta.FieldByName('NUMDEF')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsConsulta.FieldByName('DEFICIENTE')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsConsulta.FieldByName('NUMDUD')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsConsulta.FieldByName('DUDOSO')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsConsulta.FieldByName('NUMPER')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsConsulta.FieldByName('PERDIDA')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsConsulta.FieldByName('NUMTOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsConsulta.FieldByName('TOTAL')).DisplayFormat := '###,###,###.#0';

END;

PROCEDURE TfSaldosVen.MostrarDetalle(xPeriodo01, xPeriodo02, xDptoId: STRING);
VAR
   xSQL: STRING;
BEGIN

   xSQL := 'SELECT USEID,USENOM,MESANNO,PERIODO, ' +
      'SUM(NUMNOR) NUMNOR,SUM(NORMAL) NORMAL, ' +
      'SUM(NUMPOT) NUMPOT,SUM(PROPOT) PROPOT,SUM(NUMDEF) NUMDEF,SUM(DEFICIENTE) DEFICIENTE,SUM(NUMDUD) NUMDUD,SUM(DUDOSO) DUDOSO, ' +
      'SUM(NUMPER) NUMPER,SUM(PERDIDA) PERDIDA,COUNT(*) NUMTOT,SUM(TOTAL) TOTAL  ' +
      'FROM ( SELECT DPTOID,DPTODES,USEID,USENOM,MESANNO,PERIODO,CASE WHEN CFC_F=''0'' THEN SALDOS_FV ELSE 0 END NORMAL,CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR, ' +
      'CASE WHEN CFC_F=''A'' THEN SALDOS_FV ELSE 0 END PROPOT,CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT, ' +
      'CASE WHEN CFC_F=''B'' THEN SALDOS_FV ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF, ' +
      'CASE WHEN CFC_F=''C'' THEN SALDOS_FV ELSE 0 END DUDOSO,CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD,   ' +
      'CASE WHEN CFC_F=''D'' THEN SALDOS_FV ELSE 0 END PERDIDA,CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER,SALDOS_FV TOTAL ' +
      'FROM (SELECT PERIODO,CFC_F,CFCDES_F,B.DPTOID,C.DPTODES,A.UPROID,A.UPAGOID,A.USEID,B.USENOM,DIASTRANS,SALDOS_FV, ' +
      'CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''01'' WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''02'' WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''03'' WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''04''   ' +
      'WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''05'' WHEN DIASTRANS > 123 THEN  ''06''  END IDDIAS, ' +
      'CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''ENTRE 0 Y 8 DIAS'' WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''ENTRE 9 Y 31 DIAS''   ' +
      'WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE 32 Y 62 DIAS'' WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE 63 Y 93 DIAS''  ' +
      'WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE 94 Y 123 DIAS'' WHEN DIASTRANS > 123 THEN  ''MAS DE 123 DIAS''  END DIASDESC, ' +
      '1 ASOCIADOS,MESDESC||''-''||SUBSTR(PERIODO,1,4) MESANNO FROM CFC000 A,APO101 B,APO158 C,TGE181 D WHERE A.PERIODO>=' + QuotedStr(xPeriodo01) + ' AND A.PERIODO<=' + QuotedStr(xPeriodo02) + '  ' +
      'AND A.UPROID=B.UPROID(+) AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) AND B.DPTOID=C.DPTOID(+) AND NVL(SALDOS_FV,0)>0 AND SUBSTR(PERIODO,5,2)=D.MESIDR ) ' +
      ')  WHERE DPTOID=' + QuotedStr(xDptoId) + ' GROUP BY USEID,USENOM,MESANNO,PERIODO ORDER BY USEID,PERIODO';

   DM1.cdsCredito.Close;
   DM1.cdsCredito.DataRequest(xSQL);
   DM1.cdsCredito.Open;
   TNumericField(DM1.cdsCredito.FieldByName('NUMPOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsCredito.FieldByName('PROPOT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsCredito.FieldByName('NUMDEF')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsCredito.FieldByName('DEFICIENTE')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsCredito.FieldByName('NUMDUD')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsCredito.FieldByName('DUDOSO')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsCredito.FieldByName('NUMPER')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsCredito.FieldByName('PERDIDA')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsCredito.FieldByName('NUMTOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsCredito.FieldByName('TOTAL')).DisplayFormat := '###,###,###.#0';

END;

PROCEDURE TfSaldosVen.BitExportaClick(Sender: TObject);
BEGIN
   If dtgCabVencidos.DataSource.DataSet.RecordCount=0 Then Exit;
   IF TabSheet1.Showing THEN DM1.ExportaGridExcel(dtgCabVencidos, 'CabSaldosVencidos');
   IF TabSheet2.Showing THEN DM1.ExportaGridExcel(dtgDetVencidos, DM1.cdsConsulta.FieldByName('DPTODES').AsString);
END;

PROCEDURE TfSaldosVen.dtgCabVencidosDrawTitleCell(Sender: TObject;
   Canvas: TCanvas; Field: TField; Rect: TRect;
   VAR DefaultDrawing: Boolean);
BEGIN

   IF (Field.FieldName = 'NUMPOT') OR (Field.FieldName = 'PROPOT') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clTeal;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
   END;
   IF (Field.FieldName = 'NUMDEF') OR (Field.FieldName = 'DEFICIENTE') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clOlive;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
   END;

   IF (Field.FieldName = 'NUMDUD') OR (Field.FieldName = 'DUDOSO') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clPurple;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
   END;

   IF (Field.FieldName = 'NUMPER') OR (Field.FieldName = 'PERDIDA') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clRed;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
   END;

   IF (Field.FieldName = 'NUMTOT') OR (Field.FieldName = 'TOTAL') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clBlack;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
   END;

END;

PROCEDURE TfSaldosVen.dtgDetVencidosDrawTitleCell(Sender: TObject;
   Canvas: TCanvas; Field: TField; Rect: TRect;
   VAR DefaultDrawing: Boolean);
BEGIN
   IF (Field.FieldName = 'NUMPOT') OR (Field.FieldName = 'PROPOT') THEN
   BEGIN
      dtgDetVencidos.Canvas.Font.Color := clTeal;
      dtgDetVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
   END;
   IF (Field.FieldName = 'NUMDEF') OR (Field.FieldName = 'DEFICIENTE') THEN
   BEGIN
      dtgDetVencidos.Canvas.Font.Color := clOlive;
      dtgDetVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
   END;

   IF (Field.FieldName = 'NUMDUD') OR (Field.FieldName = 'DUDOSO') THEN
   BEGIN
      dtgDetVencidos.Canvas.Font.Color := clPurple;
      dtgDetVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
   END;

   IF (Field.FieldName = 'NUMPER') OR (Field.FieldName = 'PERDIDA') THEN
   BEGIN
      dtgDetVencidos.Canvas.Font.Color := clRed;
      dtgDetVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
   END;

   IF (Field.FieldName = 'NUMTOT') OR (Field.FieldName = 'TOTAL') THEN
   BEGIN
      dtgDetVencidos.Canvas.Font.Color := clBlack;
      dtgDetVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
   END;
END;
(******************************************************************************)

PROCEDURE TfSaldosVen.BitGraficoClick(Sender: TObject);
BEGIN
   If dtgCabVencidos.DataSource.DataSet.RecordCount=0 Then Exit;
   FChart_SaldosVencidos := TFChart_SaldosVencidos.create(self);
   TRY
      FChart_SaldosVencidos.xAnhoInicio := dbsAnoIni01.text;
      FChart_SaldosVencidos.xMesInicio := Format('%.2d', [StrToInt(Trim(dbsMesIni01.Text))]);
      FChart_SaldosVencidos.xAnhoFin := dbsAnoIni02.text;
      FChart_SaldosVencidos.xMesFin := Format('%.2d', [StrToInt(Trim(dbsMesIni02.Text))]);
      FChart_SaldosVencidos.ShowModal;
   FINALLY
      FChart_SaldosVencidos.free;
   END;
END;
(******************************************************************************)
procedure TfSaldosVen.dbsAnoIni01Change(Sender: TObject);
begin
LimpiaGrid;
end;

procedure TfSaldosVen.dbsAnoIni02Change(Sender: TObject);
begin
LimpiaGrid;
end;

procedure TfSaldosVen.BitImpOfiClick(Sender: TObject);
var xSQL:string;
   xTit: TStrings;
begin
    If dtgCabVencidos.DataSource.DataSet.RecordCount=0 Then Exit;
    xSQL:=xCriterio;
    FChart:= TFChart.create(self);
    try
       xTit := TStringList.Create;
       xTit.Add('Saldos Vencidos'); // por ahora una sola linea, xq se descuadran los comentarios
       FChart.crearGrafico(DM1.wModulo,xTit,xSQL);
       FChart.showmodal
    finally
       FChart.free;
    end;

end;

END.
