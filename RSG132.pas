// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FDetalle
// Fecha de Creación :13/11/2017
// Autor : Equipo de Sistemas
// Objetivo : Detalle de los archivos validados
// HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC

// Inicio HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
unit RSG132;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids,Db, Wwdbigrd, Wwdbgrid, DBTables, DBGrids,
  Buttons, StdCtrls, ExtCtrls, fcButton, fcImgBtn, fcShapeBtn, ppBands,
  ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport;

type
  TFDetalle = class(TForm)
    lbltitulo: TLabel;
    Label1: TLabel;
    StaticText1: TStaticText;
    PanelKVI: TPanel;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    PanelKVE: TPanel;
    PanelKRF: TPanel;
    PanelSKCR: TPanel;
    PanelPCI: TPanel;
    PanelMCUO: TPanel;
    StaticText20: TStaticText;
    Panel1710103: TPanel;
    Panel1710503: TPanel;
    Panel1710403: TPanel;
    Panel196: TPanel;
    PanelBDC01Deudores: TPanel;
    PanelBDC01Creditos: TPanel;
    Panel13: TPanel;
    Panel50: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    StaticText24: TStaticText;
    PanelNUECANTIDAD: TPanel;
    PanelNUEMONTO: TPanel;
    PanelEXTCANTIDAD: TPanel;
    PanelEXTMONTO: TPanel;
    PanelCANCANTIDAD: TPanel;
    PanelCANMONTO: TPanel;
    GroupBox1: TGroupBox;
    ShapeObservado: TShape;
    lblObservado: TLabel;
    ShapeConforme: TShape;
    lblConforme: TLabel;
    PanelBDC02ADeudores: TPanel;
    PanelBDC02ACreditos: TPanel;
    btnSalir: TBitBtn;
    panelObs: TPanel;
    StaticText27: TStaticText;
    BitOut: TfcShapeBtn;
    btnDiferencia: TBitBtn;
    StaticText28: TStaticText;
    StaticText29: TStaticText;
    StaticText30: TStaticText;
    StaticText31: TStaticText;
    StaticText32: TStaticText;
    StaticText33: TStaticText;
    StaticText34: TStaticText;
    StaticText35: TStaticText;
    StaticText36: TStaticText;
    StaticText37: TStaticText;
    StaticText38: TStaticText;
    BDC01_KVI: TStaticText;
    StaticText40: TStaticText;
    BALANCE_KVI: TStaticText;
    DIFERENCIA_KVI: TStaticText;
    BDC01_KVE: TStaticText;
    StaticText44: TStaticText;
    BALANCE_KVE: TStaticText;
    DIFERENCIA_KVE: TStaticText;
    BDC01_KRF: TStaticText;
    StaticText48: TStaticText;
    BALANCE_KRF: TStaticText;
    DIFERENCIA_KRF: TStaticText;
    BDC01_SKCR: TStaticText;
    BDC02A_SKCR: TStaticText;
    StaticText53: TStaticText;
    DIFERENCIA_SKCR: TStaticText;
    BDC01_PCI: TStaticText;
    StaticText56: TStaticText;
    BALANCE_PCI: TStaticText;
    DIFERENCIA_PCI: TStaticText;
    BDC01_DEUDORES: TStaticText;
    BDC02A_DEUDORES: TStaticText;
    StaticText61: TStaticText;
    DIFERENCIA_DEUDORES: TStaticText;
    BDC01_CREDITOS: TStaticText;
    BDC02A_CREDITOS: TStaticText;
    StaticText65: TStaticText;
    DIFERENCIA_CREDITOS: TStaticText;
    procedure FormActivate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure BitOutClick(Sender: TObject);
    procedure btnDiferenciaClick(Sender: TObject);
  private
    { Private declarations }
  public
     mes:String;
     anio:String;
     secuencia:Integer;
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;

implementation

uses RSGDM1;

{$R *.dfm}

