// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fIndGestion
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Indicadores de Gestion
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG006;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Mask, wwdbedit, Wwdbspin,
  Buttons, Db, ComCtrls, ExtCtrls;

type
  TfIndGestion = class(TForm)
    grbParametros: TGroupBox;
    lblNomMes01: TLabel;
    lblNomMes02: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitProcesar: TBitBtn;
    dbsAnoIni01: TwwDBSpinEdit;
    dbsMesIni01: TwwDBSpinEdit;
    dbsAnoIni02: TwwDBSpinEdit;
    dbsMesIni02: TwwDBSpinEdit;
    BitExporta: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    dtgCabVencidos: TwwDBGrid;
    dtgGesDep: TwwDBGrid;
    dtgGesUses: TwwDBGrid;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label8: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Label10: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    Label12: TLabel;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Label4: TLabel;
    Label5: TLabel;
    BitGrafico: TBitBtn;
    BitSalir: TBitBtn;
    procedure BitProcesarClick(Sender: TObject);
    procedure dtgCabVencidosDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure BitSalirClick(Sender: TObject);
    procedure dbsMesIni01Change(Sender: TObject);
    procedure dbsMesIni02Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitExportaClick(Sender: TObject);
    procedure dbsAnoIni01Change(Sender: TObject);
    procedure dbsAnoIni02Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure dtgGesDepDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure dtgGesUsesDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure Label1Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure BitGraficoClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimpiaGrid;
  public
    { Public declarations }
  end;

var
  fIndGestion: TfIndGestion;

implementation

uses RSGDM1, RSG122;

{$R *.dfm}

procedure TfIndGestion.BitProcesarClick(Sender: TObject);
var xSQL:String;
begin
xSQL:='SELECT PERACT, '+
             ' MESSAA, '+
             ' ROUND((SUM(NVL(SAL_NONORMAL,0))/SUM(NVL(SALDOS_FT,0)))*100,4) CAR_CRIT, '+
             ' ROUND(SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0))*100,4) CAR_ATRA, '+
             ' ROUND(SUM(NVL(SAL_90DIAS,0))/SUM(NVL(SALDOS_FT,0))*100,4) CAR_ALTO, '+
             ' ROUND(SUM(NVL(SAL_PESADA,0))/SUM(NVL(SALDOS_FT,0))*100,4) CAR_PESA, '+
             ' ROUND((SUM(NVL(SALDOS_PV,0))/SUM(NVL(SALDOS_FV,0)))*100,4) RAT_COB, '+
             ' ROUND((SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0)))*100,4) IND_MOR '+
             ' FROM (SELECT PERACT,B.MESDESC||''-''||SUBSTR(PERACT,1,4) MESSAA,CFC_F,CFCDES_F,SALDOS_FT,SALDOS_FV,SALDOS_FP,SALDOS_PV,0, '+
      'CASE WHEN CFC_F<>''0'' THEN SALDOS_FT ELSE 0 END SAL_NONORMAL, CASE WHEN DIASTRANS>90 THEN SALDOS_FT ELSE 0 END SAL_90DIAS, '+
      'CASE WHEN CFC_F IN (''B'',''C'',''D'') THEN SALDOS_FT ELSE 0 END SAL_PESADA, DIASTRANS FROM RIE_EST_GEN A,TGE181 B '+
      'WHERE PERACT BETWEEN '+ QuotedStr(dbsAnoIni01.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni01.Text))])) + ' AND '+QuotedStr(dbsAnoIni02.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni02.Text))]))+' AND CFC_F IS NOT NULL AND SUBSTR(PERACT,5,2)=B.MESIDR(+) ) GROUP BY PERACT, MESSAA  ORDER BY PERACT DESC' ;
DM1.cdsConsulta.Close;
DM1.cdsConsulta.DataRequest(xSQL);Screen.Cursor := crHourGlass;
DM1.cdsConsulta.Open;

