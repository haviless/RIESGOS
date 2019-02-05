// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fCalfCtaxCob
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Calificacion de deudores y exigencia de provisiones
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG
// HPC_201501_RSG : Nuevo criterio de filtro para carteta de ampliados 
// HPC_201701_RSG : Alinear monto créditos refinanciados con el monto del reporte BDC01
// HPC_201702_RSG : Corrección del cálculo del monto de saldo pendiente y saldo vencido.

unit RSG017;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wwdblook, StdCtrls, ExtCtrls, Wwdbigrd, Wwdbgrid, Grids,
  DBGrids, Mask, wwdbedit, Wwdbspin, Buttons, Db, ppDB, ppDBPipe, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
// Inicio HPC_201701_RSG
// Alinear monto créditos refinanciados con el monto del reporte BDC01
  ppReport, Wwdbdlg, ppEndUsr, ppParameter, ppRichTx, ppStrtch, ppSubRpt,
  ppModule, daDataModule;
// Final HPC_201701_RSG

type
  TfCalfCtaxCob = class(TForm)
    grpCalCar: TGroupBox;
    dtgData: TDBGrid;
    dtgClfCar: TwwDBGrid;
    ppRepClfcar: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppShape9: TppShape;
    ppShape8: TppShape;
    ppShape7: TppShape;
    ppShape5: TppShape;
    ppShape3: TppShape;
    ppShape2: TppShape;
    ppShape1: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLbltit: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppShape6: TppShape;
    ppLabel32: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel58: TppLabel;
    lblOfiDes: TppLabel;
    ppShape10: TppShape;
    ppShape21: TppShape;
    ppLabel194: TppLabel;
    ppLabel200: TppLabel;
    ppLabel201: TppLabel;
    ppLabel202: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppShape11: TppShape;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppLabel4: TppLabel;
    lblIndice: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLine11: TppLine;
    ppLabel72: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLine12: TppLine;
    ppLabel79: TppLabel;
    lblProv: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    lblPorMor: TppLabel;
    lblPorPro: TppLabel;
    ppDBCalc34: TppDBCalc;
    ppDBCalc35: TppDBCalc;
    ppDBResClfCar: TppDBPipeline;
    DataCons: TppDBPipeline;
    RepCons: TppReport;
    ppHeaderBand4: TppHeaderBand;
    LblTitulo01: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppSystemVariable15: TppSystemVariable;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel82: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppDBText11: TppDBText;
    ppDBText28: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppSummaryBand4: TppSummaryBand;
    ppLabel94: TppLabel;
    ppLine15: TppLine;
    ppLine16: TppLine;
    lblIndMor: TppLabel;
    lblrPorMor: TppLabel;
    lblIndPro: TppLabel;
    lblrPorPro: TppLabel;
    RepIntDev: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppShape4: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppLabel110: TppLabel;
    ppLabel119: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppSystemVariable19: TppSystemVariable;
    ppSystemVariable20: TppSystemVariable;
    ppSystemVariable21: TppSystemVariable;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppLbltit01: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLabel134: TppLabel;
    ppShape19: TppShape;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel145: TppLabel;
    ppLabel150: TppLabel;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppLabel159: TppLabel;
    ppLabel160: TppLabel;
    ppLabel162: TppLabel;
    ppLabel163: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText35: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText40: TppDBText;
    ppDBText43: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppSummaryBand7: TppSummaryBand;
    ppShape20: TppShape;
    ppDBCalc20: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppLabel164: TppLabel;
    DbIntDev: TppDBPipeline;
    dtgTmp01: TwwDBGrid;
    dtgTmp02: TwwDBGrid;
    lblmsg01: TppLabel;
    lblmsg02: TppLabel;
    lblmsg03: TppLabel;
    lblTitulo: TppLabel;
    Titulo: TppLabel;
    Rotulo: TppLabel;
    PPDBPInventarios_Inicial: TppDBPipeline;
    PPDBPInventariosppField1: TppField;
    PPDBPInventariosppField2: TppField;
    PPDBPInventariosppField3: TppField;
    PPDBPInventariosppField4: TppField;
    PPDBPInventariosppField5: TppField;
    PPRInventarios: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape12: TppShape;
    ppLabel1: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    PPLTitulo01: TppLabel;
    ppsrInicial: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLine1: TppLine;
    ppsrEntraron: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLine2: TppLine;
    ppsrSalieron: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText13: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppLine3: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc3: TppDBCalc;
    ppLine6: TppLine;
    ppsrFinal: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText29: TppDBText;
    ppSummaryBand6: TppSummaryBand;
    ppLabel2: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppRichText1: TppRichText;
    PPLTitulo21: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppParameterList1: TppParameterList;
    PPDBPInventarios_Entraron: TppDBPipeline;
    PPDBPInventarios_EntraronppField1: TppField;
    PPDBPInventarios_EntraronppField2: TppField;
    PPDBPInventarios_EntraronppField3: TppField;
    PPDBPInventarios_EntraronppField4: TppField;
    PPDBPInventarios_EntraronppField5: TppField;
    PPDBPInventarios_Salieron: TppDBPipeline;
    PPDBPInventarios_SalieronppField1: TppField;
    PPDBPInventarios_SalieronppField2: TppField;
    PPDBPInventarios_SalieronppField3: TppField;
    PPDBPInventarios_SalieronppField4: TppField;
    PPDBPInventarios_SalieronppField5: TppField;
    PPDBPInventarios_Final: TppDBPipeline;
    ppdbpIngresos: TppDBPipeline;
    ppdbpIngresosppField1: TppField;
    ppdbpIngresosppField2: TppField;
    ppdbpIngresosppField3: TppField;
    ppdbpIngresosppField4: TppField;
    pprIngresos: TppReport;
    ppParameterList2: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLabel3: TppLabel;
    ppLabel13: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel54: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText34: TppDBText;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine17: TppLine;
    ppFooterBand1: TppFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape13: TppShape;
    ppShape22: TppShape;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLabel35: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel59: TppLabel;
    ppLine20: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape23: TppShape;
    ppDBCalc4: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppLabel60: TppLabel;
    ppLine21: TppLine;
    ppLine22: TppLine;
    GroupBox1: TGroupBox;
    grbParametros: TGroupBox;
    lblNomMes: TLabel;
    dbsAnoIni: TwwDBSpinEdit;
    dbsMesIni: TwwDBSpinEdit;
    chkNoOficial: TCheckBox;
    BitProcesar: TBitBtn;
    rdbTipCar: TRadioGroup;
    rdbTipAso: TRadioGroup;
    Panel2: TPanel;
    Bevel3: TBevel;
    ChkOfDes: TCheckBox;
    pnlOficinas: TPanel;
    Panel1: TPanel;
    EdtOfiDes: TEdit;
    DBLkOfiDes: TwwDBLookupCombo;
    BitResClfCar: TBitBtn;
    BitConOfi: TBitBtn;
    BitSalir: TBitBtn;
    chk01: TCheckBox;
    chk02: TCheckBox;
    chk03: TCheckBox;
    BitExporta: TBitBtn;
    Bevel4: TBevel;
    BitIntDev: TBitBtn;
    BitIngresos: TBitBtn;
    BitInventarios: TBitBtn;
    BitGrafico: TBitBtn;
    Bevel5: TBevel;
// Inicio HPC_201701_RSG
// Alinear monto créditos refinanciados con el monto del reporte BDC01
    daDataModule1: TdaDataModule;
// Final HPC_201701_RSG
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitSalirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitProcesarClick(Sender: TObject);
    procedure BitResClfCarClick(Sender: TObject);
    procedure ChkOfDesClick(Sender: TObject);
    procedure DBLkOfiDesChange(Sender: TObject);
    procedure BitConOfiClick(Sender: TObject);
    procedure BitIntDevClick(Sender: TObject);
    procedure dbsMesIniChange(Sender: TObject);
    procedure BitExportaClick(Sender: TObject);
    procedure BitGraficoClick(Sender: TObject);
    procedure rdbTipCarClick(Sender: TObject);
    procedure rdbTipAsoClick(Sender: TObject);
    procedure BitIngresosClick(Sender: TObject);
    procedure BitInventariosClick(Sender: TObject);
  private
    { Private declarations }
    Procedure LimpiaGrid;
    procedure CrgGridClfCar(xPos,xWhere:String);
  public
    { Public declarations }
  end;

var
  fCalfCtaxCob: TfCalfCtaxCob;

implementation

uses RSGDM1, RSG114;

{$R *.dfm}

procedure TfCalfCtaxCob.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
  End
end;

procedure TfCalfCtaxCob.BitSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfCalfCtaxCob.FormActivate(Sender: TObject);
begin
  dbsAnoIni.Value:=StrToInt(Copy(DM1.UltCartera,1,4));
  dbsMesIni.Value:=StrToInt(Copy(DM1.UltCartera,5,2));
  lblNomMes.Caption:=DM1.DesMes(StrToInt(dbsMesIni.Text),'N');
  LimpiaGrid;
end;

