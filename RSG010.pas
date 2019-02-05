// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fTabControl
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Tablero de control
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG010;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, TeeProcs,
  TeEngine, Chart, DbChart, Db, Series, fcButton, fcImgBtn, fcShapeBtn,
  ColorGrd, jpeg, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppPrnabl,
  ppCtrls, ppBands, ppCache, ppVar, BubbleCh;

type
  TfTabControl = class(TForm)
    BitSalir: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBChart2: TDBChart;
    TabSheet2: TTabSheet;
    DBChart5: TDBChart;
    DBChart6: TDBChart;
    DBChart7: TDBChart;
    DBChart3: TDBChart;
    DBChart4: TDBChart;
    DBChart1: TDBChart;
    cdlgSerie01: TColorDialog;
    cdlgSerie02: TColorDialog;
    cdlgSerie03: TColorDialog;
    cdlgSerie04: TColorDialog;
    cdlgSerie05: TColorDialog;
    TabSheet3: TTabSheet;
    DBChart8: TDBChart;
    DBChart9: TDBChart;
    DBChart10: TDBChart;
    DBChart11: TDBChart;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    BitSalir01: TBitBtn;
    BitSalir02: TBitBtn;
    BitSalir03: TBitBtn;
    imgb04: TImage;
    imgc04: TImage;
    imga04: TImage;
    imgc05: TImage;
    imgc06: TImage;
    imgc07: TImage;
    imgc01: TImage;
    imgc02: TImage;
    imgc03: TImage;
    imga05: TImage;
    imgb05: TImage;
    imgb07: TImage;
    imgb06: TImage;
    imga06: TImage;
    imga07: TImage;
    imga01: TImage;
    imga02: TImage;
    imga03: TImage;
    imgb01: TImage;
    imgb02: TImage;
    imgb03: TImage;
    Shape1: TShape;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image2: TImage;
    Shape2: TShape;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitImprimir: TBitBtn;
    Image01: TImage;
    tRep01: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    Image001: TppImage;
    Image002: TppImage;
    Image003: TppImage;
    Image004: TppImage;
    Image02: TImage;
    Image005: TppImage;
    Image006: TppImage;
    Image007: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    Titulo: TppLabel;
    tRep02: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    Titulo02: TppLabel;
    ppDetailBand2: TppDetailBand;
    Image008: TppImage;
    Image009: TppImage;
    Image010: TppImage;
    ppFooterBand2: TppFooterBand;
    Image011: TppImage;
    BitPrint: TBitBtn;
    procedure BitSalirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BitImprimirClick(Sender: TObject);
    procedure BitPrintClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreaGrafico01(xSQL:String;xTipoGrafico:Integer);
    procedure PintaGrafico01(xTipoGrafico:Integer);
    procedure CreaGrafico02(xSQL:String;xTipoGrafico:Integer);
    procedure PintaGrafico02(xTipoGrafico:Integer);
    procedure CreaGrafico03(xSQL:String;xTipoGrafico:Integer);
    procedure PintaGrafico03(xTipoGrafico:Integer);
    procedure CreaGrafico04(xSQL:String;xTipoGrafico:Integer);
    procedure PintaGrafico04(xTipoGrafico:Integer);
    procedure CreaGrafico05(xSQL:String;xTipoGrafico:Integer);
    procedure PintaGrafico05(xTipoGrafico:Integer);
    procedure CreaGrafico06(xSQL:String;xTipoGrafico:Integer);
    procedure PintaGrafico06(xTipoGrafico:Integer);
    procedure CreaGrafico07(xSQL:String;xTipoGrafico:Integer);
    procedure PintaGrafico07(xTipoGrafico:Integer);
    procedure CreaGrafico08(xSQL:String;xTipoGrafico:Integer);
    procedure PintaGrafico08(xTipoGrafico:Integer);
    procedure CreaGrafico09(xSQL:String;xTipoGrafico:Integer);
    procedure PintaGrafico09(xTipoGrafico:Integer);
    procedure CreaGrafico10(xSQL:String;xTipoGrafico:Integer);
    procedure PintaGrafico10(xTipoGrafico:Integer);
    procedure CreaGrafico11(xSQL:String;xTipoGrafico:Integer);
    procedure PintaGrafico11(xTipoGrafico:Integer);

    procedure Semaforo(xIndicador:String);

  public
    { Public declarations }
  end;

var
  fTabControl: TfTabControl;
  xPeriodo:String;
implementation

uses RSGDM1;

{$R *.dfm}

procedure TfTabControl.BitSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfTabControl.CreaGrafico01(xSQL: String; xTipoGrafico: Integer);
begin
   Screen.Cursor := crHourGlass;
   DM1.cdsQry1.Close;
   DM1.cdsQry1.DataRequest(xSQL);
   DM1.cdsQry1.Open;
   PintaGrafico01(xTipoGrafico);
   Screen.Cursor := crDefault;
end;


procedure TfTabControl.PintaGrafico01(xTipoGrafico: Integer);
var
   xFieldDefList: TFieldDefList;
   i: integer;
   i2: integer;
   vContPuntos: integer;
   MySerie: TChartSeries;
   xIndex: STRING;
