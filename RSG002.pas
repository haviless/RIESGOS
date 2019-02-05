// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fMatDesplaz
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Matriz de desplazamiento
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG
// HPC_201501_RSG : Seleccionar entre el saldo del periodo o el saldo del
//                  periodo anterior en la pestaña: "Por Monto".  

UNIT RSG002;

INTERFACE

USES

   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids, Db, DBTables, StdCtrls, DBGrids, Wwdbigrd, Wwdbgrid,
   ExtCtrls, shellapi, Buttons, ComCtrls, ToolWin, Mask, wwdbedit,
   clipbrd, wwExport, ImgList, wwclearbuttongroup, wwradiogroup, wwcheckbox,
   Wwdotdot, Wwdbcomb, Wwdatsrc, Wwquery, ppCtrls, ppBands, ppVar, ppPrnabl,
   ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
   Spin, wwdblook, Wwdbspin;
TYPE
   TfMatDesplaz = CLASS(TForm)
      BitSalir: TBitBtn;
      dbRepOfi: TppDBPipeline;
      RepOfides: TppReport;
      ppHeaderBand9: TppHeaderBand;
      ppShape2: TppShape;
      ppLabel108: TppLabel;
      Titulos01: TppLabel;
      ppLabel159: TppLabel;
      ppLabel160: TppLabel;
      ppLabel161: TppLabel;
      ppSystemVariable25: TppSystemVariable;
      ppSystemVariable26: TppSystemVariable;
      ppSystemVariable27: TppSystemVariable;
      ppLabel162: TppLabel;
      ppLabel163: TppLabel;
      ppLabel164: TppLabel;
      xTitulos01: TppLabel;
      ppLabel170: TppLabel;
      ppLabel171: TppLabel;
      ppLabel172: TppLabel;
      ppLine48: TppLine;
      ppLine49: TppLine;
      ppLabel1: TppLabel;
      ppLabel12: TppLabel;
      ppDetailBand9: TppDetailBand;
      ppShape1: TppShape;
      ppDBText58: TppDBText;
      ppDBText60: TppDBText;
      ppDBText61: TppDBText;
      ppDBText64: TppDBText;
      ppDBText3: TppDBText;
      ppFooterBand9: TppFooterBand;
      ppSummaryBand9: TppSummaryBand;
      ppLine29: TppLine;
      ppLine30: TppLine;
      ppLabel166: TppLabel;
      ppLabel167: TppLabel;
      ppDBCalc21: TppDBCalc;
      ppDBCalc51: TppDBCalc;
      ppShape3: TppShape;
      ppDBCalc2: TppDBCalc;
      ppDBCalc1: TppDBCalc;
      RepTipo: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppShape4: TppShape;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      xTitulos02: TppLabel;
      ppLabel11: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppShape5: TppShape;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppShape6: TppShape;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      dbRepTip: TppDBPipeline;
      RepDes: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppShape7: TppShape;
      ppLabel10: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppSystemVariable6: TppSystemVariable;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      xTitulos03: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppShape8: TppShape;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand2: TppSummaryBand;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppShape9: TppShape;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      dbRepDes: TppDBPipeline;
      grbParametros: TGroupBox;
      lblNomMes: TLabel;
      BitProcesar: TBitBtn;
      dbsAnoIni: TwwDBSpinEdit;
      dbsMesIni: TwwDBSpinEdit;
      BitImpOfi: TBitBtn;
      PageControl1: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      TabSheet3: TTabSheet;
      dtgCabDept: TwwDBGrid;
      dtgCabDet: TwwDBGrid;
      dtgUsesDet: TwwDBGrid;
      BitMst01: TBitBtn;
      BitMst02: TBitBtn;
      dtgDiasAtraso: TwwDBGrid;
      TabSheet4: TTabSheet;
      dtgConcentracion: TwwDBGrid;
      ChkTot: TRadioButton;
      ChkVen: TRadioButton;
      grpDetalle: TGroupBox;
      lblOrigen: TLabel;
      Label6: TLabel;
      lblDepto: TLabel;
      BitMostrar: TBitBtn;
      pnlOrigen: TPanel;
      EdtOfDes: TEdit;
      dblOriOto: TwwDBLookupCombo;
      dblUses: TwwDBLookupCombo;
      Panel3: TPanel;
      EdtDesUse: TEdit;
      dblDpto: TwwDBLookupCombo;
      pnlDpto: TPanel;
      EdtDepart: TEdit;
      pDias: TPanel;
      Label1: TLabel;
      Label12: TLabel;
      Label13: TLabel;
      SpInicio: TSpinEdit;
      SpFin: TSpinEdit;
      ChkAntiguedad: TCheckBox;
      dblCategoria: TwwDBLookupCombo;
      Panel1: TPanel;
      EdtCategoria: TEdit;
      Label8: TLabel;
      PageControl2: TPageControl;
      TabSheet5: TTabSheet;
      TabSheet6: TTabSheet;
      TabSheet7: TTabSheet;
      dtgCabRiesgos: TwwDBGrid;
      dtgCons01a: TwwDBGrid;
      dtgCons01b: TwwDBGrid;
      Panel5: TPanel;
      Shape2: TShape;
      Shape1: TShape;
      Label9: TLabel;
      Label10: TLabel;
      dtgCons02a: TwwDBGrid;
      BitExporta: TBitBtn;
      dtgCons02b: TwwDBGrid;
      ChkDias: TRadioButton;
      dtgAuxiliar: TwwDBGrid;
      chkDepUgel: TRadioButton;
      dtgAuxiliar02: TwwDBGrid;
      rdbSeleccion: TRadioGroup;
      dtgDatos: TwwDBGrid;
      lblCount: TLabel;
      chkDptoUgelDias: TRadioButton;
      dtgAuxiliar03: TwwDBGrid;
      BitGrafico: TBitBtn;
      dblCatAnt: TwwDBLookupCombo;
      Panel4: TPanel;
      EdtCatAnt: TEdit;
      Label4: TLabel;
    lblTotal: TLabel;
    Shape5: TShape;
    Label7: TLabel;
    lblEmpeora: TLabel;
    lblMejora: TLabel;
    Label5: TLabel;
    Shape6: TShape;
    lblMantienen: TLabel;
    Panel2: TPanel;
    Shape3: TShape;
    Shape4: TShape;
    Shape7: TShape;
    Label2: TLabel;
    Label3: TLabel;
    lblTotNum: TLabel;
    Shape8: TShape;
    Label14: TLabel;
    lblDetNum: TLabel;
    lblMejNum: TLabel;
    Label17: TLabel;
    lblManNum: TLabel;
    chkProceso: TCheckBox;
    cmbConsulta: TComboBox;
    Label11: TLabel;
    Label15: TLabel;
    rdbTipCar: TRadioGroup;
    rdbTipAso: TRadioGroup;
    rdbSelPer: TRadioGroup;
// Inicio HPC_201501_RSG
    rdgSalCar: TRadioGroup;
// Fin HPC_201501_RSG
      PROCEDURE BitSalirClick(Sender: TObject);
      PROCEDURE FormActivate(Sender: TObject);
      PROCEDURE dtgCabRiesgosDrawDataCell(Sender: TObject; CONST Rect: TRect;
         Field: TField; State: TGridDrawState);
      PROCEDURE dtgCabRiesgosDrawFooterCell(Sender: TObject; Canvas: TCanvas;
         FooterCellRect: TRect; Field: TField; FooterText: STRING;
         VAR DefaultDrawing: Boolean);
      PROCEDURE dtgCabRiesgosDrawTitleCell(Sender: TObject; Canvas: TCanvas;
         Field: TField; Rect: TRect; VAR DefaultDrawing: Boolean);
      PROCEDURE BitImpOfiClick(Sender: TObject);
      PROCEDURE BitProcesarClick(Sender: TObject);
      PROCEDURE dbsMesIniChange(Sender: TObject);
      PROCEDURE dtgCabDeptDrawDataCell(Sender: TObject; CONST Rect: TRect;
         Field: TField; State: TGridDrawState);
      PROCEDURE dtgCabDetDrawDataCell(Sender: TObject; CONST Rect: TRect;
         Field: TField; State: TGridDrawState);
      PROCEDURE dtgCabDeptRowChanged(Sender: TObject);
      PROCEDURE dtgUsesDetDrawDataCell(Sender: TObject; CONST Rect: TRect;
         Field: TField; State: TGridDrawState);
      PROCEDURE dtgCabDetRowChanged(Sender: TObject);
      PROCEDURE BitMst01Click(Sender: TObject);
      PROCEDURE BitMst02Click(Sender: TObject);
      PROCEDURE dtgDiasAtrasoDrawDataCell(Sender: TObject; CONST Rect: TRect;
         Field: TField; State: TGridDrawState);
      PROCEDURE dtgConcentracionDrawDataCell(Sender: TObject;
         CONST Rect: TRect; Field: TField; State: TGridDrawState);
      PROCEDURE ChkTotClick(Sender: TObject);
      PROCEDURE ChkVenClick(Sender: TObject);
      PROCEDURE PageControl1Change(Sender: TObject);
      PROCEDURE dtgCons01aDrawDataCell(Sender: TObject;
         CONST Rect: TRect; Field: TField; State: TGridDrawState);
      PROCEDURE dtgCons01bDrawDataCell(Sender: TObject; CONST Rect: TRect;
         Field: TField; State: TGridDrawState);
      PROCEDURE dtgCons02bDrawDataCell(Sender: TObject; CONST Rect: TRect;
         Field: TField; State: TGridDrawState);
      PROCEDURE BitExportaClick(Sender: TObject);
      PROCEDURE dtgCons02aDrawDataCell(Sender: TObject; CONST Rect: TRect;
         Field: TField; State: TGridDrawState);
      PROCEDURE dblCategoriaChange(Sender: TObject);
      PROCEDURE dblOriOtoChange(Sender: TObject);
      PROCEDURE dblDptoChange(Sender: TObject);
      PROCEDURE rdbSeleccionClick(Sender: TObject);
      PROCEDURE BitMostrarClick(Sender: TObject);
      PROCEDURE dblUsesChange(Sender: TObject);
      PROCEDURE PageControl2Change(Sender: TObject);
      PROCEDURE BitGraficoClick(Sender: TObject);
      PROCEDURE dblCatAntChange(Sender: TObject);
      PROCEDURE dtgCabRiesgosDblClick(Sender: TObject);
    procedure chkProcesoClick(Sender: TObject);
    procedure dtgCons01aDblClick(Sender: TObject);
// Inicio HPC_201501_RSG
    procedure rdgSalCarClick(Sender: TObject);
    procedure dtgDatosDblClick(Sender: TObject);
    procedure rdbSelPerClick(Sender: TObject);
// Fin HPC_201501_RSG
   Private
      { Private declarations }
      PROCEDURE SumaFooter(xGrid: STRING);
      PROCEDURE LimpiaGrid;
      PROCEDURE LimpiaGrid03;
      PROCEDURE LimpiaGrid04;
      PROCEDURE LimpiaGrid05;


   Public
      { Public declarations }
   END;

VAR
   fMatDesplaz: TfMatDesplaz;
   xMostrar: Boolean;
IMPLEMENTATION
// Inicio HPC_201501_RSG
USES RSGDM1, RSG114, RSG116, RSG117, RSG118, RSG119, RSG004, RSG129;
// Fin HPC_201501_RSG
{$R *.dfm}

PROCEDURE TfMatDesplaz.BitSalirClick(Sender: TObject);
BEGIN
   Close;
END;

PROCEDURE TfMatDesplaz.FormActivate(Sender: TObject);
VAR
   xSQL: STRING;
BEGIN
   LimpiaGrid05;
   dbsAnoIni.Value:=StrToInt(Copy(DM1.UltCartera,1,4));
   dbsMesIni.Value:=StrToInt(Copy(DM1.UltCartera,5,2));

   lblNomMes.Caption := DM1.DesMes(StrToInt(dbsMesIni.Text), 'N');
   LimpiaGrid;
   LimpiaGrid03;
   LimpiaGrid04;
   xMostrar := False;
   PageControl1.ActivePageIndex := 0;
   PageControl2.ActivePageIndex := 0;

   xSQL := 'SELECT RESUMEID,RESUMEDES FROM COB113 ORDER BY PROVISID';
   DM1.cdsDLabo.Close;
   DM1.cdsDLabo.DataRequest(xSQL);
   DM1.cdsDLabo.Open;

   xSQL := 'SELECT RESUMEID,RESUMEDES FROM COB113 ORDER BY PROVISID';
   DM1.cdsDSocioE.Close;
   DM1.cdsDSocioE.DataRequest(xSQL);
   DM1.cdsDSocioE.Open;

   xSQL := 'SELECT OFDESID,OFDESNOM FROM APO110 WHERE SUBSTR(OFDESID,1,1)<>''M'' ORDER BY OFDESID';
   DM1.cdsOfDes.Close;
   DM1.cdsOfDes.DataRequest(xSQL);
   DM1.cdsOfDes.Open;

   xSQL := 'SELECT DPTOID,DPTODES FROM APO158 ORDER BY DPTOID';
   DM1.cdsMovCre.Close;
   DM1.cdsMovCre.DataRequest(xSQL);
   DM1.cdsMovCre.Open;

END;

PROCEDURE TfMatDesplaz.SumaFooter(xGrid: STRING);
VAR
   xSaldos_Ft, xSaldos_Fv, xSaldos_Fp, xSaldos_Pv, xSaldos_Cb, xSaldos_Nc, xSaldos_At: Currency;
   xNumAnt, xNumAct: Integer;
   xNumCan, xNumNor, xNumPot, xNumDef, xNumDud, xNumPer, xNumTot: Integer;
   xNormal, xProPot, xDeficiente, xDudodo, xPerdida, xTotal: Currency;
