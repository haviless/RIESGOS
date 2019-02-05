// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fAnalisisdeCosechas
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Analisis de cosechas
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG018;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Mask, wwdbedit, Wwdbspin,
  Buttons, Db, ComCtrls, Animate, GIFCtrl, ExtCtrls;

type
  TfAnalisisdeCosechas = class(TForm)
    grbParametros: TGroupBox;
    lblNomMes: TLabel;
    dbsAnoIni: TwwDBSpinEdit;
    dbsMesIni: TwwDBSpinEdit;
    BitFecha: TBitBtn;
    BitMonto: TBitBtn;
    BitPlazo: TBitBtn;
    PageControlPrincipal: TPageControl;
    TabMonto: TTabSheet;
    TabNumero: TTabSheet;
    dtgCosMon: TwwDBGrid;
    dtgCosNum: TwwDBGrid;
    lblTitulo01: TLabel;
    lblTitulo02: TLabel;
    grpEspera: TGroupBox;
    Label2: TLabel;
    rdbSelxMon: TRadioGroup;
    rdbSelxNum: TRadioGroup;
    BitExporta: TBitBtn;
    BitGrafico: TBitBtn;
    BitSalir: TBitBtn;
    rdbTipCar: TRadioGroup;
    rdbTipAso: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure BitFechaClick(Sender: TObject);
    procedure BitMontoClick(Sender: TObject);
    procedure BitPlazoClick(Sender: TObject);
    procedure dtgCosMonDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure dtgCosNumDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure dtgCosMonDblClick(Sender: TObject);
    procedure dtgCosNumDblClick(Sender: TObject);
    procedure PageControlPrincipalChange(Sender: TObject);
    procedure BitSalirClick(Sender: TObject);
    procedure BitExportaClick(Sender: TObject);
    procedure dbsMesIniChange(Sender: TObject);
    procedure BitGraficoClick(Sender: TObject);
    procedure dbsAnoIniChange(Sender: TObject);
  private
    { Private declarations }
  public
    publicSQL:String;
    xBoton:String;
    { Public declarations }
  end;

var
  fAnalisisdeCosechas: TfAnalisisdeCosechas;
  xDateIni,xDateFin:TDateTime;
implementation

uses RSGDM1, RSG007, RSG121;

{$R *.dfm}

procedure TfAnalisisdeCosechas.FormActivate(Sender: TObject);
begin
dbsAnoIni.Value:=StrToInt(Copy(DM1.UltCartera,1,4));
dbsMesIni.Value:=StrToInt(Copy(DM1.UltCartera,5,2));
lblNomMes.Caption:=DM1.DesMes(StrToInt(dbsMesIni.Text),'N');
PageControlPrincipal.ActivePageIndex:=0;
BitFecha.OnClick(BitFecha);
end;

procedure TfAnalisisdeCosechas.BitFechaClick(Sender: TObject);
var xSQL,iSQL:String;
    xWhere:String;
begin
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

xBoton:='A';
xDateIni:=Date+Time;
PageControlPrincipal.Visible:=False; fAnalisisdeCosechas.Refresh;
rdbSelxMon.Enabled:=True;
rdbSelxNum.Enabled:=True;





lblTitulo01.Caption:='Estadistica por : '+BitFecha.Caption+'   Tipo de Cartera: '+UPPERCASE(rdbTipCar.Items[rdbTipCar.ItemIndex])+'   Tipo de Asociado: '+UPPERCASE(rdbTipAso.Items[rdbTipAso.ItemIndex]); BitFecha.Refresh;
lblTitulo02.Caption:='Estadistica por : '+BitFecha.Caption+'   Tipo de Cartera: '+UPPERCASE(rdbTipCar.Items[rdbTipCar.ItemIndex])+'   Tipo de Asociado: '+UPPERCASE(rdbTipAso.Items[rdbTipAso.ItemIndex]); BitFecha.Refresh;

// Monto
Screen.Cursor := crHourGlass ;

xSQL:='SELECT DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO FROM RSG_RES_ANA_COS '+
      'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
      'AND FORMA='+QuotedStr(Name)+' AND TIPCON='+QuotedStr('01')+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex));
If DM1.CountReg(xSQL)=0 Then
   Begin
      xSQL:='SELECT SUBSTR(MESANNO,1,4) DESCRIPCION, SUM(NVL(NOR,0)) NOR, '+
             'SUM(NVL(CPP,0)) CPP, SUM(NVL(DEF,0)) DEF, SUM(NVL(DUD,0)) DUD, '+
             'SUM(NVL(PER,0)) PER, SUM(TOTAL) TOTAL '+
             ' FROM  '+
             '( SELECT TO_CHAR(CREFOTORG,''YYYYMM'') MESANNO,1 ASOCIADOS,SALDOS_FT TOTAL,CFC_F, '+
             'NOR,CPP,DEF,DUD,PER FROM (SELECT A.ASOID,B.CREFOTORG,SALDOS_FT,CFC_F,  CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NOR, '+
             'CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END CPP,  CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEF, '+
             'CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUD,  CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PER '+
             'FROM CFC000 A,(SELECT ASOID,MIN(CREFOTORG) CREFOTORG FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B '+
             'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID '+xWhere+')  ) GROUP BY SUBSTR(MESANNO,1,4) ORDER BY SUBSTR(MESANNO,1,4)';

      iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO) '+
             'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(Name)+','+QuotedStr('01')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,'+QuotedStr('01')+','+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';

      DM1.DCOM1.AppServer.EjecutaSQL(iSQL); Screen.Cursor := crDefault;
   End;