Begin

   xFieldDefList := DM1.cdsQry1.FieldDefList;
   xIndex :=xFieldDefList.FieldDefs[0].Name; // toma el primer dato para el EjeX
   i2 := 0;
   For i := 0 TO xFieldDefList.Count - 1 Do
   Begin
      If xFieldDefList.FieldDefs[i].Name <> xIndex Then
      Begin
         If xTipoGrafico=1 Then
            Begin
             DBChart1.AddSeries(TBarSeries.Create(self));
             TBarSeries(DBChart1.Series[i2]).BarPen.Visible := false;
             TBarSeries(DBChart1.Series[i2]).BarWidthPercent := 40;
             TBarSeries(DBChart1.Series[i2]).BarPen.Visible := false;
             TBarSeries(DBChart1.Series[i2]).BarWidthPercent := 40;
             End;
         DBChart1.Series[i2].DataSource := DM1.cdsQry1;
         DBChart1.Series[i2].XLabelsSource := xIndex;
         DBChart1.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;
         DBChart1.Series[i2].valueFormat := '##,###,###';
         DBChart1.Series[i2].Marks.Style := smsValue;
         DBChart1.Series[i2].Marks.Visible:=True;
         DBChart1.Legend.Visible:=False;


         DBChart1.View3D := True;
         DBChart1.Chart3DPercent := 40;
         DBChart1.View3DOptions.Elevation := 315;
         DBChart1.Series[i2].Marks.ArrowLength := 30;
         DBChart1.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         TBarSeries(DBChart1.Series[i2]).UseYOrigin := True;
         TBarSeries(DBChart1.Series[i2]).BarStyle := bsRectGradient;
      End;
   End;
   DBChart1.Series[0].ColorEachPoint:= True  ;
   DBChart1.Series[i2].SeriesColor:=cdlgSerie04.Color;
   DBChart1.RefreshData;


end;

procedure TfTabControl.FormActivate(Sender: TObject);
var xSQL:String;
begin
xPeriodo:=DM1.UltCartera;
// 1
xSQL:='SELECT MESDES,SALDOS SALDOS_FT FROM RSG_RES_CAL_CAR WHERE RESUMENID='+QuotedStr('01')+' ORDER BY PERIODO';
CreaGrafico01(xSQL,1); Semaforo('01');

xSQL:='SELECT MESDES,SALDOS SALDOS_FV FROM RSG_RES_CAL_CAR WHERE RESUMENID='+QuotedStr('02')+' ORDER BY PERIODO';
CreaGrafico02(xSQL,1); Semaforo('02');

xSQL:='SELECT MESDES,SALDOS SALDOS_PV FROM RSG_RES_CAL_CAR WHERE RESUMENID='+QuotedStr('03')+' ORDER BY PERIODO';
CreaGrafico03(xSQL,1); Semaforo('03');

//*****************

// 2
xSQL:='SELECT MESSAA,ROUND(CAR_CRIT,2) CAR_CRIT FROM RSG_RES_IND_GES WHERE IDCONS=''01'' ORDER BY PERIODO';
CreaGrafico04(xSQL,1); Semaforo('04');


xSQL:='SELECT MESSAA,ROUND(CAR_ALTO,2) CAR_ALTO FROM RSG_RES_IND_GES WHERE IDCONS=''01'' ORDER BY PERIODO';
CreaGrafico05(xSQL,1);  Semaforo('05');

xSQL:='SELECT MESSAA,ROUND(IND_MOR,2) IND_MOR FROM RSG_RES_IND_GES WHERE IDCONS=''01'' ORDER BY PERIODO';
CreaGrafico06(xSQL,1);  Semaforo('06');

xSQL:='SELECT MESSAA,ROUND(RAT_COB,2) RAT_COB FROM RSG_RES_IND_GES WHERE IDCONS=''01'' ORDER BY PERIODO';
CreaGrafico07(xSQL,1);  Semaforo('07');
  //*****************
// 3
xSQL:='SELECT MESABR, '+
            ' ROUND(SALDOS/1000,4) SALDOS_FTA '+
            ' FROM RSG_RES_CAL_CAR WHERE RESUMENID='+QuotedStr('AA')+' ORDER BY PERIODO';
CreaGrafico08(xSQL,1);

xSQL:='SELECT MESABR, '+
            ' ROUND(SALDOS/1000,4) SALDOS_FVA '+
            ' FROM RSG_RES_CAL_CAR WHERE RESUMENID='+QuotedStr('BB')+' ORDER BY PERIODO';
CreaGrafico09(xSQL,1);

xSQL:='SELECT MESABR, '+
            ' ROUND(SALDOS/1000,4) SALDOS_PVA '+
       ' FROM RSG_RES_CAL_CAR WHERE RESUMENID='+QuotedStr('CC')+' ORDER BY PERIODO';
CreaGrafico10(xSQL,1);
// 4
xSQL:='SELECT MESSAA, '+
            ' ROUND(IND_MOR,2) IND_MOR_A '+
       ' FROM RSG_RES_IND_GES WHERE IDCONS=''02'' ORDER BY PERIODO';
CreaGrafico11(xSQL,1);

PageControl1.ActivePageIndex:=0;
end;

procedure TfTabControl.CreaGrafico02(xSQL: String; xTipoGrafico: Integer);
begin
   Screen.Cursor := crHourGlass;
   DM1.cdsGradoA.Close;
   DM1.cdsGradoA.DataRequest(xSQL);
   DM1.cdsGradoA.Open;
   PintaGrafico02(xTipoGrafico);
   Screen.Cursor := crDefault;
end;

procedure TfTabControl.PintaGrafico02(xTipoGrafico: Integer);
var
   xFieldDefList: TFieldDefList;
   i: integer;
   i2: integer;
   vContPuntos: integer;
   MySerie: TChartSeries;
   xIndex: STRING;
Begin
   xFieldDefList := DM1.cdsGradoA.FieldDefList;
   xIndex :=xFieldDefList.FieldDefs[0].Name; // toma el primer dato para el EjeX
   i2 := 0;
   For i := 0 TO xFieldDefList.Count - 1 Do
   Begin
      If xFieldDefList.FieldDefs[i].Name <> xIndex Then
      Begin
         If xTipoGrafico=1 Then
            Begin
              DBChart2.AddSeries(TBarSeries.Create(self));
              TBarSeries(DBChart2.Series[i2]).BarPen.Visible := false;
              TBarSeries(DBChart2.Series[i2]).BarWidthPercent := 40;
             End;
         DBChart2.Series[i2].DataSource := DM1.cdsGradoA;
         DBChart2.Series[i2].XLabelsSource := xIndex;
         DBChart2.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;
         DBChart2.Series[i2].valueFormat := '##,###,###';
         DBChart2.Series[i2].Marks.Style := smsValue;
         DBChart2.Series[i2].Marks.Visible:=True;
         DBChart2.Legend.Visible:=False;
         DBChart2.View3D := True;
         DBChart2.Chart3DPercent := 40;
         DBChart2.View3DOptions.Elevation := 315;
         DBChart2.Series[i2].Marks.ArrowLength := 30;
         DBChart2.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         TBarSeries(DBChart2.Series[i2]).UseYOrigin := True;
         TBarSeries(DBChart2.Series[i2]).BarStyle := bsRectGradient;

      End;
   End;
   DBChart2.Series[i2].SeriesColor:=cdlgSerie02.Color;
   DBChart2.RefreshData;


