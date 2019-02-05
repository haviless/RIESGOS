// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fVisorComp
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Visor de Compración Periodos  Actual vs. Anterior
// HPC_201501_RSG : Visor de Comparación Periodos  Actual vs. Anterior


unit RSG129;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db;

type
  TfVisorComp = class(TForm)
    BitSalir: TBitBtn;
    pnlVisor: TPanel;
    pnl01: TPanel;
    pnl03: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    pnlPeriodo01: TPanel;
    lblPer01: TLabel;
    pnlPeriodo02: TPanel;
    lblPer02: TLabel;
    grpSal01: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    lblClas01: TLabel;
    lblProv01: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox2: TGroupBox;
    dtgPag01: TwwDBGrid;
    lblTot01: TLabel;
    lblVen01: TLabel;
    lblPen01: TLabel;
    lblCtaInd01: TLabel;
    lblCub01: TLabel;
    lblNoCub01: TLabel;
    GroupBox3: TGroupBox;
    lblClas02: TLabel;
    lblProv02: TLabel;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lblTot02: TLabel;
    lblVen02: TLabel;
    lblPen02: TLabel;
    lblCtaInd02: TLabel;
    lblCub02: TLabel;
    lblNoCub02: TLabel;
    GroupBox5: TGroupBox;
    dtgPag02: TwwDBGrid;
    lblCodAso: TLabel;
    lblApeNom: TLabel;
    lblDNI: TLabel;
    lblTipAso: TLabel;
    lblDpto: TLabel;
    lblUgel: TLabel;
    Shape1: TShape;
    Label19: TLabel;
    Shape2: TShape;
    lblTipAso01: TLabel;
    lblTipAso02: TLabel;
    lblCuoPac01: TLabel;
    Shape3: TShape;
    Label20: TLabel;
    Shape4: TShape;
    lblCuoPag01: TLabel;
    Shape5: TShape;
    Label21: TLabel;
    Label22: TLabel;
    Shape6: TShape;
    Label23: TLabel;
    lblCuoEfe01: TLabel;
    lblCuoPac02: TLabel;
    lblCuoPag02: TLabel;
    lblCuoEfe02: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    procedure BitSalirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure CargaComparacion(xAsoId,xPeriodo:String);
  public
    { Public declarations }
  end;

var
  fVisorComp: TfVisorComp;

implementation

uses RSG002, RSGDM1;

{$R *.dfm}

procedure TfVisorComp.BitSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfVisorComp.CargaComparacion(xAsoId, xPeriodo: String);
var xPerAnt,xFecIni,xFecFin,xSQL,xCfc01,xCfc02,xPos:String;
    xMonAnt,xAmoAnt,xIntAnt,xGasAnt,xDesAnt,xExcAnt,
    xMonAct,xAmoAct,xIntAct,xGasAct,xDesAct,xExcAct:Currency;
begin
Screen.Cursor:=crHourGlass;
xSQL:='SELECT COUNT(*) PERIODO FROM CFC000 WHERE PERIODO='+QuotedStr(xPeriodo);
If DM1.CountReg(xSQL)=0 Then
   Begin
      xPos:='_TMP ';
      xSQL:='SELECT MAX(PERIODO) PERIODO FROM CFC000';
   End
Else
   Begin
      xPos:=' ';
      xSQL:='SELECT MAX(PERIODO) PERIODO FROM CFC000 WHERE PERIODO<>'+QuotedStr(xPeriodo);
   End;
DM1.cdsQry25.Close;
DM1.cdsQry25.DataRequest(xSQL);
DM1.cdsQry25.Open;
xPerAnt:=DM1.cdsQry25.FieldByName('PERIODO').AsString;
DM1.cdsQry25.Close;