BEGIN
   IF xGrid = '01' THEN
   BEGIN
      DM1.cdsConsulta.First;
      xSaldos_Ft := 0;
      xSaldos_At := 0;
      xNumAnt := 0;
      xNumAct := 0;
      WHILE NOT DM1.cdsConsulta.Eof DO
      BEGIN
         xSaldos_Ft := xSaldos_Ft + DM1.cdsConsulta.FieldByName('SALDOS_FT').AsCurrency;
         xSaldos_At := xSaldos_At + DM1.cdsConsulta.FieldByName('SALDOS_AT').AsCurrency;
         xNumAnt := xNumAnt + DM1.cdsConsulta.FieldByName('NUM_AT').AsInteger;
         xNumAct := xNumAct + DM1.cdsConsulta.FieldByName('NUM_FT').AsInteger;
         DM1.cdsConsulta.Next;
      END;
      dtgCabRiesgos.ColumnByName('CFCDES_A').FooterValue := 'Totales';
      dtgCabRiesgos.ColumnByName('SALDOS_FT').FooterValue := FloatToStrF(xSaldos_Ft, ffNumber, 15, 2);
      dtgCabRiesgos.ColumnByName('SALDOS_AT').FooterValue := FloatToStrF(xSaldos_At, ffNumber, 15, 2);
      dtgCabRiesgos.ColumnByName('NUM_AT').FooterValue := FloatToStrF(xNumAnt, ffNumber, 10, 0);
      dtgCabRiesgos.ColumnByName('NUM_FT').FooterValue := FloatToStrF(xNumAct, ffNumber, 10, 0);
      IF DM1.cdsConsulta.RecordCount > 0 THEN DM1.cdsConsulta.First;
   END;

   IF xGrid = '02' THEN
   BEGIN
      DM1.cdsSolicitud.First;
      xSaldos_Ft := 0;
      xNumAnt := 0;
      xNumAct := 0;
      WHILE NOT DM1.cdsSolicitud.Eof DO
      BEGIN
         xSaldos_Ft := xSaldos_Ft + DM1.cdsSolicitud.FieldByName('SALDOS_FT').AsCurrency;
         xNumAct := xNumAct + DM1.cdsSolicitud.FieldByName('NUM_FT').AsInteger;
         DM1.cdsSolicitud.Next;
      END;
      dtgCabDept.ColumnByName('CFCDES_F').FooterValue := 'Totales';
      dtgCabDept.ColumnByName('SALDOS_FT').FooterValue := FloatToStrF(xSaldos_Ft, ffNumber, 15, 2);
      dtgCabDept.ColumnByName('NUM_FT').FooterValue := FloatToStrF(xNumAct, ffNumber, 10, 0);
      IF DM1.cdsSolicitud.RecordCount > 0 THEN DM1.cdsSolicitud.First;
   END;
   IF xGrid = '03' THEN
   BEGIN
      DM1.cdsDpto.First;
      xSaldos_Ft := 0;
      xNumAct := 0;
      xSaldos_Fv := 0;
      xSaldos_Fp := 0;
      xSaldos_Pv := 0;
      xSaldos_Cb := 0;
      xSaldos_Nc := 0;
      WHILE NOT DM1.cdsDpto.Eof DO
      BEGIN
         xNumAct := xNumAct + DM1.cdsDpto.FieldByName('ASOCIADOS').AsInteger;
         xSaldos_Ft := xSaldos_Ft + DM1.cdsDpto.FieldByName('SALDOS_FT').AsCurrency;
         xSaldos_Fv := xSaldos_Fv + DM1.cdsDpto.FieldByName('SALDOS_FV').AsCurrency;
         xSaldos_Fp := xSaldos_Fp + DM1.cdsDpto.FieldByName('SALDOS_FP').AsCurrency;
         xSaldos_Pv := xSaldos_Pv + DM1.cdsDpto.FieldByName('SALDOS_PV').AsCurrency;
         xSaldos_Cb := xSaldos_Cb + DM1.cdsDpto.FieldByName('SALDOS_CB').AsCurrency;
         xSaldos_Nc := xSaldos_Nc + DM1.cdsDpto.FieldByName('SALDOS_NC').AsCurrency;
         DM1.cdsDpto.Next;
      END;
      dtgDiasAtraso.ColumnByName('DIASDESC').FooterValue := 'Totales';
      dtgDiasAtraso.ColumnByName('ASOCIADOS').FooterValue := FloatToStrF(xNumAct, ffNumber, 10, 0);
      dtgDiasAtraso.ColumnByName('SALDOS_FT').FooterValue := FloatToStrF(xSaldos_Ft, ffNumber, 15, 2);
      dtgDiasAtraso.ColumnByName('SALDOS_FV').FooterValue := FloatToStrF(xSaldos_Fv, ffNumber, 15, 2);
      dtgDiasAtraso.ColumnByName('SALDOS_FP').FooterValue := FloatToStrF(xSaldos_Fp, ffNumber, 15, 2);
      dtgDiasAtraso.ColumnByName('SALDOS_PV').FooterValue := FloatToStrF(xSaldos_Pv, ffNumber, 15, 2);
      dtgDiasAtraso.ColumnByName('SALDOS_CB').FooterValue := FloatToStrF(xSaldos_Cb, ffNumber, 15, 2);
      dtgDiasAtraso.ColumnByName('SALDOS_NC').FooterValue := FloatToStrF(xSaldos_Nc, ffNumber, 15, 2);
      IF DM1.cdsDpto.RecordCount > 0 THEN DM1.cdsDpto.First;
   END;

   IF xGrid = '04' THEN
   BEGIN
      DM1.cdsUPro.First;
      xNumNor := 0;
      xNumPot := 0;
      xNumDef := 0;
      xNumDud := 0;
      xNumPer := 0;
      xNumTot := 0;
      xNormal := 0;
      xProPot := 0;
      xDeficiente := 0;
      xDudodo := 0;
      xPerdida := 0;
      xTotal := 0;

      WHILE NOT DM1.cdsUPro.Eof DO
      BEGIN
         xNormal := xNormal + DM1.cdsUPro.FieldByName('NORMAL').AsCurrency;
         xNumNor := xNumNor + DM1.cdsUPro.FieldByName('NUMNOR').AsInteger;

         xProPot := xProPot + DM1.cdsUPro.FieldByName('PROPOT').AsCurrency;
         xNumPot := xNumPot + DM1.cdsUPro.FieldByName('NUMPOT').AsInteger;

         xDeficiente := xDeficiente + DM1.cdsUPro.FieldByName('DEFICIENTE').AsCurrency;
         xNumDef := xNumDef + DM1.cdsUPro.FieldByName('NUMDEF').AsInteger;

         xDudodo := xDudodo + DM1.cdsUPro.FieldByName('DUDOSO').AsCurrency;
         xNumDud := xNumDud + DM1.cdsUPro.FieldByName('NUMDUD').AsInteger;

         xPerdida := xPerdida + DM1.cdsUPro.FieldByName('PERDIDA').AsCurrency;
         xNumPer := xNumPer + DM1.cdsUPro.FieldByName('NUMPER').AsInteger;

         xTotal := xTotal + DM1.cdsUPro.FieldByName('TOTAL').AsCurrency;
         xNumTot := xNumTot + DM1.cdsUPro.FieldByName('NUMTOT').AsInteger;

         DM1.cdsUPro.Next;
      END;
      dtgConcentracion.ColumnByName('OFDESNOM').FooterValue := 'Totales';

      dtgConcentracion.ColumnByName('NORMAL').FooterValue := FloatToStrF(xNormal, ffNumber, 15, 2);
      dtgConcentracion.ColumnByName('NUMNOR').FooterValue := FloatToStrF(xNumNor, ffNumber, 10, 0);

      dtgConcentracion.ColumnByName('PROPOT').FooterValue := FloatToStrF(xProPot, ffNumber, 15, 2);
      dtgConcentracion.ColumnByName('NUMPOT').FooterValue := FloatToStrF(xNumPot, ffNumber, 10, 0);

      dtgConcentracion.ColumnByName('DEFICIENTE').FooterValue := FloatToStrF(xDeficiente, ffNumber, 15, 2);
      dtgConcentracion.ColumnByName('NUMDEF').FooterValue := FloatToStrF(xNumDef, ffNumber, 10, 0);

      dtgConcentracion.ColumnByName('DUDOSO').FooterValue := FloatToStrF(xDudodo, ffNumber, 15, 2);
      dtgConcentracion.ColumnByName('NUMDUD').FooterValue := FloatToStrF(xNumDud, ffNumber, 10, 0);

      dtgConcentracion.ColumnByName('PERDIDA').FooterValue := FloatToStrF(xPerdida, ffNumber, 15, 2);
      dtgConcentracion.ColumnByName('NUMPER').FooterValue := FloatToStrF(xNumPer, ffNumber, 10, 0);

      dtgConcentracion.ColumnByName('TOTAL').FooterValue := FloatToStrF(xTotal, ffNumber, 15, 2);
      dtgConcentracion.ColumnByName('NUMTOT').FooterValue := FloatToStrF(xNumTot, ffNumber, 10, 0);

      IF DM1.cdsUPro.RecordCount > 0 THEN DM1.cdsUPro.First;
   END;
   IF xGrid = '05' THEN
   BEGIN
      DM1.cdsReporte.First;
      xSaldos_Ft := 0;
      xNumAnt := 0;
      xNumAct := 0;
      WHILE NOT DM1.cdsReporte.Eof DO
      BEGIN
         xSaldos_Ft := xSaldos_Ft + DM1.cdsReporte.FieldByName('SALDOS_FT').AsCurrency;
         xNumAct := xNumAct + DM1.cdsReporte.FieldByName('NUM_FT').AsInteger;
         DM1.cdsReporte.Next;
      END;
      dtgCabDet.ColumnByName('DPTODES').FooterValue := 'Totales';
      dtgCabDet.ColumnByName('SALDOS_FT').FooterValue := FloatToStrF(xSaldos_Ft, ffNumber, 15, 2);
      dtgCabDet.ColumnByName('NUM_FT').FooterValue := FloatToStrF(xNumAct, ffNumber, 10, 0);
      IF DM1.cdsReporte.RecordCount > 0 THEN DM1.cdsReporte.First;

   END;

   IF xGrid = '06' THEN
   BEGIN

      DM1.cdsEjecuta.First;
      xSaldos_Ft := 0;
      xNumAnt := 0;
      xNumAct := 0;
      WHILE NOT DM1.cdsEjecuta.Eof DO
      BEGIN
         xSaldos_Ft := xSaldos_Ft + DM1.cdsEjecuta.FieldByName('SALDOS_FT').AsCurrency;
         xNumAct := xNumAct + DM1.cdsEjecuta.FieldByName('NUM_FT').AsInteger;
         DM1.cdsEjecuta.Next;
      END;
      dtgUsesDet.ColumnByName('USENOM').FooterValue := 'Totales';
      dtgUsesDet.ColumnByName('SALDOS_FT').FooterValue := FloatToStrF(xSaldos_Ft, ffNumber, 15, 2);
      dtgUsesDet.ColumnByName('NUM_FT').FooterValue := FloatToStrF(xNumAct, ffNumber, 10, 0);
      IF DM1.cdsEjecuta.RecordCount > 0 THEN DM1.cdsEjecuta.First;
   END;
   IF xGrid = '07' THEN
   BEGIN
      DM1.cdsPadre.First;
      xNumCan := 0;
      xNumNor := 0;
      xNumPot := 0;
      xNumDef := 0;
      xNumDud := 0;
      xNumPer := 0;
      xNumTot := 0;
      WHILE NOT DM1.cdsPadre.Eof DO
      BEGIN
         xNumCan := xNumCan + DM1.cdsPadre.FieldByName('CANCELADO').AsInteger;
         xNumNor := xNumNor + DM1.cdsPadre.FieldByName('NORMAL').AsInteger;
         xNumPot := xNumPot + DM1.cdsPadre.FieldByName('PROPOT').AsInteger;
         xNumDef := xNumDef + DM1.cdsPadre.FieldByName('DEFICIENTE').AsInteger;
         xNumDud := xNumDud + DM1.cdsPadre.FieldByName('DUDOSO').AsInteger;
         xNumPer := xNumPer + DM1.cdsPadre.FieldByName('PERDIDA').AsInteger;
         xNumTot := xNumTot + DM1.cdsPadre.FieldByName('TOTAL').AsInteger;
         DM1.cdsPadre.Next;
      END;
      dtgCons01a.ColumnByName('CFCDES_A').FooterValue := 'Totales';
      dtgCons01a.ColumnByName('CANCELADO').FooterValue := FloatToStrF(xNumCan, ffNumber, 15, 0);
      dtgCons01a.ColumnByName('NORMAL').FooterValue := FloatToStrF(xNumNor, ffNumber, 15, 0);
      dtgCons01a.ColumnByName('PROPOT').FooterValue := FloatToStrF(xNumPot, ffNumber, 15, 0);
      dtgCons01a.ColumnByName('DEFICIENTE').FooterValue := FloatToStrF(xNumDef, ffNumber, 15, 0);
      dtgCons01a.ColumnByName('DUDOSO').FooterValue := FloatToStrF(xNumDud, ffNumber, 15, 0);
      dtgCons01a.ColumnByName('PERDIDA').FooterValue := FloatToStrF(xNumPer, ffNumber, 15, 0);
      dtgCons01a.ColumnByName('TOTAL').FooterValue := FloatToStrF(xNumTot, ffNumber, 15, 0);
      IF DM1.cdsPadre.RecordCount > 0 THEN DM1.cdsPadre.First;
   END;

   IF xGrid = '09' THEN
   BEGIN
      DM1.cdsHijo.First;
      xNumCan := 0;
      xNumNor := 0;
      xNumPot := 0;
      xNumDef := 0;
      xNumDud := 0;
      xNumPer := 0;
      xNumTot := 0;
      WHILE NOT DM1.cdsHijo.Eof DO
      BEGIN
         xNumCan := xNumCan + DM1.cdsHijo.FieldByName('CANCELADO').AsInteger;
         xNumNor := xNumNor + DM1.cdsHijo.FieldByName('NORMAL').AsInteger;
         xNumPot := xNumPot + DM1.cdsHijo.FieldByName('PROPOT').AsInteger;
         xNumDef := xNumDef + DM1.cdsHijo.FieldByName('DEFICIENTE').AsInteger;
         xNumDud := xNumDud + DM1.cdsHijo.FieldByName('DUDOSO').AsInteger;
         xNumPer := xNumPer + DM1.cdsHijo.FieldByName('PERDIDA').AsInteger;
         xNumTot := xNumTot + DM1.cdsHijo.FieldByName('TOTAL').AsInteger;
         DM1.cdsHijo.Next;
      END;
      dtgCons02a.ColumnByName('CFCDES_A').FooterValue := 'Totales';
      dtgCons02a.ColumnByName('CANCELADO').FooterValue := FloatToStrF(xNumCan, ffNumber, 15, 0);
      dtgCons02a.ColumnByName('NORMAL').FooterValue := FloatToStrF(xNumNor, ffNumber, 15, 0);
      dtgCons02a.ColumnByName('PROPOT').FooterValue := FloatToStrF(xNumPot, ffNumber, 15, 0);
      dtgCons02a.ColumnByName('DEFICIENTE').FooterValue := FloatToStrF(xNumDef, ffNumber, 15, 0);
      dtgCons02a.ColumnByName('DUDOSO').FooterValue := FloatToStrF(xNumDud, ffNumber, 15, 0);
      dtgCons02a.ColumnByName('PERDIDA').FooterValue := FloatToStrF(xNumPer, ffNumber, 15, 0);
      dtgCons02a.ColumnByName('TOTAL').FooterValue := FloatToStrF(xNumTot, ffNumber, 15, 0);
      IF DM1.cdsHijo.RecordCount > 0 THEN DM1.cdsHijo.First;
   END;

END;

PROCEDURE TfMatDesplaz.dtgCabRiesgosDrawDataCell(Sender: TObject;
   CONST Rect: TRect; Field: TField; State: TGridDrawState);
BEGIN
   IF ((Field.FieldName = 'SALDOS_AT') OR (Field.FieldName = 'SALDOS_FT') OR (Field.FieldName = 'NUM_AT') OR (Field.FieldName = 'NUM_FT')) THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clNavy;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_A')
      AND (DM1.cdsConsulta.FieldByName('CFC_A').AsString = '0')
      AND (DM1.cdsConsulta.FieldByName('CFC_F').AsString = '0') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clGreen;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_A')
      AND (DM1.cdsConsulta.FieldByName('CFC_A').AsString = 'A')
      AND (DM1.cdsConsulta.FieldByName('CFC_F').AsString = '0') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clTeal;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_A')
      AND (DM1.cdsConsulta.FieldByName('CFC_A').AsString = 'B')
      AND (DM1.cdsConsulta.FieldByName('CFC_F').AsString = '0') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clOlive;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_A')
      AND (DM1.cdsConsulta.FieldByName('CFC_A').AsString = 'C')
      AND (DM1.cdsConsulta.FieldByName('CFC_F').AsString = '0') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clPurple;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_A')
      AND (DM1.cdsConsulta.FieldByName('CFC_A').AsString = 'D')
      AND (DM1.cdsConsulta.FieldByName('CFC_F').AsString = '0') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clRed;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_F') AND (DM1.cdsConsulta.FieldByName('CFC_F').AsString = '0') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clGreen;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_F') AND (DM1.cdsConsulta.FieldByName('CFC_F').AsString = 'A') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clTeal;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_F') AND (DM1.cdsConsulta.FieldByName('CFC_F').AsString = 'B') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clOlive;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_F') AND (DM1.cdsConsulta.FieldByName('CFC_F').AsString = 'C') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clPurple;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_F') AND (DM1.cdsConsulta.FieldByName('CFC_F').AsString = 'D') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clRed;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_A') AND (DM1.cdsConsulta.FieldByName('CFC_A').AsString = 'Y') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clBlue;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'CFCDES_A') AND (DM1.cdsConsulta.FieldByName('CFC_A').AsString = 'R') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clNavy;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_A') AND (DM1.cdsConsulta.FieldByName('CFC_A').AsString = 'X') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clBlue;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_F') AND (DM1.cdsConsulta.FieldByName('CFC_F').AsString = 'X') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clBlue;
      dtgCabRiesgos.DefaultDrawDataCell(rect, Field, State);
   END;
END;

PROCEDURE TfMatDesplaz.dtgCabRiesgosDrawFooterCell(Sender: TObject;
   Canvas: TCanvas; FooterCellRect: TRect; Field: TField;
   FooterText: STRING; VAR DefaultDrawing: Boolean);
BEGIN
   IF (Field.FieldName = 'CREMTOGIR') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clRed;
   END;
END;

PROCEDURE TfMatDesplaz.dtgCabRiesgosDrawTitleCell(Sender: TObject;
   Canvas: TCanvas; Field: TField; Rect: TRect;
   VAR DefaultDrawing: Boolean);
BEGIN
   IF (Field.FieldName = 'CREMTOGIR') THEN
   BEGIN
      dtgCabRiesgos.Canvas.Font.Color := clRed;
   END;
END;

PROCEDURE TfMatDesplaz.LimpiaGrid;
VAR
   xSQL: STRING;