end;



procedure TfTabControl.CreaGrafico03(xSQL: String; xTipoGrafico: Integer);
begin
   Screen.Cursor := crHourGlass;
   DM1.cdsQry3.Close;
   DM1.cdsQry3.DataRequest(xSQL);
   DM1.cdsQry3.Open;
   PintaGrafico03(xTipoGrafico);
   Screen.Cursor := crDefault;
end;

procedure TfTabControl.PintaGrafico03(xTipoGrafico: Integer);
var
   xFieldDefList: TFieldDefList;
   i: integer;
   i2: integer;
   vContPuntos: integer;
   MySerie: TChartSeries;
   xIndex: STRING;
Begin
   xFieldDefList := DM1.cdsQry3.FieldDefList;
   xIndex :=xFieldDefList.FieldDefs[0].Name; // toma el primer dato para el EjeX
   i2 := 0;
   For i := 0 TO xFieldDefList.Count - 1 Do
   Begin
      If xFieldDefList.FieldDefs[i].Name <> xIndex Then
      Begin
         If xTipoGrafico=1 Then
            Begin
              DBChart3.AddSeries(TBarSeries.Create(self));
              TBarSeries(DBChart3.Series[i2]).BarPen.Visible := false;
              TBarSeries(DBChart3.Series[i2]).BarWidthPercent := 40;
             End;
         DBChart3.Series[i2].DataSource := DM1.cdsQry3;
         DBChart3.Series[i2].XLabelsSource := xIndex;
         DBChart3.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;
         DBChart3.Series[i2].valueFormat := '##,###,###';
         DBChart3.Series[i2].Marks.Style := smsValue;
         DBChart3.Series[i2].Marks.Visible:=True;
         DBChart3.Legend.Visible:=False;
         DBChart3.View3D := True;
         DBChart3.Chart3DPercent := 40;
         DBChart3.View3DOptions.Elevation := 315;
         DBChart3.Series[i2].Marks.ArrowLength := 30;
         DBChart3.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         TBarSeries(DBChart3.Series[i2]).UseYOrigin := True;
         TBarSeries(DBChart3.Series[i2]).BarStyle := bsRectGradient;

      End;
   End;
   DBChart3.Series[i2].SeriesColor:=cdlgSerie03.Color;
   DBChart3.RefreshData;

end;

procedure TfTabControl.CreaGrafico04(xSQL: String; xTipoGrafico: Integer);
begin
   Screen.Cursor := crHourGlass;
   DM1.cdsQry4.Close;
   DM1.cdsQry4.DataRequest(xSQL);
   DM1.cdsQry4.Open;
   PintaGrafico04(xTipoGrafico);
   Screen.Cursor := crDefault;
end;

procedure TfTabControl.PintaGrafico04(xTipoGrafico: Integer);
var
   xFieldDefList: TFieldDefList;
   i: integer;
   i2: integer;
   vContPuntos: integer;
   MySerie: TChartSeries;
   xIndex: STRING;
Begin
   xFieldDefList := DM1.cdsQry4.FieldDefList;
   xIndex :=xFieldDefList.FieldDefs[0].Name; // toma el primer dato para el EjeX
   i2 := 0;
   For i := 0 TO xFieldDefList.Count - 1 Do
   Begin
      If xFieldDefList.FieldDefs[i].Name <> xIndex Then
      Begin
         If xTipoGrafico=1 Then
            Begin
              DBChart4.AddSeries(TBarSeries.Create(self));
              TBarSeries(DBChart4.Series[i2]).BarPen.Visible := false;
              TBarSeries(DBChart4.Series[i2]).BarWidthPercent := 40;
             End;
         DBChart4.Series[i2].DataSource := DM1.cdsQry4;
         DBChart4.Series[i2].XLabelsSource := xIndex;
         DBChart4.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;
         DBChart4.Series[i2].valueFormat := '##,###,###.#0';
         DBChart4.Series[i2].Marks.Style := smsValue;
         DBChart4.Series[i2].Marks.Visible:=True;
         DBChart4.Legend.Visible:=False;
         DBChart4.View3D := True;
         DBChart4.Chart3DPercent := 40;
         DBChart4.View3DOptions.Elevation := 315;
         DBChart4.Series[i2].Marks.ArrowLength := 30;
         DBChart4.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         TBarSeries(DBChart4.Series[i2]).UseYOrigin := True;
         TBarSeries(DBChart4.Series[i2]).BarStyle := bsRectGradient;

      End;
   End;
   DBChart4.RefreshData;
   DBChart4.Series[i2].SeriesColor:=cdlgSerie04.Color;

end;

procedure TfTabControl.CreaGrafico05(xSQL: String; xTipoGrafico: Integer);
begin
   Screen.Cursor := crHourGlass;
   DM1.cdsQry5.Close;
   DM1.cdsQry5.DataRequest(xSQL);
   DM1.cdsQry5.Open;
   PintaGrafico05(xTipoGrafico);
   Screen.Cursor := crDefault;

end;

procedure TfTabControl.PintaGrafico05(xTipoGrafico: Integer);
var
   xFieldDefList: TFieldDefList;
   i: integer;
   i2: integer;
   vContPuntos: integer;
   MySerie: TChartSeries;
   xIndex: STRING;