TNumericField(DM1.cdsConsulta.FieldByName('CAR_CRIT')).DisplayFormat := '###,###,###.#0';
TNumericField(DM1.cdsConsulta.FieldByName('CAR_ATRA')).DisplayFormat := '###,###,###.#0';
TNumericField(DM1.cdsConsulta.FieldByName('CAR_ALTO')).DisplayFormat := '###,###,###.#0';
TNumericField(DM1.cdsConsulta.FieldByName('CAR_PESA')).DisplayFormat := '###,###,###.#0';
TNumericField(DM1.cdsConsulta.FieldByName('RAT_COB')).DisplayFormat := '###,###,###.#0';
TNumericField(DM1.cdsConsulta.FieldByName('IND_MOR')).DisplayFormat := '###,###,###.#0';
Screen.Cursor := crDefault;




end;

procedure TfIndGestion.dtgCabVencidosDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   IF (Field.FieldName = 'MESSAA') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clNavy;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CAR_CRIT') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clGreen;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CAR_ATRA') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clTeal;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CAR_PESA') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clPurple;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CAR_ALTO') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clRed;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'RAT_COB')  THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clNavy;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF  (Field.FieldName = 'IND_MOR') THEN
   BEGIN
      dtgCabVencidos.Canvas.Font.Color := clMaroon;
      dtgCabVencidos.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgCabVencidos.DefaultDrawDataCell(rect, Field, State);
   END;




end;

procedure TfIndGestion.BitSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfIndGestion.dbsMesIni01Change(Sender: TObject);
begin
   LimpiaGrid;
   lblNomMes01.Caption := DM1.DesMes(StrToInt(dbsMesIni01.Text), 'N');
end;

procedure TfIndGestion.dbsMesIni02Change(Sender: TObject);
begin
   LimpiaGrid;
   lblNomMes02.Caption := DM1.DesMes(StrToInt(dbsMesIni02.Text), 'N');
end;

procedure TfIndGestion.FormActivate(Sender: TObject);
begin
   LimpiaGrid; PageControl1.ActivePageIndex:=0;

   dbsAnoIni01.Value:=StrToInt(Copy(DM1.UltCartera,1,4));
   dbsMesIni01.Value:=StrToInt(Copy(DM1.UltCartera,5,2));
   lblNomMes01.Caption := DM1.DesMes(StrToInt(dbsMesIni01.Text), 'N');
   dbsAnoIni02.Value:=StrToInt(Copy(DM1.UltCartera,1,4));
   dbsMesIni02.Value:=StrToInt(Copy(DM1.UltCartera,5,2));
   lblNomMes02.Caption := DM1.DesMes(StrToInt(dbsMesIni02.Text), 'N');

end;

procedure TfIndGestion.BitExportaClick(Sender: TObject);
begin
If dtgCabVencidos.DataSource.DataSet.RecordCount=0 Then Exit;
If TabSheet1.Showing Then DM1.ExportaGridExcel(dtgCabVencidos,'Ind_Gestión');
If TabSheet2.Showing Then DM1.ExportaGridExcel(dtgGesDep,DM1.cdsConsulta.FieldByName('MESSAA').AsString);
If TabSheet3.Showing Then DM1.ExportaGridExcel(dtgGesUses,DM1.cdsSolicitud.FieldByName('DPTODES').AsString);
end;

