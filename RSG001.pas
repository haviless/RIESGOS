// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FPrincipal
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Menu Principal
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG
// HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
// HPC_201801_RSG : Se añade botón de Reporte de Sustento Contable
unit RSG001;
interface

uses
  Windows, Messages, SysUtils, Classes, fcLabel, StdCtrls,
  Controls, ExtCtrls, Buttons, ComCtrls, ToolWin, Forms, wwDBigrd, DB, dialogs, ppCtrls,
  DBCtrls, IniFiles, Grids, DBGrids, Wwdbgrid, Graphics,
  // Inicio: HPC_201801_RSG
  // Se añade el unidad componente jpeg
  // fcImgBtn, fcButton, fcShapeBtn, fcTreeView;
  fcImgBtn, fcButton, fcShapeBtn, fcTreeView, jpeg;
  // Fin: HPC_201801_RSG

type
  TFPrincipal = class(TForm)
    lblVersion: TLabel;
    Image1: TImage;
    fcLabel3: TfcLabel;
    fcLabel1: TfcLabel;
    StatusBar1: TStatusBar;
    Timer2: TTimer;
    Bit001: TSpeedButton;
    Bit000: TSpeedButton;
    Shape1: TShape;
    Bit009: TfcShapeBtn;
    Bit002: TfcShapeBtn;
    Bit003: TfcShapeBtn;
    Bit004: TfcShapeBtn;
    Bit005: TfcShapeBtn;
    Bit008: TfcShapeBtn;
    BitSalir: TfcShapeBtn;
    Bit006: TfcShapeBtn;
// Inicio HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
    Bit010: TfcShapeBtn;
    // Inicio: HPC_201801_RSG
    // Se añade el boton "Reporte de Sustento Contable"
    Bit011: TfcShapeBtn;
    // Fin: HPC_201801_RSG
// Fin HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Z1sbSalidaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer2Timer(Sender: TObject);
    procedure spdControlClick(Sender: TObject);
    procedure Bit001Click(Sender: TObject);
    procedure Bit009Click(Sender: TObject);
    procedure Bit002Click(Sender: TObject);
    procedure Bit003Click(Sender: TObject);
    procedure Bit004Click(Sender: TObject);
    procedure Bit005Click(Sender: TObject);
    procedure Bit008Click(Sender: TObject);
    procedure BitSalirClick(Sender: TObject);
    procedure Bit006Click(Sender: TObject);
    procedure Bit000Click(Sender: TObject);
// Inicio HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
    procedure Bit010Click(Sender: TObject);
    // Inicio: HPC_201801_RSG
    // Llama a la nueva forma de reporte de Sustento Contable
    procedure Bit011Click(Sender: TObject);
    // Fin: HPC_201801_RSG
// Fin HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC

  private
    { Private declarations }

    function  VerificaVersion: Boolean;
    procedure Verpercadpas;



  public
     xSQL:String;
     CAxuRep : String;
     procedure ListaComponentes( xForm : TForm);
     Procedure MueveMouse(xObjeto: TObject; Shift: TShiftState; X, Y: Integer);

end;

var
  FPrincipal : TFPrincipal;
  D, M, Y : Word;
  xSQL2, xSQL, sSQL : string;
  xFechasys : TDate;
  xDiaSys,xAnoSys,xMesSys : Word;


implementation
// Inicio HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
uses  RSG002,RSG017, RSG003, RSG115, RSG006, RSG018,
  // Inicio: HPC_201801_RSG
  // Se añade la unidad RSG011
  // RSG010, RSG127, RSGDM1, RSG022, RSG020,RSG130;
  RSG010, RSG127, RSGDM1, RSG022, RSG020,RSG130, RSG011;
  // Fin: HPC_201801_RSG
// Fin HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC



{$R *.DFM}

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  Screen.Cursor:=CrDefault;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  DM1.BlqComponentes(Self);
  If (DM1.wAdmin = 'G') OR
     (DM1.wAdmin = 'M')Then
  begin
    DM1.wGrupoTmp := '';
    ListaComponentes(Self);
  end;

  DecodeDate(Date, Y, M, D);
end;

procedure TFPrincipal.Z1sbSalidaClick(Sender: TObject);
begin
  Close;
end;




procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Application.Terminate;
end;

Procedure TFprincipal.FormActivate(Sender: TObject);
Var
   xFecha, xFtp: String;
   xRuta : String;
   IniFile: TIniFile;
Begin
   IniFile := TIniFile.Create('C:\SOLExes\DM_Conf_CLI.ini');
   xFtp := IniFile.ReadString('FOTOS', 'FTP', '');
   If Length(Trim(xFtp)) = 0 Then
   Begin
      MessageDlg(' Debe Actualizar El Archivo De Inicio Del Sistema ', mtError, [mbOk], 0);
      DM1.DCOM1.Connected := False;
      Application.Terminate;
   End;
   sSQL := 'SELECT ' + wRepFuncChar + wRepFecServi + ', ' + QuotedStr('DD/MM/YYYY') + ') "FECHA" FROM DUAL';
   DM1.cdsReporte.Close;
   DM1.cdsReporte.DataRequest(sSQL);
   DM1.cdsReporte.Open;
   xFecha := DM1.cdsReporte.FieldByName('FECHA').AsString;
   xFechasys := StrToDate(xFecha);
   xFechasys := Date;
   DecodeDate(xFechaSys, xAnoSys, xMesSys, xDiaSys);
   VerificaVersion;
   Verpercadpas;

   xRuta:=UpperCase(ExtractFilePath(Application.ExeName));
   If Trim(xRuta)<>'C:\SOLEXES\' Then
   Begin
      MessageDlg(' EL SISTEMA Debe Ejecutase Desde :  >>> C:\SOLExes\ <<<  VERIFIQUE LA RUTA !!!! ', mtError, [mbOk], 0);
      Application.Terminate;
   End;

   If DM1.CrgDescrip('USERID=' + QuotedStr(Trim(DM1.wUsuario)) + ' AND GRUPOID=''GRPRIESGOS''', 'TGE007', 'GRUPOID') <> 'GRPRIESGOS' Then
   Begin
      MessageDlg(' USUARIO NO PERTENECE AL GRUPO RIESGOS !!!! ', mtError, [mbOk], 0);
      Application.Terminate;
   End;

   lblVersion.Left := 8;
   lblVersion.Top := 504;
   DM1.xOfiDes := DM1.CrgDescrip('USERID=' + QuotedStr(Trim(DM1.wUsuario)), 'TGE006', 'OFDESID');
   Statusbar1.Panels[1].Text := 'Usuario : ' + DM1.wUsuario + ' -   '
      + Trim(DM1.CrgDescrip('USERID=' + QuotedStr(Trim(DM1.wUsuario)), 'TGE006', 'USERNOM'));
   Statusbar1.Panels[2].Text := 'Origen de Operaciones   :   ' + DM1.xOfiDes + ' -  '
      + DM1.CrgDescrip('OFDESID=' + QuotedStr(Trim(DM1.xOfiDes)), 'APO110', 'OFDESNOM');
// Inicio HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario)),'TGE006','CTLFAC')='G' Then
   Begin
      Bit000.Enabled:=True;
      Bit001.Enabled:=True;
      Bit008.Enabled:=True;
      Bit006.Enabled:=True;
      Bit005.Enabled:=True;
      Bit004.Enabled:=True;
      Bit003.Enabled:=True;
      Bit002.Enabled:=True;
      Bit009.Enabled:=True;
      Bit010.Enabled:=True;
      // Inicio: HPC_201801_RSG
      // Se pone en Enabled el nuevo boton de "Sustento de Reporte Contable"
      Bit011.Enabled:=True;
      // Fin: HPC_201801_RSG
   End;