Begin
   xFieldDefList := DM1.cdsQry5.FieldDefList;
   xIndex :=xFieldDefList.FieldDefs[0].Name; // toma el primer dato para el EjeX
   i2 := 0;
   For i := 0 TO xFieldDefList.Count - 1 Do
   Begin
      If xFieldDefList.FieldDefs[i].Name <> xIndex Then
      Begin
         If xTipoGrafico=1 Then
            Begin
              DBChart5.AddSeries(TBarSeries.Create(self));
              TBarSeries(DBChart5.Series[i2]).BarPen.Visible := false;
              TBarSeries(DBChart5.Series[i2]).BarWidthPercent := 40;
             End;
         DBChart5.Series[i2].DataSource := DM1.cdsQry5;
         DBChart5.Series[i2].XLabelsSource := xIndex;
         DBChart5.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;
         DBChart5.Series[i2].valueFormat := '##,###,###.#0';
         DBChart5.Series[i2].Marks.Style := smsValue;
         DBChart5.Series[i2].Marks.Visible:=True;
         DBChart5.Legend.Visible:=False;
         DBChart5.View3D := True;
         DBChart5.Chart3DPercent := 40;
         DBChart5.View3DOptions.Elevation := 315;
         DBChart5.Series[i2].Marks.ArrowLength := 30;
         DBChart5.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         TBarSeries(DBChart5.Series[i2]).UseYOrigin := True;
         TBarSeries(DBChart5.Series[i2]).BarStyle := bsRectGradient;

      End;
   End;
   DBChart5.RefreshData;
   DBChart5.Series[i2].SeriesColor:=cdlgSerie05.Color;


end;

procedure TfTabControl.CreaGrafico06(xSQL: String; xTipoGrafico: Integer);
begin
   Screen.Cursor := crHourGlass;
   DM1.cdsQry6.Close;
   DM1.cdsQry6.DataRequest(xSQL);
   DM1.cdsQry6.Open;
   PintaGrafico06(xTipoGrafico);
   Screen.Cursor := crDefault;

end;

procedure TfTabControl.PintaGrafico06(xTipoGrafico: Integer);
var
   xFieldDefList: TFieldDefList;
   i: integer;
   i2: integer;
   vContPuntos: integer;
   MySerie: TChartSeries;
   xIndex: STRING;
Begin
   xFieldDefList := DM1.cdsQry6.FieldDefList;
   xIndex :=xFieldDefList.FieldDefs[0].Name; // toma el primer dato para el EjeX
   i2 := 0;
   For i := 0 TO xFieldDefList.Count - 1 Do
   Begin
      If xFieldDefList.FieldDefs[i].Name <> xIndex Then
      Begin
         If xTipoGrafico=1 Then
            Begin
              DBChart6.AddSeries(TBarSeries.Create(self));
              TBarSeries(DBChart6.Series[i2]).BarPen.Visible := false;
              TBarSeries(DBChart6.Series[i2]).BarWidthPercent := 40;
             End;
         DBChart6.Series[i2].DataSource := DM1.cdsQry6;
         DBChart6.Series[i2].XLabelsSource := xIndex;
         DBChart6.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;
         DBChart6.Series[i2].valueFormat := '##,###,###.#0';
         DBChart6.Series[i2].Marks.Style := smsValue;
         DBChart6.Series[i2].Marks.Visible:=True;
         DBChart6.Legend.Visible:=False;
         DBChart6.View3D := True;
         DBChart6.Chart3DPercent := 40;
         DBChart6.View3DOptions.Elevation := 315;
         DBChart6.Series[i2].Marks.ArrowLength := 30;
         DBChart6.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         TBarSeries(DBChart6.Series[i2]).UseYOrigin := True;
         TBarSeries(DBChart6.Series[i2]).BarStyle := bsRectGradient;

      End;
   End;
   DBChart6.Series[i2].SeriesColor:=cdlgSerie01.Color;
   DBChart6.RefreshData;

end;

procedure TfTabControl.CreaGrafico07(xSQL: String; xTipoGrafico: Integer);
begin
   Screen.Cursor := crHourGlass;
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   PintaGrafico07(xTipoGrafico);
   Screen.Cursor := crDefault;
end;

procedure TfTabControl.PintaGrafico07(xTipoGrafico: Integer);
var
   xFieldDefList: TFieldDefList;
   i: integer;
   i2: integer;
   vContPuntos: integer;
   MySerie: TChartSeries;
   xIndex: STRING;
Begin
   xFieldDefList := DM1.cdsQry.FieldDefList;
   xIndex :=xFieldDefList.FieldDefs[0].Name; // toma el primer dato para el EjeX
   i2 := 0;
   For i := 0 TO xFieldDefList.Count - 1 Do
   Begin
      If xFieldDefList.FieldDefs[i].Name <> xIndex Then
      Begin
         If xTipoGrafico=1 Then
            Begin
              DBChart7.AddSeries(TBarSeries.Create(self));
              TBarSeries(DBChart7.Series[i2]).BarPen.Visible := false;
              TBarSeries(DBChart7.Series[i2]).BarWidthPercent := 40;
             End;
         DBChart7.Series[i2].DataSource := DM1.cdsQry;
         DBChart7.Series[i2].XLabelsSource := xIndex;
         DBChart7.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;
         DBChart7.Series[i2].valueFormat := '##,###,###.#0';
         DBChart7.Series[i2].Marks.Style := smsValue;
         DBChart7.Series[i2].Marks.Visible:=True;
         DBChart7.Legend.Visible:=False;
         DBChart7.View3D := True;
         DBChart7.Chart3DPercent := 40;
         DBChart7.View3DOptions.Elevation := 315;
         DBChart7.Series[i2].Marks.ArrowLength := 30;
         DBChart7.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         TBarSeries(DBChart7.Series[i2]).UseYOrigin := True;
         TBarSeries(DBChart7.Series[i2]).BarStyle := bsRectGradient;

      End;
   End;
   DBChart7.Series[i2].SeriesColor:=cdlgSerie04.Color;
   DBChart7.RefreshData;