xSQL:='SELECT CFC_F,ASOTIPID,PERIODO,CFCDES_F,NVL(SALDOS_FT,0) SALDOS_FT,NVL(SALDOS_FV,0) SALDOS_FV,NVL(SALDOS_FP,0) SALDOS_FP, '+
      'NVL(CTAIND_F,0) CTAIND_F,NVL(SALDO_CB,0) SALDO_CB,NVL(SALDO_NC,0) SALDO_NC, DIASTRANS '+
      'FROM CFC000'+xPos+'WHERE ASOID='+QuotedStr(xAsoId)+' AND PERIODO='+QuotedStr(xPeriodo);
DM1.cdsQry25.Close;
DM1.cdsQry25.DataRequest(xSQL);
DM1.cdsQry25.Open;
If DM1.cdsQry25.RecordCount>0 Then
   Begin
      xCfc02:=DM1.cdsQry25.FieldByName('CFC_F').AsString;
      lblTipAso02.Caption:=DM1.cdsQry25.FieldByName('ASOTIPID').AsString;
      lblPer02.Caption:='Actual : '+DM1.CrgDescrip('MESIDR=' + QuotedStr(Copy(DM1.cdsQry25.FieldByName('PERIODO').AsString,5,2)),'TGE181', 'MESDESL')+'-'+Copy(DM1.cdsQry25.FieldByName('PERIODO').AsString,1,4);
      lblClas02.Caption:=DM1.cdsQry25.FieldByName('CFCDES_F').AsString+ ' ('+DM1.cdsQry25.FieldByName('DIASTRANS').AsString+')';
      lblProv02.Caption:=DM1.FormatoNumeros(DM1.CrgDescrip('ASOID=' + QuotedStr(xAsoId)+' AND PERACT='+QuotedStr(xPeriodo) , 'RIE_EST_GEN', 'SALDOS_PV'));
      lblTot02.Caption:=DM1.FormatoNumeros(DM1.cdsQry25.FieldByName('SALDOS_FT').AsString);
      lblVen02.Caption:=DM1.FormatoNumeros(DM1.cdsQry25.FieldByName('SALDOS_FV').AsString);
      lblPen02.Caption:=DM1.FormatoNumeros(DM1.cdsQry25.FieldByName('SALDOS_FP').AsString);
      lblCtaInd02.Caption:=DM1.FormatoNumeros(DM1.cdsQry25.FieldByName('CTAIND_F').AsString);
      lblCub02.Caption:=DM1.FormatoNumeros(DM1.cdsQry25.FieldByName('SALDO_CB').AsString);
      lblNoCub02.Caption:=DM1.FormatoNumeros(DM1.cdsQry25.FieldByName('SALDO_NC').AsString);
   End
Else
   Begin
      lblTipAso02.Caption:=''; lblPer02.Caption:=''; lblClas02.Caption:='NO CLASIFICADO'; lblProv02.Caption:=DM1.FormatoNumeros('0');
      lblTot02.Caption:=DM1.FormatoNumeros('0'); lblVen02.Caption:=DM1.FormatoNumeros('0'); lblPen02.Caption:=DM1.FormatoNumeros('0');
      lblCtaInd02.Caption:=DM1.FormatoNumeros('0'); lblCub02.Caption:=DM1.FormatoNumeros('0'); lblNoCub02.Caption:=DM1.FormatoNumeros('0');
   End;
DM1.cdsQry25.Close;

xSQL:='SELECT CFC_F,ASOTIPID,PERIODO,CFCDES_F,NVL(SALDOS_FT,0) SALDOS_FT,NVL(SALDOS_FV,0) SALDOS_FV,NVL(SALDOS_FP,0) SALDOS_FP, '+
      'NVL(CTAIND_F,0) CTAIND_F,NVL(SALDO_CB,0) SALDO_CB,NVL(SALDO_NC,0) SALDO_NC, DIASTRANS  '+
      'FROM CFC000 WHERE ASOID='+QuotedStr(xAsoId)+' AND PERIODO='+QuotedStr(xPerAnt);