BEGIN

   Screen.Cursor := crHourGlass;

   xSQL := 'SELECT CFC_A,CFCDES_A,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
      'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(CANCELADO)+SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL FROM (SELECT CFC_A,CFCDES_A, CASE WHEN CFC_F IS NULL THEN 1 ELSE 0 END CANCELADO, ' +
      'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NORMAL,CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END PROPOT,  ' +
      'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUDOSO, ' +
      'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE 1=2 AND PERACT=' + QuotedStr('123') + ' AND CFC_A IS NOT NULL) ' +
      'GROUP BY CFC_A,CFCDES_A';
   DM1.cdsPadre.Close;
   DM1.cdsPadre.DataRequest(xSQL);
   DM1.cdsPadre.Open;
   TNumericField(DM1.cdsPadre.FieldByName('CANCELADO')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPadre.FieldByName('NORMAL')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPadre.FieldByName('PROPOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPadre.FieldByName('DEFICIENTE')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPadre.FieldByName('DUDOSO')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPadre.FieldByName('PERDIDA')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPadre.FieldByName('TOTAL')).DisplayFormat := '###,##0';
   SumaFooter('07');

   xSQL := 'SELECT CFC_A,CFCDES_A,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
      'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(CANCELADO)+SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL FROM (SELECT CFC_A,CFCDES_A, CASE WHEN CFC_F IS NULL THEN 1 ELSE 0 END CANCELADO, ' +
      'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NORMAL,CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END PROPOT,  ' +
      'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUDOSO, ' +
      'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE 1=2 AND PERACT=' + QuotedStr('123') + ' AND CFC_A IS NOT NULL) ' +
      'GROUP BY CFC_A,CFCDES_A';
   DM1.cdsPais.Close;
   DM1.cdsPais.DataRequest(xSQL);
   DM1.cdsPais.Open;
   TNumericField(DM1.cdsPais.FieldByName('CANCELADO')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPais.FieldByName('NORMAL')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPais.FieldByName('PROPOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPais.FieldByName('DEFICIENTE')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPais.FieldByName('DUDOSO')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPais.FieldByName('PERDIDA')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPais.FieldByName('TOTAL')).DisplayFormat := '###,##0';
   SumaFooter('08');

   xSQL := 'SELECT  CFCDES_A,CFC_A,SUM(SALDOS_AT) SALDOS_AT,SUM(0) NUM_AT,CFC_F,CFCDES_F,SUM(SALDOS_FT) SALDOS_FT,SUM(0) NUM_FT FROM RIE_EST_GEN WHERE 1=2 AND PERACT=''123'' GROUP BY  CFCDES_A,CFC_A,CFC_F,CFCDES_F ';
   DM1.cdsConsulta.Close;
   DM1.cdsConsulta.DataRequest(xSQL);
   DM1.cdsConsulta.Open;

   TNumericField(DM1.cdsConsulta.FieldByName('SALDOS_AT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsConsulta.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsConsulta.FieldByName('NUM_AT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsConsulta.FieldByName('NUM_FT')).DisplayFormat := '###,##0';
   SumaFooter('01');

   xSQL := 'SELECT CFC_F,CFCDES_F,SUM(SALDOS_FT) SALDOS_FT,SUM(0) NUM_FT FROM RIE_EST_GEN WHERE 1=2 AND PERACT=''123'' GROUP BY  CFC_F,CFCDES_F';
   DM1.cdsSolicitud.Close;
   DM1.cdsSolicitud.DataRequest(xSQL);
   DM1.cdsSolicitud.Open;

   TNumericField(DM1.cdsSolicitud.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsSolicitud.FieldByName('NUM_FT')).DisplayFormat := '###,##0';
   SumaFooter('02');

   xSQL := 'SELECT CFC_F,CFCDES_F,DIASDESC,SUM(ASOCIADOS) ASOCIADOS,SUM(SALDOS_FT) SALDOS_FT, ' +
      'SUM(SALDOS_FV) SALDOS_FV,SUM(SALDOS_FP) SALDOS_FP, SUM(SALDOS_PV) SALDOS_PV, ' +
      'SUM(SALDOS_CB) SALDOS_CB,SUM(SALDOS_NC) SALDOS_NC FROM (SELECT CASE WHEN DIASTRANS ' +
      'BETWEEN 0 AND 8 THEN ''ENTRE 0 Y 8 DIAS'' WHEN DIASTRANS BETWEEN 9 AND 31 THEN ''ENTRE 9 Y 31 DIAS''   WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE 32 Y 62 DIAS'' ' +
      'WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE 63 Y 93_DIAS'' WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE 94 Y 123 DIAS'' WHEN DIASTRANS > 123 ' +
      'THEN ''MAS DE 123 DIAS''  END DIASDESC, A.DPTOID,B.DPTODES,A.UPROID,A.UPAGOID,A.USEID, ' +
      'C.USENOM,CFC_F, CFCDES_F,DIASTRANS,1 ASOCIADOS,SALDOS_FT,SALDOS_FV,SALDOS_FP,SALDOS_PV,SALDOS_CB,SALDOS_NC ' +
      'FROM RIE_EST_GEN A,APO158 B,APO101 C WHERE 1=2 AND PERACT=''1234'' AND CFC_F IS NOT NULL AND A.DPTOID=B.DPTOID(+) ' +
      'AND A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND A.USEID=C.USEID(+) )  ' +
      'GROUP BY CFC_F,CFCDES_F,DIASDESC ';
   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xSQL);
   DM1.cdsDpto.Open;
   TNumericField(DM1.cdsDpto.FieldByName('ASOCIADOS')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsDpto.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsDpto.FieldByName('SALDOS_FV')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsDpto.FieldByName('SALDOS_FP')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsDpto.FieldByName('SALDOS_PV')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsDpto.FieldByName('SALDOS_CB')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsDpto.FieldByName('SALDOS_NC')).DisplayFormat := '###,###,###.#0';
   SumaFooter('03');

   xSQL := 'SELECT A.DPTOID,DPTODES,SUM(NUMNOR) NUMNOR,SUM(NORMAL) NORMAL, ' +
      'SUM(NUMPOT) NUMPOT,SUM(PROPOT) PROPOT,SUM(NUMDEF) NUMDEF,SUM(DEFICIENTE) DEFICIENTE, ' +
      'SUM(NUMDUD) NUMDUD,SUM(DUDOSO) DUDOSO, SUM(NUMPER) NUMPER,SUM(PERDIDA) PERDIDA, ' +
      'COUNT(*) NUMTOT,SUM(TOTAL) TOTAL FROM (SELECT CFC_F,CFCDES_F,DPTOID, CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NORMAL, ' +
      'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR, CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END PROPOT, ' +
      'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT,CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEFICIENTE, ' +
      'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF,CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUDOSO, ' +
      'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD,CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PERDIDA, ' +
      'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER ,SALDOS_FT TOTAL FROM RIE_EST_GEN WHERE PERACT=''123'') A,APO158 B ' +
      'WHERE A.DPTOID=B.DPTOID(+) GROUP BY A.DPTOID,DPTODES ';

   DM1.cdsUPro.Close;
   DM1.cdsUPro.DataRequest(xSQL);
   DM1.cdsUPro.Open;
   TNumericField(DM1.cdsUPro.FieldByName('NUMNOR')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('NORMAL')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMPOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('PROPOT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMDEF')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('DEFICIENTE')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMDUD')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('DUDOSO')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMPER')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('PERDIDA')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMTOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('TOTAL')).DisplayFormat := '###,###,###.#0';
   SumaFooter('04');

   Screen.Cursor := crDefault;

END;

PROCEDURE TfMatDesplaz.BitImpOfiClick(Sender: TObject);
BEGIN

   IF PageControl1.TabIndex = 0 THEN ShowMessage('General');
   IF PageControl1.TabIndex = 1 THEN ShowMessage('Departamento / Ugel');
   IF PageControl1.TabIndex = 2 THEN ShowMessage('Días de Atraso');

   IF DM1.cdsConsulta.RecordCount > 0 THEN
   BEGIN
      //       xTitulos01.Caption:='OPERACIONES REALIZADAS DEL '+dtpFecha.Text+' HASTA '+dtpHasta.Text;
      //      RepOfides.Print;
      //     RepOfides.Cancel;
   END;
END;

// Inicio HPC_201501_RSG
PROCEDURE TfMatDesplaz.BitProcesarClick(Sender: TObject);
VAR
   xSQL: STRING;
   xWhere,xTitulo,xSalCar:String;
BEGIN

    Case rdbTipCar.ItemIndex Of
         0:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND TIPASO=''DO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND TIPASO=''CE'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND TIPASO=''CO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         1:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND TIPCAR=''1''  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND TIPCAR=''1'' AND TIPASO=''DO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND TIPCAR=''1'' AND TIPASO=''CE''  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND TIPCAR=''1'' AND TIPASO=''CO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         2:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND TIPCAR=''2'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND TIPCAR=''2'' AND TIPASO=''DO'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND TIPCAR=''2'' AND TIPASO=''CE'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND TIPCAR=''2'' AND TIPASO=''CO'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: CONTRATADOS';
                      End;
               End;

           End;
    End;

   Screen.Cursor := crHourGlass;

   Case cmbConsulta.ItemIndex Of
       -1:Begin
            Screen.Cursor := crDefault;
            MessageDlg('DEBE SELECIONAR UN PERIODO DE EVALUACION ANTERIOR!!', mtError, [mbOk], 0);
            Exit;
          End;
        0:Begin
           xSQL := 'SELECT MAX(ORDEN) ORDEN,CFC_A,CFCDES_A,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                   'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(CANCELADO)+SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL '+
                   'FROM (SELECT  CASE WHEN CFC_A=''0'' THEN 1 WHEN CFC_A=''A'' THEN 2 WHEN CFC_A=''B'' THEN 3  WHEN CFC_A=''C'' THEN 4  '+
                   'WHEN CFC_A=''D'' THEN 5 END ORDEN, CFC_A,CFCDES_A, CASE WHEN CFC_F IS NULL THEN 1 ELSE 0 END CANCELADO, ' +
                   'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NORMAL,CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END PROPOT,  ' +
                   'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUDOSO, ' +
                   'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_A IS NOT NULL) ' +
                   'GROUP BY CFC_A,CFCDES_A ORDER BY ORDEN';


          End;
        1:Begin

           xSQL := 'SELECT MAX(ORDEN) ORDEN,CFC_T CFC_A,CFCDES_T CFCDES_A,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                   'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(CANCELADO)+SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL '+
                   'FROM (SELECT  CASE WHEN CFC_T=''0'' THEN 1 WHEN CFC_T=''A'' THEN 2 WHEN CFC_T=''B'' THEN 3  WHEN CFC_T=''C'' THEN 4  '+
                   'WHEN CFC_T=''D'' THEN 5 END ORDEN, CFC_T,CFCDES_T, CASE WHEN CFC_F IS NULL THEN 1 ELSE 0 END CANCELADO, ' +
                   'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NORMAL,CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END PROPOT,  ' +
                   'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUDOSO, ' +
                   'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_T IS NOT NULL) ' +
                   'GROUP BY CFC_T,CFCDES_T ORDER BY ORDEN';


          End;
        2:Begin


           xSQL := 'SELECT MAX(ORDEN) ORDEN,CFC_S CFC_A,CFCDES_S CFCDES_A,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                   'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(CANCELADO)+SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL '+
                   'FROM (SELECT  CASE WHEN CFC_S=''0'' THEN 1 WHEN CFC_S=''A'' THEN 2 WHEN CFC_S=''B'' THEN 3  WHEN CFC_S=''C'' THEN 4  '+
                   'WHEN CFC_S=''D'' THEN 5 END ORDEN, CFC_S,CFCDES_S, CASE WHEN CFC_F IS NULL THEN 1 ELSE 0 END CANCELADO, ' +
                   'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NORMAL,CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END PROPOT,  ' +
                   'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUDOSO, ' +
                   'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_S IS NOT NULL) ' +
                   'GROUP BY CFC_S,CFCDES_S ORDER BY ORDEN';


          End;
        3:Begin

           xSQL := 'SELECT MAX(ORDEN) ORDEN,CFC_Y CFC_A,CFCDES_Y CFCDES_A,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                   'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(CANCELADO)+SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL '+
                   'FROM (SELECT  CASE WHEN CFC_Y=''0'' THEN 1 WHEN CFC_Y=''A'' THEN 2 WHEN CFC_Y=''B'' THEN 3  WHEN CFC_Y=''C'' THEN 4  '+
                   'WHEN CFC_Y=''D'' THEN 5 END ORDEN, CFC_Y,CFCDES_Y, CASE WHEN CFC_F IS NULL THEN 1 ELSE 0 END CANCELADO, ' +
                   'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NORMAL,CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END PROPOT,  ' +
                   'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUDOSO, ' +
                   'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_Y IS NOT NULL) ' +
                   'GROUP BY CFC_Y,CFCDES_Y ORDER BY ORDEN';



          End;

   End;
   DM1.cdsPadre.Close;
   DM1.cdsPadre.DataRequest(xSQL);
   DM1.cdsPadre.Open;
   TNumericField(DM1.cdsPadre.FieldByName('CANCELADO')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPadre.FieldByName('NORMAL')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPadre.FieldByName('PROPOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPadre.FieldByName('DEFICIENTE')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPadre.FieldByName('DUDOSO')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPadre.FieldByName('PERDIDA')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsPadre.FieldByName('TOTAL')).DisplayFormat := '###,##0';
   SumaFooter('07');

   Case cmbConsulta.ItemIndex Of
       -1:Begin
            Screen.Cursor := crDefault;
            MessageDlg('DEBE SELECIONAR UN PERIODO DE EVALUACION ANTERIOR!!', mtError, [mbOk], 0);
            Exit;
          End;
        0:Begin


             xSQL := 'SELECT CFC_A,CFCDES_A,ROUND((CANCELADO/TOTAL)*100,2) CANCELADO, ' +
                'ROUND((NORMAL/TOTAL)*100,2) NORMAL, ROUND((PROPOT/TOTAL)*100,2) PROPOT, ' +
                'ROUND((DEFICIENTE/TOTAL)*100,2) DEFICIENTE, ROUND((DUDOSO/TOTAL)*100,2) DUDOSO, ' +
                'ROUND((PERDIDA/TOTAL)*100,2) PERDIDA,ROUND((TOTAL/TOTAL)*100,2) TOTAL ' +
                'FROM (SELECT MAX(ORDEN) ORDEN,CFC_A,CFCDES_A, SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA, SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL ' +
                'FROM (SELECT CASE WHEN CFC_A=''0'' THEN 1 WHEN CFC_A=''A'' THEN 2 WHEN CFC_A=''B'' THEN 3 WHEN CFC_A=''C'' THEN 4  WHEN CFC_A=''D'' THEN 5 END ORDEN, CFC_A,CFCDES_A,CASE WHEN CFC_F IS NULL THEN 1 ELSE 0 END CANCELADO,CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NORMAL, ' +
                'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END PROPOT,CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEFICIENTE, ' +
                'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUDOSO, CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_A IS NOT NULL) ' +
             'GROUP BY CFC_A,CFCDES_A) ORDER BY ORDEN';



          End;
        1:Begin


             xSQL := 'SELECT CFC_T CFC_A, CFCDES_T CFCDES_A,ROUND((CANCELADO/TOTAL)*100,2) CANCELADO, ' +
                     'ROUND((NORMAL/TOTAL)*100,2) NORMAL, ROUND((PROPOT/TOTAL)*100,2) PROPOT, ' +
                     'ROUND((DEFICIENTE/TOTAL)*100,2) DEFICIENTE, ROUND((DUDOSO/TOTAL)*100,2) DUDOSO, ' +
                     'ROUND((PERDIDA/TOTAL)*100,2) PERDIDA,ROUND((TOTAL/TOTAL)*100,2) TOTAL ' +
                     'FROM (SELECT MAX(ORDEN) ORDEN,CFC_T,CFCDES_T, SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                     'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA, SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL ' +
                     'FROM (SELECT CASE WHEN CFC_T=''0'' THEN 1 WHEN CFC_T=''A'' THEN 2 WHEN CFC_T=''B'' THEN 3 WHEN CFC_T=''C'' THEN 4  WHEN CFC_T=''D'' THEN 5 END ORDEN, CFC_T,CFCDES_T,CASE WHEN CFC_F IS NULL THEN 1 ELSE 0 END CANCELADO,CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NORMAL, ' +
                     'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END PROPOT,CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEFICIENTE, ' +
                     'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUDOSO, CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_T IS NOT NULL) ' +
                     'GROUP BY CFC_T,CFCDES_T) ORDER BY ORDEN';



          End;
        2:Begin

             xSQL := 'SELECT CFC_S CFC_A, CFCDES_S CFCDES_A,ROUND((CANCELADO/TOTAL)*100,2) CANCELADO, ' +
                     'ROUND((NORMAL/TOTAL)*100,2) NORMAL, ROUND((PROPOT/TOTAL)*100,2) PROPOT, ' +
                     'ROUND((DEFICIENTE/TOTAL)*100,2) DEFICIENTE, ROUND((DUDOSO/TOTAL)*100,2) DUDOSO, ' +
                     'ROUND((PERDIDA/TOTAL)*100,2) PERDIDA,ROUND((TOTAL/TOTAL)*100,2) TOTAL ' +
                     'FROM (SELECT MAX(ORDEN) ORDEN,CFC_S,CFCDES_S, SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                     'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA, SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL ' +
                     'FROM (SELECT CASE WHEN CFC_S=''0'' THEN 1 WHEN CFC_S=''A'' THEN 2 WHEN CFC_S=''B'' THEN 3 WHEN CFC_S=''C'' THEN 4  WHEN CFC_S=''D'' THEN 5 END ORDEN, CFC_S,CFCDES_S,CASE WHEN CFC_F IS NULL THEN 1 ELSE 0 END CANCELADO,CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NORMAL, ' +
                     'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END PROPOT,CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEFICIENTE, ' +
                     'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUDOSO, CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_S IS NOT NULL) ' +
                     'GROUP BY CFC_S,CFCDES_S) ORDER BY ORDEN';

          End;
        3:Begin

             xSQL := 'SELECT CFC_Y CFC_A, CFCDES_Y CFCDES_A,ROUND((CANCELADO/TOTAL)*100,2) CANCELADO, ' +
                     'ROUND((NORMAL/TOTAL)*100,2) NORMAL, ROUND((PROPOT/TOTAL)*100,2) PROPOT, ' +
                     'ROUND((DEFICIENTE/TOTAL)*100,2) DEFICIENTE, ROUND((DUDOSO/TOTAL)*100,2) DUDOSO, ' +
                     'ROUND((PERDIDA/TOTAL)*100,2) PERDIDA,ROUND((TOTAL/TOTAL)*100,2) TOTAL ' +
                     'FROM (SELECT MAX(ORDEN) ORDEN,CFC_Y,CFCDES_Y, SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                     'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA, SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL ' +
                     'FROM (SELECT CASE WHEN CFC_Y=''0'' THEN 1 WHEN CFC_Y=''A'' THEN 2 WHEN CFC_Y=''B'' THEN 3 WHEN CFC_Y=''C'' THEN 4  WHEN CFC_Y=''D'' THEN 5 END ORDEN, CFC_Y,CFCDES_Y,CASE WHEN CFC_F IS NULL THEN 1 ELSE 0 END CANCELADO,CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NORMAL, ' +
                     'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END PROPOT,CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEFICIENTE, ' +
                     'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUDOSO, CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_Y IS NOT NULL) ' +
                     'GROUP BY CFC_Y,CFCDES_Y) ORDER BY ORDEN';

          End;

   End;
   DM1.cdsPais.Close;
   DM1.cdsPais.DataRequest(xSQL);
   DM1.cdsPais.Open;
   TNumericField(DM1.cdsPais.FieldByName('CANCELADO')).DisplayFormat := '###,##0.#0';
   TNumericField(DM1.cdsPais.FieldByName('NORMAL')).DisplayFormat := '###,##0.#0';
   TNumericField(DM1.cdsPais.FieldByName('PROPOT')).DisplayFormat := '###,##0.#0';
   TNumericField(DM1.cdsPais.FieldByName('DEFICIENTE')).DisplayFormat := '###,##0.#0';
   TNumericField(DM1.cdsPais.FieldByName('DUDOSO')).DisplayFormat := '###,##0.#0';
   TNumericField(DM1.cdsPais.FieldByName('PERDIDA')).DisplayFormat := '###,##0.#0';
   TNumericField(DM1.cdsPais.FieldByName('TOTAL')).DisplayFormat := '###,##0.#0';
   SumaFooter('08');

   Case rdgSalCar.ItemIndex Of
        0:xSalCar:='AT';
        1:xSalCar:='FT';
   End;
   Case cmbConsulta.ItemIndex Of
       -1:Begin
            Screen.Cursor := crDefault;
            MessageDlg('DEBE SELECIONAR UN PERIODO DE EVALUACION ANTERIOR!!', mtError, [mbOk], 0);
            Exit;
          End;
        0:Begin

              xSQL := 'SELECT MAX(ORDEN) ORDEN,CFC_A,CFCDES_A,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                     'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(CANCELADO)+SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL ' +
                     'FROM (SELECT CASE WHEN CFC_A=''0'' THEN 1 WHEN CFC_A=''A'' THEN 2 WHEN CFC_A=''B'' THEN 3  WHEN CFC_A=''C'' THEN 4  '+
                     'WHEN CFC_A=''D'' THEN 5 END ORDEN,CFC_A,CFCDES_A,CASE WHEN CFC_F IS NULL THEN SALDOS_'+xSalCar+' ELSE 0 END CANCELADO,CASE WHEN CFC_F=''0'' THEN SALDOS_'+xSalCar+' ELSE 0 END NORMAL, ' +
                     'CASE WHEN CFC_F=''A'' THEN SALDOS_'+xSalCar+' ELSE 0 END PROPOT,CASE WHEN CFC_F=''B'' THEN SALDOS_'+xSalCar+' ELSE 0 END DEFICIENTE, ' +
                     'CASE WHEN CFC_F=''C'' THEN SALDOS_'+xSalCar+' ELSE 0 END DUDOSO,CASE WHEN CFC_F=''D'' THEN SALDOS_'+xSalCar+' ELSE 0 END PERDIDA FROM RIE_EST_GEN ' +
                     'WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_A IS NOT NULL ) GROUP BY CFC_A,CFCDES_A ORDER BY ORDEN';

          End;
        1:Begin

             xSQL := 'SELECT MAX(ORDEN) ORDEN,CFC_T CFC_A,CFCDES_T CFCDES_A,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                     'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(CANCELADO)+SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL ' +
                     'FROM (SELECT CASE WHEN CFC_T=''0'' THEN 1 WHEN CFC_T=''A'' THEN 2 WHEN CFC_T=''B'' THEN 3  WHEN CFC_T=''C'' THEN 4  '+
                     'WHEN CFC_T=''D'' THEN 5 END ORDEN,CFC_T,CFCDES_T,CASE WHEN CFC_F IS NULL THEN SALDOS_TT ELSE 0 END CANCELADO,CASE WHEN CFC_F=''0'' THEN SALDOS_TT ELSE 0 END NORMAL, ' +
                     'CASE WHEN CFC_F=''A'' THEN SALDOS_TT ELSE 0 END PROPOT,CASE WHEN CFC_F=''B'' THEN SALDOS_TT ELSE 0 END DEFICIENTE, ' +
                     'CASE WHEN CFC_F=''C'' THEN SALDOS_TT ELSE 0 END DUDOSO,CASE WHEN CFC_F=''D'' THEN SALDOS_TT ELSE 0 END PERDIDA FROM RIE_EST_GEN ' +
                     'WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_T IS NOT NULL ) GROUP BY CFC_T,CFCDES_T ORDER BY ORDEN';



          End;
        2:Begin

             xSQL := 'SELECT MAX(ORDEN) ORDEN,CFC_S CFC_A,CFCDES_S CFCDES_A,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                     'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(CANCELADO)+SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL ' +
                     'FROM (SELECT CASE WHEN CFC_S=''0'' THEN 1 WHEN CFC_S=''A'' THEN 2 WHEN CFC_S=''B'' THEN 3  WHEN CFC_S=''C'' THEN 4  '+
                     'WHEN CFC_S=''D'' THEN 5 END ORDEN,CFC_S,CFCDES_S,CASE WHEN CFC_F IS NULL THEN SALDOS_ST ELSE 0 END CANCELADO,CASE WHEN CFC_F=''0'' THEN SALDOS_ST ELSE 0 END NORMAL, ' +
                     'CASE WHEN CFC_F=''A'' THEN SALDOS_ST ELSE 0 END PROPOT,CASE WHEN CFC_F=''B'' THEN SALDOS_ST ELSE 0 END DEFICIENTE, ' +
                     'CASE WHEN CFC_F=''C'' THEN SALDOS_ST ELSE 0 END DUDOSO,CASE WHEN CFC_F=''D'' THEN SALDOS_ST ELSE 0 END PERDIDA FROM RIE_EST_GEN ' +
                     'WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_S IS NOT NULL ) GROUP BY CFC_S,CFCDES_S ORDER BY ORDEN';

          End;
        3:Begin

             xSQL := 'SELECT MAX(ORDEN) ORDEN,CFC_Y CFC_A,CFCDES_Y CFCDES_A,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                     'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(CANCELADO)+SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL ' +
                     'FROM (SELECT CASE WHEN CFC_Y=''0'' THEN 1 WHEN CFC_Y=''A'' THEN 2 WHEN CFC_Y=''B'' THEN 3  WHEN CFC_Y=''C'' THEN 4  '+
                     'WHEN CFC_Y=''D'' THEN 5 END ORDEN,CFC_Y,CFCDES_Y,CASE WHEN CFC_F IS NULL THEN SALDOS_YT ELSE 0 END CANCELADO,CASE WHEN CFC_F=''0'' THEN SALDOS_YT ELSE 0 END NORMAL, ' +
                     'CASE WHEN CFC_F=''A'' THEN SALDOS_YT ELSE 0 END PROPOT,CASE WHEN CFC_F=''B'' THEN SALDOS_YT ELSE 0 END DEFICIENTE, ' +
                     'CASE WHEN CFC_F=''C'' THEN SALDOS_YT ELSE 0 END DUDOSO,CASE WHEN CFC_F=''D'' THEN SALDOS_YT ELSE 0 END PERDIDA FROM RIE_EST_GEN ' +
                     'WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_Y IS NOT NULL ) GROUP BY CFC_Y,CFCDES_Y ORDER BY ORDEN';



          End;

   End;


   DM1.cdsHijo.Close;
   DM1.cdsHijo.DataRequest(xSQL);
   DM1.cdsHijo.Open;
   TNumericField(DM1.cdsHijo.FieldByName('CANCELADO')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsHijo.FieldByName('NORMAL')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsHijo.FieldByName('PROPOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsHijo.FieldByName('DEFICIENTE')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsHijo.FieldByName('DUDOSO')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsHijo.FieldByName('PERDIDA')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsHijo.FieldByName('TOTAL')).DisplayFormat := '###,##0';
   SumaFooter('09');

   Case cmbConsulta.ItemIndex Of
       -1:Begin
            Screen.Cursor := crDefault;
            MessageDlg('DEBE SELECIONAR UN PERIODO DE EVALUACION ANTERIOR!!', mtError, [mbOk], 0);
            Exit;
          End;
        0:Begin

             xSQL := 'SELECT CFC_A,CFCDES_A,ROUND((CANCELADO/TOTAL)*100,2) CANCELADO, ' +
                     'ROUND((NORMAL/TOTAL)*100,2) NORMAL,ROUND((PROPOT/TOTAL)*100,2) PROPOT, ' +
                     'ROUND((DEFICIENTE/TOTAL)*100,2) DEFICIENTE, ROUND((DUDOSO/TOTAL)*100,2) DUDOSO, ' +
                     'ROUND((PERDIDA/TOTAL)*100,2) PERDIDA, ROUND((TOTAL/TOTAL)*100,2) TOTAL ' +
                     'FROM (SELECT MAX(ORDEN) ORDEN,CFC_A,CFCDES_A,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                     'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL ' +
                     'FROM (SELECT CASE WHEN CFC_A=''0'' THEN 1 WHEN CFC_A=''A'' THEN 2 WHEN CFC_A=''B'' THEN 3 WHEN CFC_A=''C'' THEN 4  WHEN CFC_A=''D'' THEN 5 END ORDEN, '+
                     'CFC_A,CFCDES_A, CASE WHEN CFC_F IS NULL THEN SALDOS_'+xSalCar+' ELSE 0 END CANCELADO, ' +
                     'CASE WHEN CFC_F=''0'' THEN SALDOS_'+xSalCar+' ELSE 0 END NORMAL, CASE WHEN CFC_F=''A'' THEN SALDOS_'+xSalCar+' ELSE 0 END PROPOT, ' +
                     'CASE WHEN CFC_F=''B'' THEN SALDOS_'+xSalCar+' ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''C'' THEN SALDOS_'+xSalCar+' ELSE 0 END DUDOSO, ' +
                     'CASE WHEN CFC_F=''D'' THEN SALDOS_'+xSalCar+' ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+ ' AND CFC_A IS NOT NULL) GROUP BY CFC_A,CFCDES_A) ORDER BY ORDEN';


          End;

        1:Begin

             xSQL := 'SELECT CFC_T CFC_A,CFCDES_T CFCDES_A,ROUND((CANCELADO/TOTAL)*100,2) CANCELADO, ' +
                     'ROUND((NORMAL/TOTAL)*100,2) NORMAL,ROUND((PROPOT/TOTAL)*100,2) PROPOT, ' +
                     'ROUND((DEFICIENTE/TOTAL)*100,2) DEFICIENTE, ROUND((DUDOSO/TOTAL)*100,2) DUDOSO, ' +
                     'ROUND((PERDIDA/TOTAL)*100,2) PERDIDA, ROUND((TOTAL/TOTAL)*100,2) TOTAL ' +
                     'FROM (SELECT MAX(ORDEN) ORDEN,CFC_T,CFCDES_T,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                     'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL ' +
                     'FROM (SELECT CASE WHEN CFC_T=''0'' THEN 1 WHEN CFC_T=''A'' THEN 2 WHEN CFC_T=''B'' THEN 3 WHEN CFC_T=''C'' THEN 4  WHEN CFC_T=''D'' THEN 5 END ORDEN, '+
                     'CFC_T,CFCDES_T, CASE WHEN CFC_F IS NULL THEN SALDOS_AT ELSE 0 END CANCELADO, ' +
                     'CASE WHEN CFC_F=''0'' THEN SALDOS_AT ELSE 0 END NORMAL, CASE WHEN CFC_F=''A'' THEN SALDOS_AT ELSE 0 END PROPOT, ' +
                     'CASE WHEN CFC_F=''B'' THEN SALDOS_AT ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''C'' THEN SALDOS_AT ELSE 0 END DUDOSO, ' +
                     'CASE WHEN CFC_F=''D'' THEN SALDOS_AT ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+ ' AND CFC_T IS NOT NULL) GROUP BY CFC_T,CFCDES_T) ORDER BY ORDEN';



          End;

        2:Begin

             xSQL := 'SELECT CFC_S CFC_A,CFCDES_S CFCDES_A,ROUND((CANCELADO/TOTAL)*100,2) CANCELADO, ' +
                     'ROUND((NORMAL/TOTAL)*100,2) NORMAL,ROUND((PROPOT/TOTAL)*100,2) PROPOT, ' +
                     'ROUND((DEFICIENTE/TOTAL)*100,2) DEFICIENTE, ROUND((DUDOSO/TOTAL)*100,2) DUDOSO, ' +
                     'ROUND((PERDIDA/TOTAL)*100,2) PERDIDA, ROUND((TOTAL/TOTAL)*100,2) TOTAL ' +
                     'FROM (SELECT MAX(ORDEN) ORDEN,CFC_S,CFCDES_S,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                     'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL ' +
                     'FROM (SELECT CASE WHEN CFC_S=''0'' THEN 1 WHEN CFC_S=''A'' THEN 2 WHEN CFC_S=''B'' THEN 3 WHEN CFC_S=''C'' THEN 4  WHEN CFC_S=''D'' THEN 5 END ORDEN, '+
                     'CFC_S,CFCDES_S, CASE WHEN CFC_F IS NULL THEN SALDOS_AT ELSE 0 END CANCELADO, ' +
                     'CASE WHEN CFC_F=''0'' THEN SALDOS_AT ELSE 0 END NORMAL, CASE WHEN CFC_F=''A'' THEN SALDOS_AT ELSE 0 END PROPOT, ' +
                     'CASE WHEN CFC_F=''B'' THEN SALDOS_AT ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''C'' THEN SALDOS_AT ELSE 0 END DUDOSO, ' +
                     'CASE WHEN CFC_F=''D'' THEN SALDOS_AT ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+ ' AND CFC_S IS NOT NULL) GROUP BY CFC_S,CFCDES_S) ORDER BY ORDEN';


          End;

        3:Begin

             xSQL := 'SELECT CFC_Y CFC_A,CFCDES_Y CFCDES_A,ROUND((CANCELADO/TOTAL)*100,2) CANCELADO, ' +
                     'ROUND((NORMAL/TOTAL)*100,2) NORMAL,ROUND((PROPOT/TOTAL)*100,2) PROPOT, ' +
                     'ROUND((DEFICIENTE/TOTAL)*100,2) DEFICIENTE, ROUND((DUDOSO/TOTAL)*100,2) DUDOSO, ' +
                     'ROUND((PERDIDA/TOTAL)*100,2) PERDIDA, ROUND((TOTAL/TOTAL)*100,2) TOTAL ' +
                     'FROM (SELECT MAX(ORDEN) ORDEN,CFC_Y,CFCDES_Y,SUM(CANCELADO) CANCELADO,SUM(NORMAL) NORMAL,SUM(PROPOT) PROPOT,SUM(DEFICIENTE) DEFICIENTE, ' +
                     'SUM(DUDOSO) DUDOSO,SUM(PERDIDA) PERDIDA,SUM(NORMAL)+SUM(PROPOT)+SUM(DEFICIENTE)+SUM(DUDOSO)+SUM(PERDIDA) TOTAL ' +
                     'FROM (SELECT CASE WHEN CFC_Y=''0'' THEN 1 WHEN CFC_Y=''A'' THEN 2 WHEN CFC_Y=''B'' THEN 3 WHEN CFC_Y=''C'' THEN 4  WHEN CFC_Y=''D'' THEN 5 END ORDEN, '+
                     'CFC_Y,CFCDES_Y, CASE WHEN CFC_F IS NULL THEN SALDOS_AT ELSE 0 END CANCELADO, ' +
                     'CASE WHEN CFC_F=''0'' THEN SALDOS_AT ELSE 0 END NORMAL, CASE WHEN CFC_F=''A'' THEN SALDOS_AT ELSE 0 END PROPOT, ' +
                     'CASE WHEN CFC_F=''B'' THEN SALDOS_AT ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''C'' THEN SALDOS_AT ELSE 0 END DUDOSO, ' +
                     'CASE WHEN CFC_F=''D'' THEN SALDOS_AT ELSE 0 END PERDIDA FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+ ' AND CFC_Y IS NOT NULL) GROUP BY CFC_Y,CFCDES_Y) ORDER BY ORDEN';


          End;


   End;



   DM1.cdsNieto.Close;
   DM1.cdsNieto.DataRequest(xSQL);
   DM1.cdsNieto.Open;
   TNumericField(DM1.cdsNieto.FieldByName('CANCELADO')).DisplayFormat := '###,##0.#0';
   TNumericField(DM1.cdsNieto.FieldByName('NORMAL')).DisplayFormat := '###,##0.#0';
   TNumericField(DM1.cdsNieto.FieldByName('PROPOT')).DisplayFormat := '###,##0.#0';
   TNumericField(DM1.cdsNieto.FieldByName('DEFICIENTE')).DisplayFormat := '###,##0.#0';
   TNumericField(DM1.cdsNieto.FieldByName('DUDOSO')).DisplayFormat := '###,##0.#0';
   TNumericField(DM1.cdsNieto.FieldByName('PERDIDA')).DisplayFormat := '###,##0.#0';
   TNumericField(DM1.cdsNieto.FieldByName('TOTAL')).DisplayFormat := '###,##0.#0';
   SumaFooter('10');


   Case cmbConsulta.ItemIndex Of
       -1:Begin
            Screen.Cursor := crDefault;
            MessageDlg('DEBE SELECIONAR UN PERIODO DE EVALUACION ANTERIOR!!', mtError, [mbOk], 0);
            Exit;
          End;
        0:Begin
           xSQL := 'SELECT CASE WHEN CFCDES_A IS NULL AND CFC_F=''0'' THEN ''NUEVAS COLOCACIONES'' ' +
              'WHEN CFCDES_A IS NULL AND CFC_F<>''0'' THEN ''BLOQUEADOS'' WHEN CFCDES_A IS NOT NULL  THEN CFCDES_A  END CFCDES_A , ' +
              'CASE WHEN CFC_A IS NULL AND CFC_F=''0'' THEN ''Y'' WHEN CFC_A IS NULL AND CFC_F<>''0'' THEN ''R'' ' +
              'WHEN CFC_A IS NOT NULL THEN CFC_A END CFC_A ,SUM(SALDOS_AT) SALDOS_AT,SUM(NUM_AT) NUM_AT,NVL(CFC_F,''X'') CFC_F,NVL(CFCDES_F,''CANCELADO'') CFCDES_F,SUM(SALDOS_FT) SALDOS_FT, SUM(NUM_FT) NUM_FT FROM ' +
              '(' + DM1.ConsultaRiesgos(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]),xWhere  ) +') WHERE (CFC_A IS NOT NULL OR CFC_A IS NOT NULL) GROUP BY CFC_A,CFCDES_A,CFC_F,CFCDES_F ORDER BY CFC_A,CFCDES_A,CFC_F,CFCDES_F';
          End;
        1:Begin
           xSQL := 'SELECT CASE WHEN CFCDES_A IS NULL AND CFC_F=''0'' THEN ''NUEVAS COLOCACIONES'' ' +
              'WHEN CFCDES_A IS NULL AND CFC_F<>''0'' THEN ''BLOQUEADOS'' WHEN CFCDES_A IS NOT NULL  THEN CFCDES_A  END CFCDES_A , ' +
              'CASE WHEN CFC_A IS NULL AND CFC_F=''0'' THEN ''Y'' WHEN CFC_A IS NULL AND CFC_F<>''0'' THEN ''R'' ' +
              'WHEN CFC_A IS NOT NULL THEN CFC_A END CFC_A ,SUM(SALDOS_AT) SALDOS_AT,SUM(NUM_AT) NUM_AT,NVL(CFC_F,''X'') CFC_F,NVL(CFCDES_F,''CANCELADO'') CFCDES_F,SUM(SALDOS_FT) SALDOS_FT, SUM(NUM_FT) NUM_FT FROM ' +
              '(' + DM1.ConsultaRiesgosTri(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]),xWhere ) +') WHERE (CFC_A IS NOT NULL OR CFC_A IS NOT NULL) GROUP BY CFC_A,CFCDES_A,CFC_F,CFCDES_F ORDER BY CFC_A,CFCDES_A,CFC_F,CFCDES_F';

          End;
        2:Begin
           xSQL := 'SELECT CASE WHEN CFCDES_A IS NULL AND CFC_F=''0'' THEN ''NUEVAS COLOCACIONES'' ' +
              'WHEN CFCDES_A IS NULL AND CFC_F<>''0'' THEN ''BLOQUEADOS'' WHEN CFCDES_A IS NOT NULL  THEN CFCDES_A  END CFCDES_A , ' +
              'CASE WHEN CFC_A IS NULL AND CFC_F=''0'' THEN ''Y'' WHEN CFC_A IS NULL AND CFC_F<>''0'' THEN ''R'' ' +
              'WHEN CFC_A IS NOT NULL THEN CFC_A END CFC_A ,SUM(SALDOS_AT) SALDOS_AT,SUM(NUM_AT) NUM_AT,NVL(CFC_F,''X'') CFC_F,NVL(CFCDES_F,''CANCELADO'') CFCDES_F,SUM(SALDOS_FT) SALDOS_FT, SUM(NUM_FT) NUM_FT FROM ' +
              '(' + DM1.ConsultaRiesgosSem(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]),xWhere ) +') WHERE (CFC_A IS NOT NULL OR CFC_A IS NOT NULL) GROUP BY CFC_A,CFCDES_A,CFC_F,CFCDES_F ORDER BY CFC_A,CFCDES_A,CFC_F,CFCDES_F';

          End;

        3:Begin
           xSQL := 'SELECT CASE WHEN CFCDES_A IS NULL AND CFC_F=''0'' THEN ''NUEVAS COLOCACIONES'' ' +
              'WHEN CFCDES_A IS NULL AND CFC_F<>''0'' THEN ''BLOQUEADOS'' WHEN CFCDES_A IS NOT NULL  THEN CFCDES_A  END CFCDES_A , ' +
              'CASE WHEN CFC_A IS NULL AND CFC_F=''0'' THEN ''Y'' WHEN CFC_A IS NULL AND CFC_F<>''0'' THEN ''R'' ' +
              'WHEN CFC_A IS NOT NULL THEN CFC_A END CFC_A ,SUM(SALDOS_AT) SALDOS_AT,SUM(NUM_AT) NUM_AT,NVL(CFC_F,''X'') CFC_F,NVL(CFCDES_F,''CANCELADO'') CFCDES_F,SUM(SALDOS_FT) SALDOS_FT, SUM(NUM_FT) NUM_FT FROM ' +
              '(' + DM1.ConsultaRiesgosAnu(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]),xWhere ) +') WHERE (CFC_A IS NOT NULL OR CFC_A IS NOT NULL) GROUP BY CFC_A,CFCDES_A,CFC_F,CFCDES_F ORDER BY CFC_A,CFCDES_A,CFC_F,CFCDES_F';

          End;


   End;




   DM1.cdsConsulta.Close;
   DM1.cdsConsulta.DataRequest(xSQL);
   DM1.cdsConsulta.Open;

   //    DM1.AgruparGrid(dtgCabRiesgos,'CFCDES_A');

   BitMst01.Caption := 'Mostrar : ' + Trim(DM1.cdsConsulta.FieldByName('CFCDES_F').AsString);
   TNumericField(DM1.cdsConsulta.FieldByName('SALDOS_AT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsConsulta.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsConsulta.FieldByName('NUM_AT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsConsulta.FieldByName('NUM_FT')).DisplayFormat := '###,##0';
   SumaFooter('01');

   xSQL := 'SELECT CFC_F,CFCDES_F,SUM(SALDOS_FT) SALDOS_FT,SUM(NUM_FT) NUM_FT ' +
      'FROM (' + DM1.ConsultaRiesgos(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]),xWhere) + ') WHERE CFC_F IS NOT NULL  GROUP BY CFC_F,CFCDES_F  ORDER BY CFC_F,CFCDES_F';
   DM1.cdsSolicitud.Close;
   DM1.cdsSolicitud.DataRequest(xSQL);
   DM1.cdsSolicitud.Open;

   TNumericField(DM1.cdsSolicitud.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsSolicitud.FieldByName('NUM_FT')).DisplayFormat := '###,##0';
   SumaFooter('02');

   If Length(Trim(xWhere)) > 0 Then
     xSQL := 'SELECT ORDENCFC,ORDENDIAS,CFC_F,CFCDES_F,DIASDESC,SUM(ASOCIADOS) ASOCIADOS,SUM(SALDOS_FT) SALDOS_FT,SUM(SALDOS_FV) SALDOS_FV,SUM(SALDOS_FP) SALDOS_FP, ' +
        'SUM(SALDOS_PV) SALDOS_PV,SUM(SALDOS_CB) SALDOS_CB,SUM(SALDOS_NC) SALDOS_NC ' +
        'FROM (' + DM1.ConsultaDiasAtraso(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]),xWhere ) + ') GROUP BY ORDENCFC,ORDENDIAS,CFC_F,CFCDES_F,DIASDESC ORDER BY ORDENCFC,ORDENDIAS'



   Else
     xSQL := 'SELECT ORDENCFC,ORDENDIAS,CFC_F,CFCDES_F,DIASDESC,SUM(ASOCIADOS) ASOCIADOS,SUM(SALDOS_FT) SALDOS_FT,SUM(SALDOS_FV) SALDOS_FV,SUM(SALDOS_FP) SALDOS_FP, ' +
        'SUM(SALDOS_PV) SALDOS_PV,SUM(SALDOS_CB) SALDOS_CB,SUM(SALDOS_NC) SALDOS_NC ' +
        'FROM (' + DM1.ConsultaDiasAtraso(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) + ')  GROUP BY ORDENCFC,ORDENDIAS,CFC_F,CFCDES_F,DIASDESC ORDER BY ORDENCFC,ORDENDIAS ';



   DM1.cdsDpto.Close;
   DM1.cdsDpto.DataRequest(xSQL);
   DM1.cdsDpto.Open;
   DM1.AgruparGrid(dtgDiasAtraso, 'CFCDES_F');
   TNumericField(DM1.cdsDpto.FieldByName('ASOCIADOS')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsDpto.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsDpto.FieldByName('SALDOS_FV')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsDpto.FieldByName('SALDOS_FP')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsDpto.FieldByName('SALDOS_PV')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsDpto.FieldByName('SALDOS_CB')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsDpto.FieldByName('SALDOS_NC')).DisplayFormat := '###,###,###.#0';
   SumaFooter('03');

   xSQL := 'SELECT A.DPTOID,DPTODES,SUM(NUMNOR) NUMNOR,SUM(NORMAL) NORMAL, ' +
      'SUM(NUMPOT) NUMPOT,SUM(PROPOT) PROPOT,SUM(NUMDEF) NUMDEF,SUM(DEFICIENTE) DEFICIENTE, ' +
      'SUM(NUMDUD) NUMDUD,SUM(DUDOSO) DUDOSO, SUM(NUMPER) NUMPER,SUM(PERDIDA) PERDIDA, ' +
      'COUNT(*) NUMTOT,SUM(TOTAL) TOTAL FROM (SELECT CFC_F,CFCDES_F,DPTOID, CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NORMAL, ' +
      'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR, CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END PROPOT, ' +
      'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT,CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEFICIENTE, ' +
      'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF,CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUDOSO, ' +
      'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD,CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PERDIDA, ' +
      'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER ,SALDOS_FT TOTAL FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND CFC_F IS NOT NULL) A,APO158 B ' +
   'WHERE A.DPTOID=B.DPTOID(+) GROUP BY A.DPTOID,DPTODES ORDER BY A.DPTOID,DPTODES';
   DM1.cdsUPro.Close;
   DM1.cdsUPro.DataRequest(xSQL);
   DM1.cdsUPro.Open;
   TNumericField(DM1.cdsUPro.FieldByName('NUMNOR')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('NORMAL')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMPOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('PROPOT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMDEF')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('DEFICIENTE')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMDUD')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('DUDOSO')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMPER')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('PERDIDA')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMTOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('TOTAL')).DisplayFormat := '###,###,###.#0';
   SumaFooter('04');

   xSQL:='SELECT NVL(SUM(TOTAL),0) TOTAL,NVL(SUM(MANTIENEN),0) MANTIENEN,NVL(SUM(MEJORAN),0) MEJORAN,NVL(SUM(EMPEORAN),0) EMPEORAN '+
         'FROM (SELECT 1 TOTAL, CASE WHEN CFC_F=CFC_A THEN 1 ELSE 0 END MANTIENEN, '+
         'CASE WHEN CFC_F>CFC_A THEN 1 ELSE 0 END EMPEORAN,CASE WHEN CFC_F<CFC_A THEN 1 ELSE 0 END MEJORAN '+
         'FROM RIE_EST_GEN WHERE PERACT='+QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+') ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   lblTotal.Caption:=FormatFloat('###,###',DM1.Valores(DM1.cdsQry.FieldByName('TOTAL').AsString))+' - 100.00%';
   IF DM1.cdsQry.FieldByName('TOTAL').AsInteger = 0 THEN
   begin
     lblMantienen.Caption:=FormatFloat('###,###',0)+'%';
     lblMejora.Caption:=FormatFloat('###,###',0)+'%';
     lblEmpeora.Caption:=FormatFloat('###,###',0)+'%';
   end
   ELSE
   begin
     lblMantienen.Caption:=FormatFloat('###,###',DM1.Valores(DM1.cdsQry.FieldByName('MANTIENEN').AsString))+' - '+FloatToStr(DM1.FRound(((DM1.cdsQry.FieldByName('MANTIENEN').AsInteger/DM1.cdsQry.FieldByName('TOTAL').AsInteger)*100),3,2))+'%';
     lblMejora.Caption:=FormatFloat('###,###',DM1.Valores(DM1.cdsQry.FieldByName('MEJORAN').AsString))+' - '+FloatToStr(DM1.FRound(((DM1.cdsQry.FieldByName('MEJORAN').AsInteger/DM1.cdsQry.FieldByName('TOTAL').AsInteger)*100),3,2))+'%';
     lblEmpeora.Caption:=FormatFloat('###,###',DM1.Valores(DM1.cdsQry.FieldByName('EMPEORAN').AsString))+' - '+FloatToStr(DM1.FRound(((DM1.cdsQry.FieldByName('EMPEORAN').AsInteger/DM1.cdsQry.FieldByName('TOTAL').AsInteger)*100),3,2))+'%';
   end;
   DM1.cdsQry.Close;



   xSQL:='SELECT NVL(SUM(TOTAL),0) TOTAL,NVL(SUM(MANTIENEN),0) MANTIENEN,NVL(SUM(MEJORAN),0) MEJORAN,NVL(SUM(EMPEORAN),0) EMPEORAN '+
         'FROM (SELECT SALDOS_'+xSalCar+' TOTAL, CASE WHEN CFC_F=CFC_A THEN SALDOS_'+xSalCar+' ELSE 0 END MANTIENEN, '+
         'CASE WHEN CFC_F>CFC_A THEN SALDOS_'+xSalCar+' ELSE 0 END EMPEORAN,CASE WHEN CFC_F<CFC_A THEN SALDOS_'+xSalCar+' ELSE 0 END MEJORAN '+
         'FROM RIE_EST_GEN WHERE PERACT='+QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) +xWhere+' AND ';
         If rdgSalCar.ItemIndex=0 Then
            xSQL:=xSQL+' CFC_F IS NOT NULL ) ';
         If rdgSalCar.ItemIndex=1 Then
            xSQL:=xSQL+' CFC_A IS NOT NULL ) ';

   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   lblTotNum.Caption:=FormatFloat('###,###',DM1.Valores(DM1.cdsQry.FieldByName('TOTAL').AsString))+' - 100.00%';
   if (DM1.cdsQry.FieldByName('TOTAL').AsInteger = 0) then
   begin
     lblManNum.Caption:=FormatFloat('###,###',0)+'%';
     lblMejNum.Caption:=FormatFloat('###,###',0)+'%';
     lblDetNum.Caption:=FormatFloat('###,###',0)+'%';
   end
   else
   begin
     lblManNum.Caption:=FormatFloat('###,###',DM1.Valores(DM1.cdsQry.FieldByName('MANTIENEN').AsString))+' - '+FloatToStr(DM1.FRound(((DM1.cdsQry.FieldByName('MANTIENEN').AsInteger/DM1.cdsQry.FieldByName('TOTAL').AsInteger)*100),3,2))+'%';
     lblMejNum.Caption:=FormatFloat('###,###',DM1.Valores(DM1.cdsQry.FieldByName('MEJORAN').AsString))+' - '+FloatToStr(DM1.FRound(((DM1.cdsQry.FieldByName('MEJORAN').AsInteger/DM1.cdsQry.FieldByName('TOTAL').AsInteger)*100),3,2))+'%';
     lblDetNum.Caption:=FormatFloat('###,###',DM1.Valores(DM1.cdsQry.FieldByName('EMPEORAN').AsString))+' - '+FloatToStr(DM1.FRound(((DM1.cdsQry.FieldByName('EMPEORAN').AsInteger/DM1.cdsQry.FieldByName('TOTAL').AsInteger)*100),3,2))+'%';
   end;
   DM1.cdsQry.Close;

   BitProcesar.Enabled:=False;
   Screen.Cursor := crDefault;