DM1.cdsSolicitud.Close;
DM1.cdsSolicitud.DataRequest(xSQL); Screen.Cursor := crHourGlass;
DM1.cdsSolicitud.Open; Screen.Cursor := crDefault;
TNumericField(DM1.cdsSolicitud.FieldByName('NOR')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('CPP')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('DEF')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('DUD')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('PER')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('TOTAL')).DisplayFormat := '###,##0';
dtgCosMon.Selected.Clear;
dtgCosMon.Selected.Add('DESCRIPCION'#9'18'#9'Año de~Otorgamiento'#9#9);
dtgCosMon.Selected.Add('NOR'#9'15'#9'Normal'#9#9);
dtgCosMon.Selected.Add('CPP'#9'15'#9'Problemas~Potenciales'#9#9);
dtgCosMon.Selected.Add('DEF'#9'15'#9'Deficiente'#9#9);
dtgCosMon.Selected.Add('DUD'#9'15'#9'Dudoso'#9#9);
dtgCosMon.Selected.Add('PER'#9'15'#9'Perdida'#9#9);
dtgCosMon.Selected.Add('TOTAL'#9'15'#9'Total'#9#9);
dtgCosMon.ApplySelected;
dtgCosMon.ColumnByName('DESCRIPCION').FooterValue := 'Totales';
dtgCosMon.ColumnByName('NOR').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'NOR'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('CPP').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'CPP'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('DEF').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'DEF'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('DUD').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'DUD'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('PER').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'PER'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('TOTAL').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'TOTAL'), ffNumber, 15, 0);
// Número


xSQL:='SELECT DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO FROM RSG_RES_ANA_COS '+
      'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
      'AND FORMA='+QuotedStr(Name)+' AND TIPCON='+QuotedStr('02')+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex));
If DM1.CountReg(xSQL)=0 Then
   Begin
      xSQL:='SELECT SUBSTR(MESANNO,1,4) DESCRIPCION, SUM(NVL(NOR,0)) NOR, '+
             'SUM(NVL(CPP,0)) CPP, SUM(NVL(DEF,0)) DEF, SUM(NVL(DUD,0)) DUD, '+
             'SUM(NVL(PER,0)) PER, SUM(TOTAL) TOTAL FROM  '+
             '( SELECT TO_CHAR(CREFOTORG,''YYYYMM'') MESANNO,1 ASOCIADOS,1 TOTAL,CFC_F, '+
             'NOR,CPP,DEF,DUD,PER FROM (SELECT A.ASOID,B.CREFOTORG,1,CFC_F,  CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NOR, '+
             'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END CPP,  CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEF, '+
             'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUD,  CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PER '+
             'FROM CFC000 A,(SELECT ASOID,MIN(CREFOTORG) CREFOTORG FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B '+
             'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID '+xWhere+')  ) GROUP BY SUBSTR(MESANNO,1,4) ORDER BY SUBSTR(MESANNO,1,4)';
      iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO) '+
             'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(Name)+','+QuotedStr('02')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,'+QuotedStr('01')+','+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';


      DM1.DCOM1.AppServer.EjecutaSQL(iSQL);
   End;

DM1.cdsSolicitudA.Close;
DM1.cdsSolicitudA.DataRequest(xSQL); Screen.Cursor := crHourGlass;
DM1.cdsSolicitudA.Open; Screen.Cursor := crDefault;
TNumericField(DM1.cdsSolicitudA.FieldByName('NOR')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('CPP')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('DEF')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('DUD')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('PER')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('TOTAL')).DisplayFormat := '###,##0';

dtgCosNum.Selected.Clear;
dtgCosNum.Selected.Add('DESCRIPCION'#9'18'#9'Año de~Otorgamiento'#9#9);
dtgCosNum.Selected.Add('NOR'#9'15'#9'Normal'#9#9);
dtgCosNum.Selected.Add('CPP'#9'15'#9'Problemas~Potenciales'#9#9);
dtgCosNum.Selected.Add('DEF'#9'15'#9'Deficiente'#9#9);
dtgCosNum.Selected.Add('DUD'#9'15'#9'Dudoso'#9#9);
dtgCosNum.Selected.Add('PER'#9'15'#9'Perdida'#9#9);
dtgCosNum.Selected.Add('TOTAL'#9'15'#9'Total'#9#9);
dtgCosNum.ApplySelected;

dtgCosNum.ColumnByName('DESCRIPCION').FooterValue := 'Totales';
dtgCosNum.ColumnByName('NOR').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'NOR'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('CPP').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'CPP'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('DEF').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'DEF'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('DUD').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'DUD'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('PER').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'PER'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('TOTAL').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'TOTAL'), ffNumber, 15, 0);


xDateFin:=Date+Time;
Label2.Caption:=DM1.CalculaTiempo(xDateIni,xDateFin);
PageControlPrincipal.Visible:=True;
end;

procedure TfAnalisisdeCosechas.BitMontoClick(Sender: TObject);
var xSQL,iSQL,xWhere:String;
    xDateIni,xDateFin:TDateTime;
begin
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

xBoton:='B';
xDateIni:=Date+Time;
PageControlPrincipal.Visible:=False; fAnalisisdeCosechas.Refresh;
rdbSelxMon.Enabled:=False;
rdbSelxNum.Enabled:=False;

lblTitulo01.Caption:='Estadistica por : '+BitMonto.Caption+'   Tipo de Cartera: '+UPPERCASE(rdbTipCar.Items[rdbTipCar.ItemIndex])+'   Tipo de Asociado: '+UPPERCASE(rdbTipAso.Items[rdbTipAso.ItemIndex]); BitMonto.Refresh;
lblTitulo02.Caption:='Estadistica por : '+BitMonto.Caption+'   Tipo de Cartera: '+UPPERCASE(rdbTipCar.Items[rdbTipCar.ItemIndex])+'   Tipo de Asociado: '+UPPERCASE(rdbTipAso.Items[rdbTipAso.ItemIndex]); BitMonto.Refresh;


Screen.Cursor := crHourGlass;
xSQL:='SELECT CLAVE IDMON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO FROM RSG_RES_ANA_COS '+
      'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
      'AND FORMA='+QuotedStr(Name)+' AND TIPCON='+QuotedStr('03')+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex));
If DM1.CountReg(xSQL)=0 Then
   Begin
     xSQL:='SELECT IDMON,MONTOS DESCRIPCION,SUM(NVL(NOR,0)) NOR,SUM(NVL(CPP,0)) CPP,SUM(NVL(DEF,0)) DEF,SUM(NVL(DUD,0)) DUD,'+
           'SUM(NVL(PER,0)) PER,SUM(TOTAL) TOTAL FROM ( SELECT CREMTOOTOR,CASE WHEN CREMTOOTOR BETWEEN 0 AND 3000 THEN ''DE 0 A 3,000''  '+
           'WHEN CREMTOOTOR BETWEEN 3001 AND 5000 THEN ''DE 3,001 A 5,000'' WHEN CREMTOOTOR BETWEEN 5001 AND 7000 THEN ''DE 5,001 A 7,000''  '+
           'WHEN CREMTOOTOR BETWEEN 7001 AND 9000 THEN ''DE 7,001 A 9,000'' WHEN CREMTOOTOR BETWEEN 9001 AND 11000 THEN ''DE 9,001 A 11,000''  '+
           'WHEN CREMTOOTOR BETWEEN 11001 AND 13000 THEN ''DE 11,001 A 13,000'' WHEN CREMTOOTOR BETWEEN 13001 AND 15000 THEN ''DE 13,001 A 15,000'' '+
           'WHEN CREMTOOTOR BETWEEN 15001 AND 17000 THEN ''DE 15,001 A 17,000'' WHEN CREMTOOTOR > 17000 THEN ''MAYOR 17,000'' END MONTOS, '+
           'CASE WHEN CREMTOOTOR BETWEEN 0 AND 3000 THEN ''01''  WHEN CREMTOOTOR BETWEEN 3001 AND 5000 THEN ''02'' WHEN CREMTOOTOR BETWEEN 5001 AND 7000 THEN ''03''  '+
           'WHEN CREMTOOTOR BETWEEN 7001 AND 9000 THEN ''04'' WHEN CREMTOOTOR BETWEEN 9001 AND 11000 THEN ''05''  WHEN CREMTOOTOR BETWEEN 11001 AND 13000 THEN ''06''  '+
           'WHEN CREMTOOTOR BETWEEN 13001 AND 15000 THEN ''07'' WHEN CREMTOOTOR BETWEEN 15001 AND 17000 THEN ''08''  WHEN CREMTOOTOR > 17000 THEN ''09''  END IDMON, '+
           '1 ASOCIADOS,SALDOS_FT TOTAL,CFC_F, NOR,CPP,DEF,DUD,PER FROM (SELECT A.ASOID,TRUNC(B.CREMTOOTOR) CREMTOOTOR,SALDOS_FT,CFC_F, '+
           'CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NOR,  CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END CPP,  CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEF, '+
           'CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUD,  CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PER FROM CFC000 A,(SELECT ASOID,MAX(CREMTOOTOR) CREMTOOTOR FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B '+
           'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID '+xWhere+' ) ) GROUP BY IDMON,MONTOS ORDER BY IDMON ';

      iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO) '+
             'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(Name)+','+QuotedStr('03')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,IDMON,'+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';

      DM1.DCOM1.AppServer.EjecutaSQL(iSQL);  Screen.Cursor := crDefault
   End;

DM1.cdsSolicitud.Close;
DM1.cdsSolicitud.DataRequest(xSQL); Screen.Cursor := crHourGlass;
DM1.cdsSolicitud.Open; Screen.Cursor := crDefault;
TNumericField(DM1.cdsSolicitud.FieldByName('NOR')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('CPP')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('DEF')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('DUD')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('PER')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('TOTAL')).DisplayFormat := '###,##0';
dtgCosMon.Selected.Clear;
dtgCosMon.Selected.Add('DESCRIPCION'#9'18'#9'Montos Otorgados'#9#9);
dtgCosMon.Selected.Add('NOR'#9'15'#9'Normal'#9#9);
dtgCosMon.Selected.Add('CPP'#9'15'#9'Problemas~Potenciales'#9#9);
dtgCosMon.Selected.Add('DEF'#9'15'#9'Deficiente'#9#9);
dtgCosMon.Selected.Add('DUD'#9'15'#9'Dudoso'#9#9);
dtgCosMon.Selected.Add('PER'#9'15'#9'Perdida'#9#9);
dtgCosMon.Selected.Add('TOTAL'#9'15'#9'Total'#9#9);
dtgCosMon.ApplySelected;
dtgCosMon.ColumnByName('DESCRIPCION').FooterValue := 'Totales';
dtgCosMon.ColumnByName('NOR').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'NOR'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('CPP').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'CPP'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('DEF').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'DEF'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('DUD').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'DUD'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('PER').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'PER'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('TOTAL').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'TOTAL'), ffNumber, 15, 0);

xSQL:='SELECT CLAVE IDMON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO FROM RSG_RES_ANA_COS '+
      'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
      'AND FORMA='+QuotedStr(Name)+' AND TIPCON='+QuotedStr('04')+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex));
If DM1.CountReg(xSQL)=0 Then
   Begin
     xSQL:='SELECT IDMON,MONTOS DESCRIPCION,SUM(NVL(NOR,0)) NOR,SUM(NVL(CPP,0)) CPP,SUM(NVL(DEF,0)) DEF,SUM(NVL(DUD,0)) DUD,'+
           'SUM(NVL(PER,0)) PER,SUM(TOTAL) TOTAL FROM ( SELECT CREMTOOTOR,CASE WHEN CREMTOOTOR BETWEEN 0 AND 3000 THEN ''DE 0 A 3,000''  '+
           'WHEN CREMTOOTOR BETWEEN 3001 AND 5000 THEN ''DE 3,001 A 5,000'' WHEN CREMTOOTOR BETWEEN 5001 AND 7000 THEN ''DE 5,001 A 7,000''  '+
           'WHEN CREMTOOTOR BETWEEN 7001 AND 9000 THEN ''DE 7,001 A 9,000'' WHEN CREMTOOTOR BETWEEN 9001 AND 11000 THEN ''DE 9,001 A 11,000''  '+
           'WHEN CREMTOOTOR BETWEEN 11001 AND 13000 THEN ''DE 11,001 A 13,000'' WHEN CREMTOOTOR BETWEEN 13001 AND 15000 THEN ''DE 13,001 A 15,000'' '+
           'WHEN CREMTOOTOR BETWEEN 15001 AND 17000 THEN ''DE 15,001 A 17,000'' WHEN CREMTOOTOR > 17000 THEN ''MAYOR 17,000'' END MONTOS, '+
           'CASE WHEN CREMTOOTOR BETWEEN 0 AND 3000 THEN ''01''  WHEN CREMTOOTOR BETWEEN 3001 AND 5000 THEN ''02'' WHEN CREMTOOTOR BETWEEN 5001 AND 7000 THEN ''03''  '+
           'WHEN CREMTOOTOR BETWEEN 7001 AND 9000 THEN ''04'' WHEN CREMTOOTOR BETWEEN 9001 AND 11000 THEN ''05''  WHEN CREMTOOTOR BETWEEN 11001 AND 13000 THEN ''06''  '+
           'WHEN CREMTOOTOR BETWEEN 13001 AND 15000 THEN ''07'' WHEN CREMTOOTOR BETWEEN 15001 AND 17000 THEN ''08''  WHEN CREMTOOTOR > 17000 THEN ''09''  END IDMON, '+
           '1 ASOCIADOS,1 TOTAL,CFC_F, NOR,CPP,DEF,DUD,PER FROM (SELECT A.ASOID,TRUNC(B.CREMTOOTOR) CREMTOOTOR,1,CFC_F, '+
           'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NOR,  CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END CPP,  CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEF, '+
           'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUD,  CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PER FROM CFC000 A,(SELECT ASOID,MAX(CREMTOOTOR) CREMTOOTOR FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B '+
           'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID '+xWhere+') ) GROUP BY IDMON,MONTOS ORDER BY IDMON ';

      iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO) '+
             'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(Name)+','+QuotedStr('04')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,IDMON,'+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';

      DM1.DCOM1.AppServer.EjecutaSQL(iSQL);
   End;

DM1.cdsSolicitudA.Close;
DM1.cdsSolicitudA.DataRequest(xSQL); Screen.Cursor := crHourGlass;
DM1.cdsSolicitudA.Open; Screen.Cursor := crDefault;
TNumericField(DM1.cdsSolicitudA.FieldByName('NOR')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('CPP')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('DEF')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('DUD')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('PER')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('TOTAL')).DisplayFormat := '###,##0';

dtgCosNum.Selected.Clear;
dtgCosNum.Selected.Add('DESCRIPCION'#9'18'#9'Montos Otorgados'#9#9);
dtgCosNum.Selected.Add('NOR'#9'15'#9'Normal'#9#9);
dtgCosNum.Selected.Add('CPP'#9'15'#9'Problemas~Potenciales'#9#9);
dtgCosNum.Selected.Add('DEF'#9'15'#9'Deficiente'#9#9);
dtgCosNum.Selected.Add('DUD'#9'15'#9'Dudoso'#9#9);
dtgCosNum.Selected.Add('PER'#9'15'#9'Perdida'#9#9);
dtgCosNum.Selected.Add('TOTAL'#9'15'#9'Total'#9#9);
dtgCosNum.ApplySelected;


dtgCosNum.ColumnByName('DESCRIPCION').FooterValue := 'Totales';
dtgCosNum.ColumnByName('NOR').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'NOR'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('CPP').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'CPP'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('DEF').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'DEF'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('DUD').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'DUD'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('PER').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'PER'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('TOTAL').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'TOTAL'), ffNumber, 15, 0);

xDateFin:=Date+Time;
Label2.Caption:=DM1.CalculaTiempo(xDateIni,xDateFin);
PageControlPrincipal.Visible:=True;

end;

procedure TfAnalisisdeCosechas.BitPlazoClick(Sender: TObject);
var xSQL,iSQL,xWhere:String;
    xDateIni,xDateFin:TDateTime;
begin
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

xBoton:='C';
xDateIni:=Date+Time;
PageControlPrincipal.Visible:=False; fAnalisisdeCosechas.Refresh;
rdbSelxMon.Enabled:=False;
rdbSelxNum.Enabled:=False;

lblTitulo01.Caption:='Estadistica por : '+BitPlazo.Caption+'   Tipo de Cartera: '+UPPERCASE(rdbTipCar.Items[rdbTipCar.ItemIndex])+'   Tipo de Asociado: '+UPPERCASE(rdbTipAso.Items[rdbTipAso.ItemIndex]); BitPlazo.Refresh;
lblTitulo02.Caption:='Estadistica por : '+BitPlazo.Caption+'   Tipo de Cartera: '+UPPERCASE(rdbTipCar.Items[rdbTipCar.ItemIndex])+'   Tipo de Asociado: '+UPPERCASE(rdbTipAso.Items[rdbTipAso.ItemIndex]); BitPlazo.Refresh;

Screen.Cursor := crHourGlass ;
xSQL:='SELECT CLAVE IDPLAZ,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO  FROM RSG_RES_ANA_COS '+
      'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
      'AND FORMA='+QuotedStr(Name)+' AND TIPCON='+QuotedStr('05')+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex));
If DM1.CountReg(xSQL)=0 Then
   Begin
      xSQL:='SELECT IDPLAZ,PLAZOS DESCRIPCION,SUM(NVL(NOR,0)) NOR,SUM(NVL(CPP,0)) CPP,SUM(NVL(DEF,0)) DEF,SUM(NVL(DUD,0)) DUD,SUM(NVL(PER,0)) PER, '+
             'SUM(TOTAL) TOTAL FROM (SELECT CRENUMCUO,CASE WHEN CRENUMCUO BETWEEN 1 AND 12 THEN ''DE 1 A 12 Cuotas''  WHEN CRENUMCUO BETWEEN 13 AND 24 THEN ''DE 13 A 24 Cuotas'' '+
             'WHEN CRENUMCUO BETWEEN 25 AND 36 THEN ''DE 25 A 36 Cuotas'' WHEN CRENUMCUO BETWEEN 37 AND 48 THEN ''DE 37 A 48 Cuotas'' WHEN CRENUMCUO > 48 THEN ''MAYOR A 48 Cuotas'' '+
             'END PLAZOS, CASE WHEN CRENUMCUO BETWEEN 1 AND 12 THEN ''01'' WHEN CRENUMCUO BETWEEN 13 AND 24 THEN ''02'' WHEN CRENUMCUO BETWEEN 25 AND 36 THEN ''03'' '+
             'WHEN CRENUMCUO BETWEEN 37 AND 48 THEN ''04''  WHEN CRENUMCUO > 48 THEN ''05''  END IDPLAZ, 1 ASOCIADOS,SALDOS_FT TOTAL,CFC_F, NOR,CPP,DEF,DUD,PER '+
             'FROM (SELECT A.ASOID,CRENUMCUO,SALDOS_FT,CFC_F,CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NOR,CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END CPP, '+
             'CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEF, CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUD, CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PER '+
             'FROM CFC000 A,(SELECT ASOID,MAX(CRENUMCUO) CRENUMCUO FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID '+xWhere+') ) GROUP BY IDPLAZ,PLAZOS ORDER BY IDPLAZ';


      iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO) '+
             'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(Name)+','+QuotedStr('05')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,IDPLAZ,'+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';

      DM1.DCOM1.AppServer.EjecutaSQL(iSQL);    Screen.Cursor := crDefault
   End;


DM1.cdsSolicitud.Close;
DM1.cdsSolicitud.DataRequest(xSQL); Screen.Cursor := crHourGlass;
DM1.cdsSolicitud.Open; Screen.Cursor := crDefault;
TNumericField(DM1.cdsSolicitud.FieldByName('NOR')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('CPP')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('DEF')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('DUD')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('PER')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitud.FieldByName('TOTAL')).DisplayFormat := '###,##0';
dtgCosMon.Selected.Clear;
dtgCosMon.Selected.Add('DESCRIPCION'#9'18'#9'Número de Cuotas'#9#9);
dtgCosMon.Selected.Add('NOR'#9'15'#9'Normal'#9#9);
dtgCosMon.Selected.Add('CPP'#9'15'#9'Problemas~Potenciales'#9#9);
dtgCosMon.Selected.Add('DEF'#9'15'#9'Deficiente'#9#9);
dtgCosMon.Selected.Add('DUD'#9'15'#9'Dudoso'#9#9);
dtgCosMon.Selected.Add('PER'#9'15'#9'Perdida'#9#9);
dtgCosMon.Selected.Add('TOTAL'#9'15'#9'Total'#9#9);
dtgCosMon.ApplySelected;
dtgCosMon.ColumnByName('DESCRIPCION').FooterValue := 'Totales';
dtgCosMon.ColumnByName('NOR').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'NOR'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('CPP').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'CPP'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('DEF').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'DEF'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('DUD').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'DUD'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('PER').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'PER'), ffNumber, 15, 0);
dtgCosMon.ColumnByName('TOTAL').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitud,'TOTAL'), ffNumber, 15, 0);

xSQL:='SELECT CLAVE IDPLAZ,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO FROM RSG_RES_ANA_COS '+
      'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
      'AND FORMA='+QuotedStr(Name)+' AND TIPCON='+QuotedStr('06')+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex));
If DM1.CountReg(xSQL)=0 Then
   Begin
      xSQL:='SELECT IDPLAZ,PLAZOS DESCRIPCION,SUM(NVL(NOR,0)) NOR,SUM(NVL(CPP,0)) CPP,SUM(NVL(DEF,0)) DEF,SUM(NVL(DUD,0)) DUD,SUM(NVL(PER,0)) PER, '+
             'SUM(TOTAL) TOTAL FROM (SELECT CRENUMCUO,CASE WHEN CRENUMCUO BETWEEN 1 AND 12 THEN ''DE 1 A 12 Cuotas''  WHEN CRENUMCUO BETWEEN 13 AND 24 THEN ''DE 13 A 24 Cuotas'' '+
             'WHEN CRENUMCUO BETWEEN 25 AND 36 THEN ''DE 25 A 36 Cuotas'' WHEN CRENUMCUO BETWEEN 37 AND 48 THEN ''DE 37 A 48 Cuotas'' WHEN CRENUMCUO > 48 THEN ''MAYOR A 48 Cuotas'' '+
             'END PLAZOS, CASE WHEN CRENUMCUO BETWEEN 1 AND 12 THEN ''01'' WHEN CRENUMCUO BETWEEN 13 AND 24 THEN ''02'' WHEN CRENUMCUO BETWEEN 25 AND 36 THEN ''03'' '+
             'WHEN CRENUMCUO BETWEEN 37 AND 48 THEN ''04''  WHEN CRENUMCUO > 48 THEN ''05''  END IDPLAZ, 1 ASOCIADOS,1 TOTAL,CFC_F, NOR,CPP,DEF,DUD,PER '+
             'FROM (SELECT A.ASOID,CRENUMCUO,SALDOS_FT,CFC_F,CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NOR,CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END CPP, '+
             'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEF, CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUD, CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PER '+
             'FROM CFC000 A,(SELECT ASOID,MAX(CRENUMCUO) CRENUMCUO FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID '+xWhere+' ) ) GROUP BY IDPLAZ,PLAZOS ORDER BY IDPLAZ';


      iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO) '+
             'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(Name)+','+QuotedStr('06')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,IDPLAZ,'+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';

      DM1.DCOM1.AppServer.EjecutaSQL(iSQL);
   End;


DM1.cdsSolicitudA.Close;
DM1.cdsSolicitudA.DataRequest(xSQL); Screen.Cursor := crHourGlass;
DM1.cdsSolicitudA.Open; Screen.Cursor := crDefault;
TNumericField(DM1.cdsSolicitudA.FieldByName('NOR')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('CPP')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('DEF')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('DUD')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('PER')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsSolicitudA.FieldByName('TOTAL')).DisplayFormat := '###,##0';

dtgCosNum.Selected.Clear;
dtgCosNum.Selected.Add('DESCRIPCION'#9'18'#9'Número de Cuotas'#9#9);
dtgCosNum.Selected.Add('NOR'#9'15'#9'Normal'#9#9);
dtgCosNum.Selected.Add('CPP'#9'15'#9'Problemas~Potenciales'#9#9);
dtgCosNum.Selected.Add('DEF'#9'15'#9'Deficiente'#9#9);
dtgCosNum.Selected.Add('DUD'#9'15'#9'Dudoso'#9#9);
dtgCosNum.Selected.Add('PER'#9'15'#9'Perdida'#9#9);
dtgCosNum.Selected.Add('TOTAL'#9'15'#9'Total'#9#9);
dtgCosNum.ApplySelected;

dtgCosNum.ColumnByName('DESCRIPCION').FooterValue := 'Totales';
dtgCosNum.ColumnByName('NOR').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'NOR'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('CPP').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'CPP'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('DEF').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'DEF'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('DUD').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'DUD'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('PER').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'PER'), ffNumber, 15, 0);
dtgCosNum.ColumnByName('TOTAL').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'TOTAL'), ffNumber, 15, 0);

xDateFin:=Date+Time;
Label2.Caption:=DM1.CalculaTiempo(xDateIni,xDateFin);
PageControlPrincipal.Visible:=True;
end;

procedure TfAnalisisdeCosechas.dtgCosMonDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   If (Field.FieldName = 'DESCRIPCION') Then
   Begin
      dtgCosMon.Canvas.Font.Color := clNavy;
      dtgCosMon.DefaultDrawDataCell(rect, Field, State);
   End;
   If (Field.FieldName = 'TOTAL') Then
   Begin
      dtgCosMon.Canvas.Font.Color := clNavy;
      dtgCosMon.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'NOR') Then
   Begin
      dtgCosMon.Canvas.Font.Color := clGreen;
      dtgCosMon.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'CPP') Then
   Begin
      dtgCosMon.Canvas.Font.Color := clTeal;
      dtgCosMon.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'DEF') Then
   Begin
      dtgCosMon.Canvas.Font.Color := clOlive;
      dtgCosMon.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'DUD') Then
   Begin
      dtgCosMon.Canvas.Font.Color := clPurple;
      dtgCosMon.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'PER') Then
   Begin
      dtgCosMon.Canvas.Font.Color := clRed;
      dtgCosMon.DefaultDrawDataCell(rect, Field, State);
   End;
end;

procedure TfAnalisisdeCosechas.dtgCosNumDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   IF (Field.FieldName = 'DESCRIPCION') THEN
   BEGIN
      dtgCosNum.Canvas.Font.Color := clNavy;
      dtgCosNum.DefaultDrawDataCell(rect, Field, State);
   END;
   IF (Field.FieldName = 'TOTAL') THEN
   BEGIN
      dtgCosNum.Canvas.Font.Color := clNavy;
      dtgCosNum.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'NOR') THEN
   BEGIN
      dtgCosNum.Canvas.Font.Color := clGreen;
      dtgCosNum.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'CPP') THEN
   BEGIN
      dtgCosNum.Canvas.Font.Color := clTeal;
      dtgCosNum.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'DEF') THEN
   BEGIN
      dtgCosNum.Canvas.Font.Color := clOlive;
      dtgCosNum.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'DUD') THEN
   BEGIN
      dtgCosNum.Canvas.Font.Color := clPurple;
      dtgCosNum.DefaultDrawDataCell(rect, Field, State);
   END;

   IF (Field.FieldName = 'PER') THEN
   BEGIN
      dtgCosNum.Canvas.Font.Color := clRed;
      dtgCosNum.DefaultDrawDataCell(rect, Field, State);
   END;

end;

procedure TfAnalisisdeCosechas.dtgCosMonDblClick(Sender: TObject);
var xSQL,iSQL,mSQL,xTitulo,xWhere:String;
begin
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

   fEstDepMeses:= TfEstDepMeses.Create(self);
   fEstDepMeses.dtgCosDpto.Selected.Clear;
   Case rdbSelxMon.ItemIndex Of
        0:Begin
        //Dpto
           If xBoton='A' Then
              Begin

                Screen.Cursor := crHourGlass ;
                xSQL:='SELECT CLAVE DPTOID,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO FROM RSG_RES_ANA_COS '+
                      'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                      'AND FORMA='+QuotedStr(fEstDepMeses.Name)+' AND TIPCON='+QuotedStr('07')+' AND CLAVE='+QuotedStr(DM1.cdsSolicitud.FieldByname('DESCRIPCION').AsString)+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex)); mSQL:=xSQL;
                If DM1.CountReg(xSQL)=0 Then
                   Begin
                       xSQL:='SELECT DPTOID,DPTODES DESCRIPCION,SUM(NVL(NOR,0)) NOR,SUM(NVL(CPP,0)) CPP,SUM(NVL(DEF,0)) DEF,SUM(NVL(DUD,0)) DUD, '+
                             'SUM(NVL(PER,0)) PER, SUM(TOTAL) TOTAL FROM (  SELECT TO_CHAR(CREFOTORG,''YYYYMM'') MESANNO,  '+
                             'USEID,DPTOID,DPTODES,USENOM, 1 ASOCIADOS,SALDOS_FT TOTAL,CFC_F, NOR,CPP,DEF,DUD,PER '+
                             'FROM (SELECT A.ASOID,B.CREFOTORG,SALDOS_FT,CFC_F, CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NOR, '+
                             'CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END CPP,  CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEF,  '+
                             'CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUD,  CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PER, '+
                             'A.UPROID,A.UPAGOID,A.USEID,C.DPTOID,D.DPTODES,C.USENOM  FROM CFC000 A,(SELECT ASOID,MIN(CREFOTORG) CREFOTORG FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B, '+
                             'APO101 C,APO158 D  WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID '+xWhere+' AND A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND A.USEID=C.USEID(+) '+
                             'AND C.DPTOID=D.DPTOID(+) ) ) WHERE SUBSTR(MESANNO,1,4)='+QuotedStr(Trim(DM1.cdsSolicitud.FieldByname('DESCRIPCION').AsString))+' GROUP BY DPTOID,DPTODES  ORDER BY DPTOID ';


                        iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO) '+
                              'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(fEstDepMeses.Name)+','+QuotedStr('07')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,'+QuotedStr(DM1.cdsSolicitud.FieldByname('DESCRIPCION').AsString)+','+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';

                        DM1.DCOM1.AppServer.EjecutaSQL(iSQL);
                   End;
                   Screen.Cursor := crDefault;
                   fEstDepMeses.dtgCosDpto.Selected.Add('DESCRIPCION'#9'23'#9'Departamento'#9#9);
                   xTitulo:='Año de Otorgamiento : ';
              End;
           If xBoton='B' Then
              Begin

                Screen.Cursor := crHourGlass ;
                xSQL:='SELECT CLAVE DPTOID,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO FROM RSG_RES_ANA_COS '+
                      'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                      'AND FORMA='+QuotedStr(fEstDepMeses.Name)+' AND TIPCON='+QuotedStr('08')+' AND CLAVE='+QuotedStr(DM1.cdsSolicitud.FieldByName('IDMON').AsString)+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex)) ; mSQL:=xSQL;
                If DM1.CountReg(xSQL)=0 Then
                   Begin
                   xSQL:='SELECT A.DPTOID,DPTODES DESCRIPCION,SUM(NOR) NOR,SUM(CPP) CPP,SUM(DEF) DEF,SUM(DUD) DUD,SUM(PER) PER,SUM(TOTAL) TOTAL FROM ( '+
                          'SELECT DPTOID,CREMTOOTOR,                                                 '+
                          'CASE WHEN CREMTOOTOR BETWEEN 0 AND 3000 THEN ''DE 0 A 3,000''            '+
                          '     WHEN CREMTOOTOR BETWEEN 3001 AND 5000 THEN ''DE 3,001 A 5,000''     '+
                          '     WHEN CREMTOOTOR BETWEEN 5001 AND 7000 THEN ''DE 5,001 A 7,000''     '+
                          '     WHEN CREMTOOTOR BETWEEN 7001 AND 9000 THEN ''DE 7,001 A 9,000''     '+
                          '     WHEN CREMTOOTOR BETWEEN 9001 AND 11000 THEN ''DE 9,001 A 11,000''   '+
                          '     WHEN CREMTOOTOR BETWEEN 11001 AND 13000 THEN ''DE 11,001 A 13,000'' '+
                          '     WHEN CREMTOOTOR BETWEEN 13001 AND 15000 THEN ''DE 13,001 A 15,000'' '+
                          '     WHEN CREMTOOTOR BETWEEN 15001 AND 17000 THEN ''DE 15,001 A 17,000'' '+
                          '     WHEN CREMTOOTOR > 17000 THEN ''MAYOR 17,000''       '+
                          '     END MONTOS,                                         '+
                          'CASE WHEN CREMTOOTOR BETWEEN 0 AND 3000 THEN ''01''       '+
                          '     WHEN CREMTOOTOR BETWEEN 3001 AND 5000 THEN ''02''   '+
                          '     WHEN CREMTOOTOR BETWEEN 5001 AND 7000 THEN ''03''   '+
                          '     WHEN CREMTOOTOR BETWEEN 7001 AND 9000 THEN ''04''   '+
                          '     WHEN CREMTOOTOR BETWEEN 9001 AND 11000 THEN ''05''  '+
                          '     WHEN CREMTOOTOR BETWEEN 11001 AND 13000 THEN ''06'' '+
                          '     WHEN CREMTOOTOR BETWEEN 13001 AND 15000 THEN ''07'' '+
                          '     WHEN CREMTOOTOR BETWEEN 15001 AND 17000 THEN ''08'' '+
                          '     WHEN CREMTOOTOR > 17000 THEN ''09'' '+
                          '     END IDMON, '+
                          '1 ASOCIADOS,SALDOS_FT TOTAL,CFC_F, '+
                          'NOR,CPP,DEF,DUD,PER '+
                          'FROM '+
                          '(SELECT C.DPTOID,A.ASOID,TRUNC(B.CREMTOOTOR) CREMTOOTOR,SALDOS_FT,CFC_F, '+
                          ' CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NOR, '+
                          ' CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END CPP, '+
                          ' CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEF, '+
                          ' CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUD, '+
                          ' CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PER  '+
                          'FROM CFC000 A,(SELECT ASOID,MAX(CREMTOOTOR) CREMTOOTOR FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B,APO101 C '+
                          'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND A.USEID=C.USEID(+) '+
                          'AND A.ASOID=B.ASOID '+xWhere+') ) A,APO158 B WHERE IDMON='+QuotedStr(DM1.cdsSolicitud.FieldByName('IDMON').AsString)+' '+
                          'AND A.DPTOID=B.DPTOID(+)  '+
                          'GROUP BY A.DPTOID,DPTODES';

                           iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO) '+
                                  'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(fEstDepMeses.Name)+','+QuotedStr('08')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,'+QuotedStr(DM1.cdsSolicitud.FieldByName('IDMON').AsString)+','+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';
                           DM1.DCOM1.AppServer.EjecutaSQL(iSQL);
                   End;
                   Screen.Cursor := crDefault;

                   fEstDepMeses.dtgCosDpto.Selected.Add('DESCRIPCION'#9'23'#9'Departamento'#9#9);
                   fEstDepMeses.rdbSelxMonDep.ItemIndex:=1;
                   fEstDepMeses.rdbSelxMonDep.Enabled:=False;
                   xTitulo:='Monto Otorgado : ';
              End;
           If xBoton='C' Then
              Begin
                Screen.Cursor := crHourGlass ;
                xSQL:='SELECT CLAVE DPTOID,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO FROM RSG_RES_ANA_COS '+
                      'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                      'AND FORMA='+QuotedStr(fEstDepMeses.Name)+' AND TIPCON='+QuotedStr('09')+' AND CLAVE='+QuotedStr(DM1.cdsSolicitud.FieldByName('IDPLAZ').AsString)+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex)); mSQL:=xSQL;
                If DM1.CountReg(xSQL)=0 Then
                   Begin
                     xSQL:='SELECT DPTOID,DPTODES DESCRIPCION, '+
                           'SUM(NVL(NOR,0)) NOR,SUM(NVL(CPP,0)) CPP,SUM(NVL(DEF,0)) DEF,SUM(NVL(DUD,0)) DUD,SUM(NVL(PER,0)) PER, SUM(TOTAL) TOTAL '+
                           'FROM ( SELECT DPTOID,DPTODES,CRENUMCUO,CASE WHEN CRENUMCUO BETWEEN 1 AND 12 THEN ''DE 1 A 12 Cuotas''  '+
                           'WHEN CRENUMCUO BETWEEN 13 AND 24 THEN ''DE 13 A 24 Cuotas'' WHEN CRENUMCUO BETWEEN 25 AND 36 THEN ''DE 25 A 36 Cuotas'' '+
                           'WHEN CRENUMCUO BETWEEN 37 AND 48 THEN ''DE 37 A 48 Cuotas'' WHEN CRENUMCUO > 48 THEN ''MAYOR A 48 Cuotas'' END PLAZOS,  '+
                           'CASE WHEN CRENUMCUO BETWEEN 1 AND 12 THEN ''01'' '+
                           'WHEN CRENUMCUO BETWEEN 13 AND 24 THEN ''02''  '+
                           'WHEN CRENUMCUO BETWEEN 25 AND 36 THEN ''03''  '+
                           'WHEN CRENUMCUO BETWEEN 37 AND 48 THEN ''04''  '+
                           'WHEN CRENUMCUO > 48 THEN ''05''  END IDPLAZ, '+
                           '1 ASOCIADOS,SALDOS_FT TOTAL,CFC_F, NOR,CPP,DEF,DUD,PER FROM   '+
                           '(SELECT A.ASOID,C.DPTOID,D.DPTODES,CRENUMCUO,SALDOS_FT,CFC_F, '+
                           'CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NOR, '+
                           'CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END CPP, '+
                           'CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEF, '+
                           'CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUD, '+
                           'CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PER FROM CFC000 A, '+
                           '(SELECT ASOID,MAX(CRENUMCUO) CRENUMCUO FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B,APO101 C,APO158 D '+
                           'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID '+xWhere+' AND A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) '+
                           'AND A.USEID=C.USEID(+) AND C.DPTOID=D.DPTOID(+) ) ) WHERE IDPLAZ='+QuotedStr(DM1.cdsSolicitud.FieldByName('IDPLAZ').AsString )+'  GROUP BY DPTOID,DPTODES ORDER BY DPTOID ';

                        iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO) '+
                               'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(fEstDepMeses.Name)+','+QuotedStr('09')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,'+QuotedStr(DM1.cdsSolicitud.FieldByName('IDPLAZ').AsString)+','+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';
                        DM1.DCOM1.AppServer.EjecutaSQL(iSQL);
                   End;
                     Screen.Cursor := crDefault;

                     fEstDepMeses.dtgCosDpto.Selected.Add('DESCRIPCION'#9'23'#9'Departamento'#9#9);
                     fEstDepMeses.rdbSelxMonDep.ItemIndex:=1;
                     fEstDepMeses.rdbSelxMonDep.Enabled:=False;
                     xTitulo:='Plazo Otorgado : ';

              End;

          End;
        1:Begin
        // Meses
           If xBoton='A' Then
              Begin
                Screen.Cursor := crHourGlass ;
                xSQL:='SELECT CLAVE DPTOID,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO FROM RSG_RES_ANA_COS '+
                      'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                      'AND FORMA='+QuotedStr(fEstDepMeses.Name)+' AND TIPCON='+QuotedStr('13')+' AND CLAVE='+QuotedStr(DM1.cdsSolicitud.FieldByname('DESCRIPCION').AsString)+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex)); mSQL:=xSQL;
                If DM1.CountReg(xSQL)=0 Then
                   Begin
                    xSQL:='SELECT ANNO,MESDESL DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL '+
                          'FROM (SELECT MESANNO ANNO, SUM(NVL(NOR,0)) NOR, SUM(NVL(CPP,0)) CPP, '+
                          'SUM(NVL(DEF,0)) DEF, SUM(NVL(DUD,0)) DUD, SUM(NVL(PER,0)) PER, SUM(TOTAL) TOTAL '+
                          'FROM ( SELECT TO_CHAR(CREFOTORG,''YYYYMM'') MESANNO,1 ASOCIADOS,SALDOS_FT TOTAL,CFC_F,  '+
                          'NOR,CPP,DEF,DUD,PER FROM (SELECT A.ASOID,B.CREFOTORG,SALDOS_FT,CFC_F,  CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NOR, '+
                          'CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END CPP,  CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEF,  '+
                          'CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUD,  CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PER '+
                          'FROM CFC000 A,(SELECT ASOID,MIN(CREFOTORG) CREFOTORG FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B  '+
                          'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID '+xWhere+')  ) WHERE SUBSTR(MESANNO,1,4)='+QuotedStr(Trim(DM1.cdsSolicitud.FieldByname('DESCRIPCION').AsString))+' GROUP BY MESANNO) A,TGE181 B '+
                          'WHERE SUBSTR(ANNO,5,2)=B.MESIDR ORDER BY ANNO ';


                        iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO ) '+
                              'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(fEstDepMeses.Name)+','+QuotedStr('13')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,'+QuotedStr(DM1.cdsSolicitud.FieldByname('DESCRIPCION').AsString)+','+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';
                        DM1.DCOM1.AppServer.EjecutaSQL(iSQL);
                   End;
                   Screen.Cursor := crDefault;

                   fEstDepMeses.dtgCosDpto.Selected.Add('DESCRIPCION'#9'24'#9'Meses'#9#9);
              End;
           If xBoton='B' Then
              Begin
                 Exit;
              End;
           If xBoton='C' Then
              Begin
                 Exit;
              End;



          End;
   End;
   fEstDepMeses.dtgCosDpto.Selected.Add('NOR'#9'14'#9'Normal'#9#9);
   fEstDepMeses.dtgCosDpto.Selected.Add('CPP'#9'14'#9'Problemas~Potenciales'#9#9);
   fEstDepMeses.dtgCosDpto.Selected.Add('DEF'#9'14'#9'Deficiente'#9#9);
   fEstDepMeses.dtgCosDpto.Selected.Add('DUD'#9'14'#9'Dudoso'#9#9);
   fEstDepMeses.dtgCosDpto.Selected.Add('PER'#9'14'#9'Perdida'#9#9);
   fEstDepMeses.dtgCosDpto.Selected.Add('TOTAL'#9'14'#9'Total'#9#9);


   xDateIni:=Date+Time;
   DM1.cdsSobrino.Close;
   DM1.cdsSobrino.DataRequest(xSQL); Screen.Cursor := crHourGlass; publicSQL:=mSQL;
   DM1.cdsSobrino.Open; Screen.Cursor := crDefault;
   TNumericField(DM1.cdsSobrino.FieldByName('NOR')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsSobrino.FieldByName('CPP')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsSobrino.FieldByName('DEF')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsSobrino.FieldByName('DUD')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsSobrino.FieldByName('PER')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsSobrino.FieldByName('TOTAL')).DisplayFormat := '###,##0';

   fEstDepMeses.lblTitulo01.Caption:='Periodo de Cartera  : '+lblNomMes.Caption+' - '+dbsAnoIni.Text;
   fEstDepMeses.lblTitulo02.Caption:=xTitulo+DM1.cdsSolicitud.FieldByName('DESCRIPCION').AsString;
   fEstDepMeses.dtgCosDpto.ApplySelected;




   xDateFin:=Date+Time;
   Label2.Caption:=DM1.CalculaTiempo(xDateIni,xDateFin);
   fEstDepMeses.ShowModal;
   fEstDepMeses.Free;
end;

procedure TfAnalisisdeCosechas.dtgCosNumDblClick(Sender: TObject);
var xSQL,iSQL,mSQL,xTitulo,xWhere:String;
begin

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


   fEstDepMeses:= TfEstDepMeses.Create(self);
   fEstDepMeses.dtgCosDpto.Selected.Clear;
   Case rdbSelxMon.ItemIndex Of
        0:Begin // Dpto
           If xBoton='A' Then
              Begin
                Screen.Cursor := crHourGlass ;
                xSQL:='SELECT CLAVE DPTOID,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO FROM RSG_RES_ANA_COS '+
                      'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                      'AND FORMA='+QuotedStr(fEstDepMeses.Name)+' AND TIPCON='+QuotedStr('10')+' AND CLAVE='+QuotedStr(DM1.cdsSolicitudA.FieldByname('DESCRIPCION').AsString)+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND  TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex)) ; mSQL:=xSQL;
                If DM1.CountReg(xSQL)=0 Then
                   Begin
                       xSQL:='SELECT DPTOID,DPTODES DESCRIPCION,SUM(NVL(NOR,0)) NOR,SUM(NVL(CPP,0)) CPP,SUM(NVL(DEF,0)) DEF,SUM(NVL(DUD,0)) DUD, '+
                             'SUM(NVL(PER,0)) PER, SUM(TOTAL) TOTAL FROM (  SELECT TO_CHAR(CREFOTORG,''YYYYMM'') MESANNO,  '+
                             'USEID,DPTOID,DPTODES,USENOM, 1 ASOCIADOS,1 TOTAL,CFC_F, NOR,CPP,DEF,DUD,PER '+
                             'FROM (SELECT A.ASOID,B.CREFOTORG,1,CFC_F, CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NOR, '+
                             'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END CPP,  CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEF,  '+
                             'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUD,  CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PER, '+
                             'A.UPROID,A.UPAGOID,A.USEID,C.DPTOID,D.DPTODES,C.USENOM  FROM CFC000 A,(SELECT ASOID,MIN(CREFOTORG) CREFOTORG FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B, '+
                             'APO101 C,APO158 D  WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID  '+xWhere+' AND A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND A.USEID=C.USEID(+) '+
                             'AND C.DPTOID=D.DPTOID(+) ) ) WHERE SUBSTR(MESANNO,1,4)='+QuotedStr(Trim(DM1.cdsSolicitudA.FieldByname('DESCRIPCION').AsString))+' GROUP BY DPTOID,DPTODES  ORDER BY DPTOID ';


                        iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO) '+
                               'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(fEstDepMeses.Name)+','+QuotedStr('10')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,'+QuotedStr(DM1.cdsSolicitudA.FieldByname('DESCRIPCION').AsString)+','+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';
                        DM1.DCOM1.AppServer.EjecutaSQL(iSQL);
                   End;
                   Screen.Cursor := crDefault;

                   xTitulo:='Año de Otorgamiento : ';
                   fEstDepMeses.dtgCosDpto.Selected.Add('DESCRIPCION'#9'24'#9'Departamento'#9#9);
              End;
           If xBoton='B' Then
              Begin
                    Screen.Cursor := crHourGlass ;
                    xSQL:='SELECT CLAVE DPTOID,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO FROM RSG_RES_ANA_COS '+
                          'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                          'AND FORMA='+QuotedStr(fEstDepMeses.Name)+' AND TIPCON='+QuotedStr('11')+' AND CLAVE='+QuotedStr(DM1.cdsSolicitudA.FieldByname('IDMON').AsString)+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND  TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex))  ; mSQL:=xSQL;
                    If DM1.CountReg(xSQL)=0 Then
                       Begin
                           xSQL:='SELECT A.DPTOID,DPTODES DESCRIPCION,SUM(NOR) NOR,SUM(CPP) CPP,SUM(DEF) DEF,SUM(DUD) DUD,SUM(PER) PER,SUM(TOTAL) TOTAL FROM ( '+
                                  'SELECT DPTOID,CREMTOOTOR,                                                 '+
                                  'CASE WHEN CREMTOOTOR BETWEEN 0 AND 3000 THEN ''DE 0 A 3,000''            '+
                                  '     WHEN CREMTOOTOR BETWEEN 3001 AND 5000 THEN ''DE 3,001 A 5,000''     '+
                                  '     WHEN CREMTOOTOR BETWEEN 5001 AND 7000 THEN ''DE 5,001 A 7,000''     '+
                                  '     WHEN CREMTOOTOR BETWEEN 7001 AND 9000 THEN ''DE 7,001 A 9,000''     '+
                                  '     WHEN CREMTOOTOR BETWEEN 9001 AND 11000 THEN ''DE 9,001 A 11,000''   '+
                                  '     WHEN CREMTOOTOR BETWEEN 11001 AND 13000 THEN ''DE 11,001 A 13,000'' '+
                                  '     WHEN CREMTOOTOR BETWEEN 13001 AND 15000 THEN ''DE 13,001 A 15,000'' '+
                                  '     WHEN CREMTOOTOR BETWEEN 15001 AND 17000 THEN ''DE 15,001 A 17,000'' '+
                                  '     WHEN CREMTOOTOR > 17000 THEN ''MAYOR 17,000''       '+
                                  '     END MONTOS,                                         '+
                                  'CASE WHEN CREMTOOTOR BETWEEN 0 AND 3000 THEN ''01''       '+
                                  '     WHEN CREMTOOTOR BETWEEN 3001 AND 5000 THEN ''02''   '+
                                  '     WHEN CREMTOOTOR BETWEEN 5001 AND 7000 THEN ''03''   '+
                                  '     WHEN CREMTOOTOR BETWEEN 7001 AND 9000 THEN ''04''   '+
                                  '     WHEN CREMTOOTOR BETWEEN 9001 AND 11000 THEN ''05''  '+
                                  '     WHEN CREMTOOTOR BETWEEN 11001 AND 13000 THEN ''06'' '+
                                  '     WHEN CREMTOOTOR BETWEEN 13001 AND 15000 THEN ''07'' '+
                                  '     WHEN CREMTOOTOR BETWEEN 15001 AND 17000 THEN ''08'' '+
                                  '     WHEN CREMTOOTOR > 17000 THEN ''09'' '+
                                  '     END IDMON, '+
                                  '1 ASOCIADOS,1 TOTAL,CFC_F, '+
                                  'NOR,CPP,DEF,DUD,PER '+
                                  'FROM '+
                                  '(SELECT C.DPTOID,A.ASOID,TRUNC(B.CREMTOOTOR) CREMTOOTOR,1 SALDOS_FT,CFC_F, '+
                                  ' CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NOR, '+
                                  ' CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END CPP, '+
                                  ' CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEF, '+
                                  ' CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUD, '+
                                  ' CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PER  '+
                                  'FROM CFC000 A,(SELECT ASOID,MAX(CREMTOOTOR) CREMTOOTOR FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B,APO101 C '+
                                  'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND A.USEID=C.USEID(+) '+
                                  'AND A.ASOID=B.ASOID '+xWhere+' ) ) A,APO158 B WHERE IDMON='+QuotedStr(DM1.cdsSolicitudA.FieldByName('IDMON').AsString)+' '+
                                  'AND A.DPTOID=B.DPTOID(+)  '+
                                  'GROUP BY A.DPTOID,DPTODES';

                           iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO) '+
                                  'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(fEstDepMeses.Name)+','+QuotedStr('11')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,'+QuotedStr(DM1.cdsSolicitudA.FieldByname('IDMON').AsString)+','+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';


                           DM1.DCOM1.AppServer.EjecutaSQL(iSQL);
                       End;
                       Screen.Cursor := crDefault;


                      fEstDepMeses.dtgCosDpto.Selected.Add('DESCRIPCION'#9'23'#9'Departamento'#9#9);
                      fEstDepMeses.rdbSelxMonDep.ItemIndex:=1;
                      fEstDepMeses.rdbSelxMonDep.Enabled:=False;
                      xTitulo:='Monto Otorgado : ';


              End;
           If xBoton='C' Then
              Begin

                    Screen.Cursor := crHourGlass ;
                    xSQL:='SELECT CLAVE DPTOID,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO FROM RSG_RES_ANA_COS '+
                          'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                          'AND FORMA='+QuotedStr(fEstDepMeses.Name)+' AND TIPCON='+QuotedStr('12')+' AND CLAVE='+QuotedStr(DM1.cdsSolicitudA.FieldByname('IDPLAZ').AsString)+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND  TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex)); mSQL:=xSQL;
                    If DM1.CountReg(xSQL)=0 Then
                       Begin
                       xSQL:='SELECT DPTOID,DPTODES DESCRIPCION, '+
                             'SUM(NVL(NOR,0)) NOR,SUM(NVL(CPP,0)) CPP,SUM(NVL(DEF,0)) DEF,SUM(NVL(DUD,0)) DUD,SUM(NVL(PER,0)) PER, SUM(TOTAL) TOTAL '+
                             'FROM ( SELECT DPTOID,DPTODES,CRENUMCUO,CASE WHEN CRENUMCUO BETWEEN 1 AND 12 THEN ''DE 1 A 12 Cuotas''  '+
                             'WHEN CRENUMCUO BETWEEN 13 AND 24 THEN ''DE 13 A 24 Cuotas'' WHEN CRENUMCUO BETWEEN 25 AND 36 THEN ''DE 25 A 36 Cuotas'' '+
                             'WHEN CRENUMCUO BETWEEN 37 AND 48 THEN ''DE 37 A 48 Cuotas'' WHEN CRENUMCUO > 48 THEN ''MAYOR A 48 Cuotas'' END PLAZOS,  '+
                             'CASE WHEN CRENUMCUO BETWEEN 1 AND 12 THEN ''01'' '+
                             'WHEN CRENUMCUO BETWEEN 13 AND 24 THEN ''02''  '+
                             'WHEN CRENUMCUO BETWEEN 25 AND 36 THEN ''03''  '+
                             'WHEN CRENUMCUO BETWEEN 37 AND 48 THEN ''04''  '+
                             'WHEN CRENUMCUO > 48 THEN ''05''  END IDPLAZ, '+
                             '1 ASOCIADOS,1 TOTAL,CFC_F, NOR,CPP,DEF,DUD,PER FROM   '+
                             '(SELECT A.ASOID,C.DPTOID,D.DPTODES,CRENUMCUO,SALDOS_FT,CFC_F, '+
                             'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NOR, '+
                             'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END CPP, '+
                             'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEF, '+
                             'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUD, '+
                             'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PER FROM CFC000 A, '+
                             '(SELECT ASOID,MAX(CRENUMCUO) CRENUMCUO FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B,APO101 C,APO158 D '+
                             'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID '+xWhere+' AND A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) '+
                             'AND A.USEID=C.USEID(+) AND C.DPTOID=D.DPTOID(+) ) ) WHERE IDPLAZ='+QuotedStr(DM1.cdsSolicitudA.FieldByName('IDPLAZ').AsString )+'  GROUP BY DPTOID,DPTODES ORDER BY DPTOID ';
                                   iSQL:='INSERT INTO RSG_RES_ANA_COS(PERIODO,FORMA,TIPCON,DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,CLAVE,TIPCAR,TIPASO) '+
                                          'SELECT '+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+','+QuotedStr(fEstDepMeses.Name)+','+QuotedStr('12')+',DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL,'+QuotedStr(DM1.cdsSolicitudA.FieldByname('IDPLAZ').AsString)+','+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+','+QuotedStr(IntToStr(rdbTipAso.ItemIndex))+' FROM ('+xSQL+')';
                                   DM1.DCOM1.AppServer.EjecutaSQL(iSQL);
                               End;
                               Screen.Cursor := crDefault;


                     fEstDepMeses.dtgCosDpto.Selected.Add('DESCRIPCION'#9'23'#9'Meses'#9#9);
                     fEstDepMeses.rdbSelxMonDep.ItemIndex:=1;
                     fEstDepMeses.rdbSelxMonDep.Enabled:=False;
                     xTitulo:='Plazo Otorgado : ';


              End;


          End;
        1:Begin // Meses
           If xBoton='A' Then
              Begin
                xSQL:='SELECT ANNO,MESDESL DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL '+
                      'FROM (SELECT MESANNO ANNO, SUM(NVL(NOR,0)) NOR, SUM(NVL(CPP,0)) CPP, '+
                      'SUM(NVL(DEF,0)) DEF, SUM(NVL(DUD,0)) DUD, SUM(NVL(PER,0)) PER, SUM(TOTAL) TOTAL '+
                      'FROM ( SELECT TO_CHAR(CREFOTORG,''YYYYMM'') MESANNO,1 ASOCIADOS,1 TOTAL,CFC_F,  '+
                      'NOR,CPP,DEF,DUD,PER FROM (SELECT A.ASOID,B.CREFOTORG,SALDOS_FT,CFC_F,  CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NOR, '+
                      'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END CPP,  CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEF,  '+
                      'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUD,  CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PER '+
                      'FROM CFC000 A,(SELECT ASOID,MIN(CREFOTORG) CREFOTORG FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' GROUP BY ASOID) B  '+
                      'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID '+xWhere+' )  ) WHERE SUBSTR(MESANNO,1,4)='+QuotedStr(Trim(DM1.cdsSolicitudA.FieldByname('DESCRIPCION').AsString))+' GROUP BY MESANNO) A,TGE181 B '+
                      'WHERE SUBSTR(ANNO,5,2)=B.MESIDR ORDER BY SUBSTR(ANNO,5,2) ORDER BY ANNO';
                      fEstDepMeses.dtgCosDpto.Selected.Add('DESCRIPCION'#9'23'#9'Meses'#9#9);
              End;
           If xBoton='B' Then
              Begin
                 Exit;
              End;
           If xBoton='C' Then
              Begin
                 Exit;
              End;

          End;
   End;

   fEstDepMeses.dtgCosDpto.Selected.Add('NOR'#9'14'#9'Normal'#9#9);
   fEstDepMeses.dtgCosDpto.Selected.Add('CPP'#9'14'#9'Problemas~Potenciales'#9#9);
   fEstDepMeses.dtgCosDpto.Selected.Add('DEF'#9'14'#9'Deficiente'#9#9);
   fEstDepMeses.dtgCosDpto.Selected.Add('DUD'#9'14'#9'Dudoso'#9#9);
   fEstDepMeses.dtgCosDpto.Selected.Add('PER'#9'14'#9'Perdida'#9#9);
   fEstDepMeses.dtgCosDpto.Selected.Add('TOTAL'#9'14'#9'Total'#9#9);


   xDateIni:=Date+Time;
   DM1.cdsSobrino.Close;
   DM1.cdsSobrino.DataRequest(xSQL); Screen.Cursor := crHourGlass;   publicSQL:=mSQL;
   DM1.cdsSobrino.Open; Screen.Cursor := crDefault;
   TNumericField(DM1.cdsSobrino.FieldByName('NOR')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsSobrino.FieldByName('CPP')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsSobrino.FieldByName('DEF')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsSobrino.FieldByName('DUD')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsSobrino.FieldByName('PER')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsSobrino.FieldByName('TOTAL')).DisplayFormat := '###,##0';


   fEstDepMeses.dtgCosDpto.ApplySelected;
   fEstDepMeses.lblTitulo01.Caption:='Periodo de Cartera  : '+lblNomMes.Caption+' - '+dbsAnoIni.Text;
   fEstDepMeses.lblTitulo02.Caption:='Año de Otorgamiento : '+DM1.cdsSolicitudA.FieldByName('DESCRIPCION').AsString;
   fEstDepMeses.ShowModal;
   fEstDepMeses.Free;

end;

procedure TfAnalisisdeCosechas.PageControlPrincipalChange(Sender: TObject);
begin
If TabNumero.Showing Then
   Begin
      dtgCosNum.ColumnByName('DESCRIPCION').FooterValue := 'Totales';
      dtgCosNum.ColumnByName('NOR').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'NOR'), ffNumber, 15, 0);
      dtgCosNum.ColumnByName('CPP').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'CPP'), ffNumber, 15, 0);
      dtgCosNum.ColumnByName('DEF').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'DEF'), ffNumber, 15, 0);
      dtgCosNum.ColumnByName('DUD').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'DUD'), ffNumber, 15, 0);
      dtgCosNum.ColumnByName('PER').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'PER'), ffNumber, 15, 0);
      dtgCosNum.ColumnByName('TOTAL').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSolicitudA,'TOTAL'), ffNumber, 15, 0);
   End;
end;

procedure TfAnalisisdeCosechas.BitSalirClick(Sender: TObject);
begin
Close;
end;

procedure TfAnalisisdeCosechas.BitExportaClick(Sender: TObject);
begin
If PageControlPrincipal.ActivePageIndex=0 Then
   DM1.ExportaGridExcel(dtgCosMon,'ExpDatos21')
Else DM1.ExportaGridExcel(dtgCosNum,'ExpDatos21');
end;

procedure TfAnalisisdeCosechas.dbsMesIniChange(Sender: TObject);
begin
lblNomMes.Caption:=DM1.DesMes(StrToInt(dbsMesIni.Text),'N');
BitFecha.OnClick(BitFecha);
end;

procedure TfAnalisisdeCosechas.BitGraficoClick(Sender: TObject);
var xSQL:string;
   xTit: TStrings;
begin
    If xBoton='A' Then
       Begin
          If PageControlPrincipal.ActivePageIndex=0 Then
           xSQL:='SELECT DESCRIPCION,NOR NORMAL,CPP PROPOT,DEF DEFICIENTE,DUD DUDOSO,PER PERDIDA,TOTAL FROM RSG_RES_ANA_COS '+
                 'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                 'AND FORMA='+QuotedStr(Name)+' AND TIPCON='+QuotedStr('01')+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND  TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex));

          If PageControlPrincipal.ActivePageIndex=1 Then
           xSQL:='SELECT DESCRIPCION,NOR NORMAL,CPP PROPOT,DEF DEFICIENTE,DUD DUDOSO,PER PERDIDA,TOTAL FROM RSG_RES_ANA_COS '+
                 'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                 'AND FORMA='+QuotedStr(Name)+' AND TIPCON='+QuotedStr('02')+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND  TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex));
      End;

    If xBoton='B' Then
       Begin
          If PageControlPrincipal.ActivePageIndex=0 Then

            xSQL:='SELECT DESCRIPCION,NOR NORMAL,CPP PROPOT,DEF DEFICIENTE,DUD DUDOSO,PER PERDIDA,TOTAL FROM RSG_RES_ANA_COS '+
                  'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                  'AND FORMA='+QuotedStr(Name)+' AND TIPCON='+QuotedStr('03')+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND  TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex));

          If PageControlPrincipal.ActivePageIndex=1 Then
           xSQL:='SELECT DESCRIPCION,NOR NORMAL,CPP PROPOT,DEF DEFICIENTE,DUD DUDOSO,PER PERDIDA,TOTAL FROM RSG_RES_ANA_COS '+
                 'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                 'AND FORMA='+QuotedStr(Name)+' AND TIPCON='+QuotedStr('04')+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND  TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex));
       End;

    If xBoton='C' Then
       Begin
          If PageControlPrincipal.ActivePageIndex=0 Then
           xSQL:='SELECT DESCRIPCION,NOR NORMAL,CPP PROPOT,DEF DEFICIENTE,DUD DUDOSO,PER PERDIDA,TOTAL FROM RSG_RES_ANA_COS '+
                 'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                 'AND FORMA='+QuotedStr(Name)+' AND TIPCON='+QuotedStr('05')+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND  TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex));

          If PageControlPrincipal.ActivePageIndex=1 Then
           xSQL:='SELECT DESCRIPCION,NOR NORMAL,CPP PROPOT,DEF DEFICIENTE,DUD DUDOSO,PER PERDIDA,TOTAL FROM RSG_RES_ANA_COS '+
                 'WHERE PERIODO='+QuotedStr(Trim(dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(dbsMesIni.Text))])))+' '+
                 'AND FORMA='+QuotedStr(Name)+' AND TIPCON='+QuotedStr('06')+' AND TIPCAR='+QuotedStr(IntToStr(rdbTipCar.ItemIndex))+' AND  TIPASO='+QuotedStr(IntToStr(rdbTipAso.ItemIndex));

       End;

    If PageControlPrincipal.ActivePageIndex=0 Then
       If dtgCosMon.DataSource.DataSet.RecordCount=0 Then Exit;
    If PageControlPrincipal.ActivePageIndex=1 Then
       If dtgCosNum.DataSource.DataSet.RecordCount=0 Then Exit;

    fGrafCosechas:= TfGrafCosechas.create(self);
    Try
       xTit := TStringList.Create;
       xTit.Add(lblTitulo01.Caption+'  '+'Proceso de Cartera : '+lblNomMes.Caption+'- '+dbsAnoIni.Text);
       fGrafCosechas.crearGrafico(DM1.wModulo,xTit,xSQL);
       fGrafCosechas.showmodal
    Finally
       fGrafCosechas.free;
    End;


end;

procedure TfAnalisisdeCosechas.dbsAnoIniChange(Sender: TObject);
begin
BitFecha.OnClick(BitFecha);
end;

end.