DM1.cdsQry25.Close;
DM1.cdsQry25.DataRequest(xSQL);
DM1.cdsQry25.Open;
If DM1.cdsQry25.RecordCount>0 Then
   Begin
      xCfc01:=DM1.cdsQry25.FieldByName('CFC_F').AsString;
      lblTipAso01.Caption:=DM1.cdsQry25.FieldByName('ASOTIPID').AsString;
      lblPer01.Caption:='Anterior : '+DM1.CrgDescrip('MESIDR=' + QuotedStr(Copy(DM1.cdsQry25.FieldByName('PERIODO').AsString,5,2)),'TGE181', 'MESDESL')+'-'+Copy(DM1.cdsQry25.FieldByName('PERIODO').AsString,1,4);
      lblClas01.Caption:=DM1.cdsQry25.FieldByName('CFCDES_F').AsString+ ' ('+DM1.cdsQry25.FieldByName('DIASTRANS').AsString+')';
      lblProv01.Caption:=DM1.FormatoNumeros(DM1.CrgDescrip('ASOID=' + QuotedStr(xAsoId)+' AND PERACT='+QuotedStr(xPerAnt) , 'RIE_EST_GEN', 'SALDOS_PV'));
      lblTot01.Caption:=DM1.FormatoNumeros(DM1.cdsQry25.FieldByName('SALDOS_FT').AsString);
      lblVen01.Caption:=DM1.FormatoNumeros(DM1.cdsQry25.FieldByName('SALDOS_FV').AsString);
      lblPen01.Caption:=DM1.FormatoNumeros(DM1.cdsQry25.FieldByName('SALDOS_FP').AsString);
      lblCtaInd01.Caption:=DM1.FormatoNumeros(DM1.cdsQry25.FieldByName('CTAIND_F').AsString);
      lblCub01.Caption:=DM1.FormatoNumeros(DM1.cdsQry25.FieldByName('SALDO_CB').AsString);
      lblNoCub01.Caption:=DM1.FormatoNumeros(DM1.cdsQry25.FieldByName('SALDO_NC').AsString);
   End
Else
   Begin
      lblTipAso01.Caption:=''; lblPer01.Caption:=''; lblClas01.Caption:='NO CLASIFICADO'; lblProv01.Caption:=DM1.FormatoNumeros('0');
      lblTot01.Caption:=DM1.FormatoNumeros('0'); lblVen01.Caption:=DM1.FormatoNumeros('0'); lblPen01.Caption:=DM1.FormatoNumeros('0');
      lblCtaInd01.Caption:=DM1.FormatoNumeros('0'); lblCub01.Caption:=DM1.FormatoNumeros('0'); lblNoCub01.Caption:=DM1.FormatoNumeros('0');
   End;
DM1.cdsQry25.Close;
If xCfc02>xCfc01 Then lblClas02.Font.Color:=clRed;
If DM1.Valores(lblProv02.Caption)>DM1.Valores(lblProv01.Caption) Then lblProv02.Font.Color:=clRed;
If lblTipAso02.Caption<>lblTipAso01.Caption Then lblTipAso02.Font.Color:=clRed;
If DM1.Valores(lblVen02.Caption)>DM1.Valores(lblVen01.Caption) Then lblVen02.Font.Color:=clRed;

If xCfc02<xCfc01 Then lblClas02.Font.Color:=clGreen;
If DM1.Valores(lblProv02.Caption)<DM1.Valores(lblProv01.Caption) Then lblProv02.Font.Color:=clGreen;
If DM1.Valores(lblVen02.Caption)<DM1.Valores(lblVen01.Caption) Then lblVen02.Font.Color:=clGreen;