end;

procedure TfTabControl.Semaforo(xIndicador: String);
var xSQL:String;
begin
    If xIndicador='01' Then
       Begin
          xSQL:='SELECT CASE WHEN SALANT>SALACT THEN ''R'' WHEN SALANT=SALACT THEN ''A'' WHEN SALANT<SALACT THEN ''V'' '+
                'END SEMAFORO FROM (SELECT A.PERIODO,A.SALDOS SALANT,B.SALDOS SALACT FROM RSG_RES_CAL_CAR A, '+
                '(SELECT PERIODO,SALDOS FROM RSG_RES_CAL_CAR WHERE RESUMENID=''01'' AND PERIODO IN (SELECT MAX(PERIODO) FROM RSG_RES_CAL_CAR WHERE RESUMENID=''01'')) B  '+
                'WHERE RESUMENID=''01'' AND A.PERIODO NOT IN (SELECT MIN(PERIODO) FROM RSG_RES_CAL_CAR  WHERE RESUMENID=''01'') AND A.PERIODO NOT IN (SELECT MAX(PERIODO) FROM RSG_RES_CAL_CAR '+
                'WHERE RESUMENID=''01'') ) ';
          DM1.cdsTUSE.Close;
          DM1.cdsTUSE.DataRequest(xSQL);
          DM1.cdsTUSE.Open;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='R' Then
             Begin
                imgc01.Visible:=True;imga01.Visible:=False;imgb01.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='V' Then
             Begin
                imgc01.Visible:=False;imga01.Visible:=True;imgb01.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='A' Then
             Begin
                imgc01.Visible:=False;imga01.Visible:=False;imgb01.Visible:=True;
             End;
          DM1.cdsTUSE.Close;
       End;
    If xIndicador='02' Then
       Begin
          xSQL:='SELECT CASE WHEN SALANT>SALACT THEN ''V'' WHEN SALANT=SALACT THEN ''A'' WHEN SALANT<SALACT THEN ''R'' '+
                'END SEMAFORO FROM (SELECT A.PERIODO,A.SALDOS SALANT,B.SALDOS SALACT FROM RSG_RES_CAL_CAR A, '+
                '(SELECT PERIODO,SALDOS FROM RSG_RES_CAL_CAR WHERE RESUMENID=''02'' AND PERIODO IN (SELECT MAX(PERIODO) FROM RSG_RES_CAL_CAR WHERE RESUMENID=''02'')) B  '+
                'WHERE RESUMENID=''02'' AND A.PERIODO NOT IN (SELECT MIN(PERIODO) FROM RSG_RES_CAL_CAR  WHERE RESUMENID=''02'') AND A.PERIODO NOT IN (SELECT MAX(PERIODO) FROM RSG_RES_CAL_CAR '+
                'WHERE RESUMENID=''02'') ) ';
          DM1.cdsTUSE.Close;
          DM1.cdsTUSE.DataRequest(xSQL);
          DM1.cdsTUSE.Open;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='R' Then
             Begin
                imgc02.Visible:=True;imga02.Visible:=False;imgb02.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='V' Then
             Begin
                imgc02.Visible:=False;imga02.Visible:=True;imgb02.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='A' Then
             Begin
                imgc02.Visible:=False;imga02.Visible:=False;imgb02.Visible:=True;
             End;
          DM1.cdsTUSE.Close;
       End;
    If xIndicador='03' Then
       Begin
          xSQL:='SELECT CASE WHEN SALANT>SALACT THEN ''V'' WHEN SALANT=SALACT THEN ''A'' WHEN SALANT<SALACT THEN ''R'' '+
                'END SEMAFORO FROM (SELECT A.PERIODO,A.SALDOS SALANT,B.SALDOS SALACT FROM RSG_RES_CAL_CAR A, '+
                '(SELECT PERIODO,SALDOS FROM RSG_RES_CAL_CAR WHERE RESUMENID=''03'' AND PERIODO IN (SELECT MAX(PERIODO) FROM RSG_RES_CAL_CAR WHERE RESUMENID=''03'')) B  '+
                'WHERE RESUMENID=''03'' AND A.PERIODO NOT IN (SELECT MIN(PERIODO) FROM RSG_RES_CAL_CAR  WHERE RESUMENID=''03'') AND A.PERIODO NOT IN (SELECT MAX(PERIODO) FROM RSG_RES_CAL_CAR '+
                'WHERE RESUMENID=''03'') ) ';
          DM1.cdsTUSE.Close;
          DM1.cdsTUSE.DataRequest(xSQL);
          DM1.cdsTUSE.Open;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='R' Then
             Begin
                imgc03.Visible:=True;imga03.Visible:=False;imgb03.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='V' Then
             Begin
                imgc03.Visible:=False;imga03.Visible:=True;imgb03.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='A' Then
             Begin
                imgc03.Visible:=False;imga03.Visible:=False;imgb03.Visible:=True;
             End;
          DM1.cdsTUSE.Close;
       End;
    If xIndicador='04' Then
       Begin
          xSQL:='SELECT CASE WHEN SALANT<SALACT THEN ''R'' WHEN SALANT=SALACT THEN ''A'' WHEN SALANT>SALACT THEN ''V'' END SEMAFORO FROM ( '+
                'SELECT A.PERIODO,ROUND(A.CAR_CRIT,2) SALANT,B.CAR_CRIT SALACT FROM RSG_RES_IND_GES A, (SELECT PERIODO,ROUND(CAR_CRIT,2) CAR_CRIT FROM RSG_RES_IND_GES WHERE IDCONS=''01'' AND PERIODO IN '+
                '(SELECT MAX(PERIODO) FROM RSG_RES_IND_GES WHERE IDCONS=''01'')) B WHERE IDCONS=''01'' AND A.PERIODO NOT IN (SELECT MIN(PERIODO) FROM RSG_RES_IND_GES  WHERE IDCONS=''01'') '+
                'AND A.PERIODO NOT IN (SELECT MAX(PERIODO) FROM RSG_RES_IND_GES WHERE IDCONS=''01'') ) ';
          DM1.cdsTUSE.Close;
          DM1.cdsTUSE.DataRequest(xSQL);
          DM1.cdsTUSE.Open;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='R' Then
             Begin
                imgc04.Visible:=True;imga04.Visible:=False;imgb04.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='V' Then
             Begin
                imgc04.Visible:=False;imga04.Visible:=True;imgb04.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='A' Then
             Begin
                imgc04.Visible:=False;imga04.Visible:=False;imgb04.Visible:=True;
             End;
          DM1.cdsTUSE.Close;
       End;

    If xIndicador='05' Then
       Begin
          xSQL:='SELECT CASE WHEN SALANT<SALACT THEN ''R'' WHEN SALANT=SALACT THEN ''A'' WHEN SALANT>SALACT THEN ''V'' END SEMAFORO FROM ( '+
                'SELECT A.PERIODO,ROUND(A.CAR_ALTO,2) SALANT,B.CAR_ALTO SALACT FROM RSG_RES_IND_GES A, (SELECT PERIODO,ROUND(CAR_ALTO,2) CAR_ALTO FROM RSG_RES_IND_GES WHERE IDCONS=''01'' AND PERIODO IN '+
                '(SELECT MAX(PERIODO) FROM RSG_RES_IND_GES WHERE IDCONS=''01'')) B WHERE IDCONS=''01'' AND A.PERIODO NOT IN (SELECT MIN(PERIODO) FROM RSG_RES_IND_GES  WHERE IDCONS=''01'') '+
                'AND A.PERIODO NOT IN (SELECT MAX(PERIODO) FROM RSG_RES_IND_GES WHERE IDCONS=''01'') ) ';
          DM1.cdsTUSE.Close;
          DM1.cdsTUSE.DataRequest(xSQL);
          DM1.cdsTUSE.Open;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='R' Then
             Begin
                imgc05.Visible:=True;imga05.Visible:=False;imgb05.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='V' Then
             Begin
                imgc05.Visible:=False;imga05.Visible:=True;imgb05.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='A' Then
             Begin
                imgc05.Visible:=False;imga05.Visible:=False;imgb05.Visible:=True;
             End;
          DM1.cdsTUSE.Close;
       End;

    If xIndicador='06' Then
       Begin
          xSQL:='SELECT CASE WHEN SALANT<SALACT THEN ''R'' WHEN SALANT=SALACT THEN ''A'' WHEN SALANT>SALACT THEN ''V'' END SEMAFORO FROM ( '+
                'SELECT A.PERIODO,ROUND(A.IND_MOR,2) SALANT,B.IND_MOR SALACT FROM RSG_RES_IND_GES A, (SELECT PERIODO,ROUND(IND_MOR,2) IND_MOR FROM RSG_RES_IND_GES WHERE IDCONS=''01'' AND PERIODO IN '+
                '(SELECT MAX(PERIODO) FROM RSG_RES_IND_GES WHERE IDCONS=''01'')) B WHERE IDCONS=''01'' AND A.PERIODO NOT IN (SELECT MIN(PERIODO) FROM RSG_RES_IND_GES  WHERE IDCONS=''01'') '+
                'AND A.PERIODO NOT IN (SELECT MAX(PERIODO) FROM RSG_RES_IND_GES WHERE IDCONS=''01'') ) ';
          DM1.cdsTUSE.Close;
          DM1.cdsTUSE.DataRequest(xSQL);
          DM1.cdsTUSE.Open;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='R' Then
             Begin
                imgc06.Visible:=True;imga06.Visible:=False;imgb06.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='V' Then
             Begin
                imgc06.Visible:=False;imga06.Visible:=True;imgb06.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='A' Then
             Begin
                imgc06.Visible:=False;imga06.Visible:=False;imgb06.Visible:=True;
             End;
          DM1.cdsTUSE.Close;
       End;

    If xIndicador='07' Then
       Begin
          xSQL:='SELECT CASE WHEN SALANT<SALACT THEN ''R'' WHEN SALANT=SALACT THEN ''A'' WHEN SALANT>SALACT THEN ''V'' END SEMAFORO FROM ( '+
                'SELECT A.PERIODO,ROUND(A.RAT_COB,2) SALANT,B.RAT_COB SALACT FROM RSG_RES_IND_GES A, (SELECT PERIODO,ROUND(RAT_COB,2) RAT_COB FROM RSG_RES_IND_GES WHERE IDCONS=''01'' AND PERIODO IN '+
                '(SELECT MAX(PERIODO) FROM RSG_RES_IND_GES WHERE IDCONS=''01'')) B WHERE IDCONS=''01'' AND A.PERIODO NOT IN (SELECT MIN(PERIODO) FROM RSG_RES_IND_GES  WHERE IDCONS=''01'') '+
                'AND A.PERIODO NOT IN (SELECT MAX(PERIODO) FROM RSG_RES_IND_GES WHERE IDCONS=''01'') ) ';
          DM1.cdsTUSE.Close;
          DM1.cdsTUSE.DataRequest(xSQL);
          DM1.cdsTUSE.Open;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='R' Then
             Begin
                imgc07.Visible:=True;imga07.Visible:=False;imgb07.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='V' Then
             Begin
                imgc07.Visible:=False;imga07.Visible:=True;imgb07.Visible:=False;
             End;
          If DM1.cdsTUSE.FieldByName('SEMAFORO').AsString='A' Then
             Begin
                imgc07.Visible:=False;imga07.Visible:=False;imgb07.Visible:=True;
             End;
          DM1.cdsTUSE.Close;
       End;