END;
// Fin HPC_201501_RSG

PROCEDURE TfMatDesplaz.dbsMesIniChange(Sender: TObject);
BEGIN
   lblNomMes.Caption := DM1.DesMes(StrToInt(dbsMesIni.Text), 'N');
END;

PROCEDURE TfMatDesplaz.dtgCabDeptDrawDataCell(Sender: TObject;
   CONST Rect: TRect; Field: TField; State: TGridDrawState);
BEGIN

   IF ((Field.FieldName = 'CFCDES_F') OR (Field.FieldName = 'CFC_F')) AND (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = '0') THEN
   BEGIN
      dtgCabDept.Canvas.Font.Color := clGreen;
      dtgCabDept.DefaultDrawDataCell(rect, Field, State);
   END;

   IF ((Field.FieldName = 'CFCDES_F') OR (Field.FieldName = 'CFC_F')) AND (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = 'A') THEN
   BEGIN
      dtgCabDept.Canvas.Font.Color := clTeal;
      dtgCabDept.DefaultDrawDataCell(rect, Field, State);
   END;
   IF ((Field.FieldName = 'CFCDES_F') OR (Field.FieldName = 'CFC_F')) AND (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = 'B') THEN
   BEGIN
      dtgCabDept.Canvas.Font.Color := clOlive;
      dtgCabDept.DefaultDrawDataCell(rect, Field, State);
   END;
   IF ((Field.FieldName = 'CFCDES_F') OR (Field.FieldName = 'CFC_F')) AND (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = 'C') THEN
   BEGIN
      dtgCabDept.Canvas.Font.Color := clPurple;
      dtgCabDept.DefaultDrawDataCell(rect, Field, State);
   END;

   IF ((Field.FieldName = 'CFCDES_F') OR (Field.FieldName = 'CFC_F')) AND (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = 'D') THEN
   BEGIN
      dtgCabDept.Canvas.Font.Color := clRed;
      dtgCabDept.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'SALDOS_FT') OR (Field.FieldName = 'NUM_FT') THEN
   BEGIN
      dtgCabDept.Canvas.Font.Color := clNavy;
      dtgCabDept.DefaultDrawDataCell(rect, Field, State);
   END;