procedure TfCalfCtaxCob.LimpiaGrid;
var xSQL : String;
begin
    xSQL:='SELECT RESUMEID, '+
                ' RESUMEDES, '+
                ' ROUND(NVL(B.MOVIM,0),4) MOVIM, '+
                ' ROUND(NVL(B.SALDOS,0),4) SALDOS, '+
                ' ROUND(0,4) SALDOS_FV, '+
                ' ROUND(0,4) SALDOS_FP, '+
                ' ROUND(NVL(B.SALDO_CB,0),4) SALDO_CB, '+
                ' ROUND(NVL(B.SALDO_NC,0),4) SALDO_NC, '+
                ' ROUND(A.P_NC,4) P_NC, '+
                ' ROUND(NVL(PORNC,0),4) PORNC, '+
                ' ROUND(A.P_CB,4) P_CB, '+
                ' ROUND(NVL(B.PORCB,0),4) PORCB, '+
                ' ROUND(NVL(B.TOTPROV,0),4) TOTPROV '+
          'FROM COB113 A, (SELECT CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM,SUM(NVL(SALDOS_FT,0)) SALDOS, '+
          'SUM(NVL(SALDO_CB,0)) SALDO_CB,SUM(NVL(SALDO_NC,0)) SALDO_NC,MAX(P_NC) P_NC,(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/100 PORNC,'+
          'MAX(P_CB) P_CB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/100 PORCB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/MAX(100)+(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/MAX(100) TOTPROV '+
          'FROM CFC000,COB113 WHERE 1=2 AND ASOID='+QuotedStr('%$#@^&*!@_')+' AND CFC000.CFC_F=COB113.RESUMEID(+) GROUP BY CFC_F,RESUMEDES) B WHERE A.RESUMEID=B.CFC(+) AND A.RESUMEID=''%'' ORDER BY A.P_NC';
    DM1.cdsModelo.Close;
    DM1.cdsModelo.DataRequest(xSQL);
    DM1.cdsModelo.Open;
    dtgClfCar.ColumnByName('RESUMEDES').FooterValue :='Totales';
    dtgClfCar.ColumnByName('MOVIM').FooterValue := FloatToStrF(0,ffNumber, 10, 0);
    dtgClfCar.ColumnByName('SALDOS').FooterValue := FloatToStrF(0,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('SALDOS_FP').FooterValue := FloatToStrF(0,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('SALDOS_FV').FooterValue := FloatToStrF(0,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('SALDO_CB').FooterValue := FloatToStrF(0,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('SALDO_NC').FooterValue := FloatToStrF(0,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('PORNC').FooterValue := FloatToStrF(0,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('PORCB').FooterValue := FloatToStrF(0,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('TOTPROV').FooterValue := FloatToStrF(0,ffNumber, 15, 2);
end;

// Inicio HPC_201501_RSG
procedure TfCalfCtaxCob.BitProcesarClick(Sender: TObject);
var xWhere,xPeriodo,xPos:String;
begin
  xPeriodo:=Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))]));
  If chkNoOficial.Checked Then xPos:='_TMP' Else xPos:='';
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
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') ';
                      End;
                    1:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''DO'' ';
                      End;
                    2:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''CE'' ';
                      End;
                    3:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''CO'' ';
                      End;
               End;
           End;
         3:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') ';
                      End;
                    1:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''DO'' ';
                      End;
                    2:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''CE'' ';
                      End;
                    3:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''CO'' ';
                      End;
               End;
           End;
  End;
  Try
    If chkNoOficial.Checked Then CrgGridClfCar('_TMP',xWhere) Else CrgGridClfCar('',xWhere);
    Screen.Cursor:= crDefault;
  Except
    DM1.cdsModelo.Close;
    Screen.Cursor:= crDefault;
    MessageDlg(' No Existe Información Procesada Para Ese Periodo ', mtError,[mbOk],0);
  End;
end;
// Fin HPC_201501_RSG


procedure TfCalfCtaxCob.CrgGridClfCar(xPos,xWhere:String);
var xSQL : String;
    xSaldo,xMovim,xSaldo_Cb,xSaldo_Nc,xPorNc,xProCb,xTotProv,xSaldos_Fv,xSaldos_Fp : Currency;
begin
    Screen.Cursor := crHourglass;
// Inicio HPC_201701_RSG
// Alinear monto créditos refinanciados con el monto del reporte BDC01
    if(rdbTipCar.ItemIndex = 2) then
    begin
       xSQL:='SELECT '+
             '        RESUMEID, '+
             '        RESUMEDES, '+
             '        SUM(MOVIM) MOVIM, '+
             '        SUM(SALDOS) SALDOS, '+
             '        SUM(SALDOS_FP) SALDOS_FP, '+
             '        SUM(SALDOS_FV) SALDOS_FV, '+
             '        SUM(SALDO_CB) SALDO_CB, '+
             '        SUM(SALDO_NC) SALDO_NC, '+
             '        P_NC, '+
             '        SUM(PORNC) PORNC, '+
             '        P_CB, '+
             '        SUM(PORCB) PORCB, '+
             '        SUM(TOTPROV) TOTPROV '+
             ' FROM '+
             ' ( '+
             'SELECT RESUMEID, '+
             'RESUMEDES, '+
             'ROUND(NVL(D.MOVIM, 0), 4) MOVIM, '+
             'ROUND(NVL(D.SALDOS, 0), 4) SALDOS, '+
             'ROUND(NVL(D.SALDOS_FP, 0), 4) SALDOS_FP, '+
             'ROUND(NVL(D.SALDOS_FV, 0), 4) SALDOS_FV, '+
             'ROUND(NVL(D.SALDO_CB, 0), 4) SALDO_CB, '+
             'ROUND(NVL(D.SALDO_NC, 0), 4) SALDO_NC, '+
             'ROUND(A.P_NC, 4) P_NC, '+
             'ROUND(NVL(PORNC, 0), 4) PORNC, '+
             'ROUND(A.P_CB, 4) P_CB, '+
             'ROUND(NVL(D.PORCB, 0), 4) PORCB, '+
             'ROUND(NVL(D.TOTPROV, 0), 4) TOTPROV '+
             'FROM COB113 A, '+
             '(SELECT C.ASOID,CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM,C.PORCENTAJE,C.SALTOREF,SALDOS_FT, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN SUM(NVL(C.SALTOREF, 0))  ELSE SUM(NVL(SALDOS_FT, 0)) END SALDOS, '+
                     'CASE WHEN C.PORCENTAJE <> 1 THEN SUM(NVL(C.SALDOS_P, 0)) ELSE SUM(NVL(SALDOS_FP, 0)) END SALDOS_FP, '+
                     'CASE WHEN C.PORCENTAJE <> 1 THEN (SUM(NVL(C.SALDOS_V, 0))) ELSE SUM(NVL(SALDOS_FV, 0)) END SALDOS_FV, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND((SUM(NVL(SALDO_CB, 0)))*(C.PORCENTAJE),2) ELSE SUM(NVL(SALDO_CB, 0)) END SALDO_CB, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND((SUM(NVL(SALDO_NC, 0)))*(C.PORCENTAJE),2) ELSE SUM(NVL(SALDO_NC, 0)) END SALDO_NC, '+
                     'MAX(P_NC) P_NC, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100)*(C.PORCENTAJE),2) ELSE (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100 END PORNC, '+
                     'MAX(P_CB) P_CB, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100)*(C.PORCENTAJE),2) ELSE (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100 END PORCB, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100))*(C.PORCENTAJE),2) '+
                     'ELSE (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) END TOTPROV '+
                     'FROM CFC000'+xPos+', COB113 , '+
                     '( '+
                      'SELECT A.ASOID,A.SALDOS,B.SALTOREF, B.SALDOS_V, B.SALDOS_P,'+
                      ' CASE WHEN A.SALDOS=B.SALTOREF THEN 1 '+
                      '   WHEN A.SALDOS > B.SALTOREF THEN ROUND((B.SALTOREF/A.SALDOS),4) '+
                      ' END PORCENTAJE '+
                      ' FROM '+
                      ' (SELECT ASOID,CFC_F CFC,RESUMEDES CFCDES, '+
                                      ' COUNT(*) MOVIM, '+
                                      ' SUM(NVL(SALDOS_FT, 0)) SALDOS, '+
                                      ' SUM(NVL(SALDOS_FP, 0)) SALDOS_FP, '+
                                      ' SUM(NVL(SALDOS_FV, 0)) SALDOS_FV, '+
                                      ' SUM(NVL(SALDO_CB, 0)) SALDO_CB, '+
                                      ' SUM(NVL(SALDO_NC, 0)) SALDO_NC, '+
                                      ' MAX(P_NC) P_NC, '+
                                      ' (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100 PORNC, '+
                                      ' MAX(P_CB) P_CB, '+
                                      ' (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100 PORCB, '+
                                      ' (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + '+
                                      ' (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) TOTPROV '+
                                 ' FROM CFC000'+xPos+', COB113 WHERE PERIODO ='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+
                                   ' AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) '+xWhere+' '+
                                 ' GROUP BY ASOID,CFC_F, RESUMEDES) A, '+
                                 '( '+
                                 ' SELECT '+
                                 ' ASOID,SUM(SALTOT) SALTOREF , SUM(SALDOS_V) SALDOS_V, SUM(SALDOS_P) SALDOS_P FROM '+
                                 //Inicio HPC_201702_RSG
                                 //Corrección del cálculo del monto de saldo pendiente y saldo vencido.
                                 ' (SELECT ASOID,CREDID, NVL(SALTOT,0) SALTOT, NVL(SALVEN, 0) SALDOS_V, NVL(SALPEN, 0) SALDOS_P FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND TIPDESEID=''10'' AND SUBSTR(CREDID,9,1)=''R'' '+
                                 //Fin HPC_201702_RSG
                                 ' ) '+
                                 ' GROUP BY ASOID '+
                                 ' )B '+
                                 ' WHERE A.ASOID=B.ASOID '+
                                 ' ) C '+
                                 ' WHERE PERIODO = '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+
                                   ' AND CFC000'+xPos+'.ASOID = C.ASOID '+
                                   ' AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) '+ xWhere +
                                 ' GROUP BY C.ASOID,C.SALTOREF,C.PORCENTAJE,SALDOS_FT,CFC_F, RESUMEDES) D  '+
                         ' WHERE A.RESUMEID = D.CFC(+) '+
                         ' ORDER BY A.P_NC'+
                         ' ) '+
                         ' GROUP BY RESUMEID, RESUMEDES , P_NC, P_CB';

    end
    else
    begin
         xSQL:='SELECT RESUMEID, '+
                    ' RESUMEDES, '+
                    ' ROUND(NVL(B.MOVIM,0),4) MOVIM, '+
                    ' ROUND(NVL(B.SALDOS,0),4) SALDOS, '+
                    ' ROUND(NVL(B.SALDOS_FP,0),4) SALDOS_FP, '+
                    ' ROUND(NVL(B.SALDOS_FV,0),4) SALDOS_FV, '+
                    ' ROUND(NVL(B.SALDO_CB,0),4) SALDO_CB, '+
                    ' ROUND(NVL(B.SALDO_NC,0),4) SALDO_NC, '+
                    ' ROUND(A.P_NC,4) P_NC, '+
                    ' ROUND(NVL(PORNC,0),4) PORNC, '+
                    ' ROUND(A.P_CB,4) P_CB, '+
                    ' ROUND(NVL(B.PORCB,0),4) PORCB, '+
                    ' ROUND(NVL(B.TOTPROV,0),4) TOTPROV '+
              'FROM COB113 A, (SELECT CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM,SUM(NVL(SALDOS_FT,0)) SALDOS,SUM(NVL(SALDOS_FP,0)) SALDOS_FP ,SUM(NVL(SALDOS_FV,0)) SALDOS_FV     , '+
              'SUM(NVL(SALDO_CB,0)) SALDO_CB,SUM(NVL(SALDO_NC,0)) SALDO_NC,MAX(P_NC) P_NC,(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/100 PORNC,'+
              'MAX(P_CB) P_CB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/100 PORCB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/MAX(100)+(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/MAX(100) TOTPROV '+
              'FROM CFC000'+xPos+',COB113 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND CFC000'+xPos+'.CFC_F=COB113.RESUMEID(+) '+xWhere+' '+
              'GROUP BY CFC_F,RESUMEDES) B WHERE A.RESUMEID=B.CFC(+) ORDER BY A.P_NC';
    end;
// Final HPC_201701_RSG
    DM1.cdsModelo.Close;
    DM1.cdsModelo.DataRequest(xSQL);
    DM1.cdsModelo.Open;
    TNumericField(DM1.cdsModelo.FieldByName('MOVIM')).DisplayFormat:='###,###,##0';
    TNumericField(DM1.cdsModelo.FieldByName('SALDOS')).DisplayFormat:='###,###,###.#0';
    TNumericField(DM1.cdsModelo.FieldByName('SALDOS_FV')).DisplayFormat:='###,###,###.#0';
    TNumericField(DM1.cdsModelo.FieldByName('SALDOS_FP')).DisplayFormat:='###,###,###.#0';
    TNumericField(DM1.cdsModelo.FieldByName('SALDO_CB')).DisplayFormat:='###,###,###.#0';
    TNumericField(DM1.cdsModelo.FieldByName('SALDO_NC')).DisplayFormat:='###,###,###.#0';
    TNumericField(DM1.cdsModelo.FieldByName('PORNC')).DisplayFormat:='###,###,###.#0';
    TNumericField(DM1.cdsModelo.FieldByName('PORCB')).DisplayFormat:='###,###,###.#0';
    TNumericField(DM1.cdsModelo.FieldByName('TOTPROV')).DisplayFormat:='###,###,###.#0';
    TNumericField(DM1.cdsModelo.FieldByName('P_CB')).DisplayFormat:='###,###,###.#0';
    TNumericField(DM1.cdsModelo.FieldByName('P_NC')).DisplayFormat:='###,###,###.#0';
    xSaldo:=0;xSaldo_Cb:=0;xSaldo_Nc:=0;xPorNc:=0;xProCb:=0;xTotProv:=0;xMovim:=0;
    DM1.cdsModelo.First;
    While Not DM1.cdsModelo.Eof Do
    Begin
       xSaldo := xSaldo + DM1.cdsModelo.FieldByName('SALDOS').AsCurrency;
       xSaldos_Fp := xSaldos_Fp + DM1.cdsModelo.FieldByName('SALDOS_FP').AsCurrency;
       xSaldos_Fv := xSaldos_Fv + DM1.cdsModelo.FieldByName('SALDOS_FV').AsCurrency;
       xMovim := xMovim + DM1.cdsModelo.FieldByName('MOVIM').AsCurrency;
       xSaldo_Cb:=xSaldo_Cb + DM1.cdsModelo.FieldByName('SALDO_CB').AsCurrency;
       xSaldo_Nc:=xSaldo_Nc + DM1.cdsModelo.FieldByName('SALDO_NC').AsCurrency;
       xPorNc:=xPorNc + DM1.cdsModelo.FieldByName('PORNC').AsCurrency;
       xProCb:=xProCb + DM1.cdsModelo.FieldByName('PORCB').AsCurrency;
       xTotProv:=xTotProv + DM1.cdsModelo.FieldByName('TOTPROV').AsCurrency;
       DM1.cdsModelo.Next;
    End;
    dtgClfCar.ColumnByName('RESUMEDES').FooterValue :='Totales';
    dtgClfCar.ColumnByName('MOVIM').FooterValue := FloatToStrF(xMovim,ffNumber, 10, 0);
    dtgClfCar.ColumnByName('SALDOS_FV').FooterValue := FloatToStrF(xSaldos_Fv,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('SALDOS_FP').FooterValue := FloatToStrF(xSaldos_Fp,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('SALDOS').FooterValue := FloatToStrF(xSaldo,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('SALDO_CB').FooterValue := FloatToStrF(xSaldo_Cb,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('SALDO_NC').FooterValue := FloatToStrF(xSaldo_Nc,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('PORNC').FooterValue := FloatToStrF(xPorNc,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('PORCB').FooterValue := FloatToStrF(xProCb,ffNumber, 15, 2);
    dtgClfCar.ColumnByName('TOTPROV').FooterValue := FloatToStrF(xTotProv,ffNumber, 15, 2);
    xSQL:='SELECT RESUMEID,RESUMEDES FROM COB113 WHERE RESUMEID NOT IN (''0'') ORDER BY RESUMEID';
    DM1.cdsConcre.Close;
    DM1.cdsConcre.DataRequest(xSQL);
    DM1.cdsConcre.Open;

    xSQL:='SELECT NVL(A.OFDESID,''00'') OFDESID,NVL(B.OFDESNOM,''POR IDENTIFICAR'') OFDESNOM  FROM (SELECT OFDESID FROM CFC000'+xPos+' WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+xWhere+' '+
          'GROUP BY OFDESID) A,APO110 B WHERE A.OFDESID=B.OFDESID(+) ORDER BY OFDESID ';
    DM1.cdsOfDes.Close;
    DM1.cdsOfDes.DataRequest(xSQL);
    DM1.cdsOfDes.Open;
    Screen.Cursor := crDefault;
end;

// Inicio HPC_201501_RSG
procedure TfCalfCtaxCob.BitResClfCarClick(Sender: TObject);
var xSQL,xPos:String;
    xReg:Integer;
    xTot:Currency;
    xWhere,xTitulo,xPeriodo:String;
begin
If dtgClfCar.DataSource.DataSet.RecordCount=0 Then Exit;
If DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue)=0 Then Exit;
Screen.Cursor := crHourglass;
xPeriodo:=Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))]));
If chkNoOficial.Checked Then xPos:='_TMP' Else xPos:='';
Case rdbTipCar.ItemIndex Of
     0:Begin
           Case rdbTipAso.ItemIndex Of
                0:Begin
                    xWhere:=' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: GENERAL';
                  End;
                1:Begin
                    xWhere:=' AND ASOTIPID=''DO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: ACTIVOS';
                  End;
                2:Begin
                    xWhere:=' AND ASOTIPID=''CE'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CESANTES';
                  End;
                3:Begin
                    xWhere:=' AND ASOTIPID=''CO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CONTRATADOS';
                  End;
           End;
       End;
     1:Begin
           Case rdbTipAso.ItemIndex Of
                0:Begin
                    xWhere:=' AND NVL(SALDOS_RT,0)=0  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: GENERAL';
                  End;
                1:Begin
                    xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''DO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: ACTIVOS';
                  End;
                2:Begin
                    xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''CE'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CESANTES';
                  End;
                3:Begin
                    xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''CO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CONTRATADOS';
                  End;
           End;
       End;
     2:Begin
           Case rdbTipAso.ItemIndex Of
                0:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') ';
                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: GENERAL';
                  End;
                1:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''DO'' ';

                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: ACTIVOS';
                  End;
                2:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''CE'' ';
                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: CESANTES';
                  End;
                3:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''CO'' ';
                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: CONTRATADOS';
                  End;
           End;
       End;
     3:Begin
           Case rdbTipAso.ItemIndex Of
                0:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: GENERAL';
                  End;
                1:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''DO'' ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: ACTIVOS';
                  End;
                2:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''CE'' ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: CESANTES';
                  End;
                3:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''CO'' ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: CONTRATADOS';
                  End;
           End;
       End;
End;

If chkNoOficial.Checked Then xPos:='_TMP' Else xPos:='';
      If Not ChkOfDes.Checked Then
         Begin
            // Inicio HPC_201701_RSG
            // Alinear monto créditos refinanciados con el monto del reporte BDC01
            if(rdbTipCar.ItemIndex = 2) then
            begin
                 xSQL:='SELECT '+
                     '        RESUMEID, '+
                     '        RESUMEDES, '+
                     '        SUM(MOVIM) MOVIM, '+
                     '        ROUND((NVL(SUM(MOVIM),0))*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue))+',4) Movim_Por, '+
                     '        SUM(SALDOS) SALDOS_FT, '+
                     '        ROUND(NVL(SUM(SALDOS),0)*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('SALDOS').FooterValue))+',4) SaldoTotal_Por, '+
                     '        SUM(SALDOS_FV) SALDOS_FV, '+
                     '        SUM(SALDOS_FP) SALDOS_FP, '+
                     '        SUM(SALDO_CB) SALDO_CB, '+
                     '        SUM(SALDO_NC) SALDO_NC, '+
                     '        P_NC, '+
                     '        SUM(PORNC) PORNC, '+
                     '        P_CB, '+
                     '        SUM(PORCB) PORCB, '+
                     '        SUM(TOTPROV) TOTPROV '+
                     ' FROM '+
                     ' ( '+
                     'SELECT RESUMEID, '+
                     'RESUMEDES, '+
                     'ROUND(NVL(D.MOVIM, 0), 4) MOVIM, '+
                     'ROUND(NVL(D.SALDOS, 0), 4) SALDOS, '+
                     'ROUND(NVL(D.SALDOS_FP, 0), 4) SALDOS_FP, '+
                     'ROUND(NVL(D.SALDOS_FV, 0), 4) SALDOS_FV, '+
                     'ROUND(NVL(D.SALDO_CB, 0), 4) SALDO_CB, '+
                     'ROUND(NVL(D.SALDO_NC, 0), 4) SALDO_NC, '+
                     'ROUND(A.P_NC, 4) P_NC, '+
                     'ROUND(NVL(PORNC, 0), 4) PORNC, '+
                     'ROUND(A.P_CB, 4) P_CB, '+
                     'ROUND(NVL(D.PORCB, 0), 4) PORCB, '+
                     'ROUND(NVL(D.TOTPROV, 0), 4) TOTPROV '+
                     'FROM COB113 A, '+
                     '(SELECT C.ASOID,CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM,C.PORCENTAJE,C.SALTOREF,SALDOS_FT, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN SUM(NVL(C.SALTOREF, 0))  ELSE SUM(NVL(SALDOS_FT, 0)) END SALDOS, '+
                             'CASE WHEN C.PORCENTAJE <> 1 THEN SUM(NVL(C.SALDOS_P, 0)) ELSE SUM(NVL(SALDOS_FP, 0)) END SALDOS_FP, '+
                             'CASE WHEN C.PORCENTAJE <> 1 THEN (SUM(NVL(C.SALDOS_V, 0))) ELSE SUM(NVL(SALDOS_FV, 0)) END SALDOS_FV, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND((SUM(NVL(SALDO_CB, 0)))*(C.PORCENTAJE),2) ELSE SUM(NVL(SALDO_CB, 0)) END SALDO_CB, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND((SUM(NVL(SALDO_NC, 0)))*(C.PORCENTAJE),2) ELSE SUM(NVL(SALDO_NC, 0)) END SALDO_NC, '+
                             'MAX(P_NC) P_NC, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100)*(C.PORCENTAJE),2) ELSE (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100 END PORNC, '+
                             'MAX(P_CB) P_CB, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100)*(C.PORCENTAJE),2) ELSE (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100 END PORCB, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100))*(C.PORCENTAJE),2) '+
                             'ELSE (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) END TOTPROV '+
                             'FROM CFC000'+xPos+', COB113 , '+
                             '( '+
                              'SELECT A.ASOID,A.SALDOS,B.SALTOREF , B.SALDOS_V, B.SALDOS_P, '+
                              ' CASE WHEN A.SALDOS=B.SALTOREF THEN 1 '+
                              '   WHEN A.SALDOS > B.SALTOREF THEN ROUND((B.SALTOREF/A.SALDOS),4) '+
                              ' END PORCENTAJE '+
                              ' FROM '+
                              ' (SELECT ASOID,CFC_F CFC,RESUMEDES CFCDES, '+
                                              ' COUNT(*) MOVIM, '+
                                              ' SUM(NVL(SALDOS_FT, 0)) SALDOS, '+
                                              ' SUM(NVL(SALDOS_FP, 0)) SALDOS_FP, '+
                                              ' SUM(NVL(SALDOS_FV, 0)) SALDOS_FV, '+
                                              ' SUM(NVL(SALDO_CB, 0)) SALDO_CB, '+
                                              ' SUM(NVL(SALDO_NC, 0)) SALDO_NC, '+
                                              ' MAX(P_NC) P_NC, '+
                                              ' (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100 PORNC, '+
                                              ' MAX(P_CB) P_CB, '+
                                              ' (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100 PORCB, '+
                                              ' (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + '+
                                              ' (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) TOTPROV '+
                                         ' FROM CFC000'+xPos+', COB113 WHERE PERIODO ='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+
                                           ' AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) '+xWhere+' '+
                                         ' GROUP BY ASOID,CFC_F, RESUMEDES) A, '+
                                         '( '+
                                         ' SELECT '+
                                         ' ASOID,SUM(SALTOT) SALTOREF, SUM(SALDOS_V) SALDOS_V, SUM(SALDOS_P) SALDOS_P FROM '+
                                         //Inicio HPC_201702_RSG
                                         //Corrección del cálculo del monto de saldo pendiente y saldo vencido.
                                         ' (SELECT ASOID,CREDID, NVL(SALTOT,0) SALTOT, NVL(SALVEN, 0) SALDOS_V, NVL(SALPEN, 0) SALDOS_P FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND TIPDESEID=''10'' AND SUBSTR(CREDID,9,1)=''R'' '+
                                         //Fin HPC_201702_RSG
                                         ' ) '+
                                         ' GROUP BY ASOID '+
                                         ' )B '+
                                         ' WHERE A.ASOID=B.ASOID '+
                                         ' ) C '+
                                         ' WHERE PERIODO = '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+
                                           ' AND CFC000'+xPos+'.ASOID = C.ASOID '+
                                           ' AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) '+ xWhere +
                                         ' GROUP BY C.ASOID,C.SALTOREF,C.PORCENTAJE,SALDOS_FT,CFC_F, RESUMEDES) D  '+
                                 ' WHERE A.RESUMEID = D.CFC(+) '+
                                 ' ORDER BY A.P_NC'+
                                 ' ) '+
                                 ' GROUP BY RESUMEID, RESUMEDES , P_NC, P_CB';
                    end
                    else
                    begin
                      xSQL:='SELECT RESUMEID, '+
                                  ' RESUMEDES, '+
                                  ' ROUND(NVL(B.MOVIM,0),4) MOVIM, '+
                                  ' ROUND((NVL(B.MOVIM,0))*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue))+',4) Movim_Por, '+
                                  ' ROUND(NVL(B.SALDOS_FT,0),4) SALDOS_FT, '+
                                  ' ROUND(NVL(B.SALDOS_FT,0)*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('SALDOS').FooterValue))+',4) SaldoTotal_Por, '+
                                  ' ROUND(NVL(SALDOS_FV,0),4) SALDOS_FV, '+
                                  ' ROUND(NVL(SALDOS_FP,0),4) SALDOS_FP, '+
                                  ' ROUND(NVL(B.SALDO_CB,0),4) SALDO_CB, '+
                                  ' ROUND(NVL(B.SALDO_NC,0),4) SALDO_NC, '+
                                  ' ROUND(A.P_NC,4) P_NC, '+
                                  ' ROUND(NVL(PORNC,0),4) PORNC, '+
                                  ' ROUND(A.P_CB,4) P_CB, '+
                                  ' ROUND(NVL(B.PORCB,0),4) PORCB, '+
                                  ' ROUND(NVL(B.TOTPROV,0),4) TOTPROV '+
                            'FROM COB113 A,(SELECT CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM, SUM(NVL(SALDOS_FT,0)) SALDOS_FT, SUM(NVL(SALDOS_FV,0)) SALDOS_FV,SUM(NVL(SALDOS_FP,0)) SALDOS_FP, '+
                            'SUM(NVL(SALDO_CB,0)) SALDO_CB,SUM(NVL(SALDO_NC,0)) SALDO_NC,MAX(P_NC) P_NC,(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/100 PORNC, '+
                            'MAX(P_CB) P_CB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/100 PORCB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/MAX(100)+(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/MAX(100) TOTPROV  '+
                            'FROM CFC000'+xPos+',COB113 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND CFC000'+xPos+'.CFC_F=COB113.RESUMEID(+) '+xWhere+' '+
                            'GROUP BY CFC_F,RESUMEDES) B WHERE A.RESUMEID=B.CFC(+) ORDER BY A.P_NC';
                            lblOfiDes.Caption:='TODAS LAS OFICINAS DESCONCENTRADAS';
                     end;
                 // Final HPC_201701_RSG
         End
      Else
         Begin

            If  Length(Trim(EdtOfiDes.Text))=0 Then
                Begin
                   MessageDlg(' Debe SELECCIONAR UNA OFICINA!!', mtError,[mbOk],0);
                   Screen.Cursor := crDefault;
                   Exit;
                End;
            // Inicio HPC_201701_RSG 
            // Alinear monto créditos refinanciados con el monto del reporte BDC01
            if(rdbTipCar.ItemIndex = 2) then
            begin
               xSQL:='SELECT '+
                     '        RESUMEID, '+
                     '        RESUMEDES, '+
                     '        SUM(MOVIM) MOVIM, '+
                     '        ROUND((NVL(SUM(MOVIM),0))*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue))+',4) Movim_Por, '+
                     '        SUM(SALDOS) SALDOS_FT, '+
                     '        ROUND(NVL(SUM(SALDOS),0)*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('SALDOS').FooterValue))+',4) SaldoTotal_Por, '+
                     '        SUM(SALDOS_FV) SALDOS_FV, '+
                     '        SUM(SALDOS_FP) SALDOS_FP, '+
                     '        SUM(SALDO_CB) SALDO_CB, '+
                     '        SUM(SALDO_NC) SALDO_NC, '+
                     '        P_NC, '+
                     '        SUM(PORNC) PORNC, '+
                     '        P_CB, '+
                     '        SUM(PORCB) PORCB, '+
                     '        SUM(TOTPROV) TOTPROV '+
                     ' FROM '+
                     ' ( '+
                     'SELECT RESUMEID, '+
                     'RESUMEDES, '+
                     'ROUND(NVL(D.MOVIM, 0), 4) MOVIM, '+
                     'ROUND(NVL(D.SALDOS, 0), 4) SALDOS, '+
                     'ROUND(NVL(D.SALDOS_FP, 0), 4) SALDOS_FP, '+
                     'ROUND(NVL(D.SALDOS_FV, 0), 4) SALDOS_FV, '+
                     'ROUND(NVL(D.SALDO_CB, 0), 4) SALDO_CB, '+
                     'ROUND(NVL(D.SALDO_NC, 0), 4) SALDO_NC, '+
                     'ROUND(A.P_NC, 4) P_NC, '+
                     'ROUND(NVL(PORNC, 0), 4) PORNC, '+
                     'ROUND(A.P_CB, 4) P_CB, '+
                     'ROUND(NVL(D.PORCB, 0), 4) PORCB, '+
                     'ROUND(NVL(D.TOTPROV, 0), 4) TOTPROV '+
                     'FROM COB113 A, '+
                     '(SELECT C.ASOID,CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM,C.PORCENTAJE,C.SALTOREF,SALDOS_FT, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN SUM(NVL(C.SALTOREF, 0))  ELSE SUM(NVL(SALDOS_FT, 0)) END SALDOS, '+
                             'CASE WHEN C.PORCENTAJE <> 1 THEN SUM(NVL(C.SALDOS_P, 0)) ELSE SUM(NVL(SALDOS_FP, 0)) END SALDOS_FP, '+
                             'CASE WHEN C.PORCENTAJE <> 1 THEN (SUM(NVL(C.SALDOS_V, 0))) ELSE SUM(NVL(SALDOS_FV, 0)) END SALDOS_FV, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND((SUM(NVL(SALDO_CB, 0)))*(C.PORCENTAJE),2) ELSE SUM(NVL(SALDO_CB, 0)) END SALDO_CB, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND((SUM(NVL(SALDO_NC, 0)))*(C.PORCENTAJE),2) ELSE SUM(NVL(SALDO_NC, 0)) END SALDO_NC, '+
                             'MAX(P_NC) P_NC, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100)*(C.PORCENTAJE),2) ELSE (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100 END PORNC, '+
                             'MAX(P_CB) P_CB, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100)*(C.PORCENTAJE),2) ELSE (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100 END PORCB, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100))*(C.PORCENTAJE),2) '+
                             'ELSE (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) END TOTPROV '+
                             'FROM CFC000'+xPos+', COB113 , '+
                             '( '+
                              'SELECT A.ASOID,A.SALDOS,B.SALTOREF, B.SALDOS_V,B.SALDOS_P, '+
                              ' CASE WHEN A.SALDOS=B.SALTOREF THEN 1 '+
                              '   WHEN A.SALDOS > B.SALTOREF THEN ROUND((B.SALTOREF/A.SALDOS),4) '+
                              ' END PORCENTAJE '+
                              ' FROM '+
                              ' (SELECT ASOID,CFC_F CFC,RESUMEDES CFCDES, '+
                                              ' COUNT(*) MOVIM, '+
                                              ' SUM(NVL(SALDOS_FT, 0)) SALDOS, '+
                                              ' SUM(NVL(SALDOS_FP, 0)) SALDOS_FP, '+
                                              ' SUM(NVL(SALDOS_FV, 0)) SALDOS_FV, '+
                                              ' SUM(NVL(SALDO_CB, 0)) SALDO_CB, '+
                                              ' SUM(NVL(SALDO_NC, 0)) SALDO_NC, '+
                                              ' MAX(P_NC) P_NC, '+
                                              ' (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100 PORNC, '+
                                              ' MAX(P_CB) P_CB, '+
                                              ' (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100 PORCB, '+
                                              ' (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + '+
                                              ' (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) TOTPROV '+
                                         ' FROM CFC000'+xPos+', COB113 WHERE PERIODO ='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+
                                           ' AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) '+xWhere+' '+
                                         ' GROUP BY ASOID,CFC_F, RESUMEDES) A, '+
                                         '( '+
                                         ' SELECT '+
                                         ' ASOID,SUM(SALTOT) SALTOREF, SUM(SALDOS_V) SALDOS_V, SUM(SALDOS_P) SALDOS_P FROM '+
                                         //Inicio HPC_201702_RSG
                                         //Corrección del cálculo del monto de saldo pendiente y saldo vencido.
                                         ' (SELECT ASOID,CREDID, NVL(SALTOT,0) SALTOT, NVL(SALVEN, 0) SALDOS_V, NVL(SALPEN, 0) SALDOS_P FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND TIPDESEID=''10'' AND SUBSTR(CREDID,9,1)=''R'' '+
                                         //Fin HPC_201702_RSG
                                         ' ) '+
                                         ' GROUP BY ASOID '+
                                         ' )B '+
                                         ' WHERE A.ASOID=B.ASOID '+
                                         ' ) C '+
                                         ' WHERE PERIODO = '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+
                                           ' AND CFC000'+xPos+'.ASOID = C.ASOID '+
                                           ' AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) '+xWhere+' '+
                                         ' GROUP BY C.ASOID,C.SALTOREF,C.PORCENTAJE,SALDOS_FT,CFC_F, RESUMEDES) D  '+
                                 ' WHERE A.RESUMEID = D.CFC(+) '+
                                 ' ORDER BY A.P_NC'+
                                 ' ) '+
                                 ' GROUP BY RESUMEID, RESUMEDES , P_NC, P_CB';
                    end
                    else
                    begin
                      xSQL:='SELECT RESUMEID, '+
                                  ' RESUMEDES, '+
                                  ' ROUND(NVL(B.MOVIM,0),4) MOVIM, '+
                                  ' ROUND((NVL(B.MOVIM,0))*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue))+',4) Movim_Por, '+
                                  ' ROUND(NVL(B.SALDOS_FT,0),4) SALDOS_FT, '+
                                  ' ROUND(NVL(B.SALDOS_FT,0)*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('SALDOS').FooterValue))+',4) SaldoTotal_Por, '+
                                  ' ROUND(NVL(SALDOS_FV,0),4) SALDOS_FV, '+
                                  ' ROUND(NVL(SALDOS_FP,0),4) SALDOS_FP, '+
                                  ' ROUND(NVL(B.SALDO_CB,0),4) SALDO_CB, '+
                                  ' ROUND(NVL(B.SALDO_NC,0),4) SALDO_NC, '+
                                  ' ROUND(A.P_NC,4) P_NC, '+
                                  ' ROUND(NVL(PORNC,0),4) PORNC, '+
                                  ' ROUND(A.P_CB,4) P_CB, '+
                                  ' ROUND(NVL(B.PORCB,0),4) PORCB, '+
                                  ' ROUND(NVL(B.TOTPROV,0),4) TOTPROV '+
                                  'FROM COB113 A,(SELECT CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM, SUM(NVL(SALDOS_FT,0)) SALDOS_FT, SUM(NVL(SALDOS_FV,0)) SALDOS_FV,SUM(NVL(SALDOS_FP,0)) SALDOS_FP, '+
                            'SUM(NVL(SALDO_CB,0)) SALDO_CB,SUM(NVL(SALDO_NC,0)) SALDO_NC,MAX(P_NC) P_NC,(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/100 PORNC, '+
                            'MAX(P_CB) P_CB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/100 PORCB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/MAX(100)+(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/MAX(100) TOTPROV  '+
                            'FROM CFC000'+xPos+',COB113 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND NVL(CFC000.OFDESID,''00'')='+QuotedStr(DBLkOfiDes.Text)+' AND CFC000'+xPos+'.CFC_F=COB113.RESUMEID(+) '+xWhere+' '+
                            'GROUP BY CFC_F,RESUMEDES) B WHERE A.RESUMEID=B.CFC(+) ORDER BY A.P_NC';
                      lblOfiDes.Caption:='OFICINA DESCONCENTRADA  : '+Trim(EdtOfiDes.Text);
                    end;
            // Final HPC_201701_RSG
         End;


      DM1.cdsDetalle.Close;
      DM1.cdsDetalle.DataRequest(xSQL);
      DM1.cdsDetalle.Open;
      If DM1.cdsDetalle.RecordCount > 0 Then
         Begin
           If ChkOfDes.Checked Then
              Begin
               If Length(Trim(EdtOfiDes.Text))=0 Then
                  Begin
                     Exit;
                  End;
              End;


           If Not ChkOfDes.Checked Then
                // Inicio HPC_201701_RSG 
                // Alinear monto créditos refinanciados con el monto del reporte BDC01
                if(rdbTipCar.ItemIndex = 2) then
                begin
                 xSQL:=
                     ' SELECT '+
                     ' CASE WHEN (SUM(SALDOS_FT)=0) THEN 0 ELSE '+
                     ' ROUND(SUM(SALDOS_FV)/SUM(SALDOS_FT),4) END INDMOR, '+
                     ' CASE WHEN (SUM(SALDOS_FV)=0) THEN 0 ELSE '+
                     ' ROUND(SUM(TOTPROV)/SUM(SALDOS_FV),4) END INDPRO '+
                     ' FROM( '+
                     'SELECT '+
                     '        RESUMEID, '+
                     '        RESUMEDES, '+
                     '        SUM(MOVIM) MOVIM, '+
                     '        ROUND((NVL(SUM(MOVIM),0))*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue))+',4) Movim_Por, '+
                     '        SUM(SALDOS) SALDOS_FT, '+
                     '        ROUND(NVL(SUM(SALDOS),0)*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('SALDOS').FooterValue))+',4) SaldoTotal_Por, '+
                     '        SUM(SALDOS_FV) SALDOS_FV, '+
                     '        SUM(SALDOS_FP) SALDOS_FP, '+
                     '        SUM(SALDO_CB) SALDO_CB, '+
                     '        SUM(SALDO_NC) SALDO_NC, '+
                     '        P_NC, '+
                     '        SUM(PORNC) PORNC, '+
                     '        P_CB, '+
                     '        SUM(PORCB) PORCB, '+
                     '        SUM(TOTPROV) TOTPROV '+
                     ' FROM '+
                     ' ( '+
                     'SELECT RESUMEID, '+
                     'RESUMEDES, '+
                     'ROUND(NVL(D.MOVIM, 0), 4) MOVIM, '+
                     'ROUND(NVL(D.SALDOS, 0), 4) SALDOS, '+
                     'ROUND(NVL(D.SALDOS_FP, 0), 4) SALDOS_FP, '+
                     'ROUND(NVL(D.SALDOS_FV, 0), 4) SALDOS_FV, '+
                     'ROUND(NVL(D.SALDO_CB, 0), 4) SALDO_CB, '+
                     'ROUND(NVL(D.SALDO_NC, 0), 4) SALDO_NC, '+
                     'ROUND(A.P_NC, 4) P_NC, '+
                     'ROUND(NVL(PORNC, 0), 4) PORNC, '+
                     'ROUND(A.P_CB, 4) P_CB, '+
                     'ROUND(NVL(D.PORCB, 0), 4) PORCB, '+
                     'ROUND(NVL(D.TOTPROV, 0), 4) TOTPROV '+
                     'FROM COB113 A, '+
                     '(SELECT C.ASOID,CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM,C.PORCENTAJE,C.SALTOREF,SALDOS_FT, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN SUM(NVL(C.SALTOREF, 0))  ELSE SUM(NVL(SALDOS_FT, 0)) END SALDOS, '+
                             'CASE WHEN C.PORCENTAJE <> 1 THEN SUM(NVL(C.SALDOS_P, 0)) ELSE SUM(NVL(SALDOS_FP, 0)) END SALDOS_FP, '+
                             'CASE WHEN C.PORCENTAJE <> 1 THEN (SUM(NVL(C.SALDOS_V, 0))) ELSE SUM(NVL(SALDOS_FV, 0)) END SALDOS_FV, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND((SUM(NVL(SALDO_CB, 0)))*(C.PORCENTAJE),2) ELSE SUM(NVL(SALDO_CB, 0)) END SALDO_CB, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND((SUM(NVL(SALDO_NC, 0)))*(C.PORCENTAJE),2) ELSE SUM(NVL(SALDO_NC, 0)) END SALDO_NC, '+
                             'MAX(P_NC) P_NC, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100)*(C.PORCENTAJE),2) ELSE (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100 END PORNC, '+
                             'MAX(P_CB) P_CB, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100)*(C.PORCENTAJE),2) ELSE (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100 END PORCB, '+
                             'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100))*(C.PORCENTAJE),2) '+
                             'ELSE (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) END TOTPROV '+
                             'FROM CFC000'+xPos+', COB113 , '+
                             '( '+
                              'SELECT A.ASOID,A.SALDOS,B.SALTOREF, B.SALDOS_V,B.SALDOS_P, '+
                              ' CASE WHEN A.SALDOS=B.SALTOREF THEN 1 '+
                              '   WHEN A.SALDOS > B.SALTOREF THEN ROUND((B.SALTOREF/A.SALDOS),4) '+
                              ' END PORCENTAJE '+
                              ' FROM '+
                              ' (SELECT ASOID,CFC_F CFC,RESUMEDES CFCDES, '+
                                              ' COUNT(*) MOVIM, '+
                                              ' SUM(NVL(SALDOS_FT, 0)) SALDOS, '+
                                              ' SUM(NVL(SALDOS_FP, 0)) SALDOS_FP, '+
                                              ' SUM(NVL(SALDOS_FV, 0)) SALDOS_FV, '+
                                              ' SUM(NVL(SALDO_CB, 0)) SALDO_CB, '+
                                              ' SUM(NVL(SALDO_NC, 0)) SALDO_NC, '+
                                              ' MAX(P_NC) P_NC, '+
                                              ' (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100 PORNC, '+
                                              ' MAX(P_CB) P_CB, '+
                                              ' (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100 PORCB, '+
                                              ' (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + '+
                                              ' (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) TOTPROV '+
                                         ' FROM CFC000'+xPos+', COB113 WHERE PERIODO ='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+
                                           ' AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) '+xWhere+' '+  
                                         ' GROUP BY ASOID,CFC_F, RESUMEDES) A, '+
                                         '( '+
                                         ' SELECT '+
                                         ' ASOID,SUM(SALTOT) SALTOREF, SUM(SALDOS_V) SALDOS_V, SUM(SALDOS_P) SALDOS_P FROM '+
                                         //Inicio HPC_201702_RSG
                                         //Corrección del cálculo del monto de saldo pendiente y saldo vencido.
                                         ' (SELECT ASOID,CREDID, NVL(SALTOT,0) SALTOT, NVL(SALVEN, 0) SALDOS_V, NVL(SALPEN, 0) SALDOS_P FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND TIPDESEID=''10'' AND SUBSTR(CREDID,9,1)=''R'' '+
                                         //Fin HPC_201702_RSG
                                         ' ) '+
                                         ' GROUP BY ASOID '+
                                         ' )B '+
                                         ' WHERE A.ASOID=B.ASOID '+
                                         ' ) C '+
                                         ' WHERE PERIODO = '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+
                                           ' AND CFC000'+xPos+'.ASOID = C.ASOID '+
                                           ' AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) '+ xWhere +
                                         ' GROUP BY C.ASOID,C.SALTOREF,C.PORCENTAJE,SALDOS_FT,CFC_F, RESUMEDES) D  '+
                                 ' WHERE A.RESUMEID = D.CFC(+) '+
                                 ' ORDER BY A.P_NC'+
                                 ' ) '+
                                 ' GROUP BY RESUMEID, RESUMEDES , P_NC, P_CB)';
                    end
                    else
                    begin
                       xSQL:='SELECT ROUND(SUM(SALDOS_FV)/SUM(SALDOS_FT),4) INDMOR, '+
                                     ' ROUND(SUM(TOTPROV)/SUM(SALDOS_FV),4) INDPRO '+
                                 'FROM '+
                               '(SELECT CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM, SUM(NVL(SALDOS_FT,0)) SALDOS_FT, SUM(NVL(SALDOS_FV,0)) SALDOS_FV,SUM(NVL(SALDOS_FP,0)) SALDOS_FP, '+
                               'SUM(NVL(SALDO_CB,0)) SALDO_CB,SUM(NVL(SALDO_NC,0)) SALDO_NC,MAX(P_NC) P_NC,(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/100 PORNC,  '+
                               'MAX(P_CB) P_CB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/100 PORCB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/MAX(100)+(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/MAX(100) TOTPROV  '+
                               'FROM CFC000'+xPos+',COB113 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND CFC000'+xPos+'.CFC_F=COB113.RESUMEID(+) '+xWhere+' '+
                               'GROUP BY CFC_F,RESUMEDES) '
                    end
           Else
                   xSQL:='SELECT ROUND(SUM(SALDOS_FV)/SUM(SALDOS_FT),4) INDMOR, '+
                                 ' ROUND(SUM(TOTPROV)/SUM(SALDOS_FV),4) INDPRO '+
                                 ' FROM ' +
                           '(SELECT CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM, SUM(NVL(SALDOS_FT,0)) SALDOS_FT, SUM(NVL(SALDOS_FV,0)) SALDOS_FV,SUM(NVL(SALDOS_FP,0)) SALDOS_FP, '+
                           'SUM(NVL(SALDO_CB,0)) SALDO_CB,SUM(NVL(SALDO_NC,0)) SALDO_NC,MAX(P_NC) P_NC,(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/100 PORNC,  '+
                           'MAX(P_CB) P_CB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/100 PORCB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/MAX(100)+(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/MAX(100) TOTPROV  '+
                           'FROM CFC000'+xPos+',COB113 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND NVL(CFC000.OFDESID,''00'')='+QuotedStr(DBLkOfiDes.Text)+' AND CFC000'+xPos+'.CFC_F=COB113.RESUMEID(+) '+xWhere+' '+
                           'GROUP BY CFC_F,RESUMEDES) '; ChkOfDes.Checked:=False;
                 // Final HPC_201701_RSG
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSQL);
            DM1.cdsQry.Open;
            // Inicio HPC_201701_RSG 
            // Alinear monto créditos refinanciados con el monto del reporte BDC01
            If DM1.cdsQry.FieldByName('INDMOR').AsCurrency > 0 Then
                Begin
                   lblIndice.Caption:=FloatToStrF(DM1.cdsQry.FieldByName('INDMOR').AsCurrency,ffNumber, 10, 5);
                   lblProv.Caption:=FloatToStrF(DM1.cdsQry.FieldByName('INDPRO').AsCurrency,ffNumber, 10, 5);
                   lblPorMor.Caption:='('+FloatToStrF((DM1.cdsQry.FieldByName('INDMOR').AsCurrency*100),ffNumber, 10, 2)+' %)';
                   lblPorPro.Caption:='('+FloatToStrF((DM1.cdsQry.FieldByName('INDPRO').AsCurrency*100),ffNumber, 10, 2)+' %)';
                End
            Else
                Begin
                   lblIndice.Caption:=FloatToStrF(0,ffNumber, 10, 5);
                   lblProv.Caption:=FloatToStrF(0,ffNumber, 10, 5);
                   lblPorMor.Caption:='('+FloatToStrF((DM1.cdsQry.FieldByName('INDMOR').AsCurrency*100),ffNumber, 10, 2)+' %)';
                   lblPorPro.Caption:='('+FloatToStrF((DM1.cdsQry.FieldByName('INDPRO').AsCurrency*100),ffNumber, 10, 2)+' %)';
            // Final HPC_201701_RSG
                End;
            DM1.cdsQry.Close;

            ppLbltit.Caption:='CALIFICACION DE DEUDORES Y EXIGENCIA DE PROVISIONES  A : '+Trim(lblNomMes.Caption)+' - '+dbsAnoIni.Text;
            If chkNoOficial.Checked Then lblmsg02.Visible:=True Else lblmsg02.Visible:=False;
            lblTitulo.Caption:=UpperCase(xTitulo);
            ppRepClfcar.Print;
            ppRepClfcar.Cancel;
         End
      Else
         Begin
          MessageDlg(' No Existe Información Procesada Para Ese Periodo ', mtError,[mbOk],0);
         End;
      DM1.cdsDetalle.Close;

