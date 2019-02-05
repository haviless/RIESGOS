// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fGrafCosechas
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Grafico de analisis de cosechas
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG121;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, TeeProcs, TeEngine, Chart, ExtCtrls,
   ComCtrls, ToolWin, DbChart, Menus, Series, printers, RSG110;
type
  TfGrafCosechas = class(TForm)
    FraChartP1: TFraChartP;
        PROCEDURE FraChartP1btnImprimirClick(Sender: TObject);
    procedure FraChartP1dbgbAgregarComentarioClick(Sender: TObject);
    procedure FraChartP1btnGrabarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      PROCEDURE crearGrafico(ICodigo: STRING); Overload;
      PROCEDURE crearGrafico(IModulo: STRING; ITitulo: TStrings; ISQL: STRING); Overload;

  end;

var
  fGrafCosechas: TfGrafCosechas;

implementation

{$R *.dfm}

{ TfGrafCosechas }

procedure TfGrafCosechas.crearGrafico(ICodigo: STRING);
begin
   FraChartP1.limpiarDatos();
   FraChartP1.crearGrafico(TRIM(ICodigo));
end;

procedure TfGrafCosechas.crearGrafico(IModulo: STRING; ITitulo: TStrings;
  ISQL: STRING);
begin
   FraChartP1.limpiarDatos();
   FraChartP1.xModulo := IModulo;
   FraChartP1.xTitulo:=ITitulo;
   FraChartP1.xSQL := ISQL;
   FraChartP1.crearGrafico();
end;

procedure TfGrafCosechas.FraChartP1btnImprimirClick(Sender: TObject);
begin
    INHERITED;
   FraChartP1.dbChartPrincipal.Gradient.Visible := False;
   printer.Orientation := poLandscape;
   self.PrintScale := poPrintToFit;
   self.Print;
   FraChartP1.dbChartPrincipal.Gradient.Visible := True;
   FraChartP1.btnImprimirClick(Sender);           
end;

procedure TfGrafCosechas.FraChartP1dbgbAgregarComentarioClick(
  Sender: TObject);
begin
  FraChartP1.dbgbAgregarComentarioClick(Sender);
end;

procedure TfGrafCosechas.FraChartP1btnGrabarClick(Sender: TObject);
begin
  FraChartP1.btnGrabarClick(Sender);

end;

end.