end;

procedure TfTabControl.CreaGrafico08(xSQL: String; xTipoGrafico: Integer);
begin
   Screen.Cursor := crHourGlass;
   DM1.cdsEjecuta.Close;
   DM1.cdsEjecuta.DataRequest(xSQL);
   DM1.cdsEjecuta.Open;
   PintaGrafico08(xTipoGrafico);
   Screen.Cursor := crDefault;

end;

procedure TfTabControl.PintaGrafico08(xTipoGrafico: Integer);
var
   xFieldDefList: TFieldDefList;
   i: integer;
   i2: integer;
   vContPuntos: integer;
   MySerie: TChartSeries;
   xIndex: STRING;
Begin
   xFieldDefList := DM1.cdsEjecuta.FieldDefList;
   xIndex :=xFieldDefList.FieldDefs[0].Name; // toma el primer dato para el EjeX
   i2 := 0;
   For i := 0 TO xFieldDefList.Count - 1 Do
   Begin
      If xFieldDefList.FieldDefs[i].Name <> xIndex Then
      Begin
         If xTipoGrafico=1 Then
            Begin
              DBChart8.AddSeries(TBarSeries.Create(self));
              TBarSeries(DBChart8.Series[i2]).BarPen.Visible := false;
              TBarSeries(DBChart8.Series[i2]).BarWidthPercent := 20;
             End;
         DBChart8.Series[i2].DataSource := DM1.cdsEjecuta;
         DBChart8.Series[i2].XLabelsSource := xIndex;
         DBChart8.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;
         DBChart8.Series[i2].valueFormat := '##,###,###.#0';
         DBChart8.Series[i2].Marks.Style := smsValue;
         DBChart8.Series[i2].Marks.Visible:=True;
         DBChart8.Legend.Visible:=False;
         DBChart8.View3D := True;
         DBChart8.Chart3DPercent := 1;
         DBChart8.View3DOptions.Elevation := 315;
         DBChart8.Series[i2].Marks.ArrowLength := 30;
         DBChart8.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         TBarSeries(DBChart8.Series[i2]).UseYOrigin := True;
         TBarSeries(DBChart8.Series[i2]).BarStyle := bsRectGradient;

      End;
   End;
   DBChart8.Series[i2].SeriesColor:=cdlgSerie03.Color;
   DBChart8.RefreshData;