Screen.Cursor:= crDefault;
end;
// Fin HPC_201501_RSG


procedure TfCalfCtaxCob.ChkOfDesClick(Sender: TObject);
begin
If ChkOfDes.Checked Then
   pnlOficinas.Enabled:=True
Else
   Begin
     pnlOficinas.Enabled:=False; DBLkOfiDes.Text := '';
   End;
end;

procedure TfCalfCtaxCob.DBLkOfiDesChange(Sender: TObject);
begin
   If DM1.cdsOfdes.Locate('OFDESID',VarArrayof([DBLkOfiDes.Text]),[]) Then
      Begin
        EdtOfiDes.Text  := DM1.cdsOfdes.fieldbyname('OFDESNOM').AsString ;
      End
   Else
      Begin
        if Length(DBLkOfiDes.Text) <> 2 then
           Begin
              Beep;
              EdtOfiDes.Text  :='';
           End;
      End;
end;

// Inicio HPC_201501_RSG
procedure TfCalfCtaxCob.BitConOfiClick(Sender: TObject);
var xSQL,xPos,xWhere,xTitulo,xPeriodo:String;
begin
If dtgClfCar.DataSource.DataSet.RecordCount=0 Then Exit;
If DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue)=0 Then Exit;
Screen.Cursor := crHourglass;
xPeriodo:=Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))]));
If chkNoOficial.Checked Then xPos:='_TMP' Else xPos:='';
ChkOfDes.Checked:=False;
Case rdbTipCar.ItemIndex Of
     0:Begin
           Case rdbTipAso.ItemIndex Of
                0:Begin
                    xWhere:=' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: GENERAL';
                  End;
                1:Begin
                    xWhere:=' AND ASOTIPID=''DO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: ACTIVOS';
                  End;
                2:Begin
                    xWhere:=' AND ASOTIPID=''CE'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CESANTES';
                  End;
                3:Begin
                    xWhere:=' AND ASOTIPID=''CO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CONTRATADOS';
                  End;
           End;
       End;
     1:Begin
           Case rdbTipAso.ItemIndex Of
                0:Begin
                    xWhere:=' AND NVL(SALDOS_RT,0)=0  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: GENERAL';
                  End;
                1:Begin
                    xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''DO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: ACTIVOS';
                  End;
                2:Begin
                    xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''CE'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CESANTES';
                  End;
                3:Begin
                    xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''CO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CONTRATADOS';
                  End;
           End;
       End;
     2:Begin
           Case rdbTipAso.ItemIndex Of
                0:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') ';
                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: GENERAL';
                  End;
                1:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''DO'' ';

                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: ACTIVOS';
                  End;
                2:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''CE'' ';
                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: CESANTES';
                  End;
                3:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''CO'' ';
                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: CONTRATADOS';
                  End;
           End;
       End;
     3:Begin
           Case rdbTipAso.ItemIndex Of
                0:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: GENERAL';
                  End;
                1:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''DO'' ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: ACTIVOS';
                  End;
                2:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''CE'' ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: CESANTES';
                  End;
                3:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''CO'' ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: CONTRATADOS';
                  End;
           End;
       End;

