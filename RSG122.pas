// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fGrafIndGestion
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Graficos de indices de gestion
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG122;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, TeeProcs, TeEngine, Chart, ExtCtrls,
   ComCtrls, ToolWin, DbChart, Menus, Series, printers, RSG110;
type
  TfGrafIndGestion = class(TForm)
    FraChartP1: TFraChartP;
          PROCEDURE FraChartP1btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      PROCEDURE crearGrafico(ICodigo: STRING); Overload;
      PROCEDURE crearGrafico(IModulo: STRING; ITitulo: TStrings; ISQL: STRING); Overload;
  end;

var
  fGrafIndGestion: TfGrafIndGestion;

implementation

{$R *.dfm}

{ TfGrafIndGestion }

procedure TfGrafIndGestion.crearGrafico(ICodigo: STRING);
begin
   FraChartP1.limpiarDatos();
   FraChartP1.crearGrafico(TRIM(ICodigo));
end;

procedure TfGrafIndGestion.crearGrafico(IModulo: STRING; ITitulo: TStrings;
  ISQL: STRING);
begin
   FraChartP1.limpiarDatos();
   FraChartP1.xModulo := IModulo;
   FraChartP1.xTitulo:=ITitulo;
   FraChartP1.xSQL := ISQL;
   FraChartP1.crearGrafico();
end;

procedure TfGrafIndGestion.FraChartP1btnImprimirClick(Sender: TObject);
begin
    INHERITED;
   FraChartP1.dbChartPrincipal.Gradient.Visible := False;
   printer.Orientation := poLandscape;
   self.PrintScale := poPrintToFit;
   self.Print;
   FraChartP1.dbChartPrincipal.Gradient.Visible := True;
   FraChartP1.btnImprimirClick(Sender);
end;

end.