procedure TfIndGestion.LimpiaGrid;
var xSQL:String;
begin
xSQL:='SELECT PERACT, '+
            ' MESSAA, '+
            ' ROUND((SUM(NVL(SAL_NONORMAL,0))/SUM(NVL(SALDOS_FT,0)))*100,4) CAR_CRIT, '+
            ' ROUND(SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0))*100,4) CAR_ATRA, '+
            ' ROUND(SUM(NVL(SAL_90DIAS,0))/SUM(NVL(SALDOS_FT,0))*100,4) CAR_ALTO, '+
            ' ROUND(SUM(NVL(SAL_PESADA,0))/SUM(NVL(SALDOS_FT,0))*100,4) CAR_PESA, '+
            ' ROUND((SUM(NVL(SALDOS_PV,0))/SUM(NVL(SALDOS_FV,0)))*100,4) RAT_COB, '+
            ' ROUND((SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0)))*100,4) IND_MOR '+
            ' FROM (SELECT PERACT,B.MESDESC||''-''||SUBSTR(PERACT,1,4) MESSAA,CFC_F,CFCDES_F,SALDOS_FT,SALDOS_FV,SALDOS_FP,SALDOS_PV,0, '+
      'CASE WHEN CFC_F<>''0'' THEN SALDOS_FT ELSE 0 END SAL_NONORMAL, CASE WHEN DIASTRANS>90 THEN SALDOS_FT ELSE 0 END SAL_90DIAS, '+
      'CASE WHEN CFC_F IN (''B'',''C'',''D'') THEN SALDOS_FT ELSE 0 END SAL_PESADA, DIASTRANS FROM RIE_EST_GEN A,TGE181 B '+
      'WHERE 1 = 2 AND PERACT=''XXXXXX'' AND CFC_F IS NOT NULL AND SUBSTR(PERACT,5,2)=B.MESIDR(+) ) GROUP BY PERACT, MESSAA  ORDER BY PERACT DESC' ;
DM1.cdsConsulta.Close;
DM1.cdsConsulta.DataRequest(xSQL);Screen.Cursor := crHourGlass;
DM1.cdsConsulta.Open;

TNumericField(DM1.cdsConsulta.FieldByName('CAR_CRIT')).DisplayFormat := '###,###,##0.#0';
TNumericField(DM1.cdsConsulta.FieldByName('CAR_ATRA')).DisplayFormat := '###,###,##0.#0';
TNumericField(DM1.cdsConsulta.FieldByName('CAR_ALTO')).DisplayFormat := '###,###,##0.#0';
TNumericField(DM1.cdsConsulta.FieldByName('CAR_PESA')).DisplayFormat := '###,###,##0.#0';
TNumericField(DM1.cdsConsulta.FieldByName('RAT_COB')).DisplayFormat := '###,###,##0.#0';
TNumericField(DM1.cdsConsulta.FieldByName('IND_MOR')).DisplayFormat := '###,###,##0.#0';
Screen.Cursor := crDefault;
end;

procedure TfIndGestion.dbsAnoIni01Change(Sender: TObject);
begin
   LimpiaGrid;
end;

procedure TfIndGestion.dbsAnoIni02Change(Sender: TObject);
begin
   LimpiaGrid;
end;

procedure TfIndGestion.PageControl1Change(Sender: TObject);
var xSQL:String;
begin
If dtgCabVencidos.DataSource.DataSet.RecordCount=0 Then PageControl1.ActivePageIndex:=0;
If TabSheet1.Showing Then
   Begin
      TabSheet2.Caption:='Por Departamentos ';
      TabSheet3.Caption:='Por Ugeles / Uses ';
   End;
