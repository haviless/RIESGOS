// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fDetDesplaz
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Detalle de desplazamiento por concepto
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG004;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Db;

type
  TfDetDesplaz = class(TForm)
    dtgCabDes: TwwDBGrid;
    BitSalir: TBitBtn;
    lblDesplazados: TLabel;
    procedure dtgCabDesDblClick(Sender: TObject);
    procedure BitSalirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dtgCabDesDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDetDesplaz: TfDetDesplaz;

implementation

uses RSGDM1, RSG002, RSG005;

{$R *.dfm}

procedure TfDetDesplaz.dtgCabDesDblClick(Sender: TObject);
var xSQL:String;
begin
    xSQL:='SELECT B.DPTOID DPTOID,C.DPTODES DPTODES,B.USEID USEID,B.USENOM USENOM,COUNT(*) ASOCIADOS, '+
          'SUM(NVL(SALDOS_FT,0)) SALDOS_FT, SUM(NVL(SALDOS_FP,0)) SALDOS_FP, SUM(NVL(SALDOS_FV,0)) SALDOS_FV, '+
          'SUM(NVL(SALDOS_PV,0)) SALDOS_PV FROM RIE_EST_GEN A,APO101 B,APO158 C  '+
          'WHERE PERACT='+ QuotedStr(fMatDesplaz.dbsAnoIni.Text + Format('%.2d',[StrToInt(Trim(fMatDesplaz.dbsMesIni.Text))]))+' AND  CFC_F='+QuotedStr(DM1.cdsConsulta.FieldByName('CFC_F').AsString)+' AND CFC_A='+QuotedStr(DM1.cdsConsulta.FieldByName('CFC_A').AsString)+' AND B.DPTOID='+QuotedStr(DM1.cdsConvenio.FieldByName('DPTOID').AsString)+' AND A.UPROID=B.UPROID(+) AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) AND B.DPTOID=C.DPTOID(+) '+
          'GROUP BY B.DPTOID,C.DPTODES,B.USEID,B.USENOM ORDER BY COUNT(*) DESC ';
    DM1.cdsDetalle.Close;
    DM1.cdsDetalle.DataRequest(xSQL);
    DM1.cdsDetalle.Open;
    TNumericField(DM1.cdsDetalle.FieldByName('ASOCIADOS')).DisplayFormat := '###,##0';
    TNumericField(DM1.cdsDetalle.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
    TNumericField(DM1.cdsDetalle.FieldByName('SALDOS_FV')).DisplayFormat := '###,###,###.#0';
    TNumericField(DM1.cdsDetalle.FieldByName('SALDOS_FP')).DisplayFormat := '###,###,###.#0';
    TNumericField(DM1.cdsDetalle.FieldByName('SALDOS_PV')).DisplayFormat := '###,###,###.#0';
    If DM1.cdsDetalle.RecordCount > 0 Then
       Begin
         fDetDesplazUgel:= TfDetDesplazUgel.Create(self);
         fDetDesplazUgel.lblDesplazados.Caption:=lblDesplazados.Caption;
         fDetDesplazUgel.lblDpto.Caption:='Departamento : '+DM1.cdsDetalle.FieldByName('DPTODES').AsString;
         fDetDesplazUgel.ShowModal;
         fDetDesplazUgel.Free;
       End;


end;

procedure TfDetDesplaz.BitSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfDetDesplaz.FormActivate(Sender: TObject);
var xAso:Integer;
    xSalFt,xSalFp,xSalFv,xSalPt:Currency;
begin
xAso:=0;xSalFt:=0;xSalFp:=0;xSalFv:=0;xSalPt:=0;
DM1.cdsConvenio.First;
While Not DM1.cdsConvenio.Eof Do
Begin
   xAso  := xAso + DM1.cdsConvenio.FieldByName('ASOCIADOS').AsInteger;
   xSalFt:= xSalFt + DM1.cdsConvenio.FieldByName('SALDOS_FT').AsCurrency;
   xSalFp:= xSalFp + DM1.cdsConvenio.FieldByName('SALDOS_FP').AsCurrency;
   xSalFv:= xSalFv + DM1.cdsConvenio.FieldByName('SALDOS_FV').AsCurrency;
   xSalPt:= xSalPt + DM1.cdsConvenio.FieldByName('SALDOS_PV').AsCurrency;
   DM1.cdsConvenio.Next;
End;
TNumericField(DM1.cdsConvenio.FieldByName('ASOCIADOS')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsConvenio.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
TNumericField(DM1.cdsConvenio.FieldByName('SALDOS_FV')).DisplayFormat := '###,###,###.#0';
TNumericField(DM1.cdsConvenio.FieldByName('SALDOS_FP')).DisplayFormat := '###,###,###.#0';
TNumericField(DM1.cdsConvenio.FieldByName('SALDOS_PV')).DisplayFormat := '###,###,###.#0';
dtgCabDes.ColumnByName('DPTODES').FooterValue := 'Totales';
dtgCabDes.ColumnByName('ASOCIADOS').FooterValue := FloatToStrF(xAso, ffNumber, 10, 0);
dtgCabDes.ColumnByName('SALDOS_FT').FooterValue := FloatToStrF(xSalFt, ffNumber, 15, 2);
dtgCabDes.ColumnByName('SALDOS_FV').FooterValue := FloatToStrF(xSalFv, ffNumber, 15, 2);
dtgCabDes.ColumnByName('SALDOS_FP').FooterValue := FloatToStrF(xSalFp, ffNumber, 15, 2);
dtgCabDes.ColumnByName('SALDOS_PV').FooterValue := FloatToStrF(xSalPt, ffNumber, 15, 2);
If DM1.cdsConvenio.RecordCount > 0 Then DM1.cdsConvenio.First;
end;

procedure TfDetDesplaz.dtgCabDesDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   IF (Field.FieldName = 'ASOCIADOS') THEN
   BEGIN
      dtgCabDes.Canvas.Font.Color := clRed;
      dtgCabDes.DefaultDrawDataCell(rect, Field, State);
   END;
end;

end.
