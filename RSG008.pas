// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fEstMesUgel
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Analisis de cosechas por meses / Ugel
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG008;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Db, Buttons;

type
  TfEstMesUgel = class(TForm)
    dtgMesUgel: TwwDBGrid;
    BitExporta: TBitBtn;
    BitGrafico: TBitBtn;
    BitSalir: TBitBtn;
    lblTitulo02: TLabel;
    lblTitulo01: TLabel;
    lblTitulo03: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure dtgMesUgelDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure BitExportaClick(Sender: TObject);
    procedure BitSalirClick(Sender: TObject);
    procedure BitGraficoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEstMesUgel: TfEstMesUgel;

implementation

uses RSGDM1, RSG123, RSG007;

{$R *.dfm}

procedure TfEstMesUgel.Button1Click(Sender: TObject);
begin
DM1.ExportaGridExcel(dtgMesUgel,'ExpDatos16');
end;

procedure TfEstMesUgel.dtgMesUgelDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   If (Field.FieldName = 'DESCRIPCION') Then
   Begin
      dtgMesUgel.Canvas.Font.Color := clNavy;
      dtgMesUgel.DefaultDrawDataCell(rect, Field, State);
   End;
   If (Field.FieldName = 'TOTAL') Then
   Begin
      dtgMesUgel.Canvas.Font.Color := clNavy;
      dtgMesUgel.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'NOR') Then
   Begin
      dtgMesUgel.Canvas.Font.Color := clGreen;
      dtgMesUgel.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'CPP') Then
   Begin
      dtgMesUgel.Canvas.Font.Color := clTeal;
      dtgMesUgel.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'DEF') Then
   Begin
      dtgMesUgel.Canvas.Font.Color := clOlive;
      dtgMesUgel.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'DUD') Then
   Begin
      dtgMesUgel.Canvas.Font.Color := clPurple;
      dtgMesUgel.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'PER') Then
   Begin
      dtgMesUgel.Canvas.Font.Color := clRed;
      dtgMesUgel.DefaultDrawDataCell(rect, Field, State);
   End;

end;

procedure TfEstMesUgel.FormActivate(Sender: TObject);
begin
   dtgMesUgel.ColumnByName('DESCRIPCION').FooterValue := 'Totales';
   dtgMesUgel.ColumnByName('NOR').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsUSES,'NOR'), ffNumber, 15, 0);
   dtgMesUgel.ColumnByName('CPP').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsUSES,'CPP'), ffNumber, 15, 0);
   dtgMesUgel.ColumnByName('DEF').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsUSES,'DEF'), ffNumber, 15, 0);
   dtgMesUgel.ColumnByName('DUD').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsUSES,'DUD'), ffNumber, 15, 0);
   dtgMesUgel.ColumnByName('PER').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsUSES,'PER'), ffNumber, 15, 0);
   dtgMesUgel.ColumnByName('TOTAL').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsUSES,'TOTAL'), ffNumber, 15, 0);

end;

procedure TfEstMesUgel.BitExportaClick(Sender: TObject);
begin
DM1.ExportaGridExcel(dtgMesUgel,'ExpDatos16');
end;

procedure TfEstMesUgel.BitSalirClick(Sender: TObject);
begin
Close;
end;

procedure TfEstMesUgel.BitGraficoClick(Sender: TObject);
var xSQL:string;
   xTit: TStrings;
begin
    fGrafDepMeses:= TfGrafDepMeses.create(self);
    Try
       xSQL:='SELECT DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL FROM ('+fEstDepMeses.publicSQL+')';
       xTit := TStringList.Create;
       xTit.Add(lblTitulo01.Caption+' - '+lblTitulo02.Caption+' '+lblTitulo03.Caption);
       fGrafDepMeses.crearGrafico(DM1.wModulo,xTit,xSQL);
       fGrafDepMeses.showmodal
    Finally
       fGrafDepMeses.free;
    End;                  


end;

end.