end;

procedure TfTabControl.CreaGrafico09(xSQL: String; xTipoGrafico: Integer);
begin
   Screen.Cursor := crHourGlass;
   DM1.cdsEstado.Close;
   DM1.cdsEstado.DataRequest(xSQL);
   DM1.cdsEstado.Open;
   PintaGrafico09(xTipoGrafico);
   Screen.Cursor := crDefault;

end;

procedure TfTabControl.PintaGrafico09(xTipoGrafico: Integer);
var
   xFieldDefList: TFieldDefList;
   i: integer;
   i2: integer;
   vContPuntos: integer;
   MySerie: TChartSeries;
   xIndex: STRING;
Begin
   xFieldDefList := DM1.cdsEstado.FieldDefList;
   xIndex :=xFieldDefList.FieldDefs[0].Name; // toma el primer dato para el EjeX
   i2 := 0;
   For i := 0 TO xFieldDefList.Count - 1 Do
   Begin
      If xFieldDefList.FieldDefs[i].Name <> xIndex Then
      Begin
         If xTipoGrafico=1 Then
            Begin
              DBChart9.AddSeries(TBarSeries.Create(self));
              TBarSeries(DBChart9.Series[i2]).BarPen.Visible := false;
              TBarSeries(DBChart9.Series[i2]).BarWidthPercent := 20;
             End;
         DBChart9.Series[i2].DataSource := DM1.cdsEstado;
         DBChart9.Series[i2].XLabelsSource := xIndex;
         DBChart9.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;
         DBChart9.Series[i2].valueFormat := '##,###,###.#0';
         DBChart9.Series[i2].Marks.Style := smsValue;
         DBChart9.Series[i2].Marks.Visible:=True;
         DBChart9.Legend.Visible:=False;
         DBChart9.View3D := True;
         DBChart9.Chart3DPercent := 1;
         DBChart9.View3DOptions.Elevation := 315;
         DBChart9.Series[i2].Marks.ArrowLength := 30;
         DBChart9.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         TBarSeries(DBChart9.Series[i2]).UseYOrigin := True;
         TBarSeries(DBChart9.Series[i2]).BarStyle := bsRectGradient;

      End;
   End;
   DBChart9.Series[i2].SeriesColor:=cdlgSerie04.Color;

   DBChart9.RefreshData;


end;

procedure TfTabControl.CreaGrafico10(xSQL: String; xTipoGrafico: Integer);
begin
   Screen.Cursor := crHourGlass;
   DM1.cdsCtasBco.Close;
   DM1.cdsCtasBco.DataRequest(xSQL);
   DM1.cdsCtasBco.Open;
   PintaGrafico10(xTipoGrafico);
   Screen.Cursor := crDefault;

end;

procedure TfTabControl.PintaGrafico10(xTipoGrafico: Integer);
var
   xFieldDefList: TFieldDefList;
   i: integer;
   i2: integer;
   vContPuntos: integer;
   MySerie: TChartSeries;
   xIndex: STRING;
Begin
   xFieldDefList := DM1.cdsCtasBco.FieldDefList;
   xIndex :=xFieldDefList.FieldDefs[0].Name; // toma el primer dato para el EjeX
   i2 := 0;
   For i := 0 TO xFieldDefList.Count - 1 Do
   Begin
      If xFieldDefList.FieldDefs[i].Name <> xIndex Then
      Begin
         If xTipoGrafico=1 Then
            Begin
              DBChart10.AddSeries(TBarSeries.Create(self));
              TBarSeries(DBChart10.Series[i2]).BarPen.Visible := false;
              TBarSeries(DBChart10.Series[i2]).BarWidthPercent := 20;
             End;
         DBChart10.Series[i2].DataSource := DM1.cdsCtasBco;
         DBChart10.Series[i2].XLabelsSource := xIndex;
         DBChart10.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;
         DBChart10.Series[i2].valueFormat := '##,###,###.#0';
         DBChart10.Series[i2].Marks.Style := smsValue;
         DBChart10.Series[i2].Marks.Visible:=True;
         DBChart10.Legend.Visible:=False;
         DBChart10.View3D := True;
         DBChart10.Chart3DPercent := 1;
         DBChart10.View3DOptions.Elevation := 315;
         DBChart10.Series[i2].Marks.ArrowLength := 30;
         DBChart10.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         TBarSeries(DBChart10.Series[i2]).UseYOrigin := True;
         TBarSeries(DBChart10.Series[i2]).BarStyle := bsRectGradient;

      End;
   End;
   DBChart10.Series[i2].SeriesColor:=cdlgSerie01.Color;
   DBChart10.RefreshData;