If TabSheet2.Showing Then
   Begin
      TabSheet2.Caption:='Periodo : '+DM1.cdsConsulta.FieldByName('MESSAA').AsString+'  ';
      xSQL:='SELECT DPTOID, '+
                  ' DPTODES, '+
                  ' ROUND((SUM(NVL(SAL_NONORMAL,0))/SUM(NVL(SALDOS_FT,0)))*100,4) CAR_CRIT, '+
                  ' ROUND(SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0))*100,4) CAR_ATRA, '+
                  ' ROUND(SUM(NVL(SAL_90DIAS,0))/SUM(NVL(SALDOS_FT,0))*100,4) CAR_ALTO, '+
                  ' ROUND(SUM(NVL(SAL_PESADA,0))/SUM(NVL(SALDOS_FT,0))*100,4) CAR_PESA, '+
                  ' ROUND(CASE WHEN SUM(NVL(SALDOS_FV,0))>0 THEN (SUM(NVL(SALDOS_PV,0))/SUM(NVL(SALDOS_FV,0)))*100 ELSE 0 END,4) RAT_COB, '+
                  ' ROUND((SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0)))*100,4) IND_MOR '+
            ' FROM ( SELECT PERACT,B.MESDESC||''-''||SUBSTR(PERACT,1,4) MESSAA, '+
            'C.DPTOID,D.DPTODES,C.USEID,C.USENOM,CFC_F,CFCDES_F,SALDOS_FT,SALDOS_FV,SALDOS_FP,SALDOS_PV,0,CASE WHEN CFC_F<>''0'' THEN SALDOS_FT ELSE 0 END SAL_NONORMAL, '+
            'CASE WHEN DIASTRANS>90 THEN SALDOS_FT ELSE 0 END SAL_90DIAS,CASE WHEN CFC_F IN (''B'',''C'',''D'') THEN SALDOS_FT ELSE 0 END SAL_PESADA, '+
            'DIASTRANS FROM RIE_EST_GEN A,TGE181 B,APO101 C,APO158 D  WHERE PERACT='+QuotedStr(DM1.cdsConsulta.FieldByName('PERACT').AsString)+' AND  A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND '+
            'A.USEID=C.USEID(+) AND  C.DPTOID=D.DPTOID(+) AND CFC_F IS NOT NULL AND C.DPTOID IS NOT NULL  AND SUBSTR(PERACT,5,2)=B.MESIDR(+) )  GROUP BY DPTOID,DPTODES ORDER BY CAR_ALTO DESC';
      DM1.cdsSolicitud.Close;
      DM1.cdsSolicitud.DataRequest(xSQL); Screen.Cursor := crHourGlass;
      DM1.cdsSolicitud.Open;
      TNumericField(DM1.cdsSolicitud.FieldByName('CAR_CRIT')).DisplayFormat := '###,###,##0.#0';
      TNumericField(DM1.cdsSolicitud.FieldByName('CAR_ATRA')).DisplayFormat := '###,###,##0.#0';
      TNumericField(DM1.cdsSolicitud.FieldByName('CAR_ALTO')).DisplayFormat := '###,###,##0.#0';
      TNumericField(DM1.cdsSolicitud.FieldByName('CAR_PESA')).DisplayFormat := '###,###,##0.#0';
      TNumericField(DM1.cdsSolicitud.FieldByName('RAT_COB')).DisplayFormat := '###,###,##0.#0';
      TNumericField(DM1.cdsSolicitud.FieldByName('IND_MOR')).DisplayFormat := '###,###,##0.#0';
      Screen.Cursor := crDefault;

   End;