// Fin HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
End;

procedure TFPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If key=#13 Then
  begin
    If Self.ActiveControl Is TDBMemo Then Exit;
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;


function TFPrincipal.VerificaVersion: Boolean;
begin
  Result:=False;
  xSQL:='SELECT CODIGO,DESCRIP,VERSION,USUARIO,FLAGSTD,PREFIJO,MODDIFC,VERSIG FROM TGE600 WHERE CODIGO='''+DM1.wModulo+'''';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest( xSQL );
  DM1.cdsQry.Open;
  If lblVersion.caption=DM1.cdsQry.FieldByName('VERSION').AsString Then
    Result:=True
  Else
  begin
    ShowMessage( 'PARA PODER CONTINUAR, ES NECESARIO QUE ACTUALICE LA VERSION');
    DM1.DCOM1.Connected:=False;
    Application.Terminate;
  end;
end;


procedure TFPrincipal.ListaComponentes(xForm: TForm);
var
  i : integer;
begin
   for i:=0 to xForm.ComponentCount-1 do begin

      if xForm.Components[i].ClassName = 'TPanel' then
         TPanel(xForm.components[i]).OnMouseMove := MueveMouse;
      // para botones
      if xForm.Components[i].ClassName = 'TButton' then
         TButton(xForm.components[i]).OnMouseMove := MueveMouse;
      // para bitbuttons
      if xForm.Components[i].ClassName = 'TBitBtn' then
         TBitBtn(xForm.components[i]).OnMouseMove := MueveMouse;
      // para speedbuttons
      if xForm.Components[i].ClassName = 'TSpeedButton' then
         TSpeedButton(xForm.components[i]).OnMouseMove := MueveMouse;
      // Boton de Grid
      if xForm.Components[i].ClassName = 'TwwIButton' then
         TwwIButton(xForm.components[i]).OnMouseMove := MueveMouse;

      // para la forma
      xForm.onMouseMove := MueveMouse;
   end;
end;

procedure TFPrincipal.MueveMouse(xObjeto: TObject; Shift: TShiftState; X,
  Y: Integer);
var
   xComponente : String;
   xForma : TForm;
begin
   xForma      := Screen.ActiveForm;
   xComponente := xForma.Name;

   If xObjeto is TForm Then
   Else
    begin
     xComponente := xComponente+'.'+TControl(xObjeto).Name;

     DM1.wObjetoForma := xForma.Name;
     DM1.wObjetoNombr := TControl(xObjeto).Name;
     If Copy(DM1.wObjetoNombr,2,1)='2' Then
      DM1.wObjetoDescr := DM1.wObjetoDesPr+' - '+TControl(xObjeto).Hint
     Else
      begin
       DM1.wObjetoDescr := TControl(xObjeto).Hint;
      end;
   end;
end;

procedure TFPrincipal.Timer2Timer(Sender: TObject);
begin
    Statusbar1.Panels[3].Text :=DateTOStr(DM1.FechaSys)+'   '+TimeToStr(Time);
end;

procedure TFPrincipal.spdControlClick(Sender: TObject);
begin
Screen.Cursor := crHourGlass;
Screen.Cursor := crDefault;
showMessage('Ok');

end;


Procedure TFprincipal.Verpercadpas;
Var
   xSql: String;
   xfecfin: TDate;
   xdiasexppass, xdiasduracpass: Integer;
   xdiasfaltantes: Integer;
   xpassact, xpassnue: String;
Begin
   xSql := 'SELECT TO_DATE(nvl(FECINI_PWD,sysdate)) FECINI_PWD, '
      + '       TO_DATE(nvl(FECFIN_PWD,sysdate+30)) FECFIN_PWD, '
      + '       nvl(DIASEXP_PWD,7) DIASEXP_PWD, '
      + '       nvl(DIASDURAC_PWD,30) DIASDURAC_PWD, PASSWORD '
      + 'FROM TGE006 WHERE USERID = ' + QuotedStr(DM1.wUsuario);

   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xfecfin := DM1.cdsQry.FieldByName('FECFIN_PWD').AsDateTime;
   xdiasexppass := DM1.cdsQry.FieldByName('DIASEXP_PWD').AsInteger;
   xdiasduracpass := DM1.cdsQry.FieldByName('DIASDURAC_PWD').AsInteger;
   xpassact := DM1.cdsQry.FieldByName('PASSWORD').AsString;
   xSql := 'SELECT TO_DATE(' + QuotedStr(DateToStr(xfecfin)) + ') - TO_DATE(SYSDATE) DIASFALTANTE FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xdiasfaltantes := DM1.cdsQry.FieldByName('DIASFALTANTE').AsInteger; // dias que faltan
   If xdiasfaltantes <= xdiasexppass Then
   Begin
      If xdiasfaltantes <= 0 Then
         MessageDlg('SU CONTRASEÑA HA CADUCADO, DEBE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
      Else
         If xdiasfaltantes = 1 Then
            MessageDlg('*** FALTA 1 DíA PARA EL VENCIMIENTO DE SU PASSWORD. ***'#13'                            SE SUGIERE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
         Else
            MessageDlg('*** FALTAN ' + IntToStr(xdiasfaltantes) + ' DÍAS PARA EL VENCIMIENTO DE SU PASSWORD. ***'#13'                            SE SUGIERE CAMBIARLA AHORA', mtCustom, [mbOk], 0);
      DM1.cdsUser.Close;
      DM1.cdsUser.DataRequest('SELECT USERID, USERNOM, PASSWORD, FECEXP, OFDESID, CTLFAC, FLGAUT, FECINI_PWD, FECFIN_PWD, DIASEXP_PWD, DIASDURAC_PWD, CTRL_IP FROM TGE006 WHERE USERID=''' + DM1.wUsuario + '''');
      DM1.cdsUser.Open;

      FCPassw := TFCPassw.Create(Self);
      FCPassw.dbeUsuario.Text := DM1.wUsuario;
      FCPassw.dbeNombre.Text := DM1.cdsUser.FieldByname('USERNOM').AsString;
      FCPassw.dbeUsuario.Text := DM1.wUsuario;
      FCPassw.sPassword := DM1.cdsUser.FieldByname('PASSWORD').AsString;
      FCPassw.sModulo := DM1.wModulo;
      FCPassw.wcdsUsuarios := DM1.cdsUser;
      Try
         FCPassw.ShowModal;
      Finally
         FCPassw.Free;
      End;

      xSql := 'SELECT PASSWORD FROM TGE006 WHERE USERID = ' + QuotedStr(DM1.wUsuario);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      xpassnue := DM1.cdsQry.FieldByName('PASSWORD').AsString;
      If xpassact <> xpassnue Then
      Begin
         xSql := 'UPDATE TGE006 '
            + 'SET FECINI_PWD = TO_DATE(SYSDATE), '
            + '    FECFIN_PWD = TO_DATE(SYSDATE)+' + IntToStr(xdiasduracpass)
            + ' WHERE USERID = ' + QuotedStr(DM1.wUsuario);
         DM1.DCOM1.AppServer.EjecutaSQL(xSql);
         Application.Terminate;
      End;
      If xdiasfaltantes <= 0 Then Application.Terminate;
   End
   Else
      If xdiasfaltantes <= 0 Then Application.Terminate;
End;

procedure TFPrincipal.Bit001Click(Sender: TObject);
Var
   xSQL: String;
   xpassact, xpassnue: String;
   xdiasduracpass: Integer;
Begin
   DM1.cdsUser.Close;
   DM1.cdsUser.DataRequest('SELECT USERID, USERNOM, PASSWORD, FECEXP, OFDESID, CTLFAC, FLGAUT, FECINI_PWD, FECFIN_PWD, DIASEXP_PWD, DIASDURAC_PWD, CTRL_IP FROM TGE006 WHERE USERID=''' + DM1.wUsuario + '''');
   DM1.cdsUser.Open;

   xpassact := DM1.cdsUser.FieldByName('PASSWORD').AsString;
   xdiasduracpass := DM1.cdsUser.FieldByName('DIASDURAC_PWD').AsInteger;

   FCPassw := TFCPassw.Create(Self);
   FCPassw.dbeUsuario.Text := DM1.wUsuario;
   FCPassw.dbeNombre.Text := DM1.cdsUser.FieldByname('USERNOM').AsString;
   FCPassw.dbeUsuario.Text := DM1.wUsuario;
   FCPassw.sPassword := DM1.cdsUser.FieldByname('PASSWORD').AsString;
   FCPassw.sModulo := DM1.wModulo;
   FCPassw.wcdsUsuarios := DM1.cdsUser;
   Try
      FCPassw.ShowModal;
   Finally
      FCPassw.Free;
   End;

   xSQL := 'SELECT PASSWORD FROM TGE006 WHERE USERID = ' + QuotedStr(DM1.wUsuario);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   xpassnue := DM1.cdsQry.FieldByName('PASSWORD').AsString;
   If xpassact <> xpassnue Then
   Begin
      xSql := 'UPDATE TGE006 '
         + 'SET FECINI_PWD = TO_DATE(SYSDATE), '
         + '    FECFIN_PWD = TO_DATE(SYSDATE)+' + IntToStr(xdiasduracpass)
         + ' WHERE USERID = ' + QuotedStr(DM1.wUsuario);
      DM1.DCOM1.AppServer.EjecutaSQL(xSql);
      Application.Terminate;
   End;
End;



procedure TFPrincipal.Bit009Click(Sender: TObject);
begin
   fCalfCtaxCob:= TfCalfCtaxCob.Create(self);
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario)),'TGE006','CTLFAC')='G' Then fCalfCtaxCob.chkNoOficial.Enabled:=True;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit009.Name),'RIE_AUT_USU','IMPRESION')='N' Then
      Begin fCalfCtaxCob.BitResClfCar.Enabled:=False; fCalfCtaxCob.BitConOfi.Enabled:=False; fCalfCtaxCob.BitIntDev.Enabled:=False; End;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit009.Name),'RIE_AUT_USU','GRAFICA')='N' Then
      Begin fCalfCtaxCob.BitGrafico.Enabled:=False; End;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit009.Name),'RIE_AUT_USU','EXPORTA')='N' Then
      Begin fCalfCtaxCob.chk01.Enabled:=False; fCalfCtaxCob.chk02.Enabled:=False; fCalfCtaxCob.chk03.Enabled:=False; fCalfCtaxCob.BitExporta.Enabled:=False; End;
   fCalfCtaxCob.ShowModal;
   fCalfCtaxCob.Free;
end;

procedure TFPrincipal.Bit002Click(Sender: TObject);
begin
   DM1.limpiarTodosCDS();
   fMatDesplaz:= TfMatDesplaz.Create(self);
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit002.Name),'GES_AUT_USU','IMPRESION')='N' Then
      Begin
         fMatDesplaz.BitImpOfi.Enabled:=False;
      End;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit002.Name),'RIE_AUT_USU','GRAFICA')='N' Then
      Begin
          fMatDesplaz.BitGrafico.Enabled:=False;
      End;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit002.Name),'RIE_AUT_USU','EXPORTA')='N' Then
      Begin
          fMatDesplaz.BitExporta.Enabled:=False;
      End;


   fMatDesplaz.ShowModal;
   fMatDesplaz.Free;

end;

procedure TFPrincipal.Bit003Click(Sender: TObject);
begin
   fSaldosVen:= TfSaldosVen.Create(self);
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit003.Name),'GES_AUT_USU','IMPRESION')='N' Then
      Begin
      End;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit003.Name),'RIE_AUT_USU','GRAFICA')='N' Then
      Begin
          fSaldosVen.BitGrafico.Enabled:=False;
          fSaldosVen.BitImpOfi.Enabled:=False;
      End;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit003.Name),'RIE_AUT_USU','EXPORTA')='N' Then
      Begin
          fSaldosVen.BitExporta.Enabled:=False;
      End;

   fSaldosVen.ShowModal;
   fSaldosVen.Free;
end;

procedure TFPrincipal.Bit004Click(Sender: TObject);
begin
   fIndGestion:= TfIndGestion.Create(self);
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit004.Name),'RIE_AUT_USU','IMPRESION')='N' Then
      Begin
      End;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit004.Name),'RIE_AUT_USU','GRAFICA')='N' Then
      Begin
          fIndGestion.BitGrafico.Enabled:=False;
      End;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit004.Name),'RIE_AUT_USU','EXPORTA')='N' Then
      Begin
          fIndGestion.BitExporta.Enabled:=False;
      End;
   fIndGestion.ShowModal;
   fIndGestion.Free;
end;

procedure TFPrincipal.Bit005Click(Sender: TObject);
begin
   fAnalisisdeCosechas:= TfAnalisisdeCosechas.Create(self);
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit005.Name),'RIE_AUT_USU','IMPRESION')='N' Then
      Begin
      End;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit005.Name),'RIE_AUT_USU','GRAFICA')='N' Then
      Begin
          fAnalisisdeCosechas.BitGrafico.Enabled:=False;
      End;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit005.Name),'RIE_AUT_USU','EXPORTA')='N' Then
      Begin
          fAnalisisdeCosechas.BitExporta.Enabled:=False;
      End;

   fAnalisisdeCosechas.ShowModal;
   fAnalisisdeCosechas.Free;
end;

procedure TFPrincipal.Bit008Click(Sender: TObject);
begin
   FListaReportesGraficos:=TFListaReportesGraficos.create(self);
   try
      FListaReportesGraficos.showmodal;
   finally
      FListaReportesGraficos.free;
   end;

end;

procedure TFPrincipal.BitSalirClick(Sender: TObject);
begin
 Close;
end;

procedure TFPrincipal.Bit006Click(Sender: TObject);
begin
   fTabControl:=TfTabControl.create(self);
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit006.Name),'RIE_AUT_USU','IMPRESION')='N' Then
      Begin
         fTabControl.BitImprimir.Enabled:=False;
         fTabControl.BitPrint.Enabled:=False;
      End;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit006.Name),'RIE_AUT_USU','GRAFICA')='N' Then
      Begin
      End;
   If DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario))+' AND COMPONENTE='+QuotedStr(Bit006.Name),'RIE_AUT_USU','EXPORTA')='N' Then
      Begin
      End;
   try
      fTabControl.showmodal;
   finally
      fTabControl.free;
   end;

end;

procedure TFPrincipal.Bit000Click(Sender: TObject);
begin
  fCtrlAutorizacionAcceso:= TfCtrlAutorizacionAcceso.Create(self);
  fCtrlAutorizacionAcceso.ShowModal;
  fCtrlAutorizacionAcceso.Free;

end;

// Inicio HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
procedure TFPrincipal.Bit010Click(Sender: TObject);
begin
  FValidacionBDC:= TFValidacionBDC.Create(self);
  FValidacionBDC.ShowModal;
  FValidacionBDC.Free;
end;
// Fin HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC


// Inicio: HPC_201801_RSG
// Activa la nueva for de Reporte de Sustento Contable
procedure TFPrincipal.Bit011Click(Sender: TObject);
begin
   FReportesContables:=TFReportesContables.create(self);
   Try
      FReportesContables.showmodal;
   Finally
      FReportesContables.free;
   End;
end;
// Fin: HPC_201801_RSG

Initialization
  registerclasses([TLabel, TBevel, TppLabel]);

end.