xSQL:='SELECT ASOID,FORPAG, '+
      'SUM(NVL(MONPAG,0)) MONPAG, '+
      'SUM(NVL(AMOPAG,0)) AMOPAG, '+
      'SUM(NVL(INTPAG,0)) INTPAG, '+
      'SUM(NVL(GASPAG,0)) GASPAG, '+
      'SUM(NVL(DESPAG,0)) DESPAG, '+
      'SUM(NVL(EXCPAG,0)) EXCPAG  '+
			'FROM '+
      '(SELECT ASOID, '+
      'CASE WHEN FORPAGID IN (''01'',''09'',''22'') THEN ''PLA'' '+
      '      WHEN FORPAGID=''02'' THEN ''EFE'' '+
      '      WHEN FORPAGID=''03'' THEN ''BAN'' '+
      '      WHEN FORPAGID=''05'' THEN ''BEN'' '+
      '      WHEN FORPAGID=''12'' THEN ''REF'' '+
      '      WHEN FORPAGID=''15'' THEN ''ABN'' '+
      '      WHEN FORPAGID IN (''23'',''24'',''44'') THEN ''FSC'' '+
      '      WHEN FORPAGID=''27'' THEN ''AMP'' '+
      '      WHEN FORPAGID IN (''40'',''41'') THEN ''FDG'' '+
      '      WHEN FORPAGID=''43'' THEN ''ONP'' '+
      '      WHEN FORPAGID NOT IN (''01'',''09'',''22'',''02'',''03'',''05'',''12'',''15'',''23'',''24'',''44'',''27'',''40'',''41'',''43'') THEN ''OTR'' END FORPAG, '+
      '      NVL(CREMTOCOB,0) MONPAG, '+
      '      NVL(CREAMORT,0) AMOPAG, '+
      '      NVL(CREINTERES,0) INTPAG, '+
      '      NVL(CREFLAT,0) GASPAG, '+
      '      NVL(MONCOBDESGRAV,0) DESPAG, '+
      '      NVL(CREMTOEXC,0) EXCPAG '+
      '      FROM CRE310 WHERE ASOID='+QuotedStr(xAsoId)+' AND TO_CHAR(FREG,''YYYYMM'')='+QuotedStr(xPerAnt)+' '+
      '      AND CREESTID NOT IN (''04'',''13'',''99'')) GROUP BY ASOID,FORPAG ';

DM1.cdsQry23.Close;
DM1.cdsQry23.DataRequest(xSQL);
DM1.cdsQry23.Open;
TNumericField(DM1.cdsQry23.FieldByName('MONPAG')).DisplayFormat:='###,###.#0';
TNumericField(DM1.cdsQry23.FieldByName('AMOPAG')).DisplayFormat:='###,###.#0';
TNumericField(DM1.cdsQry23.FieldByName('INTPAG')).DisplayFormat:='###,###.#0';
TNumericField(DM1.cdsQry23.FieldByName('GASPAG')).DisplayFormat:='###,###.#0';
TNumericField(DM1.cdsQry23.FieldByName('DESPAG')).DisplayFormat:='###,###.#0';
TNumericField(DM1.cdsQry23.FieldByName('EXCPAG')).DisplayFormat:='###,###.#0';
xMonAnt:=0;xAmoAnt:=0;xIntAnt:=0;xGasAnt:=0;xDesAnt:=0;xExcAnt:=0;
DM1.cdsQry23.First;
While Not DM1.cdsQry23.Eof Do
Begin
     xMonAnt:= xMonAct + DM1.cdsQry23.FieldByName('MONPAG').AsCurrency;
     xAmoAnt:= xAmoAct + DM1.cdsQry23.FieldByName('AMOPAG').AsCurrency;
     xIntAnt:= xIntAct + DM1.cdsQry23.FieldByName('INTPAG').AsCurrency;
     xGasAnt:= xGasAct + DM1.cdsQry23.FieldByName('GASPAG').AsCurrency;
     xDesAnt:= xDesAct + DM1.cdsQry23.FieldByName('DESPAG').AsCurrency;
     xExcAnt:= xDesAct + DM1.cdsQry23.FieldByName('EXCPAG').AsCurrency;
     DM1.cdsQry23.Next;