End;
   xSQL:='SELECT NVL(A.OFDESID,''00'') OFDESID ,'+
               ' NVL(B.OFDESNOM,''POR IDENTIFICAR'') OFDESNOM ,'+
               ' ROUND(SUM(SALDOS_FV)/SUM(SALDOS_FT),4) INDMOR ,'+
               ' ROUND(SUM(SALDOS_FV)/SUM(SALDOS_FT)*100,4) PORMOR ,'+
               'CASE WHEN SUM(SALDOS_FV)=0 THEN 0 ELSE ROUND(SUM(TOTPROV)/SUM(SALDOS_FV),4) END INDPRO, '+
               'CASE WHEN SUM(SALDOS_FV)=0 THEN 0 ELSE ROUND(SUM(TOTPROV)/SUM(SALDOS_FV)*100,4) END PORPRO '+
         'FROM (SELECT CFC000'+xPos+'.OFDESID,CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM, SUM(NVL(SALDOS_FT,0)) SALDOS_FT, SUM(NVL(SALDOS_FV,0)) SALDOS_FV,SUM(NVL(SALDOS_FP,0)) SALDOS_FP, '+
         'SUM(NVL(SALDO_CB,0)) SALDO_CB,SUM(NVL(SALDO_NC,0)) SALDO_NC,MAX(P_NC) P_NC,(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/100 PORNC, '+
         'MAX(P_CB) P_CB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/100 PORCB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/MAX(100)+(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/MAX(100) TOTPROV  '+
         'FROM CFC000'+xPos+',COB113 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+xWhere+' '+
         'AND CFC000'+xPos+'.CFC_F=COB113.RESUMEID(+) GROUP BY CFC000'+xPos+'.OFDESID,CFC_F,RESUMEDES) A, APO110 B WHERE A.OFDESID=B.OFDESID(+) GROUP BY A.OFDESID,B.OFDESNOM ORDER BY INDMOR DESC ';
   DM1.cdsQry6.Close;
   DM1.cdsQry6.DataRequest(xSQL);
   DM1.cdsQry6.Open;
   Screen.Cursor := crDefault;
   If DM1.cdsQry6.RecordCount > 0 Then
      Begin
         Screen.Cursor := crHourglass;
         LblTitulo01.Caption:='INDICE DE MOROSIDAD Y PROVISION POR OFICINA DESCONCENTRADA - '+Trim(lblNomMes.Caption)+' - '+dbsAnoIni.Text;
         xSQL:='SELECT ROUND(SUM(SALDOS_FV)/SUM(SALDOS_FT),4) INDMOR, '+
                     ' ROUND(SUM(SALDOS_FV)/SUM(SALDOS_FT)*100,4) PORMOR, '+
               'CASE WHEN SUM(SALDOS_FV)=0 THEN 0 ELSE ROUND(SUM(TOTPROV)/SUM(SALDOS_FV),4) END INDPRO, '+
               'CASE WHEN SUM(SALDOS_FV)=0 THEN 0 ELSE ROUND(SUM(TOTPROV)/SUM(SALDOS_FV)*100,4) END PORPRO '+
               'FROM (SELECT CFC000'+xPos+'.OFDESID,CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM, SUM(NVL(SALDOS_FT,0)) SALDOS_FT, SUM(NVL(SALDOS_FV,0)) SALDOS_FV,SUM(NVL(SALDOS_FP,0)) SALDOS_FP, '+
               'SUM(NVL(SALDO_CB,0)) SALDO_CB,SUM(NVL(SALDO_NC,0)) SALDO_NC,MAX(P_NC) P_NC,(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/100 PORNC, MAX(P_CB) P_CB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/100 PORCB, '+
               '(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/MAX(100)+(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/MAX(100) TOTPROV '+
               'FROM CFC000'+xPos+',COB113 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+xWhere+' '+
               'AND CFC000'+xPos+'.CFC_F=COB113.RESUMEID(+) GROUP BY CFC000'+xPos+'.OFDESID,CFC_F,RESUMEDES) A, APO110 B WHERE A.OFDESID=B.OFDESID(+) ';
               DM1.cdsQry5.Close;
               DM1.cdsQry5.DataRequest(xSQL);
               DM1.cdsQry5.Open;
               Screen.Cursor := crDefault;
               If DM1.cdsQry5.RecordCount > 0 Then
                  Begin
                    lblIndMor.Caption:=FloatToStrF(DM1.cdsQry5.FieldByName('INDMOR').AsCurrency,ffNumber, 10, 5);
                    lblrPorMor.Caption:=FloatToStrF(DM1.cdsQry5.FieldByName('PORMOR').AsCurrency,ffNumber, 10, 2);
                    lblIndPro.Caption:=FloatToStrF(DM1.cdsQry5.FieldByName('INDPRO').AsCurrency,ffNumber, 10, 5);
                    lblrPorPro.Caption:=FloatToStrF(DM1.cdsQry5.FieldByName('PORPRO').AsCurrency,ffNumber, 10, 2);
                  End;
                  DM1.cdsQry5.Close;
         If chkNoOficial.Checked Then lblmsg03.Visible:=True Else lblmsg03.Visible:=False;
         Titulo.Caption:=UpperCase(xTitulo);
         RepCons.Print;
         RepCons.Cancel;
      End;
      DM1.cdsQry6.Close;
      Screen.Cursor := crDefault;