procedure TFDetalle.FormActivate(Sender: TObject);
var xSql:String;
BDC01_SKCR_REAL,
BDC01_PCI_REAL,
BDC01_KVI_REAL,
BDC01_KRF_REAL,
BDC01_KVE_REAL,
BDC01_Deudores_REAL,
BDC01_Creditos_REAL:Real;

BDC02A_SKCR_REAL,
BDC02A_DEUDORES_REAL,
BDC02A_CREDITOS_REAL:REAL;

BALANCE_KVI_REAL,
BALANCE_KVE_REAL,
BALANCE_KRF_REAL,
BALANCE_PCI_REAL:REAL;
begin
  CurrencyString := '';
  lbltitulo.Caption:=lbltitulo.Caption+DM1.DesMes(StrToInt(mes),'N')+' '+anio;
  xSql := 'SELECT SKCR,PCI,KVI,KRF,KVE,MCUO,CANDEU,NROCRE FROM RSG_DET_VAL A WHERE A.CODSEC='+inttostr(secuencia)+' AND A.CODBDC=1';
  DM1.cdsPadre.Close;
  DM1.cdsPadre.DataRequest(xSql);
  DM1.cdsPadre.Open;
  PanelSKCR.Caption:=CurrToStrF(DM1.cdsPadre.FieldByName('SKCR').AsCurrency, ffCurrency, 2);
  PanelPCI.Caption:=CurrToStrF(DM1.cdsPadre.FieldByName('PCI').AsCurrency, ffCurrency, 4);
  PanelKVI.Caption:=CurrToStrF(DM1.cdsPadre.FieldByName('KVI').AsCurrency, ffCurrency, 2);
  PanelKRF.Caption:=CurrToStrF(DM1.cdsPadre.FieldByName('KRF').AsCurrency, ffCurrency, 2);
  PanelKVE.Caption:=CurrToStrF(DM1.cdsPadre.FieldByName('KVE').AsCurrency, ffCurrency, 2);
  PanelBDC01Deudores.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('CANDEU').AsCurrency,ffCurrency, 0);
  PanelBDC01Creditos.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('NROCRE').AsCurrency,ffCurrency, 0);

  BDC01_SKCR.Caption:=CurrToStrF(DM1.cdsPadre.FieldByName('SKCR').AsCurrency, ffCurrency, 2);
  BDC01_PCI.Caption:=CurrToStrF(DM1.cdsPadre.FieldByName('PCI').AsCurrency, ffCurrency, 4);
  BDC01_KVI.Caption:=CurrToStrF(DM1.cdsPadre.FieldByName('KVI').AsCurrency, ffCurrency, 2);
  BDC01_KRF.Caption:=CurrToStrF(DM1.cdsPadre.FieldByName('KRF').AsCurrency, ffCurrency, 2);
  BDC01_KVE.Caption:=CurrToStrF(DM1.cdsPadre.FieldByName('KVE').AsCurrency, ffCurrency, 2);
  BDC01_Deudores.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('CANDEU').AsCurrency,ffCurrency, 0);
  BDC01_Creditos.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('NROCRE').AsCurrency,ffCurrency, 0);

  BDC01_SKCR_REAL:=DM1.cdsPadre.FieldByName('SKCR').AsFloat;
  BDC01_PCI_REAL:=DM1.cdsPadre.FieldByName('PCI').AsFloat;
  BDC01_KVI_REAL:=DM1.cdsPadre.FieldByName('KVI').AsFloat;
  BDC01_KRF_REAL:=DM1.cdsPadre.FieldByName('KRF').AsFloat;
  BDC01_KVE_REAL:=DM1.cdsPadre.FieldByName('KVE').AsFloat;
  BDC01_Deudores_REAL:=DM1.cdsPadre.FieldByName('CANDEU').AsFloat;
  BDC01_Creditos_REAL:=DM1.cdsPadre.FieldByName('NROCRE').AsFloat;

  
  xSql := 'SELECT SKCR,PCI,KVI,KRF,KVE,MCUO,CANDEU,NROCRE FROM RSG_DET_VAL A WHERE A.CODSEC='+inttostr(secuencia)+' AND A.CODBDC=2';
  DM1.cdsPadre.Close;
  DM1.cdsPadre.DataRequest(xSql);
  DM1.cdsPadre.Open;
  PanelMCUO.Caption:=CurrToStrF(DM1.cdsPadre.FieldByName('MCUO').AsCurrency, ffCurrency, 2);
  PanelBDC02ADeudores.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('CANDEU').AsCurrency,ffCurrency, 0);
  PanelBDC02ACreditos.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('NROCRE').AsCurrency,ffCurrency, 0);

  BDC02A_SKCR.Caption:=CurrToStrF(DM1.cdsPadre.FieldByName('MCUO').AsCurrency, ffCurrency, 2);
  BDC02A_DEUDORES.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('CANDEU').AsCurrency,ffCurrency, 0);
  BDC02A_Creditos.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('NROCRE').AsCurrency,ffCurrency, 0);

  BDC02A_SKCR_REAL:=DM1.cdsPadre.FieldByName('MCUO').AsFloat;
  BDC02A_DEUDORES_REAL:=DM1.cdsPadre.FieldByName('CANDEU').AsFloat;
  BDC02A_CREDITOS_REAL:=DM1.cdsPadre.FieldByName('NROCRE').AsFloat;

  xSql := 'SELECT ''SALDOS'' SALDOS,SUM(CASE WHEN CUENTAID =''1710103'' THEN SALDMN'+mes+' ELSE 0 END) CTA1710103,'+
  'SUM(CASE WHEN CUENTAID =''1710503'' THEN SALDMN'+mes+' ELSE 0 END) CTA1710503,'+
  'SUM(CASE WHEN CUENTAID =''1710403'' THEN SALDMN'+mes+' ELSE 0END) CTA1710403,'+
  'abs(SUM(CASE WHEN CUENTAID =''196'' THEN SALDMN'+mes+' ELSE 0 END)) CTA196,'+
  ' '' '' CTA1,'' '' CTA2,'' '' CTA3,'' '' CTA4 '+
  'FROM CNT401 WHERE CIAID=''01'' AND ANO='+quotedstr(anio)+'  AND CUENTAID IN (''1710103'',''1710503'',''1710403'',''196'') AND TIPREG=''1'' ';
  DM1.cdsPadre.Close;
  DM1.cdsPadre.DataRequest(xSql);
  DM1.cdsPadre.Open;
  Panel1710103.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('CTA1710103').AsCurrency, ffCurrency, 2);
  Panel1710503.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('CTA1710503').AsCurrency, ffCurrency, 2);
  Panel1710403.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('CTA1710403').AsCurrency, ffCurrency, 2);
  Panel196.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('CTA196').AsCurrency, ffCurrency, 4);

  BALANCE_KVI.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('CTA1710103').AsCurrency, ffCurrency, 2);
  BALANCE_KVE.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('CTA1710503').AsCurrency, ffCurrency, 2);
  BALANCE_KRF.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('CTA1710403').AsCurrency, ffCurrency, 2);
  BALANCE_PCI.Caption:= CurrToStrF(DM1.cdsPadre.FieldByName('CTA196').AsCurrency, ffCurrency, 4);

  BALANCE_KVI_REAL:=DM1.cdsPadre.FieldByName('CTA1710103').AsFloat;
  BALANCE_KVE_REAL:=DM1.cdsPadre.FieldByName('CTA1710503').AsFloat;
  BALANCE_KRF_REAL:=DM1.cdsPadre.FieldByName('CTA1710403').AsFloat;
  BALANCE_PCI_REAL:=DM1.cdsPadre.FieldByName('CTA196').AsFloat;

  DIFERENCIA_KVI.Caption:=CurrToStrF(ABS(BDC01_KVI_REAL-BALANCE_KVI_REAL), ffCurrency, 2);
  DIFERENCIA_KVE.Caption:=CurrToStrF(ABS(BDC01_KVE_REAL-BALANCE_KVE_REAL), ffCurrency, 2);
  DIFERENCIA_KRF.Caption:=CurrToStrF(ABS(BDC01_KRF_REAL-BALANCE_KRF_REAL), ffCurrency, 2);
  DIFERENCIA_PCI.Caption:=CurrToStrF(ABS(BDC01_PCI_REAL-BALANCE_PCI_REAL), ffCurrency, 4);
  DIFERENCIA_SKCR.Caption:=CurrToStrF(ABS(BDC01_SKCR_REAL-BDC02A_SKCR_REAL), ffCurrency, 2);
  DIFERENCIA_DEUDORES.Caption:=CurrToStrF(ABS(BDC01_DEUDORES_REAL-BDC02A_DEUDORES_REAL), ffCurrency, 0);
  DIFERENCIA_CREDITOS.Caption:=CurrToStrF(ABS(BDC01_CREDITOS_REAL-BDC02A_CREDITOS_REAL), ffCurrency, 0);

  xSql := 'BEGIN SF_RSG_CRE_EST('+quotedstr(anio+mes)+'); END;';
  DM1.DCOM1.AppServer.EjecutaSql(xSQL);

  xSql := 'SELECT CANCANTIDAD,CANMONTO,NUECANTIDAD,NUEMONTO,EXTCANTIDAD,EXTMONTO FROM RSG_BALANCE_TEMP';
  DM1.cdsPadre.Close;
  DM1.cdsPadre.DataRequest(xSql);
  DM1.cdsPadre.Open;
  PanelCANCANTIDAD.Caption:= DM1.cdsPadre.FieldByName('CANCANTIDAD').AsString;
  PanelCANMONTO.Caption:=  CurrToStrF(DM1.cdsPadre.FieldByName('CANMONTO').AsCurrency, ffCurrency, 2);
  PanelNUECANTIDAD.Caption:= DM1.cdsPadre.FieldByName('NUECANTIDAD').AsString;
  PanelNUEMONTO.Caption:=  CurrToStrF(DM1.cdsPadre.FieldByName('NUEMONTO').AsCurrency, ffCurrency, 2);
  PanelEXTCANTIDAD.Caption:= DM1.cdsPadre.FieldByName('EXTCANTIDAD').AsString;
  PanelEXTMONTO.Caption:=  CurrToStrF(DM1.cdsPadre.FieldByName('EXTMONTO').AsCurrency, ffCurrency, 2);

  If PanelKVI.Caption<>Panel1710103.Caption Then
  Begin
    PanelKVI.Color:= $00B4ACFB;
    Panel1710103.Color:=$00B4ACFB;
  End;
  If PanelKVE.Caption<>Panel1710503.Caption Then
  Begin
    PanelKVE.Color:= $00B4ACFB;
    Panel1710503.Color:=$00B4ACFB;
  End;
  If PanelKRF.Caption<>Panel1710403.Caption Then
  Begin
    PanelKRF.Color:= $00B4ACFB;
    Panel1710403.Color:=$00B4ACFB;
  End;
  If PanelPCI.Caption<>Panel196.Caption Then
  Begin
    PanelPCI.Color:= $00B4ACFB;
    Panel196.Color:=$00B4ACFB;
  End;
  If PanelSKCR.Caption<>PanelMCUO.Caption Then
  Begin
    PanelSKCR.Color:= $00B4ACFB;
    PanelMCUO.Color:=$00B4ACFB;
  End;
  If PanelBDC01Deudores.Caption<>PanelBDC02ADeudores.Caption Then
  Begin
    PanelBDC01Deudores.Color:= $00B4ACFB;
    PanelBDC02ADeudores.Color:=$00B4ACFB;
  End;
  If PanelBDC01Creditos.Caption<>PanelBDC02ACreditos.Caption Then
  Begin
    PanelBDC01Creditos.Color:= $00B4ACFB;
    PanelBDC02ACreditos.Color:=$00B4ACFB;
  End;
end;

procedure TFDetalle.btnSalirClick(Sender: TObject);
begin
close;
end;

procedure TFDetalle.BitOutClick(Sender: TObject);
begin
panelObs.Visible:=false;
end;

procedure TFDetalle.btnDiferenciaClick(Sender: TObject);
begin
panelObs.Visible:=true;
end;

 

end.