End;
dtgPag01.ColumnByName('FORPAG').FooterValue := 'Totales';
dtgPag01.ColumnByName('MONPAG').FooterValue := FloatToStrF(xMonAnt, ffNumber, 15, 2);
dtgPag01.ColumnByName('AMOPAG').FooterValue := FloatToStrF(xAmoAnt, ffNumber, 15, 2);
dtgPag01.ColumnByName('INTPAG').FooterValue := FloatToStrF(xIntAnt, ffNumber, 15, 2);
dtgPag01.ColumnByName('GASPAG').FooterValue := FloatToStrF(xGasAnt, ffNumber, 15, 2);
dtgPag01.ColumnByName('DESPAG').FooterValue := FloatToStrF(xDesAnt, ffNumber, 15, 2);
dtgPag01.ColumnByName('EXCPAG').FooterValue := FloatToStrF(xExcAnt, ffNumber, 15, 2);
DM1.cdsQry23.First;

If DM1.Valores(lblCuoPac01.Caption)=0 Then
   Begin
       lblCuoPac01.Caption:='0.00'; lblCuoPag01.Caption:='0.00'; lblCuoEfe01.Caption:='0.00 %';
   End
Else
   Begin
       lblCuoPac01.Caption:=DM1.FormatoNumeros(DM1.CrgDescrip('ASOID=' + QuotedStr(xAsoId)+' AND PERIODO='+QuotedStr(xPerAnt) , 'SAL000', 'MAX(CRECUOTA)'));
       lblCuoPag01.Caption:=DM1.FormatoNumeros(FloatToStr(xMonAnt));
       lblCuoEfe01.Caption:=FloatToStr(DM1.FRound(((DM1.Valores(lblCuoPag01.Caption)/DM1.Valores(lblCuoPac01.Caption))*100),3,2))+' %';
   End;



xSQL:='SELECT ASOID,FORPAG, '+
      'SUM(NVL(MONPAG,0)) MONPAG, '+
      'SUM(NVL(AMOPAG,0)) AMOPAG, '+
      'SUM(NVL(INTPAG,0)) INTPAG, '+
      'SUM(NVL(GASPAG,0)) GASPAG, '+
      'SUM(NVL(DESPAG,0)) DESPAG, '+
      'SUM(NVL(EXCPAG,0)) EXCPAG  '+
			'FROM '+
      '(SELECT ASOID, '+
      'CASE WHEN FORPAGID IN (''01'',''09'',''22'') THEN ''PLA'' '+
      '      WHEN FORPAGID=''02'' THEN ''EFE'' '+
      '      WHEN FORPAGID=''03'' THEN ''BAN'' '+
      '      WHEN FORPAGID=''05'' THEN ''BEN'' '+
      '      WHEN FORPAGID=''12'' THEN ''REF'' '+
      '      WHEN FORPAGID=''15'' THEN ''ABN'' '+
      '      WHEN FORPAGID IN (''23'',''24'',''44'') THEN ''FSC'' '+
      '      WHEN FORPAGID=''27'' THEN ''AMP'' '+
      '      WHEN FORPAGID IN (''40'',''41'') THEN ''FDG'' '+
      '      WHEN FORPAGID=''43'' THEN ''ONP'' '+
      '      WHEN FORPAGID NOT IN (''01'',''09'',''22'',''02'',''03'',''05'',''12'',''15'',''23'',''24'',''44'',''27'',''40'',''41'',''43'') THEN ''OTR'' END FORPAG, '+
      '      NVL(CREMTOCOB,0) MONPAG, '+
      '      NVL(CREAMORT,0) AMOPAG, '+
      '      NVL(CREINTERES,0) INTPAG, '+
      '      NVL(CREFLAT,0) GASPAG, '+
      '      NVL(MONCOBDESGRAV,0) DESPAG, '+
      '      NVL(CREMTOEXC,0) EXCPAG '+
      '      FROM CRE310 WHERE ASOID='+QuotedStr(xAsoId)+' AND TO_CHAR(FREG,''YYYYMM'')='+QuotedStr(xPeriodo)+' '+
      '      AND CREESTID NOT IN (''04'',''13'',''99'')) GROUP BY ASOID,FORPAG ';

