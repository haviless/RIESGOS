// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fCtrlAutorizacionAcceso
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Autorizacion de usuarios
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG127;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, ShellApi, ComCtrls,
  Spin, Mask, db,  Wwdatsrc, DBTables, fcButton, fcImgBtn,
  fcShapeBtn, wwdblook, Wwdbdlg, FileCtrl;


type
  TfCtrlAutorizacionAcceso = class(TForm)
    dtgUsuarios: TwwDBGrid;
    BitAyuda: TBitBtn;
    dtgComponentes: TwwDBGrid;
    BitIzq: TBitBtn;
    BitDer: TBitBtn;
    Shape1: TShape;
    rdbImpr: TCheckBox;
    rdbCons: TCheckBox;
    Shape2: TShape;
    lblUsuario: TLabel;
    dtgAcceso: TwwDBGrid;
    rdbGrafica: TCheckBox;
    rdbExpor: TCheckBox;
    BitSalir: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure dtgUsuariosRowChanged(Sender: TObject);
    procedure dtgUsuariosDblClick(Sender: TObject);
    procedure rdbConsClick(Sender: TObject);
    procedure BitDerClick(Sender: TObject);
    procedure BitIzqClick(Sender: TObject);
    procedure BitSalirClick(Sender: TObject);
    procedure dtgAccesoDblClick(Sender: TObject);
    procedure BitAyudaClick(Sender: TObject);
  private
    { Private declarations }
    function TrueoFalse(xFactor:String):Boolean;
  public
    { Public declarations }
    procedure Mostrar(xUser:String);
  end;

var
  fCtrlAutorizacionAcceso: TfCtrlAutorizacionAcceso;

implementation

uses RSGDM1, RSG128;

{$R *.dfm}

{ TfCtrlAutorizacionAcceso }

procedure TfCtrlAutorizacionAcceso.Mostrar(xUser: String);
var xSQL:String;
begin
  xSQL:='SELECT A.COMPONENTE,COMPDES,CONSULTA,IMPRESION,GRAFICA,EXPORTA FROM RIE_AUT_USU A,RIE_DES_COM B '+
        'WHERE A.COMPONENTE=B.COMPONENTE AND USERID='+QuotedStr(xUser);
  DM1.cdsDFam.Close;
  DM1.cdsDFam.DataRequest(xSQL);
  DM1.cdsDFam.Open;

  xSQL:='SELECT COMPONENTE,COMPDES FROM RIE_DES_COM WHERE MODULOID=''RSG'' AND COMPONENTE NOT IN '+
        '(SELECT COMPONENTE FROM RIE_AUT_USU WHERE USERID='+QuotedStr(xUser)+') ORDER BY COMPONENTE ';
  DM1.cdsDLabo.Close;
  DM1.cdsDLabo.DataRequest(xSQL);
  DM1.cdsDLabo.Open;

  lblUsuario.Caption:='Usuario  :  '+DM1.cdsCEdu.FieldByName('USERNOM').AsString;


end;

procedure TfCtrlAutorizacionAcceso.FormActivate(Sender: TObject);
var xSQL:String;
begin
  xSQL:='SELECT A.USERID,A.USERNOM,CTLFAC FROM TGE007 A,TGE006 B WHERE '+
        'A.USERID=B.USERID  AND A.GRUPOID=''GRPRIESGOS'' AND CTLFAC IS NULL ';
  DM1.cdsCEdu.Close;
  DM1.cdsCEdu.DataRequest(xSQL);
  DM1.cdsCEdu.Open;
  Mostrar(DM1.cdsCEdu.FieldByName('USERID').AsString);
  xSQL:='SELECT COMPONENTE,COMPDES FROM RIE_DES_COM WHERE MODULOID=''RSG'' AND COMPONENTE NOT IN '+
        '(SELECT COMPONENTE FROM RIE_AUT_USU WHERE USERID='+QuotedStr(DM1.cdsCEdu.FieldByName('USERID').AsString)+' ) ORDER BY COMPONENTE ';
  DM1.cdsDLabo.Close;
  DM1.cdsDLabo.DataRequest(xSQL);
  DM1.cdsDLabo.Open;
end;

procedure TfCtrlAutorizacionAcceso.dtgUsuariosRowChanged(Sender: TObject);
begin
 Mostrar(DM1.cdsCEdu.FieldByName('USERID').AsString);
end;

procedure TfCtrlAutorizacionAcceso.dtgUsuariosDblClick(Sender: TObject);
begin
  Mostrar(DM1.cdsCEdu.FieldByName('USERID').AsString);
end;

procedure TfCtrlAutorizacionAcceso.rdbConsClick(Sender: TObject);
begin
If rdbCons.Checked Then
   Begin
      rdbImpr.Enabled:=True;
      rdbGrafica.Enabled:=True;
      rdbExpor.Enabled:=True;
   End
