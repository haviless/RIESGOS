// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FChartN
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Formulario para dar un nombre a los reportes
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG111;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFChartN = class(TForm)
    Button1: TButton;
    btnAceptar: TButton;
    edNombre: TEdit;
    Label1: TLabel;
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FChartN: TFChartN;

implementation

{$R *.dfm}

procedure TFChartN.btnAceptarClick(Sender: TObject);
begin
  edNombre.Text:=trim(edNombre.Text);
  if edNombre.Text='' then
  begin
      showmessage('Por favor ingrese un Titulo para el Grafico');
      exit;
  end
  else
    ModalResult:= mrOk;
end;

end.