END;

PROCEDURE TfMatDesplaz.dtgCabDetDrawDataCell(Sender: TObject;
   CONST Rect: TRect; Field: TField; State: TGridDrawState);
BEGIN
   IF DM1.cdsReporte.RecordCount > 0 THEN
   BEGIN
      IF (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = '0') THEN
      BEGIN
         dtgCabDet.Canvas.Font.Color := clGreen;
         dtgCabDet.DefaultDrawDataCell(rect, Field, State);
      END;

      IF (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = 'A') THEN
      BEGIN
         dtgCabDet.Canvas.Font.Color := clTeal;
         dtgCabDet.DefaultDrawDataCell(rect, Field, State);
      END;

      IF (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = 'B') THEN
      BEGIN
         dtgCabDet.Canvas.Font.Color := clOlive;
         dtgCabDet.DefaultDrawDataCell(rect, Field, State);
      END;

      IF (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = 'C') THEN
      BEGIN
         dtgCabDet.Canvas.Font.Color := clPurple;
         dtgCabDet.DefaultDrawDataCell(rect, Field, State);
      END;

      IF (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = 'D') THEN
      BEGIN
         dtgCabDet.Canvas.Font.Color := clRed;
         dtgCabDet.DefaultDrawDataCell(rect, Field, State);
      END;
   END;
END;

PROCEDURE TfMatDesplaz.LimpiaGrid03;
VAR
   xSQL: STRING;
BEGIN
   xSQL := 'SELECT A.DPTOID,DPTODES,SALDOS_FT SALDOS_FT,0 NUM_FT FROM RIE_EST_GEN A,APO158 B ' +
      'WHERE 1=2 AND PERACT=''123'' AND A.DPTOID=B.DPTOID ';
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSQL);
   DM1.cdsReporte.Open;
   TNumericField(DM1.cdsReporte.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsReporte.FieldByName('NUM_FT')).DisplayFormat := '###,##0';
   SumaFooter('05');
END;

PROCEDURE TfMatDesplaz.dtgCabDeptRowChanged(Sender: TObject);
BEGIN
   LimpiaGrid03;
   BitMst01.Caption := 'Mostrar : ' + Trim(DM1.cdsSolicitud.FieldByName('CFCDES_F').AsString);

END;

PROCEDURE TfMatDesplaz.dtgUsesDetDrawDataCell(Sender: TObject;
   CONST Rect: TRect; Field: TField; State: TGridDrawState);