Else
   Begin
     rdbImpr.Checked:=False;
     rdbImpr.Enabled:=False;
     rdbGrafica.Checked:=False;
     rdbGrafica.Enabled:=False;
     rdbExpor.Checked:=False;
     rdbExpor.Enabled:=False;
   End;

end;

procedure TfCtrlAutorizacionAcceso.BitDerClick(Sender: TObject);
var xSQL,xCons,xImpr,xGraf,xExpor:String;
begin
If dtgComponentes.DataSource.DataSet.RecordCount=0 Then Exit;
If dtgUsuarios.DataSource.DataSet.RecordCount=0 Then Exit;

If (Not rdbCons.Checked) AND (Not rdbImpr.Checked) AND (Not rdbGrafica.Checked) Then
   Begin
       MessageDlg('DEBE SELECCIONAR COMO MINIMO EL CHECK CONSULTAR !!!', mtError, [mbOk], 0);
       Exit;
   End;

xCons:='N';  If rdbCons.Checked Then xCons:='S';
xImpr:='N';  If rdbImpr.Checked Then xImpr:='S';
xGraf:='N';  If rdbGrafica.Checked Then xGraf:='S';
xExpor:='N'; If rdbExpor.Checked Then xExpor:='S';

xSQL:='INSERT INTO RIE_AUT_USU(USERID,COMPONENTE,CONSULTA,IMPRESION,GRAFICA,EXPORTA,USUARIO,HREG,MODULOID) VALUES ( '+QuotedStr(DM1.cdsCEdu.FieldByName('USERID').AsString)+','+QuotedStr(DM1.cdsDLabo.FieldByName('COMPONENTE').AsString)+','+QuotedStr(xCons)+','+QuotedStr(xImpr)+','+QuotedStr(xGraf)+','+QuotedStr(xExpor)+','+QuotedStr(DM1.wUsuario)+',SYSDATE,''RSG'' ) ';
DM1.DCOM1.AppServer.EjecutaSql(xSQL);
rdbCons.Checked:=False; rdbImpr.Checked:=False; rdbGrafica.Checked:=False;
Mostrar(DM1.cdsCEdu.FieldByName('USERID').AsString);

end;

procedure TfCtrlAutorizacionAcceso.BitIzqClick(Sender: TObject);
var xSQL:String;
begin
    If dtgAcceso.DataSource.DataSet.RecordCount=0 Then Exit;
    If MessageDlg('¿ Esta seguro de eliminar el acceso a la opción de : '+DM1.cdsDFam.FieldByName('COMPDES').AsString, mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
       Begin
          xSQL:='DELETE FROM RIE_AUT_USU WHERE USERID='+QuotedStr(DM1.cdsCEdu.FieldByName('USERID').AsString)+' AND COMPONENTE='+QuotedStr(DM1.cdsDFam.FieldByName('COMPONENTE').AsString);
          DM1.DCOM1.AppServer.EjecutaSql(xSQL);
          Mostrar(DM1.cdsCEdu.FieldByName('USERID').AsString);
       End;


end;

procedure TfCtrlAutorizacionAcceso.BitSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfCtrlAutorizacionAcceso.dtgAccesoDblClick(Sender: TObject);
begin
   If dtgAcceso.DataSource.DataSet.RecordCount>0 Then
      Begin
         fPermisos:= TfPermisos.Create(self);
         fPermisos.mOpcion.Text:=DM1.cdsDFam.FieldByName('COMPDES').AsString ;
         fPermisos.rdbGrafica.Checked:=TrueoFalse(DM1.cdsDFam.FieldByName('IMPRESION').AsString);
         fPermisos.rdbExpor.Checked:=TrueoFalse(DM1.cdsDFam.FieldByName('GRAFICA').AsString);
         fPermisos.rdbImpr.Checked:=TrueoFalse(DM1.cdsDFam.FieldByName('EXPORTA').AsString);
         fPermisos.ShowModal;
         fPermisos.Free;
      End;
end;


function TfCtrlAutorizacionAcceso.TrueoFalse(xFactor: String): Boolean;
begin
If xFactor='S' Then Result:=True Else Result:=False;
end;

procedure TfCtrlAutorizacionAcceso.BitAyudaClick(Sender: TObject);
begin
   If FileExists('C:\SolExes\HpInfGer.pdf') Then
      ShellExecute(fCtrlAutorizacionAcceso.Handle,nil,PChar('C:\SolExes\HpInfGer.pdf'),'','',SW_SHOWNORMAL)
   Else
       MessageDlg('ARCHIVO DE AYUDA NO EXISTE, COMUNIQUESE CON SISTEMAS!!!', mtError, [mbOk], 0);
end;

end.
