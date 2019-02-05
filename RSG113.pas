// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FComentarioImg
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Formulario para ingresar un comentario en el grafico
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG113;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFComentarioImg = class(TForm)
    Button1: TButton;
    Button2: TButton;
    mComentario: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FComentarioImg: TFComentarioImg;

implementation

{$R *.dfm}

procedure TFComentarioImg.FormShow(Sender: TObject);
var i:integer;
begin
  for i:=0 to mComentario.Lines.Count-1 do
       if trim(mComentario.Lines.Strings[i])='' then
          mComentario.Lines.Delete(i);
end;

end.