end;

procedure TfTabControl.CreaGrafico11(xSQL: String; xTipoGrafico: Integer);
begin
   Screen.Cursor := crHourGlass;
   DM1.cdsCViv.Close;
   DM1.cdsCViv.DataRequest(xSQL);
   DM1.cdsCViv.Open;
   PintaGrafico11(xTipoGrafico);
   Screen.Cursor := crDefault;

end;

procedure TfTabControl.PintaGrafico11(xTipoGrafico: Integer);
var
   xFieldDefList: TFieldDefList;
   i: integer;
   i2: integer;
   vContPuntos: integer;
   MySerie: TChartSeries;
   xIndex: STRING;
Begin
   xFieldDefList := DM1.cdsCViv.FieldDefList;
   xIndex :=xFieldDefList.FieldDefs[0].Name; // toma el primer dato para el EjeX
   i2 := 0;
   For i := 0 TO xFieldDefList.Count - 1 Do
   Begin
      If xFieldDefList.FieldDefs[i].Name <> xIndex Then
      Begin
         If xTipoGrafico=1 Then
            Begin
              DBChart11.AddSeries(TBarSeries.Create(self));
              TBarSeries(DBChart11.Series[i2]).BarPen.Visible := false;
              TBarSeries(DBChart11.Series[i2]).BarWidthPercent := 20;
             End;
         DBChart11.Series[i2].DataSource := DM1.cdsCViv;
         DBChart11.Series[i2].XLabelsSource := xIndex;
         DBChart11.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;
         DBChart11.Series[i2].valueFormat := '##,###,###.#0';
         DBChart11.Series[i2].Marks.Style := smsValue;
         DBChart11.Series[i2].Marks.Visible:=True;
         DBChart11.Legend.Visible:=False;
         DBChart11.View3D := True;
         DBChart11.Chart3DPercent := 1;
         DBChart11.View3DOptions.Elevation := 315;
         DBChart11.Series[i2].Marks.ArrowLength := 30;
         DBChart11.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         TBarSeries(DBChart11.Series[i2]).UseYOrigin := True;
         TBarSeries(DBChart11.Series[i2]).BarStyle := bsRectGradient;

      End;
   End;
   DBChart11.RefreshData;


end;

procedure TfTabControl.PageControl1Change(Sender: TObject);
begin
If TabSheet1.Showing Then fTabControl.WindowState:=wsNormal;
If TabSheet2.Showing Then fTabControl.WindowState:=wsNormal;
If TabSheet3.Showing Then fTabControl.WindowState:=wsMaximized;
end;

procedure TfTabControl.BitImprimirClick(Sender: TObject);
var Image01,Image02: TImage;
begin
Image01 := TImage.Create(Nil);
Image01.Width := DBChart1.Width;
Image01.Height := DBChart1.Height;

DBChart1.Draw(Image01.Canvas, Image01.BoundsRect);
Image001.Picture:=Image01.Picture;
DBChart2.Draw(Image01.Canvas, Image01.BoundsRect);
Image002.Picture:=Image01.Picture;
DBChart3.Draw(Image01.Canvas, Image01.BoundsRect);
Image003.Picture:=Image01.Picture;


Image02 := TImage.Create(Nil);
Image02.Width := DBChart8.Width;
Image02.Height := DBChart8.Height;

DBChart8.Draw(Image02.Canvas, Image02.BoundsRect);
Image004.Picture:=Image02.Picture;

DBChart9.Draw(Image02.Canvas, Image02.BoundsRect);
Image005.Picture:=Image02.Picture;

DBChart10.Draw(Image02.Canvas, Image02.BoundsRect);
Image006.Picture:=Image02.Picture;

DBChart11.Draw(Image02.Canvas, Image02.BoundsRect);
Image007.Picture:=Image02.Picture;


Image01.Destroy;
Image02.Destroy;

Titulo.Caption:='CALIFICACIÓN DE DEUDORES Y EXIGENCIA DE PROVISIONES ';
Titulo.Caption:= UpperCase(Titulo.Caption+' - '+DM1.DesMes(StrToInt(Copy(xPeriodo,5,2)),'N')+' - '+Copy(xPeriodo,1,4));
tRep01.Print;
tRep01.Cancel;

end;

procedure TfTabControl.BitPrintClick(Sender: TObject);
var Image01,Image02: TImage;
begin
Image01 := TImage.Create(Nil);
Image01.Width := DBChart4.Width;
Image01.Height := DBChart4.Height;

DBChart4.Draw(Image01.Canvas, Image01.BoundsRect);
Image008.Picture:=Image01.Picture;

DBChart5.Draw(Image01.Canvas, Image01.BoundsRect);
Image009.Picture:=Image01.Picture;

DBChart6.Draw(Image01.Canvas, Image01.BoundsRect);
Image010.Picture:=Image01.Picture;

DBChart7.Draw(Image01.Canvas, Image01.BoundsRect);
Image011.Picture:=Image01.Picture;

Image01.Destroy;


Titulo02.Caption:='INDICADORES DE GESTIÓN';
Titulo02.Caption:= UpperCase(Titulo02.Caption+' - '+DM1.DesMes(StrToInt(Copy(xPeriodo,5,2)),'N')+' - '+Copy(xPeriodo,1,4));
tRep02.Print;
tRep02.Cancel;


end;

end.