BEGIN
   IF DM1.cdsEjecuta.RecordCount > 0 THEN
   BEGIN
      IF (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = '0') THEN
      BEGIN
         dtgUsesDet.Canvas.Font.Color := clGreen;
         dtgUsesDet.DefaultDrawDataCell(rect, Field, State);
      END;

      IF (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = 'A') THEN
      BEGIN
         dtgUsesDet.Canvas.Font.Color := clTeal;
         dtgUsesDet.DefaultDrawDataCell(rect, Field, State);
      END;

      IF (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = 'B') THEN
      BEGIN
         dtgUsesDet.Canvas.Font.Color := clOlive;
         dtgUsesDet.DefaultDrawDataCell(rect, Field, State);
      END;

      IF (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = 'C') THEN
      BEGIN
         dtgUsesDet.Canvas.Font.Color := clPurple;
         dtgUsesDet.DefaultDrawDataCell(rect, Field, State);
      END;

      IF (DM1.cdsSolicitud.FieldByName('CFC_F').AsString = 'D') THEN
      BEGIN
         dtgUsesDet.Canvas.Font.Color := clRed;
         dtgUsesDet.DefaultDrawDataCell(rect, Field, State);
      END;
   END;

END;

PROCEDURE TfMatDesplaz.LimpiaGrid04;
var
   xSQL: String;
BEGIN
   xSQL := 'SELECT A.USEID,USENOM,SALDOS_FT SALDOS_FT,0 NUM_FT FROM RIE_EST_GEN A,APO101 B ' +
      'WHERE 1=2 AND PERACT=''123'' AND A.UPROID=B.UPROID AND A.UPAGOID=B.UPAGOID AND A.USEID=B.USEID';
   DM1.cdsEjecuta.Close;
   DM1.cdsEjecuta.DataRequest(xSQL);
   DM1.cdsEjecuta.Open;
   TNumericField(DM1.cdsEjecuta.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsEjecuta.FieldByName('NUM_FT')).DisplayFormat := '###,##0';
   SumaFooter('06');

END;

PROCEDURE TfMatDesplaz.dtgCabDetRowChanged(Sender: TObject);
BEGIN
   IF xMostrar THEN BitMst02.Caption := 'Mostrar : ' + Trim(DM1.cdsReporte.FieldByName('DPTODES').AsString);
END;

PROCEDURE TfMatDesplaz.BitMst01Click(Sender: TObject);
VAR
   xSQL: STRING;
   xWhere,xTitulo: String;
BEGIN
    Case rdbTipCar.ItemIndex Of
         0:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND TIPASO=''DO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND TIPASO=''CE'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND TIPASO=''CO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         1:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND TIPCAR=''1''  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND TIPCAR=''1'' AND TIPASO=''DO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND TIPCAR=''1'' AND TIPASO=''CE''  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND TIPCAR=''1'' AND TIPASO=''CO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         2:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND TIPCAR=''2'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND TIPCAR=''2'' AND TIPASO=''DO'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND TIPCAR=''2'' AND TIPASO=''CE'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND TIPCAR=''2'' AND TIPASO=''CO'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: CONTRATADOS';
                      End;
               End;

           End;
    End;




   xSQL := 'SELECT CFC_F,DPTOID,DPTODES,SUM(SALDOS_FT) SALDOS_FT,SUM(NUM_FT) NUM_FT FROM ' +
      '(' + DM1.ConsultaRiesgos(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]),xWhere) + ') WHERE CFC_F=' + QuotedStr(DM1.cdsSolicitud.FieldByName('CFC_F').AsString) + ' GROUP BY CFC_F,DPTOID,DPTODES  ORDER BY CFC_F,DPTOID,DPTODES ';
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(xSQL);
   Screen.Cursor := crHourGlass;
   DM1.cdsReporte.Open;
   IF DM1.cdsReporte.RecordCount > 0 THEN
      xMostrar := True
   ELSE
      xMostrar := False;
   TNumericField(DM1.cdsReporte.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsReporte.FieldByName('NUM_FT')).DisplayFormat := '###,##0';
   SumaFooter('05');
   Screen.Cursor := crDefault;

END;

PROCEDURE TfMatDesplaz.BitMst02Click(Sender: TObject);
VAR
   xSQL: STRING;
   xWhere,xTitulo: String;
BEGIN
    Case rdbTipCar.ItemIndex Of
         0:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND TIPASO=''DO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND TIPASO=''CE'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND TIPASO=''CO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         1:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND TIPCAR=''1''  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND TIPCAR=''1'' AND TIPASO=''DO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND TIPCAR=''1'' AND TIPASO=''CE''  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND TIPCAR=''1'' AND TIPASO=''CO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         2:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND TIPCAR=''2'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND TIPCAR=''2'' AND TIPASO=''DO'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND TIPCAR=''2'' AND TIPASO=''CE'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND TIPCAR=''2'' AND TIPASO=''CO'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: CONTRATADOS';
                      End;
               End;

           End;
    End;

   xSQL := 'SELECT USEID,USENOM,SUM(SALDOS_FT) SALDOS_FT,SUM(NUM_FT) NUM_FT FROM ' +
      '(' + DM1.ConsultaRiesgos(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]),xWhere) + ') WHERE CFC_F=' + QuotedStr(DM1.cdsSolicitud.FieldByName('CFC_F').AsString) + ' AND DPTOID=' + QuotedStr(DM1.cdsReporte.FieldByName('DPTOID').AsString) + ' GROUP BY USEID,USENOM  ORDER BY USEID,USENOM';
   DM1.cdsEjecuta.Close;
   DM1.cdsEjecuta.DataRequest(xSQL);
   Screen.Cursor := crHourGlass;
   DM1.cdsEjecuta.Open;
   TNumericField(DM1.cdsEjecuta.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsEjecuta.FieldByName('NUM_FT')).DisplayFormat := '###,##0';
   SumaFooter('06');
   Screen.Cursor := crDefault;
END;

PROCEDURE TfMatDesplaz.dtgDiasAtrasoDrawDataCell(Sender: TObject;
   CONST Rect: TRect; Field: TField; State: TGridDrawState);
BEGIN

   IF (Field.FieldName <> 'CFCDES_F') THEN
   BEGIN
      dtgDiasAtraso.Canvas.Font.Color := clNavy;
      dtgDiasAtraso.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_F') AND (DM1.cdsDpto.FieldByName('CFC_F').AsString = '0') AND (DM1.cdsDpto.FieldByName('DIASDESC').AsString = 'ENTRE 0 Y 8 DIAS') THEN
   BEGIN
      dtgDiasAtraso.Canvas.Font.Color := clGreen;
      dtgDiasAtraso.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_F') AND (DM1.cdsDpto.FieldByName('CFC_F').AsString = 'A') AND (DM1.cdsDpto.FieldByName('DIASDESC').AsString = 'ENTRE 9 Y 31 DIAS') THEN
   BEGIN
      dtgDiasAtraso.Canvas.Font.Color := clTeal;
      dtgDiasAtraso.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CFCDES_F') AND (DM1.cdsDpto.FieldByName('CFC_F').AsString = 'B') AND (DM1.cdsDpto.FieldByName('DIASDESC').AsString = 'ENTRE 32 Y 62 DIAS') THEN
   BEGIN
      dtgDiasAtraso.Canvas.Font.Color := clOlive;
      dtgDiasAtraso.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'CFCDES_F') AND (DM1.cdsDpto.FieldByName('CFC_F').AsString = 'C') AND (DM1.cdsDpto.FieldByName('DIASDESC').AsString = 'ENTRE 63 Y 93 DIAS') THEN
   BEGIN
      dtgDiasAtraso.Canvas.Font.Color := clPurple;
      dtgDiasAtraso.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'CFCDES_F') AND (DM1.cdsDpto.FieldByName('CFC_F').AsString = 'D') AND (DM1.cdsDpto.FieldByName('DIASDESC').AsString = 'MAS DE 123 DIAS') THEN
   BEGIN
      dtgDiasAtraso.Canvas.Font.Color := clRed;
      dtgDiasAtraso.DefaultDrawDataCell(rect, Field, State);
   END;

END;

PROCEDURE TfMatDesplaz.dtgConcentracionDrawDataCell(Sender: TObject;
   CONST Rect: TRect; Field: TField; State: TGridDrawState);
BEGIN
   IF ((Field.FieldName = 'NUMNOR') OR (Field.FieldName = 'NORMAL')) THEN
   BEGIN
      dtgConcentracion.Canvas.Font.Color := clGreen;
      dtgConcentracion.DefaultDrawDataCell(rect, Field, State);
   END;

   IF ((Field.FieldName = 'NUMPOT') OR (Field.FieldName = 'PROPOT')) THEN
   BEGIN
      dtgConcentracion.Canvas.Font.Color := clTeal;
      dtgConcentracion.DefaultDrawDataCell(rect, Field, State);
   END;
   IF ((Field.FieldName = 'NUMDEF') OR (Field.FieldName = 'DEFICIENTE')) THEN
   BEGIN
      dtgConcentracion.Canvas.Font.Color := clOlive;
      dtgConcentracion.DefaultDrawDataCell(rect, Field, State);
   END;
   IF ((Field.FieldName = 'NUMDUD') OR (Field.FieldName = 'DUDOSO')) THEN
   BEGIN
      dtgConcentracion.Canvas.Font.Color := clPurple;
      dtgConcentracion.DefaultDrawDataCell(rect, Field, State);
   END;

   IF ((Field.FieldName = 'NUMPER') OR (Field.FieldName = 'PERDIDA')) THEN
   BEGIN
      dtgConcentracion.Canvas.Font.Color := clRed;
      dtgConcentracion.DefaultDrawDataCell(rect, Field, State);
   END;

   IF ((Field.FieldName = 'NUMTOT') OR (Field.FieldName = 'TOTAL')) THEN
   BEGIN
      dtgConcentracion.Canvas.Font.Color := clBlack;
      dtgConcentracion.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'DPTODES') THEN
   BEGIN
      dtgConcentracion.Canvas.Font.Color := clNavy;
      dtgConcentracion.DefaultDrawDataCell(rect, Field, State);
   END;

END;

PROCEDURE TfMatDesplaz.ChkTotClick(Sender: TObject);
VAR
   xSQL: STRING;
BEGIN
   Screen.Cursor := crHourGlass;
   xSQL := 'SELECT A.DPTOID,DPTODES,SUM(NUMNOR) NUMNOR,SUM(NORMAL) NORMAL, ' +
      'SUM(NUMPOT) NUMPOT,SUM(PROPOT) PROPOT,SUM(NUMDEF) NUMDEF,SUM(DEFICIENTE) DEFICIENTE, ' +
      'SUM(NUMDUD) NUMDUD,SUM(DUDOSO) DUDOSO, SUM(NUMPER) NUMPER,SUM(PERDIDA) PERDIDA, ' +
      'COUNT(*) NUMTOT,SUM(TOTAL) TOTAL FROM (SELECT CFC_F,CFCDES_F,DPTOID, CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NORMAL, ' +
      'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR, CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END PROPOT, ' +
      'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT,CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEFICIENTE, ' +
      'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF,CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUDOSO, ' +
      'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD,CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PERDIDA, ' +
      'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER ,SALDOS_FT TOTAL FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) + ' AND CFC_F IS NOT NULL) A,APO158 B ' +
   'WHERE A.DPTOID=B.DPTOID(+) GROUP BY A.DPTOID,DPTODES ';
   DM1.cdsUPro.Close;
   DM1.cdsUPro.DataRequest(xSQL);
   DM1.cdsUPro.Open;
   TNumericField(DM1.cdsUPro.FieldByName('NUMNOR')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('NORMAL')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMPOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('PROPOT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMDEF')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('DEFICIENTE')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMDUD')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('DUDOSO')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMPER')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('PERDIDA')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMTOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('TOTAL')).DisplayFormat := '###,###,###.#0';
   SumaFooter('04');

   Screen.Cursor := crDefault;

END;

PROCEDURE TfMatDesplaz.ChkVenClick(Sender: TObject);
VAR
   xSQL: STRING;
BEGIN
   Screen.Cursor := crHourGlass;
   xSQL := 'SELECT A.DPTOID,DPTODES,SUM(NUMNOR) NUMNOR,SUM(NORMAL) NORMAL, ' +
      'SUM(NUMPOT) NUMPOT,SUM(PROPOT) PROPOT,SUM(NUMDEF) NUMDEF,SUM(DEFICIENTE) DEFICIENTE, ' +
      'SUM(NUMDUD) NUMDUD,SUM(DUDOSO) DUDOSO, SUM(NUMPER) NUMPER,SUM(PERDIDA) PERDIDA, ' +
      'COUNT(*) NUMTOT,SUM(TOTAL) TOTAL FROM (SELECT CFC_F,CFCDES_F,DPTOID, CASE WHEN CFC_F=''0'' THEN SALDOS_FV ELSE 0 END NORMAL, ' +
      'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR, CASE WHEN CFC_F=''A'' THEN SALDOS_FV ELSE 0 END PROPOT, ' +
      'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT,CASE WHEN CFC_F=''B'' THEN SALDOS_FV ELSE 0 END DEFICIENTE, ' +
      'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF,CASE WHEN CFC_F=''C'' THEN SALDOS_FV ELSE 0 END DUDOSO, ' +
      'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD,CASE WHEN CFC_F=''D'' THEN SALDOS_FV ELSE 0 END PERDIDA, ' +
      'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER ,SALDOS_FV TOTAL FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) + ' AND CFC_F IS NOT NULL) A,APO158 B ' +
   'WHERE A.DPTOID=B.DPTOID(+) GROUP BY A.DPTOID,DPTODES ';
   DM1.cdsUPro.Close;
   DM1.cdsUPro.DataRequest(xSQL);
   DM1.cdsUPro.Open;
   TNumericField(DM1.cdsUPro.FieldByName('NUMNOR')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('NORMAL')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMPOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('PROPOT')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMDEF')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('DEFICIENTE')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMDUD')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('DUDOSO')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMPER')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('PERDIDA')).DisplayFormat := '###,###,###.#0';
   TNumericField(DM1.cdsUPro.FieldByName('NUMTOT')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUPro.FieldByName('TOTAL')).DisplayFormat := '###,###,###.#0';
   SumaFooter('04');

   Screen.Cursor := crDefault;

END;

PROCEDURE TfMatDesplaz.dtgCons01aDrawDataCell(Sender: TObject;
   CONST Rect: TRect; Field: TField; State: TGridDrawState);
BEGIN
   dtgCons01a.Canvas.Font.Color := clNavy;
   dtgCons01a.DefaultDrawDataCell(rect, Field, State);

   If (Field.FieldName = 'CANCELADO') Or (Field.FieldName = 'TOTAL') Or (Field.FieldName = 'CFCDES_A') Then
       Begin
         dtgCons01a.Canvas.Brush.Color := clWhite;
         dtgCons01a.Canvas.Font.Color := clNavy;
         dtgCons01a.DefaultDrawDataCell(rect, Field, State);
       End;

   IF (DM1.cdsPadre.FieldByName('CFC_A').AsString = 'A')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := $0093FF93;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPadre.FieldByName('CFC_A').AsString = 'B')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'DUDOSO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := $0093FF93;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPadre.FieldByName('CFC_A').AsString = 'C')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'DUDOSO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := $0093FF93;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPadre.FieldByName('CFC_A').AsString = 'D')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := $0093FF93;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPadre.FieldByName('CFC_A').AsString = '0')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := $00BFBFFF;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPadre.FieldByName('CFC_A').AsString = 'A')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := $00BFBFFF;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPadre.FieldByName('CFC_A').AsString = 'B')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'PROPOT') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := $00BFBFFF;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPadre.FieldByName('CFC_A').AsString = 'C')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'PROPOT') AND (Field.FieldName <> 'DEFICIENTE') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := $00BFBFFF;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NORMAL') AND (DM1.cdsPadre.FieldByName('CFC_A').AsString = '0') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := clYellow;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'PROPOT') AND (DM1.cdsPadre.FieldByName('CFC_A').AsString = 'A') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := clYellow;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'DEFICIENTE') AND (DM1.cdsPadre.FieldByName('CFC_A').AsString = 'B') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := clYellow;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'DUDOSO') AND (DM1.cdsPadre.FieldByName('CFC_A').AsString = 'C') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := clYellow;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'PERDIDA') AND (DM1.cdsPadre.FieldByName('CFC_A').AsString = 'D') THEN
   BEGIN
      dtgCons01a.Canvas.Brush.Color := clYellow;
      dtgCons01a.Canvas.Font.Color := clNavy;
      dtgCons01a.DefaultDrawDataCell(rect, Field, State);
   END;

END;

PROCEDURE TfMatDesplaz.dtgCons01bDrawDataCell(Sender: TObject;
   CONST Rect: TRect; Field: TField; State: TGridDrawState);
BEGIN

   dtgCons01b.Canvas.Font.Color := clNavy;
   dtgCons01b.DefaultDrawDataCell(rect, Field, State);

   IF (DM1.cdsPais.FieldByName('CFC_A').AsString = 'A')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := $0093FF93;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPais.FieldByName('CFC_A').AsString = 'B')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'DUDOSO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := $0093FF93;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPais.FieldByName('CFC_A').AsString = 'C')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'DUDOSO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := $0093FF93;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPais.FieldByName('CFC_A').AsString = 'D')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := $0093FF93;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPais.FieldByName('CFC_A').AsString = '0')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := $00BFBFFF;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPais.FieldByName('CFC_A').AsString = 'A')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := $00BFBFFF;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPais.FieldByName('CFC_A').AsString = 'B')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'PROPOT') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := $00BFBFFF;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsPais.FieldByName('CFC_A').AsString = 'C')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'PROPOT') AND (Field.FieldName <> 'DEFICIENTE') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := $00BFBFFF;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NORMAL') AND (DM1.cdsPais.FieldByName('CFC_A').AsString = '0') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := clYellow;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'PROPOT') AND (DM1.cdsPais.FieldByName('CFC_A').AsString = 'A') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := clYellow;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'DEFICIENTE') AND (DM1.cdsPais.FieldByName('CFC_A').AsString = 'B') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := clYellow;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'DUDOSO') AND (DM1.cdsPais.FieldByName('CFC_A').AsString = 'C') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := clYellow;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'PERDIDA') AND (DM1.cdsPais.FieldByName('CFC_A').AsString = 'D') THEN
   BEGIN
      dtgCons01b.Canvas.Brush.Color := clYellow;
      dtgCons01b.Canvas.Font.Color := clNavy;
      dtgCons01b.DefaultDrawDataCell(rect, Field, State);
   END;