DM1.cdsQry22.Close;
DM1.cdsQry22.DataRequest(xSQL);
DM1.cdsQry22.Open;
TNumericField(DM1.cdsQry22.FieldByName('MONPAG')).DisplayFormat:='###,###.#0';
TNumericField(DM1.cdsQry22.FieldByName('AMOPAG')).DisplayFormat:='###,###.#0';
TNumericField(DM1.cdsQry22.FieldByName('INTPAG')).DisplayFormat:='###,###.#0';
TNumericField(DM1.cdsQry22.FieldByName('GASPAG')).DisplayFormat:='###,###.#0';
TNumericField(DM1.cdsQry22.FieldByName('DESPAG')).DisplayFormat:='###,###.#0';
TNumericField(DM1.cdsQry22.FieldByName('EXCPAG')).DisplayFormat:='###,###.#0';
xMonAct:=0;xAmoAct:=0;xIntAct:=0;xGasAct:=0;xDesAct:=0; xExcAct:=0;
DM1.cdsQry22.First;
While Not DM1.cdsQry22.Eof Do
Begin
     xMonAct:= xMonAct + DM1.cdsQry22.FieldByName('MONPAG').AsCurrency;
     xAmoAct:= xAmoAct + DM1.cdsQry22.FieldByName('AMOPAG').AsCurrency;
     xIntAct:= xIntAct + DM1.cdsQry22.FieldByName('INTPAG').AsCurrency;
     xGasAct:= xGasAct + DM1.cdsQry22.FieldByName('GASPAG').AsCurrency;
     xDesAct:= xDesAct + DM1.cdsQry22.FieldByName('DESPAG').AsCurrency;
     xExcAct:= xDesAct + DM1.cdsQry22.FieldByName('EXCPAG').AsCurrency;
     DM1.cdsQry22.Next;
End;
dtgPag02.ColumnByName('FORPAG').FooterValue := 'Totales';
dtgPag02.ColumnByName('MONPAG').FooterValue := FloatToStrF(xMonAct, ffNumber, 15, 2);
dtgPag02.ColumnByName('AMOPAG').FooterValue := FloatToStrF(xAmoAct, ffNumber, 15, 2);
dtgPag02.ColumnByName('INTPAG').FooterValue := FloatToStrF(xIntAct, ffNumber, 15, 2);
dtgPag02.ColumnByName('GASPAG').FooterValue := FloatToStrF(xGasAct, ffNumber, 15, 2);
dtgPag02.ColumnByName('DESPAG').FooterValue := FloatToStrF(xDesAct, ffNumber, 15, 2);
dtgPag02.ColumnByName('EXCPAG').FooterValue := FloatToStrF(xExcAct, ffNumber, 15, 2);
DM1.cdsQry22.First;

If DM1.Valores(lblCuoPac02.Caption)=0 Then
   Begin
       lblCuoPac02.Caption:='0.00'; lblCuoPag02.Caption:='0.00'; lblCuoEfe02.Caption:='0.00 %';
   End
Else
   Begin
       lblCuoPac02.Caption:=DM1.FormatoNumeros(DM1.CrgDescrip('ASOID=' + QuotedStr(xAsoId)+' AND PERIODO='+QuotedStr(xPeriodo) , 'SAL000', 'MAX(CRECUOTA)'));
       lblCuoPag02.Caption:=DM1.FormatoNumeros(FloatToStr(xMonAct));
       lblCuoEfe02.Caption:=FloatToStr(DM1.FRound(((DM1.Valores(lblCuoPag02.Caption)/DM1.Valores(lblCuoPac02.Caption))*100),3,2))+' %';
   End;


Screen.Cursor:=crDefault;
end;

procedure TfVisorComp.FormActivate(Sender: TObject);
begin
CargaComparacion(lblCodAso.Caption,fMatDesplaz.dbsAnoIni.Text + Format('%.2d', [StrToInt(Trim(fMatDesplaz.dbsMesIni.Text))]));
end;

end.
