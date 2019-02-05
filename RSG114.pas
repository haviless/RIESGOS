// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FChart
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Formulario para crear un grafico
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

UNIT RSG114;

INTERFACE

USES
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, TeeProcs, TeEngine, Chart, ExtCtrls,
   ComCtrls, ToolWin, DbChart, Menus, Series, printers, RSG110;

TYPE
   TFChart = CLASS(TForm)
    FraChartP1: TFraChartP;
      PROCEDURE FraChartP1btnImprimirClick(Sender: TObject);
    procedure FraChartP1btnGrabarClick(Sender: TObject);
    procedure FraChartP1btnActualizarClick(Sender: TObject);
    procedure FraChartP1btnCambiarTituloClick(Sender: TObject);
    procedure FraChartP1btnColorSerieClick(Sender: TObject);
   Private
   Public
      PROCEDURE crearGrafico(ICodigo: STRING); Overload;
      PROCEDURE crearGrafico(IModulo: STRING; ITitulo: TStrings; ISQL: STRING); Overload;
   END;

VAR
   FChart: TFChart;

IMPLEMENTATION

USES RSGDM1;

{$R *.dfm}

(******************************************************************************)

procedure TFChart.crearGrafico(ICodigo: STRING);
begin
   FraChartP1.limpiarDatos();
   FraChartP1.crearGrafico(TRIM(ICodigo));
end;
(******************************************************************************)

procedure TFChart.crearGrafico(IModulo: STRING; ITitulo: TStrings;
  ISQL: STRING);
begin
   FraChartP1.limpiarDatos();
   FraChartP1.xModulo := IModulo;
   FraChartP1.xTitulo:=ITitulo;
   FraChartP1.xSQL := ISQL;
   FraChartP1.crearGrafico();
end;
(******************************************************************************)

PROCEDURE TFChart.FraChartP1btnImprimirClick(Sender: TObject);
BEGIN
   INHERITED;
   FraChartP1.dbChartPrincipal.Gradient.Visible := False;
   printer.Orientation := poLandscape;
   self.PrintScale := poPrintToFit;
   self.Print;
   FraChartP1.dbChartPrincipal.Gradient.Visible := True;
   FraChartP1.btnImprimirClick(Sender);

END;

procedure TFChart.FraChartP1btnGrabarClick(Sender: TObject);
begin
  FraChartP1.btnGrabarClick(Sender);

end;

procedure TFChart.FraChartP1btnActualizarClick(Sender: TObject);
begin
  FraChartP1.btnActualizarClick(Sender);

end;

procedure TFChart.FraChartP1btnCambiarTituloClick(Sender: TObject);
begin
  FraChartP1.btnCambiarTituloClick(Sender);

end;

procedure TFChart.FraChartP1btnColorSerieClick(Sender: TObject);
begin
  FraChartP1.btnColorSerieClick(Sender);

end;

END.


