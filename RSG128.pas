// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fPermisos
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Modificar la Autorizacion de usuarios
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG128;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB;

type
  TfPermisos = class(TForm)
    BitSalir: TBitBtn;
    BitGrabar: TBitBtn;
    GroupBox1: TGroupBox;
    rdbGrafica: TCheckBox;
    rdbExpor: TCheckBox;
    rdbImpr: TCheckBox;
    mOpcion: TMemo;
    procedure BitSalirClick(Sender: TObject);
    procedure BitGrabarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPermisos: TfPermisos;

implementation

uses RSGDM1, RSG127;

{$R *.dfm}

procedure TfPermisos.BitSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfPermisos.BitGrabarClick(Sender: TObject);
var xSQL,xImpr,xGraf,xExpor:String;
    xRegistro: TBookmark;
begin
xImpr :='N';  If rdbImpr.Checked Then xImpr:='S';
xGraf :='N';  If rdbGrafica.Checked Then xGraf:='S';
xExpor:='N'; If rdbExpor.Checked Then xExpor:='S';
xRegistro := DM1.cdsDFam.GetBookmark;
xSQL:='UPDATE RIE_AUT_USU SET IMPRESION='+QuotedStr(xImpr)+',GRAFICA='+QuotedStr(xGraf)+',EXPORTA='+QuotedStr(xExpor)+' '+
      'WHERE USERID='+QuotedStr(DM1.cdsCEdu.FieldByName('USERID').AsString)+' AND COMPONENTE='+QuotedStr(DM1.cdsDFam.FieldByName('COMPONENTE').AsString);
DM1.DCOM1.AppServer.EjecutaSql(xSQL);
fCtrlAutorizacionAcceso.Mostrar(DM1.cdsCEdu.FieldByName('USERID').AsString);
DM1.cdsDFam.GotoBookmark(xRegistro);
         
end;

end.