end;
// Fin HPC_201501_RSG


// Inicio HPC_201501_RSG
procedure TfCalfCtaxCob.BitIntDevClick(Sender: TObject);
var xSQL,xPos,xWhere,xTitulo,xPeriodo:String;
begin
    If dtgClfCar.DataSource.DataSet.RecordCount=0 Then Exit;
    If DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue)=0 Then Exit;
    If chkNoOficial.Checked Then xPos:='_TMP' Else xPos:='';
    Screen.Cursor := crHourglass;
    xPeriodo:=Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))]));
    Case rdbTipCar.ItemIndex Of
         0:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND ASOTIPID=''DO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND ASOTIPID=''CE'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND ASOTIPID=''CO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         1:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''DO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''CE'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''CO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
     2:Begin
           Case rdbTipAso.ItemIndex Of
                0:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') ';
                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: GENERAL';
                  End;
                1:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''DO'' ';

                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: ACTIVOS';
                  End;
                2:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''CE'' ';
                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: CESANTES';
                  End;
                3:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''CO'' ';
                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: CONTRATADOS';
                  End;
           End;
       End;
     3:Begin
           Case rdbTipAso.ItemIndex Of
                0:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: GENERAL';
                  End;
                1:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''DO'' ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: ACTIVOS';
                  End;
                2:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''CE'' ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: CESANTES';
                  End;
                3:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''CO'' ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: CONTRATADOS';
                  End;
           End;
       End;

    End;
    // Inicio HPC_201701_RSG 
    // Alinear monto créditos refinanciados con el monto del reporte BDC01
    if(rdbTipCar.ItemIndex = 2) then
    begin
       xSQL:='SELECT '+
             'RESUMEDES, '+
             'SUM(MOVIM) MOVIM, '+
             'SUM(SALDOS_FT) SALDOS_FT, '+
             'SUM(INTERES_FV) INTERES_FV, '+
             'SUM(INTERES_FP) INTERES_FP, '+
             'SUM(INTERES_FT) INTERES_FT, '+
             'SUM(INTERES_PM) INTERES_PM '+
             'FROM ( '+
             'SELECT RESUMEDES, '+
             'ROUND(MOVIM, 4) MOVIM, '+
             'ROUND(SALDOS_FT, 4) SALDOS_FT, '+
             'ROUND(INTERES_FV, 4) INTERES_FV, '+
             'ROUND(INTERES_FP, 4) INTERES_FP, '+
             'ROUND(INTERES_FT, 4) INTERES_FT, '+
             'ROUND(INTERES_PM, 4) INTERES_PM '+
             ' FROM '+
             ' ( '+
             'SELECT '+
             'RESUMEDES,NVL(SUM(MOVIM),0) MOVIM,(NVL(SUM(MOVIM),0))*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue))+' Movim_Por,NVL(SUM(SALDOS),0) SALDOS_FT,NVL(SUM(SALDOS),0)*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('SALDOS').FooterValue))+' SaldoTotal_Por, '+
             'SUM(SALDOS_FP) SALDOS_FP, '+
             'SUM(SALDOS_FV) SALDOS_FV, '+
             'SUM(SALDO_CB) SALDO_CB, '+
             'SUM(SALDO_NC) SALDO_NC, '+
             'ROUND(A.P_NC, 4) P_NC, '+
             'SUM(PORNC) PORNC, '+
             'ROUND(A.P_CB, 4) P_CB, '+
             'SUM(PORCB) PORCB, '+
             'SUM(TOTPROV) TOTPROV, '+
             'NVL(D.INTERES_FV, 0) INTERES_FV, '+
             'NVL(INTERES_FP, 0) INTERES_FP, '+
             'NVL(INTERES_FT, 0) INTERES_FT, '+
             'NVL(INTERES_PM, 0) INTERES_PM '+
             'FROM COB113 A, '+
             '(SELECT C.ASOID,CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM,C.PORCENTAJE,C.SALTOREF,SALDOS_FT, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN SUM(NVL(C.SALTOREF, 0))  ELSE SUM(NVL(SALDOS_FT, 0)) END SALDOS, '+
                     'CASE WHEN C.PORCENTAJE <> 1 THEN SUM(NVL(C.SALDOS_P, 0)) ELSE SUM(NVL(SALDOS_FP, 0)) END SALDOS_FP, '+
                     'CASE WHEN C.PORCENTAJE <> 1 THEN (SUM(NVL(C.SALDOS_V, 0))) ELSE SUM(NVL(SALDOS_FV, 0)) END SALDOS_FV, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND((SUM(NVL(SALDO_CB, 0)))*(C.PORCENTAJE),2) ELSE SUM(NVL(SALDO_CB, 0)) END SALDO_CB, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND((SUM(NVL(SALDO_NC, 0)))*(C.PORCENTAJE),2) ELSE SUM(NVL(SALDO_NC, 0)) END SALDO_NC, '+
                     'MAX(P_NC) P_NC, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100)*(C.PORCENTAJE),2) ELSE (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100 END PORNC, '+
                     'MAX(P_CB) P_CB, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100)*(C.PORCENTAJE),2) ELSE (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100 END PORCB, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100))*(C.PORCENTAJE),2) '+
                     'ELSE (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) END TOTPROV, '+
                     ' SUM(NVL(INTERES_FV, 0)) INTERES_FV, '+
                     ' SUM(NVL(INTERES_FP, 0)) INTERES_FP, '+
                     ' SUM(NVL(INTERES_FT, 0)) INTERES_FT, '+
                     ' SUM(NVL(INTERES_PM, 0)) INTERES_PM '+
                     'FROM CFC000'+xPos+', COB113 , '+
                     '( '+
                      'SELECT A.ASOID,A.SALDOS,B.SALTOREF, B.SALDOS_V,B.SALDOS_P, '+
                      ' CASE WHEN A.SALDOS=B.SALTOREF THEN 1 '+
                      '   WHEN A.SALDOS > B.SALTOREF THEN ROUND((B.SALTOREF/A.SALDOS),4) '+
                      ' END PORCENTAJE '+
                      ' FROM '+
                      ' (SELECT ASOID,CFC_F CFC,RESUMEDES CFCDES, '+
                                      ' COUNT(*) MOVIM, '+
                                      ' SUM(NVL(SALDOS_FT, 0)) SALDOS, '+
                                      ' SUM(NVL(SALDOS_FP, 0)) SALDOS_FP, '+
                                      ' SUM(NVL(SALDOS_FV, 0)) SALDOS_FV, '+
                                      ' SUM(NVL(SALDO_CB, 0)) SALDO_CB, '+
                                      ' SUM(NVL(SALDO_NC, 0)) SALDO_NC, '+
                                      ' MAX(P_NC) P_NC, '+
                                      ' (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100 PORNC, '+
                                      ' MAX(P_CB) P_CB, '+
                                      ' (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100 PORCB, '+
                                      ' (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + '+
                                      ' (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) TOTPROV '+
                                 ' FROM CFC000'+xPos+', COB113 WHERE PERIODO ='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+
                                   ' AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) '+xWhere+' '+
                                 ' GROUP BY ASOID,CFC_F, RESUMEDES) A, '+
                                 '( '+
                                 ' SELECT '+
                                 ' ASOID,SUM(SALTOT) SALTOREF, SUM(SALDOS_V) SALDOS_V, SUM(SALDOS_P) SALDOS_P FROM '+
                                 //Inicio HPC_201702_RSG
                                 //Corrección del cálculo del monto de saldo pendiente y saldo vencido.
                                 ' (SELECT ASOID,CREDID, NVL(SALTOT,0) SALTOT, NVL(SALVEN, 0) SALDOS_V, NVL(SALPEN, 0) SALDOS_P FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND TIPDESEID=''10'' AND SUBSTR(CREDID,9,1)=''R'' '+
                                 //Fin HPC_201702_RSG
                                 ' ) '+
                                 ' GROUP BY ASOID '+
                                 ' )B '+
                                 ' WHERE A.ASOID=B.ASOID '+
                                 ' ) C '+
                                 ' WHERE PERIODO = '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+
                                   ' AND CFC000'+xPos+'.ASOID = C.ASOID '+
                                   ' AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) ' + xWhere +
                                 ' GROUP BY C.ASOID,C.SALTOREF,C.PORCENTAJE,SALDOS_FT,CFC_F, RESUMEDES) D  '+
                         ' WHERE A.RESUMEID = D.CFC(+) '+
                         ' GROUP BY RESUMEDES,A.P_NC,A.P_CB,D.INTERES_FV,INTERES_FP,INTERES_FP,INTERES_FT,INTERES_FT,INTERES_PM '+
                         'ORDER BY A.P_NC) '+
                         ' GROUP BY RESUMEDES,MOVIM, P_NC, P_CB,SALDOS_FT,INTERES_FV,INTERES_FP,INTERES_FT,INTERES_PM '+
                         ' ORDER BY P_NC) '+
                         ' GROUP BY RESUMEDES '+
                         ' ORDER BY MOVIM DESC';

    end
    else
    begin
        xSQL:='SELECT RESUMEDES, '+
                    ' ROUND(MOVIM,4) MOVIM, '+
                    ' ROUND(SALDOS_FT,4) SALDOS_FT, '+
                    ' ROUND(INTERES_FV,4) INTERES_FV, '+
                    ' ROUND(INTERES_FP,4) INTERES_FP, '+
                    ' ROUND(INTERES_FT,4) INTERES_FT, '+
                    ' ROUND(INTERES_PM,4) INTERES_PM '+
              'FROM (SELECT RESUMEID,RESUMEDES,NVL(B.MOVIM,0) MOVIM,(NVL(B.MOVIM,0))*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue))+' Movim_Por,NVL(B.SALDOS_FT,0) SALDOS_FT,NVL(B.SALDOS_FT,0)*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('SALDOS').FooterValue))+' SaldoTotal_Por, '+
              'NVL(SALDOS_FV,0) SALDOS_FV,NVL(SALDOS_FP,0) SALDOS_FP,NVL(B.SALDO_CB,0) SALDO_CB, '+
              'NVL(B.SALDO_NC,0) SALDO_NC,A.P_NC,NVL(PORNC,0) PORNC,A.P_CB,NVL(B.PORCB,0) PORCB,NVL(B.TOTPROV,0) TOTPROV,NVL(B.INTERES_FV,0) INTERES_FV, NVL(INTERES_FP,0) INTERES_FP,NVL(INTERES_FT,0) INTERES_FT ,NVL(INTERES_PM,0) INTERES_PM '+
              'FROM COB113 A,(SELECT CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM, SUM(NVL(SALDOS_FT,0)) SALDOS_FT, SUM(NVL(SALDOS_FV,0)) SALDOS_FV,SUM(NVL(SALDOS_FP,0)) SALDOS_FP, '+
              'SUM(NVL(SALDO_CB,0)) SALDO_CB,SUM(NVL(SALDO_NC,0)) SALDO_NC,MAX(P_NC) P_NC,(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/100 PORNC, '+
              'MAX(P_CB) P_CB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/100 PORCB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/MAX(100)+(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/MAX(100) TOTPROV, SUM(NVL(INTERES_FV,0)) INTERES_FV, SUM(NVL(INTERES_FP,0)) INTERES_FP, '+
              'SUM(NVL(INTERES_FT,0)) INTERES_FT ,SUM(NVL(INTERES_PM,0)) INTERES_PM   '+
              'FROM CFC000'+xPos+',COB113 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND CFC000'+xPos+'.CFC_F=COB113.RESUMEID(+) '+xWhere+' '+
              'GROUP BY CFC_F,RESUMEDES) B WHERE A.RESUMEID=B.CFC(+) ORDER BY A.P_NC)';
    end;
    // Final HPC_201701_RSG
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSQL);
    DM1.cdsQry.Open;

    If DM1.cdsQry.RecordCount > 0 Then
       Begin
           ppLbltit01.Caption:='CALIFICACION DE DEUDORES Y EXIGENCIA DE PROVISIONES  A : '+Trim(lblNomMes.Caption)+' - '+dbsAnoIni.Text;
           If chkNoOficial.Checked Then lblmsg01.Visible:=True Else lblmsg01.Visible:=False;
           Rotulo.Caption:= UpperCase(xTitulo);
           RepIntDev.Print;
           RepIntDev.Cancel;
       End
    Else
       Begin
           MessageDlg(' No Existe Información Procesada Para Ese Periodo ', mtError,[mbOk],0);
           Exit;
       End;
    Screen.Cursor := crDefault;