END;

PROCEDURE TfMatDesplaz.dtgCons02bDrawDataCell(Sender: TObject;
   CONST Rect: TRect; Field: TField; State: TGridDrawState);
BEGIN

   dtgCons02b.Canvas.Font.Color := clNavy;
   dtgCons02b.DefaultDrawDataCell(rect, Field, State);

   IF (DM1.cdsNieto.FieldByName('CFC_A').AsString = 'A')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := $0093FF93;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsNieto.FieldByName('CFC_A').AsString = 'B')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'DUDOSO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := $0093FF93;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsNieto.FieldByName('CFC_A').AsString = 'C')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'DUDOSO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := $0093FF93;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsNieto.FieldByName('CFC_A').AsString = 'D')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := $0093FF93;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsNieto.FieldByName('CFC_A').AsString = '0')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := $00BFBFFF;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsNieto.FieldByName('CFC_A').AsString = 'A')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := $00BFBFFF;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsNieto.FieldByName('CFC_A').AsString = 'B')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'PROPOT') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := $00BFBFFF;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsNieto.FieldByName('CFC_A').AsString = 'C')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'PROPOT') AND (Field.FieldName <> 'DEFICIENTE') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := $00BFBFFF;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NORMAL') AND (DM1.cdsNieto.FieldByName('CFC_A').AsString = '0') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := clYellow;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'PROPOT') AND (DM1.cdsNieto.FieldByName('CFC_A').AsString = 'A') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := clYellow;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'DEFICIENTE') AND (DM1.cdsNieto.FieldByName('CFC_A').AsString = 'B') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := clYellow;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'DUDOSO') AND (DM1.cdsNieto.FieldByName('CFC_A').AsString = 'C') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := clYellow;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'PERDIDA') AND (DM1.cdsNieto.FieldByName('CFC_A').AsString = 'D') THEN
   BEGIN
      dtgCons02b.Canvas.Brush.Color := clYellow;
      dtgCons02b.Canvas.Font.Color := clNavy;
      dtgCons02b.DefaultDrawDataCell(rect, Field, State);
   END;

END;

PROCEDURE TfMatDesplaz.BitExportaClick(Sender: TObject);
VAR
   xSQL: STRING;
   xWhere,xTitulo: String;
BEGIN
  Case rdbTipCar.ItemIndex Of
         0:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' ';
                      End;
                    1:Begin
                        xWhere:=' AND ASOTIPID=''DO'' ';
                      End;
                    2:Begin
                        xWhere:=' AND ASOTIPID=''CE'' ';
                      End;
                    3:Begin
                        xWhere:=' AND ASOTIPID=''CO'' ';
                      End;
               End;
           End;
         1:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0';
                      End;
                    1:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''DO'' ';
                      End;
                    2:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''CE'' ';
                      End;
                    3:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''CO'' ';
                      End;
               End;
           End;
         2:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)>0';
                      End;
                    1:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)>0 AND ASOTIPID=''DO'' ';
                      End;
                    2:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)>0 AND ASOTIPID=''CE'' ';
                      End;
                    3:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)>0 AND ASOTIPID=''CO'' ';
                      End;
               End;

           End;
  End;

   IF (PageControl1.TabIndex = 0) AND (PageControl2.TabIndex = 0) THEN
   BEGIN
      DM1.ExportaGridExcel(dtgCabRiesgos, 'ExpDatos01');
   END;

   IF (PageControl1.TabIndex = 0) AND (PageControl2.TabIndex = 1) THEN
   BEGIN
      DM1.ExportaGridExcel(dtgCons01a, 'ExpDatos02');
      DM1.ExportaGridExcel(dtgCons01b, 'ExpDatos03');
   END;

   IF (PageControl1.TabIndex = 0) AND (PageControl2.TabIndex = 2) THEN
   BEGIN
      DM1.ExportaGridExcel(dtgCons02a, 'ExpDatos04');
      DM1.ExportaGridExcel(dtgCons02b, 'ExpDatos05');
   END;

   IF (PageControl1.TabIndex = 1) THEN
   BEGIN
      Screen.Cursor := crHourGlass;
      xSQL := 'SELECT DPTOID,DPTODES DEPARTAMENTO,USEID,USENOM UGELES,CFC_F,CFCDES_F CATRIESGO,DIASDESC RANGODIAS,SUM(NVL(SALDOS_FT,0)) SALCAPITAL,SUM(NVL(NUM_FT,0)) NUMASOCIADOS,SUM(NVL(SALDOS_PV,0)) PROVISION,SUM(NVL(SALDOS_FV,0)) SALVENCIDO FROM (' + DM1.ConsultaRiesgos(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]),xWhere ) + ') WHERE CFC_F IS NOT NULL '+xWhere+'  GROUP BY  DPTOID,DPTODES,USEID,USENOM,CFC_F,CFCDES_F,DIASDESC ORDER BY DPTOID,USEID,CFC_F';
      DM1.cdsQry6.Close;
      DM1.cdsQry6.DataRequest(xSQL);
      DM1.cdsQry6.Open;
      Screen.Cursor := crDefault;
      DM1.ExportaGridExcel(dtgAuxiliar, 'ExpDatos06');
   END;
   IF (PageControl1.TabIndex = 2) THEN
   BEGIN
      IF ChkTot.Checked THEN DM1.ExportaGridExcel(dtgConcentracion, 'ExpDatos07');
      IF ChkVen.Checked THEN DM1.ExportaGridExcel(dtgConcentracion, 'ExpDatos08');
      IF ChkDias.Checked THEN DM1.ExportaGridExcel(dtgDiasAtraso, 'ExpDatos09');
      IF chkDepUgel.Checked THEN
      BEGIN
         Screen.Cursor := crHourGlass;
         xSQL := 'SELECT A.DPTOID,DPTODES,A.UPROID,A.UPAGOID,A.USEID,B.USENOM,SUM(NUMNOR) NUMNOR,SUM(NORMAL) NORMAL, ' +
            'SUM(NUMPOT) NUMPOT,SUM(PROPOT) PROPOT,SUM(NUMDEF) NUMDEF,SUM(DEFICIENTE) DEFICIENTE,SUM(NUMDUD) NUMDUD,SUM(DUDOSO) DUDOSO, ' +
            'SUM(NUMPER) NUMPER,SUM(PERDIDA) PERDIDA,COUNT(*) NUMTOT,SUM(TOTAL) TOTAL FROM (SELECT DPTOID,CFC_F,CFCDES_F,OFDESID,UPROID,UPAGOID,USEID, ' +
            'CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NORMAL,CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR, ' +
            'CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END PROPOT,CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT, ' +
            'CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF,CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUDOSO, ' +
            'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD,CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PERDIDA, ' +
            'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER,SALDOS_FT TOTAL FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) + ' AND CFC_F IS NOT NULL '+xWhere+' ) A,APO101 B,APO158 C ' +
         'WHERE A.UPROID=B.UPROID(+) AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) AND A.DPTOID=C.DPTOID(+) GROUP BY A.DPTOID,DPTODES,A.UPROID,A.UPAGOID,A.USEID,B.USENOM ' +
            'ORDER BY A.DPTOID,DPTODES,A.UPROID ';
         DM1.cdsQry5.Close;
         DM1.cdsQry5.DataRequest(xSQL);
         DM1.cdsQry5.Open;
         Screen.Cursor := crDefault;
         DM1.ExportaGridExcel(dtgAuxiliar02, 'ExpDatos10');

         Screen.Cursor := crHourGlass;
         xSQL := 'SELECT A.DPTOID,DPTODES,A.UPROID,A.UPAGOID,A.USEID,B.USENOM,SUM(NUMNOR) NUMNOR,SUM(NORMAL) NORMAL, ' +
            'SUM(NUMPOT) NUMPOT,SUM(PROPOT) PROPOT,SUM(NUMDEF) NUMDEF,SUM(DEFICIENTE) DEFICIENTE,SUM(NUMDUD) NUMDUD,SUM(DUDOSO) DUDOSO, ' +
            'SUM(NUMPER) NUMPER,SUM(PERDIDA) PERDIDA,COUNT(*) NUMTOT,SUM(TOTAL) TOTAL FROM (SELECT DPTOID,CFC_F,CFCDES_F,OFDESID,UPROID,UPAGOID,USEID, ' +
            'CASE WHEN CFC_F=''0'' THEN SALDOS_FV ELSE 0 END NORMAL,CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR, ' +
            'CASE WHEN CFC_F=''A'' THEN SALDOS_FV ELSE 0 END PROPOT,CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT, ' +
            'CASE WHEN CFC_F=''B'' THEN SALDOS_FV ELSE 0 END DEFICIENTE,CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF,CASE WHEN CFC_F=''C'' THEN SALDOS_FV ELSE 0 END DUDOSO, ' +
            'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD,CASE WHEN CFC_F=''D'' THEN SALDOS_FV ELSE 0 END PERDIDA, ' +
            'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER,SALDOS_FV TOTAL FROM RIE_EST_GEN WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) + ' AND CFC_F IS NOT NULL '+xWhere+' ) A,APO101 B,APO158 C ' +
         'WHERE A.UPROID=B.UPROID(+) AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) AND A.DPTOID=C.DPTOID(+) GROUP BY A.DPTOID,DPTODES,A.UPROID,A.UPAGOID,A.USEID,B.USENOM ' +
            'ORDER BY A.DPTOID,DPTODES,A.UPROID ';
         DM1.cdsQry5.Close;
         DM1.cdsQry5.DataRequest(xSQL);
         DM1.cdsQry5.Open;
         Screen.Cursor := crDefault;
         DM1.ExportaGridExcel(dtgAuxiliar02, 'ExpDatos11');
      END;
      IF chkDptoUgelDias.Checked THEN
      BEGIN
         Screen.Cursor := crHourGlass;
         xSQL := 'SELECT DPTODES,USENOM,CFC_F,CFCDES_F,DIASDESC,SUM(ASOCIADOS) ASOCIADOS,SUM(SALDOS_FT) SALDOS_FT,SUM(SALDOS_FV) SALDOS_FV, ' +
            'SUM(SALDOS_FP) SALDOS_FP,SUM(SALDOS_PV) SALDOS_PV,SUM(SALDOS_CB) SALDOS_CB,SUM(SALDOS_NC) SALDOS_NC FROM (SELECT CASE ' +
            'WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''ENTRE 0 Y 8 DIAS'' WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''ENTRE 9 Y 31 DIAS'' ' +
            'WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE 32 Y 62 DIAS'' WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE 63 Y 93 DIAS'' ' +
            'WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE 94 Y 123 DIAS'' WHEN DIASTRANS > 123 THEN  ''MAS DE 123 DIAS''  END DIASDESC, ' +
            'A.DPTOID,B.DPTODES,A.UPROID,A.UPAGOID,A.USEID,C.USENOM,CFC_F,CFCDES_F,DIASTRANS,1 ASOCIADOS,SALDOS_FT,SALDOS_FV, ' +
            'SALDOS_FP,SALDOS_PV,SALDOS_CB,SALDOS_NC  FROM RIE_EST_GEN A, APO158 B, APO101 C  WHERE PERACT = ' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) + '  AND CFC_F IS NOT NULL ' +xWhere+' '+
            'AND A.DPTOID = B.DPTOID(+) AND A.UPROID = C.UPROID(+) AND A.UPAGOID = C.UPAGOID(+) AND A.USEID = C.USEID(+)) ' +
            'GROUP BY DPTODES,USENOM,CFC_F, CFCDES_F, DIASDESC';
         DM1.cdsQry4.Close;
         DM1.cdsQry4.DataRequest(xSQL);
         DM1.cdsQry4.Open;
         Screen.Cursor := crDefault;
         DM1.ExportaGridExcel(dtgAuxiliar03, 'ExpDatos17');
      END;

   END;
   IF (PageControl1.TabIndex = 3) THEN
   BEGIN
      DM1.ExportaGridExcel(dtgDatos, 'ExpDatos12');
   END;
END;

PROCEDURE TfMatDesplaz.dtgCons02aDrawDataCell(Sender: TObject;
   CONST Rect: TRect; Field: TField; State: TGridDrawState);
BEGIN
   dtgCons02a.Canvas.Font.Color := clNavy;
   dtgCons02a.DefaultDrawDataCell(rect, Field, State);

   IF (DM1.cdsHijo.FieldByName('CFC_A').AsString = 'A')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := $0093FF93;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsHijo.FieldByName('CFC_A').AsString = 'B')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'DUDOSO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := $0093FF93;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsHijo.FieldByName('CFC_A').AsString = 'C')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'DUDOSO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := $0093FF93;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsHijo.FieldByName('CFC_A').AsString = 'D')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := $0093FF93;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsHijo.FieldByName('CFC_A').AsString = '0')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := $00BFBFFF;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsHijo.FieldByName('CFC_A').AsString = 'A')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := $00BFBFFF;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsHijo.FieldByName('CFC_A').AsString = 'B')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'PROPOT') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := $00BFBFFF;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (DM1.cdsHijo.FieldByName('CFC_A').AsString = 'C')
      AND (Field.FieldName <> 'CFCDES_A') AND (Field.FieldName <> 'CANCELADO') AND (Field.FieldName <> 'NORMAL') AND (Field.FieldName <> 'PROPOT') AND (Field.FieldName <> 'DEFICIENTE') AND (Field.FieldName <> 'TOTAL') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := $00BFBFFF;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NORMAL') AND (DM1.cdsHijo.FieldByName('CFC_A').AsString = '0') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := clYellow;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'PROPOT') AND (DM1.cdsHijo.FieldByName('CFC_A').AsString = 'A') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := clYellow;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'DEFICIENTE') AND (DM1.cdsHijo.FieldByName('CFC_A').AsString = 'B') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := clYellow;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'DUDOSO') AND (DM1.cdsHijo.FieldByName('CFC_A').AsString = 'C') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := clYellow;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'PERDIDA') AND (DM1.cdsHijo.FieldByName('CFC_A').AsString = 'D') THEN
   BEGIN
      dtgCons02a.Canvas.Brush.Color := clYellow;
      dtgCons02a.Canvas.Font.Color := clNavy;
      dtgCons02a.DefaultDrawDataCell(rect, Field, State);
   END;

END;

PROCEDURE TfMatDesplaz.dblCategoriaChange(Sender: TObject);
BEGIN
   IF DM1.cdsDLabo.Locate('RESUMEID', dblCategoria.Text, []) THEN
   BEGIN
      EdtCategoria.Text := DM1.cdsDLabo.fieldbyname('RESUMEDES').AsString;
   END
   ELSE
   BEGIN
      IF Length(dblCategoria.Text) <> 1 THEN
      BEGIN
         Beep;
         EdtCategoria.Text := '';
      END;
   END;
END;

PROCEDURE TfMatDesplaz.dblOriOtoChange(Sender: TObject);
VAR
   xSQL: STRING;
BEGIN
   IF DM1.cdsOfdes.Locate('OFDESID', dblOriOto.Text, []) THEN
   BEGIN
      EdtOfDes.Text := DM1.cdsOfdes.fieldbyname('OFDESNOM').AsString;
      xSQL := 'SELECT A.USEID,B.USENOM FROM RIE_EST_GEN A,APO101 B WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) + ' AND CFC_F IS NOT NULL ' +
      'AND A.OFDESID=' + QuotedStr(dblOriOto.Text) + ' AND A.UPROID=B.UPROID(+) AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) GROUP BY A.USEID,B.USENOM ';
      DM1.cdsUSES.Close;
      Screen.Cursor := crHourGlass;
      DM1.cdsUSES.DataRequest(xSQL);
      DM1.cdsUSES.Open;
      IF DM1.cdsUSES.RecordCount > 0 THEN
         dblUses.Enabled := True
      ELSE
         dblUses.Enabled := False;
      Screen.Cursor := crDefault;

   END
   ELSE
   BEGIN
      IF Length(dblOriOto.Text) <> 2 THEN
      BEGIN
         Beep;
         EdtOfDes.Text := '';
      END;
   END;
END;

PROCEDURE TfMatDesplaz.dblDptoChange(Sender: TObject);
VAR
   xSQL: STRING;
BEGIN
   IF DM1.cdsMovCre.Locate('DPTOID', dblDpto.Text, []) THEN
   BEGIN
      EdtDepart.Text := DM1.cdsMovCre.fieldbyname('DPTODES').AsString;
      xSQL := 'SELECT A.USEID,B.USENOM FROM RIE_EST_GEN A,APO101 B WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) + ' AND CFC_F IS NOT NULL ' +
      'AND A.DPTOID=' + QuotedStr(dblDpto.Text) + ' AND A.UPROID=B.UPROID(+) AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) GROUP BY A.USEID,B.USENOM ';
      DM1.cdsUSES.Close;
      Screen.Cursor := crHourGlass;
      DM1.cdsUSES.DataRequest(xSQL);
      DM1.cdsUSES.Open;
      IF DM1.cdsUSES.RecordCount > 0 THEN
         dblUses.Enabled := True
      ELSE
         dblUses.Enabled := False;
      Screen.Cursor := crDefault;

   END
   ELSE
   BEGIN
      IF Length(dblDpto.Text) <> 2 THEN
      BEGIN
         Beep;
         EdtDepart.Text := '';
      END;
   END;
END;