If TabSheet3.Showing Then
   Begin
      TabSheet3.Caption:='Departamento : '+DM1.cdsSolicitud.FieldByName('DPTODES').AsString+'  ';
      xSQL:='SELECT USEID, '+
                  ' USENOM, '+
                  ' ROUND((SUM(NVL(SAL_NONORMAL,0))/SUM(NVL(SALDOS_FT,0)))*100,4) CAR_CRIT, '+
                  ' ROUND(SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0))*100,4) CAR_ATRA, '+
                  ' ROUND(SUM(NVL(SAL_90DIAS,0))/SUM(NVL(SALDOS_FT,0))*100,4) CAR_ALTO, '+
                  ' ROUND(SUM(NVL(SAL_PESADA,0))/SUM(NVL(SALDOS_FT,0))*100,4) CAR_PESA, '+
                  ' ROUND(CASE WHEN SUM(NVL(SALDOS_FV,0))>0 THEN (SUM(NVL(SALDOS_PV,0))/SUM(NVL(SALDOS_FV,0)))*100 ELSE 0 END,4) RAT_COB, '+
                  ' ROUND((SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0)))*100,4) IND_MOR '+
            ' FROM ( SELECT PERACT,B.MESDESC||''-''||SUBSTR(PERACT,1,4) MESSAA, '+
            'C.DPTOID,D.DPTODES,C.USEID,C.USENOM,CFC_F,CFCDES_F,SALDOS_FT,SALDOS_FV,SALDOS_FP,SALDOS_PV,0,CASE WHEN CFC_F<>''0'' THEN SALDOS_FT ELSE 0 END SAL_NONORMAL, '+
            'CASE WHEN DIASTRANS>90 THEN SALDOS_FT ELSE 0 END SAL_90DIAS,CASE WHEN CFC_F IN (''B'',''C'',''D'') THEN SALDOS_FT ELSE 0 END SAL_PESADA, '+
            'DIASTRANS FROM RIE_EST_GEN A,TGE181 B,APO101 C,APO158 D  WHERE PERACT='+QuotedStr(DM1.cdsConsulta.FieldByName('PERACT').AsString)+' AND  A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND '+
            'A.USEID=C.USEID(+) AND  C.DPTOID=D.DPTOID(+) AND CFC_F IS NOT NULL AND C.DPTOID='+QuotedStr(DM1.cdsSolicitud.FieldByName('DPTOID').AsString)+' AND SUBSTR(PERACT,5,2)=B.MESIDR(+) )  GROUP BY USEID,USENOM ORDER BY CAR_ALTO DESC';
      DM1.cdsSolicitudA.Close;
      DM1.cdsSolicitudA.DataRequest(xSQL); Screen.Cursor := crHourGlass;
      DM1.cdsSolicitudA.Open;
      TNumericField(DM1.cdsSolicitudA.FieldByName('CAR_CRIT')).DisplayFormat := '###,###,##0.#0';
      TNumericField(DM1.cdsSolicitudA.FieldByName('CAR_ATRA')).DisplayFormat := '###,###,##0.#0';
      TNumericField(DM1.cdsSolicitudA.FieldByName('CAR_ALTO')).DisplayFormat := '###,###,##0.#0';
      TNumericField(DM1.cdsSolicitudA.FieldByName('CAR_PESA')).DisplayFormat := '###,###,##0.#0';
      TNumericField(DM1.cdsSolicitudA.FieldByName('RAT_COB')).DisplayFormat := '###,###,##0.#0';
      TNumericField(DM1.cdsSolicitudA.FieldByName('IND_MOR')).DisplayFormat := '###,###,##0.#0';
      Screen.Cursor := crDefault;

   End;


end;

procedure TfIndGestion.dtgGesDepDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   IF (Field.FieldName = 'DPTODES') THEN
   BEGIN
      dtgGesDep.Canvas.Font.Color := clNavy;
      dtgGesDep.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesDep.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CAR_CRIT') THEN
   BEGIN
      dtgGesDep.Canvas.Font.Color := clGreen;
      dtgGesDep.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesDep.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CAR_ATRA') THEN
   BEGIN
      dtgGesDep.Canvas.Font.Color := clTeal;
      dtgGesDep.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesDep.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CAR_PESA') THEN
   BEGIN
      dtgGesDep.Canvas.Font.Color := clPurple;
      dtgGesDep.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesDep.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CAR_ALTO') THEN
   BEGIN
      dtgGesDep.Canvas.Font.Color := clRed;
      dtgGesDep.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesDep.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'RAT_COB')  THEN
   BEGIN
      dtgGesDep.Canvas.Font.Color := clNavy;
      dtgGesDep.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesDep.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'IND_MOR') THEN
   BEGIN
      dtgGesDep.Canvas.Font.Color := clMaroon;
      dtgGesDep.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesDep.DefaultDrawDataCell(rect, Field, State);
   END;

end;