end;
// Fin HPC_201501_RSG

procedure TfCalfCtaxCob.dbsMesIniChange(Sender: TObject);
begin
lblNomMes.Caption:=DM1.DesMes(StrToInt(dbsMesIni.Text),'N');
LimpiaGrid;

end;

// Inicio HPC_201501_RSG
procedure TfCalfCtaxCob.BitExportaClick(Sender: TObject);
var xSQL,xPos,xWhere,xTitulo,xPeriodo:String;
begin
    If dtgClfCar.DataSource.DataSet.RecordCount=0 Then Exit;
    If DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue)=0 Then Exit;
    xPeriodo:=Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))]));
    If chkNoOficial.Checked Then xPos:='_TMP' Else xPos:='';
    Case rdbTipCar.ItemIndex Of
         0:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND ASOTIPID=''DO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND ASOTIPID=''CE'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND ASOTIPID=''CO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         1:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''DO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''CE'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''CO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
     2:Begin
           Case rdbTipAso.ItemIndex Of
                0:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') ';
                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: GENERAL';
                  End;
                1:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''DO'' ';

                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: ACTIVOS';
                  End;
                2:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''CE'' ';
                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: CESANTES';
                  End;
                3:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''CO'' ';
                    xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: CONTRATADOS';
                  End;
           End;
       End;
     3:Begin
           Case rdbTipAso.ItemIndex Of
                0:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: GENERAL';
                  End;
                1:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''DO'' ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: ACTIVOS';
                  End;
                2:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''CE'' ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: CESANTES';
                  End;
                3:Begin
                    xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                              ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                              ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''CO'' ';
                    xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: CONTRATADOS';
                  End;
           End;
       End;
    End;


   If chk01.Checked Then DM1.ExportaGridExcel(dtgClfCar,'ExpDatos13');
   If chk02.Checked Then
      Begin
         DM1.cdsQry5.Close;
         xSQL:='SELECT NVL(A.OFDESID,''00'') OFDESID, '+
                     ' NVL(B.OFDESNOM,''POR IDENTIFICAR'') OFDESNOM, '+
                     ' ROUND(SUM(SALDOS_FV)/SUM(SALDOS_FT),4) INDMOR, '+
                     ' ROUND(SUM(SALDOS_FV)/SUM(SALDOS_FT)*100,4) PORMOR, '+
                     ' CASE WHEN SUM(SALDOS_FV)=0 THEN 0 ELSE ROUND(SUM(TOTPROV)/SUM(SALDOS_FV),4) END INDPRO, '+
                     ' CASE WHEN SUM(SALDOS_FV)=0 THEN 0 ELSE ROUND(SUM(TOTPROV)/SUM(SALDOS_FV)*100,4) END PORPRO '+
               'FROM (SELECT CFC000'+xPos+'.OFDESID,CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM, SUM(NVL(SALDOS_FT,0)) SALDOS_FT, SUM(NVL(SALDOS_FV,0)) SALDOS_FV,SUM(NVL(SALDOS_FP,0)) SALDOS_FP, '+
               'SUM(NVL(SALDO_CB,0)) SALDO_CB,SUM(NVL(SALDO_NC,0)) SALDO_NC,MAX(P_NC) P_NC,(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/100 PORNC, '+
               'MAX(P_CB) P_CB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/100 PORCB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/MAX(100)+(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/MAX(100) TOTPROV  '+
               'FROM CFC000'+xPos+',COB113 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+xWhere+' '+
               'AND CFC000'+xPos+'.CFC_F=COB113.RESUMEID(+) GROUP BY CFC000'+xPos+'.OFDESID,CFC_F,RESUMEDES) A, APO110 B WHERE A.OFDESID=B.OFDESID(+) GROUP BY A.OFDESID,B.OFDESNOM ORDER BY INDMOR DESC ';
          DM1.cdsQry5.DataRequest(xSQL);
          DM1.cdsQry5.Open;
          If DM1.cdsQry5.RecordCount > 0 Then  DM1.ExportaGridExcel(dtgTmp01,'ExpDatos14');
          DM1.cdsQry5.Close;
      End;
   If chk03.Checked Then
      Begin
         DM1.cdsQry.Close;
         // Inicio HPC_201701_RSG 
         // Alinear monto créditos refinanciados con el monto del reporte BDC01
         if(rdbTipCar.ItemIndex = 2) then
         begin
             xSQL:='SELECT '+
             'RESUMEDES, '+
             'SUM(MOVIM) MOVIM, '+
             'SUM(SALDOS_FT) SALDOS_FT, '+
             'SUM(INTERES_FV) INTERES_FV, '+
             'SUM(INTERES_FP) INTERES_FP, '+
             'SUM(INTERES_FT) INTERES_FT, '+
             'SUM(INTERES_PM) INTERES_PM '+
             'FROM ( '+
             'SELECT RESUMEDES, '+
             'ROUND(MOVIM, 4) MOVIM, '+
             'ROUND(SALDOS_FT, 4) SALDOS_FT, '+
             'ROUND(INTERES_FV, 4) INTERES_FV, '+
             'ROUND(INTERES_FP, 4) INTERES_FP, '+
             'ROUND(INTERES_FT, 4) INTERES_FT, '+
             'ROUND(INTERES_PM, 4) INTERES_PM '+
             ' FROM '+
             ' ( '+
             'SELECT '+
             'RESUMEDES,NVL(SUM(MOVIM),0) MOVIM,(NVL(SUM(MOVIM),0))*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue))+' Movim_Por,NVL(SUM(SALDOS),0) SALDOS_FT,NVL(SUM(SALDOS),0)*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('SALDOS').FooterValue))+' SaldoTotal_Por, '+
             'SUM(SALDOS_FP) SALDOS_FP, '+
             'SUM(SALDOS_FV) SALDOS_FV, '+
             'SUM(SALDO_CB) SALDO_CB, '+
             'SUM(SALDO_NC) SALDO_NC, '+
             'ROUND(A.P_NC, 4) P_NC, '+
             'SUM(PORNC) PORNC, '+
             'ROUND(A.P_CB, 4) P_CB, '+
             'SUM(PORCB) PORCB, '+
             'SUM(TOTPROV) TOTPROV, '+
             'NVL(D.INTERES_FV, 0) INTERES_FV, '+
             'NVL(INTERES_FP, 0) INTERES_FP, '+
             'NVL(INTERES_FT, 0) INTERES_FT, '+
             'NVL(INTERES_PM, 0) INTERES_PM '+
             'FROM COB113 A, '+
             '(SELECT C.ASOID,CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM,C.PORCENTAJE,C.SALTOREF,SALDOS_FT, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN SUM(NVL(C.SALTOREF, 0))  ELSE SUM(NVL(SALDOS_FT, 0)) END SALDOS, '+
                     'CASE WHEN C.PORCENTAJE <> 1 THEN SUM(NVL(C.SALDOS_P, 0)) ELSE SUM(NVL(SALDOS_FP, 0)) END SALDOS_FP, '+
                     'CASE WHEN C.PORCENTAJE <> 1 THEN (SUM(NVL(C.SALDOS_V, 0))) ELSE SUM(NVL(SALDOS_FV, 0)) END SALDOS_FV, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND((SUM(NVL(SALDO_CB, 0)))*(C.PORCENTAJE),2) ELSE SUM(NVL(SALDO_CB, 0)) END SALDO_CB, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND((SUM(NVL(SALDO_NC, 0)))*(C.PORCENTAJE),2) ELSE SUM(NVL(SALDO_NC, 0)) END SALDO_NC, '+
                     'MAX(P_NC) P_NC, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100)*(C.PORCENTAJE),2) ELSE (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100 END PORNC, '+
                     'MAX(P_CB) P_CB, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100)*(C.PORCENTAJE),2) ELSE (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100 END PORCB, '+
                     'CASE WHEN C.PORCENTAJE <>1 THEN ROUND(((SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100))*(C.PORCENTAJE),2) '+
                     'ELSE (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) END TOTPROV, '+
                     ' SUM(NVL(INTERES_FV, 0)) INTERES_FV, '+
                     ' SUM(NVL(INTERES_FP, 0)) INTERES_FP, '+
                     ' SUM(NVL(INTERES_FT, 0)) INTERES_FT, '+
                     ' SUM(NVL(INTERES_PM, 0)) INTERES_PM '+
                     'FROM CFC000'+xPos+', COB113 , '+
                     '( '+
                      'SELECT A.ASOID,A.SALDOS,B.SALTOREF,B.SALDOS_V, B.SALDOS_P,'+
                      ' CASE WHEN A.SALDOS=B.SALTOREF THEN 1 '+
                      '   WHEN A.SALDOS > B.SALTOREF THEN ROUND((B.SALTOREF/A.SALDOS),4) '+
                      ' END PORCENTAJE '+
                      ' FROM '+
                      ' (SELECT ASOID,CFC_F CFC,RESUMEDES CFCDES, '+
                                      ' COUNT(*) MOVIM, '+
                                      ' SUM(NVL(SALDOS_FT, 0)) SALDOS, '+
                                      ' SUM(NVL(SALDOS_FP, 0)) SALDOS_FP, '+
                                      ' SUM(NVL(SALDOS_FV, 0)) SALDOS_FV, '+
                                      ' SUM(NVL(SALDO_CB, 0)) SALDO_CB, '+
                                      ' SUM(NVL(SALDO_NC, 0)) SALDO_NC, '+
                                      ' MAX(P_NC) P_NC, '+
                                      ' (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / 100 PORNC, '+
                                      ' MAX(P_CB) P_CB, '+
                                      ' (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / 100 PORCB, '+
                                      ' (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + '+
                                      ' (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) TOTPROV '+
                                 ' FROM CFC000'+xPos+', COB113 WHERE PERIODO ='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+
                                   ' AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) '+xWhere+' '+
                                 ' GROUP BY ASOID,CFC_F, RESUMEDES) A, '+
                                 '( '+
                                 ' SELECT '+
                                 ' ASOID,SUM(SALTOT) SALTOREF, SUM(SALDOS_V) SALDOS_V, SUM(SALDOS_P) SALDOS_P FROM '+
                                 //Inicio HPC_201702_RSG
                                 //Corrección del cálculo del monto de saldo pendiente y saldo vencido.
                                 ' (SELECT ASOID,CREDID, NVL(SALTOT,0) SALTOT, NVL(SALVEN, 0) SALDOS_V, NVL(SALPEN, 0) SALDOS_P FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND TIPDESEID=''10'' AND SUBSTR(CREDID,9,1)=''R'' '+
                                 //Fin HPC_201702_RSG
                                 ' ) '+
                                 ' GROUP BY ASOID '+
                                 ' )B '+
                                 ' WHERE A.ASOID=B.ASOID '+
                                 ' ) C '+
                                 ' WHERE PERIODO = '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+
                                   ' AND CFC000'+xPos+'.ASOID = C.ASOID '+
                                   ' AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) ' + xWhere +
                                 ' GROUP BY C.ASOID,C.SALTOREF,C.PORCENTAJE,SALDOS_FT,CFC_F, RESUMEDES) D  '+
                         ' WHERE A.RESUMEID = D.CFC(+) '+
                         ' GROUP BY RESUMEDES,A.P_NC,A.P_CB,D.INTERES_FV,INTERES_FP,INTERES_FP,INTERES_FT,INTERES_FT,INTERES_PM '+
                         'ORDER BY A.P_NC) '+
                         ' GROUP BY RESUMEDES,MOVIM, P_NC, P_CB,SALDOS_FT,INTERES_FV,INTERES_FP,INTERES_FT,INTERES_PM '+
                         ' ORDER BY P_NC) '+
                         ' GROUP BY RESUMEDES '+
                         ' ORDER BY MOVIM DESC';
         end
         else
         begin
             xSQL:='SELECT RESUMEDES, '+
                     ' ROUND(MOVIM,4) MOVIM, '+
                     ' ROUND(SALDOS_FT,4) SALDOS_FT, '+
                     ' ROUND(INTERES_FV,4) INTERES_FV, '+
                     ' ROUND(INTERES_FP,4) INTERES_FP, '+
                     ' ROUND(INTERES_FT,4) INTERES_FT, '+
                     ' ROUND(INTERES_PM,4) INTERES_PM '+
               'FROM (SELECT RESUMEID,RESUMEDES,NVL(B.MOVIM,0) MOVIM,(NVL(B.MOVIM,0))*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue))+' Movim_Por,NVL(B.SALDOS_FT,0) SALDOS_FT,NVL(B.SALDOS_FT,0)*100/'+FloatToStr(DM1.Valores(dtgClfCar.ColumnByName('SALDOS').FooterValue))+' SaldoTotal_Por, '+
               'NVL(SALDOS_FV,0) SALDOS_FV,NVL(SALDOS_FP,0) SALDOS_FP,NVL(B.SALDO_CB,0) SALDO_CB, '+
               'NVL(B.SALDO_NC,0) SALDO_NC,A.P_NC,NVL(PORNC,0) PORNC,A.P_CB,NVL(B.PORCB,0) PORCB,NVL(B.TOTPROV,0) TOTPROV,NVL(B.INTERES_FV,0) INTERES_FV, NVL(INTERES_FP,0) INTERES_FP,NVL(INTERES_FT,0) INTERES_FT ,NVL(INTERES_PM,0) INTERES_PM '+
               'FROM COB113 A,(SELECT CFC_F CFC,RESUMEDES CFCDES,COUNT(*) MOVIM, SUM(NVL(SALDOS_FT,0)) SALDOS_FT, SUM(NVL(SALDOS_FV,0)) SALDOS_FV,SUM(NVL(SALDOS_FP,0)) SALDOS_FP, '+
               'SUM(NVL(SALDO_CB,0)) SALDO_CB,SUM(NVL(SALDO_NC,0)) SALDO_NC,MAX(P_NC) P_NC,(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/100 PORNC, '+
               'MAX(P_CB) P_CB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/100 PORCB,(SUM(NVL(SALDO_CB,0))*MAX(P_CB))/MAX(100)+(SUM(NVL(SALDO_NC,0))*MAX(P_NC))/MAX(100) TOTPROV, SUM(NVL(INTERES_FV,0)) INTERES_FV, SUM(NVL(INTERES_FP,0)) INTERES_FP, '+
               'SUM(NVL(INTERES_FT,0)) INTERES_FT ,SUM(NVL(INTERES_PM,0)) INTERES_PM   '+
               'FROM CFC000'+xPos+',COB113 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND CFC000'+xPos+'.CFC_F=COB113.RESUMEID(+) '+xWhere+' '+
               'GROUP BY CFC_F,RESUMEDES) B WHERE A.RESUMEID=B.CFC(+) ORDER BY A.P_NC)';
         end;
         // Final HPC_201701_RSG 
          DM1.cdsQry.DataRequest(xSQL);
          DM1.cdsQry.Open;
          If DM1.cdsQry.RecordCount > 0 Then  DM1.ExportaGridExcel(dtgTmp02,'ExpDatos15');
          DM1.cdsQry.Close;
      End;