PROCEDURE TfMatDesplaz.rdbSeleccionClick(Sender: TObject);
BEGIN
   IF rdbSeleccion.ItemIndex = 0 THEN
   BEGIN
      dblDpto.Visible := True;
      lblDepto.Visible := True;
      pnlDpto.Visible := True;
      dblOriOto.Visible := False;
      lblOrigen.Visible := False;
      pnlOrigen.Visible := False;
   END;
   IF rdbSeleccion.ItemIndex = 1 THEN
   BEGIN
      dblDpto.Visible := False;
      lblDepto.Visible := False;
      pnlDpto.Visible := False;
      dblOriOto.Visible := True;
      lblOrigen.Visible := True;
      pnlOrigen.Visible := True;
   END;

END;

PROCEDURE TfMatDesplaz.BitMostrarClick(Sender: TObject);
VAR
   xSQL, xSeleccion, xOriAnt, xUses, xDias, xCampo00, xCampo01, xCampo02, xCampo03: STRING;
BEGIN
   IF Length(Trim(dblCategoria.Text)) = 0 THEN
   BEGIN
      MessageDlg('SELECCIONE UNA CATEGORIA DE RIESGO!!!', mtError, [mbOk], 0);
      Exit;
   END;
   xOriAnt := ' ';
   xCampo00 := ' ';
   IF Length(Trim(dblCatAnt.Text)) > 0 THEN
   BEGIN

      Case rdbSelPer.ItemIndex Of
           0: Begin xOriAnt := ' AND CFC_A=' + QuotedStr(dblCatAnt.Text); xCampo03:='CFCDES_A'; End;
           1: Begin xOriAnt := ' AND CFC_T=' + QuotedStr(dblCatAnt.Text); xCampo03:='CFCDES_T'; End;
           2: Begin xOriAnt := ' AND CFC_S=' + QuotedStr(dblCatAnt.Text); xCampo03:='CFCDES_S'; End;
           3: Begin xOriAnt := ' AND CFC_Y=' + QuotedStr(dblCatAnt.Text); xCampo03:='CFCDES_Y'; End;
      End;

   END;

   xCampo01 := '';
   CASE rdbSeleccion.ItemIndex OF
      -1:
         BEGIN
            xSeleccion := ' ';
            xCampo01 := '';
         END;

      0:
         BEGIN
            xSeleccion := ' AND B.DPTOID=' + QuotedStr(dblDpto.Text);
            xCampo01 := ',' + QuotedStr(EdtDepart.Text) + ' DPTODES';
         END;
      1:
         BEGIN
            xSeleccion := ' AND A.OFDESID=' + QuotedStr(dblOriOto.Text);
            xCampo01 := ',' + QuotedStr(EdtOfDes.Text) + ' OFDESNOM';
         END;
   END;
   xUses := '';
   xCampo02 := '';
   IF Length(Trim(dblUses.Text)) > 0 THEN
   BEGIN
      xUses := ' AND B.USEID=' + QuotedStr(dblUses.Text);
      xCampo02 := ',' + QuotedStr(EdtDesUse.Text) + ' USENOM';
   END;
   xDias := ' ';
   IF ChkAntiguedad.Checked THEN
   BEGIN
      IF DM1.Valores(SpInicio.Text) > DM1.Valores(SpFin.Text) THEN
      BEGIN
         MessageDlg(' El Valor de Inicio No Puede Ser Mayor Que Al Valor Final!!', mtError, [mbOk], 0);
         Exit;
      END;

      IF DM1.Valores(SpFin.Text) = 0 THEN
      BEGIN
         MessageDlg(' El Valor Final No Puede Ser 0!!', mtError, [mbOk], 0);
         Exit;
      END;
      xDias := ' AND A.DIASTRANS BETWEEN ' + QuotedStr(SpInicio.Text) + ' AND ' + QuotedStr(SpFin.Text) + ' ';
   END;

   Screen.Cursor := crHourGlass;

   // Inicio HPC_201501_RSG
   xSQL:='SELECT A.TIPASO,A.ASOID,B.DPTOID DPTOID,C.DPTODES DPTODES,B.USEID USEID,B.USENOM USENOM, '+
         'A.ASODNI,A.ASOAPENOM,CFCDES_F,A.DIASTRANS,SALDOS_FT,SALDOS_FP,SALDOS_FV,SALDOS_PV,CFCDES_F, CFCDES_A,  '+
         'TO_CHAR(MIN(CREFOTORG),''YYYYMM'') ANOOTO FROM RIE_EST_GEN A,APO101 B,APO158 C,SAL000 D WHERE PERACT='+QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]))+' AND CFC_F IS NOT NULL '+
         'AND CFC_F='+ QuotedStr(dblCategoria.Text) + xOriAnt + xSeleccion + xUses + xDias +' AND A.UPROID=B.UPROID(+) '+
         'AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) AND B.DPTOID=C.DPTOID(+) AND A.ASOID=D.ASOID(+) AND D.PERIODO='+QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]))+' GROUP BY '+
         'A.TIPASO,A.ASOID,B.DPTOID,C.DPTODES,B.USEID,B.USENOM,A.ASODNI,A.ASOAPENOM,CFCDES_F,A.DIASTRANS,SALDOS_FT,SALDOS_FP,SALDOS_FV,SALDOS_PV,CFCDES_F, CFCDES_A '+
         'ORDER BY B.DPTOID,C.DPTODES,B.USEID,B.USENOM,A.CFCDES_F,CFCDES_A ';
   // Fin HPC_201501_RSG

   DM1.cdsSobrino.Close;
   DM1.cdsSobrino.DataRequest(xSQL);
   DM1.cdsSobrino.Open;
   lblCount.Caption := 'Reg: ' + IntToStr(dtgDatos.DataSource.DataSet.RecordCount);
   Screen.Cursor := crDefault;

END;

PROCEDURE TfMatDesplaz.dblUsesChange(Sender: TObject);
BEGIN
   IF DM1.cdsUSES.Locate('USEID', dblUses.text, []) THEN
   BEGIN
      EdtDesUse.Text := DM1.cdsUSES.FieldByName('USENOM').Asstring;
   END
   ELSE
   BEGIN
      IF Length(dblUses.Text) <> 2 THEN
      BEGIN
         Beep;
         EdtDesUse.Text := '';
      END;
   END
END;

PROCEDURE TfMatDesplaz.LimpiaGrid05;
VAR
   xSQL: String;
BEGIN
   xSQL := 'SELECT ASODNI,ASOAPENOM,CFCDES_F,DIASTRANS,SALDOS_FT,SALDOS_FP,SALDOS_FV,SALDOS_PV ' +
      'FROM RIE_EST_GEN WHERE 1=2 AND PERACT=' + QuotedStr('XXXXXX') + ' AND CFC_F IS NOT NULL AND CFC_F=' + QuotedStr('/');
   DM1.cdsSobrino.Close;
   DM1.cdsSobrino.DataRequest(xSQL);
   DM1.cdsSobrino.Open;
   lblCount.Caption := 'Reg: 0';

END;

PROCEDURE TfMatDesplaz.PageControl1Change(Sender: TObject);
var
  xSQL: String;
Begin
   If dtgCabRiesgos.DataSource.DataSet.RecordCount=0 Then Begin PageControl1.TabIndex:=0; PageControl2.TabIndex:=0; End;
   // Inicio HPC_201501_RSG
   If TabSheet1.Showing Then
     Begin
        SumaFooter('01');
        SumaFooter('07');
        cmbConsulta.Enabled:=True;
        chkProceso.Enabled:=True;
        dbsAnoIni.Enabled:=True;
        dbsMesIni.Enabled:=True;
     End;
   If TabSheet2.Showing Then
     Begin
        SumaFooter('02');
        SumaFooter('05');
        SumaFooter('06');
        cmbConsulta.Enabled:=True;
        chkProceso.Enabled:=True;
        dbsAnoIni.Enabled:=True;
        dbsMesIni.Enabled:=True;
     End;
   If TabSheet3.Showing Then
     Begin
        SumaFooter('03');
        SumaFooter('04');
        cmbConsulta.Enabled:=True;
        chkProceso.Enabled:=True;
        dbsAnoIni.Enabled:=True;
        dbsMesIni.Enabled:=True;
     End;
   If TabSheet4.Showing Then
     Begin
        cmbConsulta.Enabled:=False;
        chkProceso.Enabled:=False;
        dbsAnoIni.Enabled:=False;
        dbsMesIni.Enabled:=False;
     End;
     // Fin HPC_201501_RSG
     rdbSelPer.ItemIndex:= cmbConsulta.ItemIndex;
END;

Procedure TfMatDesplaz.PageControl2Change(Sender: TObject);
var xSQL:String;
Begin
   If dtgCabRiesgos.DataSource.DataSet.RecordCount=0 Then
       Begin PageControl1.TabIndex:=0; PageControl2.TabIndex:=0; End
   Else Begin  SumaFooter('07');  SumaFooter('09'); End;
End;

PROCEDURE TfMatDesplaz.BitGraficoClick(Sender: TObject);
VAR
   xSQL: STRING;
   xTit: TStrings;
BEGIN
   IF (PageControl1.TabIndex = 0) THEN
   BEGIN
      IF (PageControl2.TabIndex = 0) THEN
      BEGIN
         FChart_MatrizDespGralDetalle := TFChart_MatrizDespGralDetalle.Create(self);
         TRY
            FChart_MatrizDespGralDetalle.xAnho := dbsAnoIni.Text;
            FChart_MatrizDespGralDetalle.xMes := Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]);
            FChart_MatrizDespGralDetalle.showmodal;
         FINALLY
            FChart_MatrizDespGralDetalle.free;
         END;
      END;

      IF (PageControl2.TabIndex = 1) THEN
      BEGIN
         FChart_MatrizDespGral := TFChart_MatrizDespGral.Create(self);
         TRY
            FChart_MatrizDespGral.xAnho := dbsAnoIni.Text;
            FChart_MatrizDespGral.xMes := Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]);
            FChart_MatrizDespGral.xTipo := 'XNUMERO';
            FChart_MatrizDespGral.showmodal;
         FINALLY
            FChart_MatrizDespGral.free;
         END;
      END;

      IF (PageControl2.TabIndex = 2) THEN
      BEGIN
         FChart_MatrizDespGral := TFChart_MatrizDespGral.Create(self);
         TRY
            FChart_MatrizDespGral.xAnho := dbsAnoIni.Text;
            FChart_MatrizDespGral.xMes := Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]);
            FChart_MatrizDespGral.xTipo := 'XMONTO';
            FChart_MatrizDespGral.showmodal;
         FINALLY
            FChart_MatrizDespGral.free;
         END;
      END;

   END;

   IF (PageControl1.TabIndex = 1) THEN
   BEGIN
      FChart_MatrizDespDptoUgel := TFChart_MatrizDespDptoUgel.Create(self);
      TRY
         FChart_MatrizDespDptoUgel.xAnho := dbsAnoIni.Text;
         FChart_MatrizDespDptoUgel.xMes := Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]);
         FChart_MatrizDespDptoUgel.showmodal;
      FINALLY
         FChart_MatrizDespDptoUgel.free;
      END;
   END;

   IF (PageControl1.TabIndex = 2) THEN
   BEGIN
      FChart_MatrizDespDAtraConc := TFChart_MatrizDespDAtraConc.Create(self);
      TRY
         FChart_MatrizDespDAtraConc.xAnho := dbsAnoIni.Text;
         FChart_MatrizDespDAtraConc.xMes := Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))]);
         FChart_MatrizDespDAtraConc.showmodal;
      FINALLY
         FChart_MatrizDespDAtraConc.free;
      END;
   END;

END;
(******************************************************************************)

PROCEDURE TfMatDesplaz.dblCatAntChange(Sender: TObject);
BEGIN
   IF DM1.cdsDSocioE.Locate('RESUMEID', dblCatAnt.Text, []) THEN
   BEGIN
      EdtCatAnt.Text := DM1.cdsDSocioE.fieldbyname('RESUMEDES').AsString;
   END
   ELSE
   BEGIN
      IF Length(dblCatAnt.Text) <> 1 THEN
      BEGIN
         Beep;
         EdtCatAnt.Text := '';
      END;
   END;

END;

PROCEDURE TfMatDesplaz.dtgCabRiesgosDblClick(Sender: TObject);
VAR
   xSQL: STRING;
BEGIN
   IF dtgCabRiesgos.DataSource.DataSet.RecordCount = 0 Then Exit;
   xSQL := 'SELECT B.DPTOID DPTOID,C.DPTODES DPTODES,COUNT(*) ASOCIADOS,SUM(NVL(SALDOS_FT,0)) SALDOS_FT, ' +
           'SUM(NVL(SALDOS_FP,0)) SALDOS_FP,SUM(NVL(SALDOS_FV,0)) SALDOS_FV,SUM(NVL(SALDOS_PV,0)) SALDOS_PV FROM RIE_EST_GEN A,APO101 B,APO158 C ' +
           'WHERE PERACT=' + QuotedStr(dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(dbsMesIni.Text))])) + ' AND  CFC_F=' + QuotedStr(DM1.cdsConsulta.FieldByName('CFC_F').AsString) + ' AND CFC_A=' + QuotedStr(DM1.cdsConsulta.FieldByName('CFC_A').AsString) + ' AND A.UPROID=B.UPROID(+) AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) AND B.DPTOID=C.DPTOID(+) ' +
           'GROUP BY B.DPTOID,C.DPTODES ORDER BY COUNT(*) DESC';
   DM1.cdsConvenio.Close;
   DM1.cdsConvenio.DataRequest(xSQL);
   DM1.cdsConvenio.Open;
   fDetDesplaz := TfDetDesplaz.Create(self);
   fDetDesplaz.lblDesplazados.Caption := 'DE : ' + DM1.cdsConsulta.FieldByName('CFCDES_A').AsString + '  A  ' + DM1.cdsConsulta.FieldByName('CFCDES_F').AsString;
   fDetDesplaz.ShowModal;
   fDetDesplaz.Free;

END;

procedure TfMatDesplaz.chkProcesoClick(Sender: TObject);
begin
If chkProceso.Checked Then
   BitProcesar.Enabled:=True
Else
   BitProcesar.Enabled:=False;
end;


procedure TfMatDesplaz.dtgCons01aDblClick(Sender: TObject);
var xCadena:String;
begin


If (dtgCons01a.FieldName(dtgCons01a.GetActiveCol) = 'CANCELADO') Then
   Begin
      xCadena:= DM1.cdsPadre.fieldbyname('CFC_A').AsString;
      Case xCadena[1] Of
           '0':Begin
                  ShowMessage('CAN-NOR');
               End;
           'A':Begin
                  ShowMessage('CAN-CPP');
               End;
           'B':Begin
                  ShowMessage('CAN-DEF');
               End;
           'C':Begin
                  ShowMessage('CAN-DUD');
               End;
           'D':Begin
                  ShowMessage('CAN-PER');
               End;
      End;
   End;

If (dtgCons01a.FieldName(dtgCons01a.GetActiveCol) = 'NORMAL') Then
   Begin

      xCadena:= DM1.cdsPadre.fieldbyname('CFC_A').AsString;
      Case xCadena[1] Of
           '0':Begin
                  ShowMessage('NOR-NOR');
               End;
           'A':Begin
                  ShowMessage('NOR-CPP');
               End;
           'B':Begin
                  ShowMessage('NOR-DEF');
               End;
           'C':Begin
                  ShowMessage('NOR-DUD');
               End;
           'D':Begin
                  ShowMessage('NOR-PER');
               End;
      End;
   End;

If (dtgCons01a.FieldName(dtgCons01a.GetActiveCol) = 'PROPOT') Then
   Begin
      xCadena:= DM1.cdsPadre.fieldbyname('CFC_A').AsString;
      Case xCadena[1] Of
           '0':Begin
                  ShowMessage('CPP-NOR');
               End;
           'A':Begin
                  ShowMessage('CPP-CPP');
               End;
           'B':Begin
                  ShowMessage('CPP-DEF');
               End;
           'C':Begin
                  ShowMessage('CPP-DUD');
               End;
           'D':Begin
                  ShowMessage('CPP-PER');
               End;
      End;
   End;

If (dtgCons01a.FieldName(dtgCons01a.GetActiveCol) = 'DEFICIENTE') Then
   Begin
   End;

If (dtgCons01a.FieldName(dtgCons01a.GetActiveCol) = 'DUDOSO') Then
   Begin
   End;

If (dtgCons01a.FieldName(dtgCons01a.GetActiveCol) = 'PERDIDA') Then
   Begin
   End;


end;

// Inicio HPC_201501_RSG
procedure TfMatDesplaz.rdgSalCarClick(Sender: TObject);
begin
BitProcesar.OnClick(BitProcesar);
end;

procedure TfMatDesplaz.dtgDatosDblClick(Sender: TObject);
begin

If (cmbConsulta.Text='Mes') And (rdbSelPer.ItemIndex=0 ) Then
   Begin
     fVisorComp:=TfVisorComp.create(self);
     try
        fVisorComp.lblCodAso.Caption:=DM1.cdsSobrino.FieldByName('ASOID').AsString;
        fVisorComp.lblApeNom.Caption:=DM1.cdsSobrino.FieldByName('ASOAPENOM').AsString;
        fVisorComp.lblDNI.Caption:=DM1.cdsSobrino.FieldByName('ASODNI').AsString;
        fVisorComp.lblTipAso.Caption:=DM1.CrgDescrip('ASOID=' + QuotedStr(DM1.cdsSobrino.FieldByName('ASOID').AsString),'APO201', 'ASOTIPID');
        fVisorComp.lblDpto.Caption:=DM1.cdsSobrino.FieldByName('DPTODES').AsString;
        fVisorComp.lblUgel.Caption:=DM1.cdsSobrino.FieldByName('USENOM').AsString;
        fVisorComp.showmodal;
     finally
        fVisorComp.free;
     end;
   End
Else
   MessageDlg('SOLO DISPONIBLE PARA COMPACIÓN CON EL MES ANTERIOR!!', mtError, [mbOk], 0);

end;
procedure TfMatDesplaz.rdbSelPerClick(Sender: TObject);
begin
BitMostrar.OnClick(BitMostrar);
end;
// Fin HPC_201501_RSG

END.
