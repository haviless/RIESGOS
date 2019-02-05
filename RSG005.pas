// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fDetDesplazUgel
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Detalle de desplazamiento por ugel/uses
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG005;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Db;

type
  TfDetDesplazUgel = class(TForm)
    dtgDetDes: TwwDBGrid;
    BitSalir: TBitBtn;
    lblDpto: TLabel;
    lblDesplazados: TLabel;
    procedure BitSalirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dtgDetDesDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDetDesplazUgel: TfDetDesplazUgel;

implementation

uses RSGDM1;

{$R *.dfm}

procedure TfDetDesplazUgel.BitSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfDetDesplazUgel.FormActivate(Sender: TObject);
var xAso:Integer;
    xSalFt,xSalFp,xSalFv,xSalPt:Currency;
begin
xAso:=0;xSalFt:=0;xSalFp:=0;xSalFv:=0;xSalPt:=0;
DM1.cdsDetalle.First;
While Not DM1.cdsDetalle.Eof Do
Begin
   xAso  := xAso + DM1.cdsDetalle.FieldByName('ASOCIADOS').AsInteger;
   xSalFt:= xSalFt + DM1.cdsDetalle.FieldByName('SALDOS_FT').AsCurrency;
   xSalFp:= xSalFp + DM1.cdsDetalle.FieldByName('SALDOS_FP').AsCurrency;
   xSalFv:= xSalFv + DM1.cdsDetalle.FieldByName('SALDOS_FV').AsCurrency;
   xSalPt:= xSalPt + DM1.cdsDetalle.FieldByName('SALDOS_PV').AsCurrency;
   DM1.cdsDetalle.Next;
End;
TNumericField(DM1.cdsDetalle.FieldByName('ASOCIADOS')).DisplayFormat := '###,##0';
TNumericField(DM1.cdsDetalle.FieldByName('SALDOS_FT')).DisplayFormat := '###,###,###.#0';
TNumericField(DM1.cdsDetalle.FieldByName('SALDOS_FV')).DisplayFormat := '###,###,###.#0';
TNumericField(DM1.cdsDetalle.FieldByName('SALDOS_FP')).DisplayFormat := '###,###,###.#0';
TNumericField(DM1.cdsDetalle.FieldByName('SALDOS_PV')).DisplayFormat := '###,###,###.#0';
dtgDetDes.ColumnByName('USENOM').FooterValue := 'Totales';
dtgDetDes.ColumnByName('ASOCIADOS').FooterValue := FloatToStrF(xAso, ffNumber, 10, 0);
dtgDetDes.ColumnByName('SALDOS_FT').FooterValue := FloatToStrF(xSalFt, ffNumber, 15, 2);
dtgDetDes.ColumnByName('SALDOS_FV').FooterValue := FloatToStrF(xSalFv, ffNumber, 15, 2);
dtgDetDes.ColumnByName('SALDOS_FP').FooterValue := FloatToStrF(xSalFp, ffNumber, 15, 2);
dtgDetDes.ColumnByName('SALDOS_PV').FooterValue := FloatToStrF(xSalPt, ffNumber, 15, 2);
If DM1.cdsDetalle.RecordCount > 0 Then DM1.cdsDetalle.First;

end;

procedure TfDetDesplazUgel.dtgDetDesDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   IF (Field.FieldName = 'ASOCIADOS') THEN
   BEGIN
      dtgDetDes.Canvas.Font.Color := clRed;
      dtgDetDes.DefaultDrawDataCell(rect, Field, State);
   END;

end;

end.