end;

// Fin HPC_201501_RSG

(******************************************************************************)

// Inicio HPC_201501_RSG
procedure TfCalfCtaxCob.BitGraficoClick(Sender: TObject);
var xSQL,xPos,xPeriodo:string;
    xTit: TStrings;
    xWhere,xTitulo:String;
begin
    If dtgClfCar.DataSource.DataSet.RecordCount=0 Then Exit;
    If DM1.Valores(dtgClfCar.ColumnByName('MOVIM').FooterValue)=0 Then Exit;
    xPeriodo:=Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))]));
    If chkNoOficial.Checked Then xPos:='_TMP' Else xPos:='';
    Case rdbTipCar.ItemIndex Of
         0:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND ASOTIPID=''DO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND ASOTIPID=''CE'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND ASOTIPID=''CO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         1:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''DO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''CE'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND NVL(SALDOS_RT,0)=0 AND ASOTIPID=''CO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         2:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') ';
                        xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''DO'' ';

                        xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''CE'' ';
                        xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''R'') AND ASOTIPID=''CO'' ';
                        xTitulo:='Tipo de Cartera : REFINANCIADA    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         3:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') ';
                        xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''DO'' ';
                        xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''CE'' ';
                        xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND EXISTS (SELECT ASOID,CREDID FROM SAL000'+xPos+' '+
                                  ' WHERE PERIODO='+QuotedStr(xPeriodo)+' AND TIPDESEID=''10'' '+
                                  ' AND CFC000'+xPos+'.ASOID=ASOID AND SUBSTR(CREDID,9,1)=''A'') AND ASOTIPID=''CO'' ';
                        xTitulo:='Tipo de Cartera : AMPLIADA    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
    End;

    xSQL:='SELECT RESUMEDES CATEGORIA_RIESGO, '+
                ' ROUND(NVL(B.SALDOS, 0),4) SALDO_TOTAL, '+
                ' ROUND(NVL(B.SALDOS_FP, 0),4) SALDO_NO_VENCIDO, '+
                ' ROUND(NVL(B.SALDOS_FV, 0),4) SALDO_VENCIDO, '+
                ' ROUND(NVL(B.TOTPROV, 0),4) TOTAL_PROVISION '+
                ' FROM COB113 A, '
         +'       (SELECT  CFC_F CFC, RESUMEDES CFCDES, '
         +'                SUM(NVL(SALDOS_FT, 0)) SALDOS, '
         +'                SUM(NVL(SALDOS_FP, 0)) SALDOS_FP, '
         +'                SUM(NVL(SALDOS_FV, 0)) SALDOS_FV, '
         +'                (SUM(NVL(SALDO_CB, 0)) * MAX(P_CB)) / MAX(100) + '
         +'                 (SUM(NVL(SALDO_NC, 0)) * MAX(P_NC)) / MAX(100) TOTPROV '
         +'           FROM CFC000'+xPos+', COB113 '
         +'          WHERE PERIODO = '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))
         +'            AND CFC000'+xPos+'.CFC_F = COB113.RESUMEID(+) '+xWhere+' '
         +'          GROUP BY CFC_F, RESUMEDES) B '
         +' WHERE A.RESUMEID = B.CFC(+) '
         +' ORDER BY A.P_NC ';
    FChart:= TFChart.create(self);
    try
       xTit := TStringList.Create;
       xTit.Add('Calificación de Deudores y Exigencia de Provisiones - '+xTitulo); // por ahora una sola linea, xq se descuadran los comentarios
       FChart.crearGrafico(DM1.wModulo,xTit,xSQL);
       FChart.showmodal
    finally
       FChart.free;
    end;