procedure TfIndGestion.dtgGesUsesDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   IF (Field.FieldName = 'USENOM') THEN
   BEGIN
      dtgGesUses.Canvas.Font.Color := clNavy;
      dtgGesUses.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesUses.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CAR_CRIT') THEN
   BEGIN
      dtgGesUses.Canvas.Font.Color := clGreen;
      dtgGesUses.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesUses.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CAR_ATRA') THEN
   BEGIN
      dtgGesUses.Canvas.Font.Color := clTeal;
      dtgGesUses.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesUses.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CAR_PESA') THEN
   BEGIN
      dtgGesUses.Canvas.Font.Color := clPurple;
      dtgGesUses.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesUses.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CAR_ALTO') THEN
   BEGIN
      dtgGesUses.Canvas.Font.Color := clRed;
      dtgGesUses.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesUses.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'RAT_COB')  THEN
   BEGIN
      dtgGesUses.Canvas.Font.Color := clNavy;
      dtgGesUses.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesUses.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'IND_MOR') THEN
   BEGIN
      dtgGesUses.Canvas.Font.Color := clMaroon;
      dtgGesUses.Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      dtgGesUses.DefaultDrawDataCell(rect, Field, State);
   END;


end;

procedure TfIndGestion.Label1Click(Sender: TObject);
begin
MessageDlg('Cartera Criticada:'+#13+#13+'Porción de la cartera que esta "contaminada",'+#13+'por atraso en los pagos y en consecuencia'+#13+' en riesgo de no ser pagado.'+#13+#13+'Composición :'+#13+'(CPP+DEF+DUD+PER) / SALDO TOTAL', mtInformation,[mbOk],0);
end;

procedure TfIndGestion.Label8Click(Sender: TObject);
begin
MessageDlg('Cartera Atrasada:'+#13+#13+'Porción de los créditos que se encuentra en situación de vencidos'+#13+#13+'Composición :'+#13+'SALDO VENCIDO /  SALDO TOTAL', mtInformation,[mbOk],0);
end;

procedure TfIndGestion.Label12Click(Sender: TObject);
begin
MessageDlg('Cartera Pesada:'+#13+#13+'Porción de los créditos totales con calificación'+#13+'deficiente,dudoso y perdida sobre el saldo total'+#13+#13+'Composición :'+#13+'(DEF+DUD+PER) / SALDO TOTAL', mtInformation,[mbOk],0);
end;

procedure TfIndGestion.Label10Click(Sender: TObject);
begin
MessageDlg('Cartera Alto Riesgo:'+#13+#13+'Porción de los créditos totales que se encuentran'+#13+'con mas de 90 días de atraso'+#13+#13+'Composición :'+#13+'SALDO TOTAL > 90 DIAS /  SALDO TOTAL', mtInformation,[mbOk],0);
end;

procedure TfIndGestion.Label4Click(Sender: TObject);
begin
MessageDlg('Ratio de Cobertura:'+#13+#13+'Muestra el porcentaje de la cartera en riesgo'+#13+'cubierta por las provisiones'+#13+#13+'Composición :'+#13+'TOTAL PROVISIONES / SALDO VENCIDO', mtInformation,[mbOk],0);
end;

procedure TfIndGestion.Label5Click(Sender: TObject);
begin
MessageDlg('Indice de Morosidad:'+#13+#13+'Porcentaje de la cartera que se encuentra en morosidad'+#13+'(incumplimeinto de pago)'+#13+#13+'Composición :'+#13+'SALDO VENCIDO / SALDO TOTAL', mtInformation,[mbOK],0);
end;

procedure TfIndGestion.BitGraficoClick(Sender: TObject);
var xSQL:string;
   xTit: TStrings;
begin
    If dtgCabVencidos.DataSource.DataSet.RecordCount=0 Then Exit;
    Case PageControl1.ActivePageIndex Of
         0:Begin
          xSQL:='SELECT MESSAA, '+
                      ' ROUND(CAR_CRIT,4) CRITICADA, '+
                      ' ROUND(CAR_ATRA,4) ATRASADA, '+
                      ' ROUND(CAR_ALTO,4) CAR_ALTO, '+
                      ' ROUND(CAR_PESA,4) PESADA, '+
                      ' ROUND(RAT_COB,4) RATIO_COBERTURA, '+
                      ' ROUND(IND_MOR,4) INDICE_MOROSIDAD '+
                ' FROM (SELECT PERACT, MESSAA,(SUM(NVL(SAL_NONORMAL,0))/SUM(NVL(SALDOS_FT,0)))*100 CAR_CRIT, '+
                'SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0))*100 CAR_ATRA, '+
                'SUM(NVL(SAL_90DIAS,0))/SUM(NVL(SALDOS_FT,0))*100 CAR_ALTO, '+
                'SUM(NVL(SAL_PESADA,0))/SUM(NVL(SALDOS_FT,0))*100 CAR_PESA,  '+
                '(SUM(NVL(SALDOS_PV,0))/SUM(NVL(SALDOS_FV,0)))*100 RAT_COB,  '+
                '(SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0)))*100 IND_MOR   '+
                'FROM (SELECT PERACT,B.MESDESC||''-''||SUBSTR(PERACT,1,4) MESSAA,CFC_F,CFCDES_F,SALDOS_FT,SALDOS_FV,SALDOS_FP,SALDOS_PV,0, '+
                'CASE WHEN CFC_F<>''0'' THEN SALDOS_FT ELSE 0 END SAL_NONORMAL, CASE WHEN DIASTRANS>90 THEN SALDOS_FT ELSE 0 END SAL_90DIAS, '+
                'CASE WHEN CFC_F IN (''B'',''C'',''D'') THEN SALDOS_FT ELSE 0 END SAL_PESADA, DIASTRANS FROM RIE_EST_GEN A,TGE181 B '+
                'WHERE PERACT BETWEEN '+ QuotedStr(dbsAnoIni01.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni01.Text))])) + ' AND '+QuotedStr(dbsAnoIni02.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni02.Text))]))+' AND CFC_F IS NOT NULL AND SUBSTR(PERACT,5,2)=B.MESIDR(+) ) GROUP BY PERACT, MESSAA  ORDER BY PERACT DESC)' ;
           End;
           1:Begin
            xSQL:='SELECT DPTODES, '+
                        ' ROUND(CAR_CRIT,4) CRITICADA, '+
                        ' ROUND(CAR_ATRA,4) ATRASADA, '+
                        ' ROUND(CAR_ALTO,4) CAR_ALTO, '+
                        ' ROUND(CAR_PESA,4) PESADA, '+
                        ' ROUND(RAT_COB,4) RATIO_COBERTURA, '+
                        ' ROUND(IND_MOR,4) INDICE_MOROSIDAD '+
                  ' FROM (SELECT DPTOID,DPTODES,(SUM(NVL(SAL_NONORMAL,0))/SUM(NVL(SALDOS_FT,0)))*100 CAR_CRIT, '+
                  'SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0))*100 CAR_ATRA,SUM(NVL(SAL_90DIAS,0))/SUM(NVL(SALDOS_FT,0))*100 CAR_ALTO, '+
                  'SUM(NVL(SAL_PESADA,0))/SUM(NVL(SALDOS_FT,0))*100 CAR_PESA,CASE WHEN SUM(NVL(SALDOS_FV,0))>0 THEN (SUM(NVL(SALDOS_PV,0))/SUM(NVL(SALDOS_FV,0)))*100 ELSE 0 END RAT_COB, '+
                  '(SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0)))*100 IND_MOR FROM ( SELECT PERACT,B.MESDESC||''-''||SUBSTR(PERACT,1,4) MESSAA, '+
                  'C.DPTOID,D.DPTODES,C.USEID,C.USENOM,CFC_F,CFCDES_F,SALDOS_FT,SALDOS_FV,SALDOS_FP,SALDOS_PV,0,CASE WHEN CFC_F<>''0'' THEN SALDOS_FT ELSE 0 END SAL_NONORMAL, '+
                  'CASE WHEN DIASTRANS>90 THEN SALDOS_FT ELSE 0 END SAL_90DIAS,CASE WHEN CFC_F IN (''B'',''C'',''D'') THEN SALDOS_FT ELSE 0 END SAL_PESADA, '+
                  'DIASTRANS FROM RIE_EST_GEN A,TGE181 B,APO101 C,APO158 D  WHERE PERACT='+QuotedStr(DM1.cdsConsulta.FieldByName('PERACT').AsString)+' AND  A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND '+
                  'A.USEID=C.USEID(+) AND  C.DPTOID=D.DPTOID(+) AND CFC_F IS NOT NULL AND C.DPTOID IS NOT NULL  AND SUBSTR(PERACT,5,2)=B.MESIDR(+) )  GROUP BY DPTOID,DPTODES ORDER BY CAR_ALTO DESC)';
             End;

           2:Begin
            xSQL:='SELECT USENOM, '+
                        ' ROUND(CAR_CRIT,4) CRITICADA, '+
                        ' ROUND(CAR_ATRA,4) ATRASADA, '+
                        ' ROUND(CAR_ALTO,4) CAR_ALTO, '+
                        ' ROUND(CAR_PESA,4) PESADA, '+
                        ' ROUND(RAT_COB,4) RATIO_COBERTURA, '+
                        ' ROUND(IND_MOR,4) INDICE_MOROSIDAD '+
                  ' FROM (SELECT USEID,USENOM,(SUM(NVL(SAL_NONORMAL,0))/SUM(NVL(SALDOS_FT,0)))*100 CAR_CRIT, '+
                  'SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0))*100 CAR_ATRA,SUM(NVL(SAL_90DIAS,0))/SUM(NVL(SALDOS_FT,0))*100 CAR_ALTO, '+
                  'SUM(NVL(SAL_PESADA,0))/SUM(NVL(SALDOS_FT,0))*100 CAR_PESA,CASE WHEN SUM(NVL(SALDOS_FV,0))>0 THEN (SUM(NVL(SALDOS_PV,0))/SUM(NVL(SALDOS_FV,0)))*100 ELSE 0 END RAT_COB, '+
                  '(SUM(NVL(SALDOS_FV,0))/SUM(NVL(SALDOS_FT,0)))*100 IND_MOR FROM ( SELECT PERACT,B.MESDESC||''-''||SUBSTR(PERACT,1,4) MESSAA, '+
                  'C.DPTOID,D.DPTODES,C.USEID,C.USENOM,CFC_F,CFCDES_F,SALDOS_FT,SALDOS_FV,SALDOS_FP,SALDOS_PV,0,CASE WHEN CFC_F<>''0'' THEN SALDOS_FT ELSE 0 END SAL_NONORMAL, '+
                  'CASE WHEN DIASTRANS>90 THEN SALDOS_FT ELSE 0 END SAL_90DIAS,CASE WHEN CFC_F IN (''B'',''C'',''D'') THEN SALDOS_FT ELSE 0 END SAL_PESADA, '+
                  'DIASTRANS FROM RIE_EST_GEN A,TGE181 B,APO101 C,APO158 D  WHERE PERACT='+QuotedStr(DM1.cdsConsulta.FieldByName('PERACT').AsString)+' AND  A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND '+
                  'A.USEID=C.USEID(+) AND  C.DPTOID=D.DPTOID(+) AND CFC_F IS NOT NULL AND C.DPTOID='+QuotedStr(DM1.cdsSolicitud.FieldByName('DPTOID').AsString)+' AND SUBSTR(PERACT,5,2)=B.MESIDR(+) )  GROUP BY USEID,USENOM ORDER BY CAR_ALTO DESC)';
             End;

    End;
    fGrafIndGestion:= TfGrafIndGestion.create(self);
    try
       xTit := TStringList.Create;
       If TabSheet1.Showing Then xTit.Add('Indices de Gestión - Estadística por Periodo ');
       If TabSheet2.Showing Then xTit.Add('Indices de Gestión - '+TabSheet2.Caption);
       If TabSheet3.Showing Then xTit.Add('Indices de Gestión - '+TabSheet2.Caption+' '+TabSheet3.Caption);
       fGrafIndGestion.crearGrafico(DM1.wModulo,xTit,xSQL);
       fGrafIndGestion.showmodal
    finally
       fGrafIndGestion.free;
    end;


end;

end.


