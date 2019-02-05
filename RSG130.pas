// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FValidacionBDC
// Fecha de Creación :13/11/2017
// Autor : Equipo de Sistemas
// Objetivo : Resumen de Validaciones
// HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC

// Inicio HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
unit RSG130;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, wwdbedit, Wwdbspin, Grids, Wwdbigrd, Wwdbgrid,
  Buttons, ExtCtrls, fcButton, fcImgBtn, fcShapeBtn;


type
  TFValidacionBDC = class(TForm)
    btnNuevaValidacion: TBitBtn;
    grid: TwwDBGrid;
    btnEliminar: TBitBtn;
    grupoEstados: TRadioGroup;
    btnAprobar: TBitBtn;
    panelObs: TPanel;
    Label2: TLabel;
    StaticText1: TStaticText;
    BitSave: TfcShapeBtn;
    BitOut: TfcShapeBtn;
    txtobservacion: TMemo;
    procedure btnNuevaValidacionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure grupoEstadosClick(Sender: TObject);
    procedure btnAprobarClick(Sender: TObject);
    procedure BitOutClick(Sender: TObject);
    procedure BitSaveClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure cargarGrilla();
  end;

var
  FValidacionBDC: TFValidacionBDC;

implementation

Uses
  RSG131,RSG132, RSGDM1;
{$R *.dfm}

procedure TFValidacionBDC.btnNuevaValidacionClick(Sender: TObject);
begin
  FValidarBDC:= TFValidarBDC.Create(self);
  FValidarBDC.ShowModal;
  FValidarBDC.Free;
end;

procedure TFValidacionBDC.FormCreate(Sender: TObject);
begin
  panelObs.Visible:=false;
  grupoEstados.ItemIndex:=0;
  cargarGrilla();
end;
procedure TFValidacionBDC.cargarGrilla();
var xSQL:String;
    xSQLF:String;
begin
  xSQLF:='';
  If grupoEstados.ItemIndex=0 Then xSQLF:=' AND CODEST=1';
  If grupoEstados.ItemIndex=1 Then xSQLF:=' AND CODEST=2';

  xSQL:='SELECT CODSEC,CODPER,CODEST,CASE WHEN CODEST=1 THEN ''CONFORME'' WHEN CODEST=2 THEN ''OBSERVADO'' ELSE ''ANULADO'' END ESTADO,'+
  'TO_CHAR(FECREG,''DD/MM/YYYY HH:MI:SS AM'') FECHA,DESOBS '+
  'FROM RSG_CAB_VAL WHERE 1=1 '+xSQLF+' ORDER BY CODPER DESC';
  DM1.cdsQry6.Close;
  DM1.cdsQry6.DataRequest(xSql);
  DM1.cdsQry6.Open;
  grid.DataSource := DM1.dsQry6;
  With grid Do
  Begin
      Selected.Clear;
      Selected.Add('CODPER'#9'15'#9'PERIODO');
      Selected.Add('FECHA'#9'30'#9'FECHA');
      Selected.Add('DESOBS'#9'40'#9'OBSERVACIÓN');
      Selected.Add('ESTADO'#9'20'#9'ESTADO');
      ApplySelected;
  End;
end;

procedure TFValidacionBDC.btnBuscarClick(Sender: TObject);
begin
   cargarGrilla();
end;

procedure TFValidacionBDC.gridDblClick(Sender: TObject);
begin
   If DM1.cdsQry6.RecordCount=0 Then exit;
   FDetalle:=TFDetalle.Create(Self);
   FDetalle.mes:=Copy(DM1.cdsQry6.FieldByName('CODPER').AsString,5,2);
   FDetalle.anio:=Copy(DM1.cdsQry6.FieldByName('CODPER').AsString,1,4);
   FDetalle.secuencia:=DM1.cdsQry6.FieldByName('CODSEC').AsInteger;
   FDetalle.ShowModal();
end;

procedure TFValidacionBDC.btnEliminarClick(Sender: TObject);
var xSQL:String;
Boton:Integer;
begin
   If DM1.cdsQry6.FieldByName('CODEST').AsInteger=0 Then
   Begin
    MessageDlg('El registro debe de estar aprobado u observado', mtInformation, [mbOk], 0);
    exit;
   End;
   If DM1.cdsQry6.RecordCount=0 Then exit;
   Boton := Application.MessageBox ('¿Seguro de anular el registro?','Aviso',MB_YESNO+MB_ICONQUESTION);
   If Boton = ID_YES Then
   Begin
    Screen.Cursor := crHourglass;
    xSQL:='UPDATE RSG_CAB_VAL SET FECMOD=SYSDATE,USUMOD='+quotedstr(DM1.wUsuario)+',CODEST=0 WHERE CODSEC='+DM1.cdsQry6.FieldByName('CODSEC').AsString;
    DM1.DCOM1.AppServer.EjecutaSql(xSQL);
    MessageDlg('Anulado correctamente', mtInformation, [mbOk], 0);
    cargarGrilla();
    Screen.Cursor := crDefault;
   End;
end;

procedure TFValidacionBDC.grupoEstadosClick(Sender: TObject);
begin
cargarGrilla();
end;

procedure TFValidacionBDC.btnAprobarClick(Sender: TObject);
begin
  If DM1.cdsQry6.RecordCount=0 Then exit;
  If (DM1.cdsQry6.FieldByName('CODEST').AsInteger=1) OR (DM1.cdsQry6.FieldByName('CODEST').AsInteger=0) Then
  Begin
    MessageDlg('El registro debe de estar observado', mtInformation, [mbOk], 0);
    exit;
  End;
  panelObs.Visible:=true;
  txtobservacion.Text:='';
  txtobservacion.SetFocus;
end;

procedure TFValidacionBDC.BitOutClick(Sender: TObject);
begin
  txtobservacion.Text:='';
  panelObs.Visible:=false;
end;

procedure TFValidacionBDC.BitSaveClick(Sender: TObject);
var Boton:Integer;
xSQL:String;
begin
   If trim(txtobservacion.Text)='' Then
   Begin
    MessageDlg('Ingrese una observación', mtInformation, [mbOk], 0);
    txtobservacion.SetFocus;
    exit;
   End;
   Boton := Application.MessageBox ('¿Seguro de aprobar la información?','Aviso',MB_YESNO+MB_ICONQUESTION);
   If Boton = ID_YES Then
   Begin
    Screen.Cursor := crHourglass;
    xSQL:='UPDATE RSG_CAB_VAL SET CODEST=1,FECMOD=SYSDATE,USUMOD='+quotedstr(DM1.wUsuario)+',DESOBS='+quotedstr(txtobservacion.Text)+' WHERE CODSEC='+DM1.cdsQry6.FieldByName('CODSEC').AsString;
    DM1.DCOM1.AppServer.EjecutaSql(xSQL);
    MessageDlg('Aprobado correctamente', mtInformation, [mbOk], 0);
    cargarGrilla();
    Screen.Cursor := crDefault;
     panelObs.Visible:=false;
    End;
end;
 // Fin HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
end.