end;
// Fin HPC_201501_RSG

(******************************************************************************)
procedure TfCalfCtaxCob.rdbTipCarClick(Sender: TObject);
begin
LimpiaGrid;
end;
(******************************************************************************)
procedure TfCalfCtaxCob.rdbTipAsoClick(Sender: TObject);
begin
LimpiaGrid;
end;
(******************************************************************************)


// Inicio HPC_201501_RSG
procedure TfCalfCtaxCob.BitIngresosClick(Sender: TObject);
var xSQL: string;
    xFechaInicial : string;
    xFechaFinal : string;
    xPeriodo : string;
begin
  Screen.Cursor := crHourGlass;
  xPeriodo := Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))]));
  xSQL := 'SELECT TO_CHAR(FECHA_INICIAL,''DD/MM/YYYY'')           FECHA_INICIAL, '+
          '       TO_CHAR(LAST_DAY(FECHA_INICIAL),''DD/MM/YYYY'') FECHA_FINAL '+
          '  FROM (SELECT TO_DATE('+QuotedStr(xPeriodo)+', ''YYYYMM'') FECHA_INICIAL '+
          '          FROM DUAL)';

  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSQL);
  DM1.cdsQry.Open;
  xFechaInicial := DM1.cdsQry.fieldbyname('FECHA_INICIAL').AsString;
  xFechaFinal   := DM1.cdsQry.fieldbyname('FECHA_FINAL').AsString;

  ppLabel54.Caption := 'DE '+ xFechaInicial +' AL ' + xFechaFinal;

  xSQL := 'SELECT TIPO, FORPAGODES, TOTAL, AMORTIZACION '+
          '  FROM (SELECT ''INGRESOS MENSUALES'' TIPO, FORPAGODES, SUM(NVL(CREMTOCOB,0)) TOTAL, SUM(NVL(CREAMORT,0)) AMORTIZACION '+
          '          FROM CRE310 A,COB101 B '+
          '         WHERE FREG BETWEEN '+QuotedStr(xFechaInicial)+' AND '+QuotedStr(xFechaFinal)+
          '           AND CREESTID NOT IN (''04'',''13'',''99'') '+
          '           AND A.FORPAGID=B.FORPAGOID(+) '+
          '         GROUP BY FORPAGODES) '+
          ' ORDER BY AMORTIZACION DESC ';
  DM1.cdsQry22.Close;
  DM1.cdsQry22.DataRequest(xSQL);
  DM1.cdsQry22.Open;
  if (DM1.cdsQry22.RecordCount = 0) then
  begin
    Screen.Cursor := crDefault;
    MessageDlg('No existen datos para el periodo : ' + xPeriodo, mtError, [mbOk], 0);
    exit;
  end;
  PPDBPIngresos.DataSource:=DM1.dsQry22;
  Screen.Cursor := crDefault;
  PPRIngresos.Print;
  PPRIngresos.Cancel;
end;
// Fin HPC_201501_RSG

(******************************************************************************)
procedure TfCalfCtaxCob.BitInventariosClick(Sender: TObject);
var xSQL: string;
    xPeriodo : string;
    xMes : String;
begin
  Screen.Cursor := crHourglass;

  xSQL := 'SELECT TRIM(TO_CHAR(TO_DATE('''+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])+''', ''MM''), ''MONTH'', ''NLS_DATE_LANGUAGE = ''''SPANISH'''''')) MES FROM DUAL';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSQL);
  DM1.cdsQry.Open;
  xMes := DM1.cdsQry.fieldbyname('MES').AsString;

  xPeriodo := Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))]));

  xSQL := 'SELECT PERIODO, ORDEN, TIPO||'' (a)'' TIPO, DETALLE, CANTIDAD '+
          '  FROM RSG_HOJA_DE_TRABAJO_RES '+
          ' WHERE PERIODO = '+ QuotedStr(xPeriodo) +
          '   AND TIPO = ''SALDO INICIAL'' '+
          ' ORDER BY ORDEN';
  DM1.cdsQry22.Close;
  DM1.cdsQry22.DataRequest(xSQL);
  DM1.cdsQry22.Open;
  if (DM1.cdsQry22.RecordCount = 0) then
  begin
    Screen.Cursor := crDefault;
    MessageDlg('No existen datos para el periodo : ' + xPeriodo, mtError, [mbOk], 0);
    exit;
  end;
  PPDBPInventarios_Inicial.DataSource:=DM1.dsQry22;


  xSQL := 'SELECT PERIODO, ORDEN, TIPO||'' (b)'' TIPO, DETALLE, CANTIDAD '+
          '  FROM RSG_HOJA_DE_TRABAJO_RES '+
          ' WHERE PERIODO = '+ QuotedStr(xPeriodo) +
          '   AND TIPO = ''ENTRARON'' '+
          ' ORDER BY ORDEN';
  DM1.cdsQry23.Close;
  DM1.cdsQry23.DataRequest(xSQL);
  DM1.cdsQry23.Open;
  PPDBPInventarios_Entraron.DataSource:=DM1.dsQry23;


  xSQL := 'SELECT PERIODO, ORDEN, TIPO||'' (c)'' TIPO, DETALLE, CANTIDAD '+
          '  FROM RSG_HOJA_DE_TRABAJO_RES '+
          ' WHERE PERIODO = '+ QuotedStr(xPeriodo) +
          '   AND TIPO = ''SALIERON'' '+
          ' ORDER BY ORDEN';
  DM1.cdsQry24.Close;
  DM1.cdsQry24.DataRequest(xSQL);
  DM1.cdsQry24.Open;
  PPDBPInventarios_Salieron.DataSource:=DM1.dsQry24;

  xSQL := 'SELECT PERIODO, ORDEN, TIPO, DETALLE, CANTIDAD '+
          '  FROM RSG_HOJA_DE_TRABAJO_RES '+
          ' WHERE PERIODO = '+ QuotedStr(xPeriodo) +
          '   AND TIPO = ''SALDO FINAL'' '+
          ' ORDER BY ORDEN';
  DM1.cdsQry25.Close;
  DM1.cdsQry25.DataRequest(xSQL);
  DM1.cdsQry25.Open;
  PPDBPInventarios_Final.DataSource:=DM1.dsQry25;


  PPLTitulo21.Caption := 'CARTERA ' + xMes +' '+dbsAnoIni.Text;
  Screen.Cursor := crDefault;

  PPRInventarios.Print;
  PPRInventarios.Cancel;
end;
(******************************************************************************)
end.
