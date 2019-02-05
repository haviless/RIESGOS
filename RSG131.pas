// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FValidarBDC
// Fecha de Creación :13/11/2017
// Autor : Equipo de Sistemas
// Objetivo : Cargar y Validar archivos BDCs
// HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC

// Inicio HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
unit RSG131;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, Mask, wwdbedit, Wwdbspin, Buttons, Wwdotdot,
  Wwdbcomb, wwdblook, Grids, Wwdbigrd, Wwdbgrid;

type
  TFValidarBDC = class(TForm)
    gbDriver: TGroupBox;
    Label2: TLabel;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    dbeNomArc: TwwDBEdit;
    btnSalir: TBitBtn;
    GroupBox1: TGroupBox;
    grbParametros: TGroupBox;
    lblNomMes: TLabel;
    dbsAnoIni: TwwDBSpinEdit;
    dbsMesIni: TwwDBSpinEdit;
    Label3: TLabel;
    cbBDC: TwwDBLookupCombo;
    btnAgregar: TBitBtn;
    griddet: TwwDBGrid;
    EditArchivo: TEdit;
    Label1: TLabel;
    lbltotal: TLabel;
    btnValidar: TBitBtn;
    btnEliminar: TBitBtn;
    procedure FileListBox1Click(Sender: TObject);
    procedure dbsMesIniChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
  private
    { Private declarations }
    SKCR,PCI,KVI,KRF,KVE:double;
    MCUO:double;
    PERIODO:String;
    CANTREG,CANDEU,NROCRE:Integer;
    function validarBDC01(S:String):Boolean;
    function validarBDC02A(S:String):Boolean;
    procedure validarBDC(Origen:String;codigoBDC:Integer);
    procedure grabar(estado:String);
  public
    { Public declarations }
  end;

var
  FValidarBDC: TFValidarBDC;

implementation

uses RSGDM1, RSG130;

{$R *.dfm}

procedure TFValidarBDC.FileListBox1Click(Sender: TObject);
begin
dbeNomArc.Text := FileListbox1.FileName;
EditArchivo.Text:= extractFileName(FileListbox1.FileName);
end;

procedure TFValidarBDC.dbsMesIniChange(Sender: TObject);
begin
   lblNomMes.Caption:=DM1.DesMes(StrToInt(dbsMesIni.Text),'N');
end;

procedure TFValidarBDC.FormCreate(Sender: TObject);
var xSQL:String;
begin
  dbsAnoIni.Text :=  Copy(DateToStr(DM1.FechaSys),7,4);
  dbsMesIni.Text :=  Copy(DateToStr(DM1.FechaSys),4,2);

  xSQL:='SELECT CODBDC,DESBDC,CODEST FROM RSG_TIP_BDC WHERE CODEST=1 ORDER BY DESBDC';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSQL);
  DM1.cdsQry.Open;
  If DM1.cdsQry.RecordCount>0 Then
  Begin
    cbBDC.LookupField:='DESBDC';
    cbBDC.LookupTable:= DM1.cdsQry;
  End;


   xSql := 'SELECT CODPER,CODBDC,NOMARC,SKCR,PCI,KVI,KRF,KVE,MCUO,RUTARC,TOTREG,CANDEU,NROCRE FROM RSG_DET_VAL WHERE CODPER=''XXXXXXX'' ';
   DM1.cdsQry1.Close;
   DM1.cdsQry1.DataRequest(xSql);
   DM1.cdsQry1.Open;
   griddet.DataSource := DM1.dsQry1;
   With griddet Do
   Begin
      Selected.Clear;
      Selected.Add('CODPER'#9'10'#9'PERIODO');
      Selected.Add('NOMARC'#9'10'#9'ARCHIVO');
      Selected.Add('SKCR'#9'20'#9'SKCR');
      Selected.Add('PCI'#9'20'#9'PCI');
      Selected.Add('PCI'#9'20'#9'PCI');
      Selected.Add('KVI'#9'20'#9'KVI');
      Selected.Add('KRF'#9'20'#9'KRF');
      Selected.Add('KVE'#9'20'#9'KRF');
      Selected.Add('MCUO'#9'20'#9'MCUO');
      ApplySelected;
  End;

end;

function TFValidarBDC.validarBDC01(S:String):Boolean;
  var
  List: TStrings;
  SKCR_S,PCI_S,KVI_S,KRF_S,KVE_S:String;
begin
  List := TStringList.Create;
  try
    ExtractStrings([','], [], PChar(S), List);
    IF List.Count<23 Then
    Begin
      Result:=false;
      exit;
    End;

    SKCR_S:=List[8];
    SKCR_S:=stringreplace(SKCR_S, '"', '',[rfReplaceAll, rfIgnoreCase]);
    if SKCR_S<>'SKCR' Then
    Begin
      Result:=false;
      exit;
    End;

    PCI_S:=List[15];
    PCI_S:=stringreplace(PCI_S, '"', '',[rfReplaceAll, rfIgnoreCase]);
    if PCI_S<>'PCI' Then
    Begin
      Result:=false;
      exit;
    End;

    KVI_S:=List[16];
    KVI_S:=stringreplace(KVI_S, '"', '',[rfReplaceAll, rfIgnoreCase]);
    if KVI_S<>'KVI' Then
    Begin
      Result:=false;
      exit;
    End;

    KRF_S:=List[20];
    KRF_S:=stringreplace(KRF_S, '"', '',[rfReplaceAll, rfIgnoreCase]);
    if KRF_S<>'KRF' Then
    Begin
      Result:=false;
      exit;
    End;

    KVE_S:=List[22];
    KVE_S:=stringreplace(KVE_S, '"', '',[rfReplaceAll, rfIgnoreCase]);
    if KVE_S<>'KVE' Then
    Begin
      Result:=false;
      exit;
    End;

  finally
    List.Free;
  end;
  Result:=true;
End;
function TFValidarBDC.validarBDC02A(S:String):Boolean;
  var
  List: TStrings;
  MCUO_S:String;
begin
  List := TStringList.Create;
  try
    ExtractStrings([','], [], PChar(S), List);
    IF List.Count<5 Then
    Begin
      Result:=false;
      exit;
    End;

    MCUO_S:=List[5];
    MCUO_S:=stringreplace(MCUO_S, '"', '',[rfReplaceAll, rfIgnoreCase]);
    if MCUO_S<>'MCUO' Then
    Begin
      Result:=false;
      exit;
    End;

  finally
    List.Free;
  end;
  Result:=true;
End;

procedure TFValidarBDC.validarBDC(Origen:String;codigoBDC:Integer);
var Archivo: TextFile;
    S:String;
    SKCR_S,PCI_S,KVI_S,KRF_S,KVE_S:String;
    MCUO_S:String;
    secuencia,xDeudor:Integer;
    List: TStrings;
    CCL,CCR:String;
    xSQL:String;
    fileName:String;
Begin
  fileName:=extractFileName(Origen);
  assignfile(Archivo,Origen);
  Reset(Archivo);
  Readln(Archivo, S);
   If Not EoF(Archivo) Then
   Begin
     if (codigoBDC=1) and (validarBDC01(S)=false) Then
     begin
        lbltotal.Caption:= inttostr(CANTREG);
        lbltotal.Refresh;
        Screen.Cursor := crDefault;
        MessageDlg('El formato del archivo es incorrecto', mterror, [mbOk], 0);
        exit;
     End;
     if (codigoBDC=2) and (validarBDC02A(S)=false) Then
     begin
        lbltotal.Caption:= inttostr(CANTREG);
        lbltotal.Refresh;
        Screen.Cursor := crDefault;
        MessageDlg('El formato del archivo es incorrecto', mterror, [mbOk], 0);
        exit;
     End;
   End;

  SKCR:=0;PCI:=0;KVI:=0;KRF:=0;KVE:=0;MCUO:=0;
  CANTREG:=0;CANDEU:=0;NROCRE:=0;
  CCL:='';CCR:='';
  secuencia:=0;
  {i:=0;}
  While Not EoF(Archivo) do
   Begin
      Readln(archivo, S);
      S:=Trim(S);
      List := TStringList.Create;
      try
        secuencia:=secuencia+1;
        If secuencia=10000 Then {2100}
        Begin
          lbltotal.Caption:= fileName+'->'+ inttostr(CANTREG);
          lbltotal.Refresh;
          secuencia:=0;
        End;

        ExtractStrings([','],[],Pchar(S),List);

        If (codigoBDC=1 )and (List.Count>=22) Then
        Begin
          CANTREG:=CANTREG+1;
          IF CCL<> stringreplace(List[0], '"', '',[rfReplaceAll, rfIgnoreCase]) Then
          Begin
            CANDEU:=CANDEU+1;
          End;
          IF CCR<> stringreplace(List[5], '"', '',[rfReplaceAll, rfIgnoreCase]) Then
          Begin
            NROCRE:=NROCRE+1;
          End;
          CCL:=stringreplace(List[0], '"', '',[rfReplaceAll, rfIgnoreCase]);
          CCR:=stringreplace(List[5], '"', '',[rfReplaceAll, rfIgnoreCase]);

          SKCR_S:=List[8];
          SKCR_S:=stringreplace(SKCR_S, '"', '',[rfReplaceAll, rfIgnoreCase]);
          if SKCR_S<>'' Then SKCR:=SKCR+StrToFloat(SKCR_S);

          PCI_S:=List[15];
          PCI_S:=stringreplace(PCI_S, '"', '',[rfReplaceAll, rfIgnoreCase]);
          if PCI_S<>'' then PCI:=PCI+StrToFloat(PCI_S);

          KVI_S:=List[16];
          KVI_S:=stringreplace(KVI_S, '"', '',[rfReplaceAll, rfIgnoreCase]);
          if KVI_S<>'' then KVI:=KVI+StrToFloat(KVI_S);

          KRF_S:=List[20];
          KRF_S:=stringreplace(KRF_S, '"', '',[rfReplaceAll, rfIgnoreCase]);
          if KRF_S<>'' then KRF:=KRF+StrToFloat(KRF_S);

          KVE_S:=List[22];
          KVE_S:=stringreplace(KVE_S, '"', '',[rfReplaceAll, rfIgnoreCase]);
          if KVE_S<>'' then KVE:=KVE+StrToFloat(KVE_S);
        End;

        If (codigoBDC=2 )and (List.Count>=5) Then
        Begin
          CANTREG:=CANTREG+1;
          IF CCL<> stringreplace(List[0], '"', '',[rfReplaceAll, rfIgnoreCase]) Then
          Begin
            CANDEU:=CANDEU+1;
          End;
          IF CCR<> stringreplace(List[1], '"', '',[rfReplaceAll, rfIgnoreCase]) Then
          Begin
            NROCRE:=NROCRE+1;
          End;
          CCL:= stringreplace(List[0], '"', '',[rfReplaceAll, rfIgnoreCase]);
          CCR:= stringreplace(List[1], '"', '',[rfReplaceAll, rfIgnoreCase]);
          If stringreplace(List[10], '"', '',[rfReplaceAll, rfIgnoreCase])='00/00/0000' Then
          Begin
            MCUO_S:=List[5];
            MCUO_S:=stringreplace(MCUO_S, '"', '',[rfReplaceAll, rfIgnoreCase]);
            if MCUO_S<>'' Then MCUO:=MCUO+StrToFloat(MCUO_S);
          End;
        End;

      finally
        List.Free;
      end;
   End;

   lbltotal.Caption:= fileName+'->'+ inttostr(CANTREG);;
   lbltotal.Refresh;

End;

procedure TFValidarBDC.btnValidarClick(Sender: TObject);
var xSql : String;
    codigoBDC:Integer;
    Origen:String;
    qBDC01,qBDC02A:Boolean;
    total_deudores_bdc01,total_creditos_bdc01:Integer;
    total_deudores_bdc02a,total_creditos_bdc02a:Integer;
    SKCR_BDC01:String;
    MCUO_BDC02A:String;
    PCI_BDC01,KVI_BDC01,KRF_BDC01,KVE_BDC01:String;
    estado:String;
    anio,mes:String;
begin
   IF DM1.cdsQry1.RecordCount=0 Then
   Begin
    MessageDlg('Agrege archivos para validar', mterror, [mbOk], 0);
    Exit;
   End;
   qBDC01:=false;
   qBDC02A:=false;
   With DM1.cdsQry1 Do
   Begin
    ControlsDisabled;
    First;
    While Not Eof Do
    Begin
      if FieldByName('CODBDC').AsInteger=1 Then qBDC01:=true;
      if FieldByName('CODBDC').AsInteger=2 Then qBDC02A:=true;
      Next;
    End;
    First;
    EnableControls;
   End;
   If qBDC01 or qBDC02A Then
   Begin
     If not qBDC01 then
     Begin
      MessageDlg('Falta agregar el archivo BDC01', mterror, [mbOk], 0);
      Exit;
     End;
     if not qBDC02A then
     Begin
      MessageDlg('Falta agregar el archivo BDC02A', mterror, [mbOk], 0);
      Exit;
     End;
   End;

   xSQl:='SELECT CODSEC FROM RSG_CAB_VAL WHERE CODPER='+QuotedStr(PERIODO)+' AND CODEST IN(1,2)';
   DM1.cdsQry3.Close;
   DM1.cdsQry3.DataRequest(xSQL);
   DM1.cdsQry3.Open;
   IF DM1.cdsQry3.RecordCount>0 THEN
   Begin
      MessageDlg('Existe un registro observado o aprobado,por favor de verificar', mterror, [mbOk], 0);
      Exit;
   End;

   Screen.Cursor := crHourglass;

   With DM1.cdsQry1 Do
   Begin
    ControlsDisabled;
    First;
    While Not Eof Do
    Begin
      codigoBDC:=FieldByName('CODBDC').AsInteger;
      Origen:=FieldByName('RUTARC').AsString;
      validarBDC(Origen,codigoBDC);
      If codigoBDC=1 Then
      Begin
        Edit;
        FieldByName('SKCR').AsString:= FormatFloat('0.00',SKCR);
        FieldByName('PCI').AsString:= FormatFloat('0.0000',PCI);
        FieldByName('KVI').AsString:= FormatFloat('0.00',KVI);
        FieldByName('KRF').AsString:= FormatFloat('0.00',KRF);
        FieldByName('KVE').AsString:= FormatFloat('0.00',KVE);
        FieldByName('NROCRE').AsString:= IntToStr(NROCRE);
        FieldByName('CANDEU').AsString:= IntToStr(CANDEU);
        FieldByName('TOTREG').AsString:= IntToStr(CANTREG);
        Post;
        total_deudores_bdc01:=CANDEU;
        total_creditos_bdc01:=NROCRE;
        SKCR_BDC01:=FormatFloat('0.00',SKCR);
      End;
      If codigoBDC=2 Then
      Begin
        Edit;
        FieldByName('MCUO').AsString:= FormatFloat('0.00',MCUO);
        FieldByName('NROCRE').AsString:= IntToStr(NROCRE);
        FieldByName('CANDEU').AsString:= IntToStr(CANDEU);
        FieldByName('TOTREG').AsString:= IntToStr(CANTREG);
        Post;
        total_deudores_bdc02a:=CANDEU;
        total_creditos_bdc02a:=NROCRE;
        MCUO_BDC02A:=FormatFloat('0.00',MCUO);
      End;

      Next;
    End;
    First;
    EnableControls;
   End;
   If qBDC01 or qBDC02A Then
   Begin
     IF (total_deudores_bdc01 < total_deudores_bdc02a) or (total_creditos_bdc01 < total_creditos_bdc02a) Then
     Begin
      MessageDlg('Los archivos no se encuentran ordenados', mterror, [mbOk], 0);
      Screen.Cursor := crDefault;
      Exit;
     End;
     IF (total_deudores_bdc01 > total_deudores_bdc02a) or (total_creditos_bdc01 > total_creditos_bdc02a)Then
     Begin
      MessageDlg('El número de deudores de BDC01 es menor al número de deudores del BDC02A', mterror, [mbOk], 0);
      Screen.Cursor := crDefault;
      Exit;
     End;
     estado:='1';
     If SKCR_BDC01<>MCUO_BDC02A Then
     Begin
       estado:='2';
     End;
     mes:= COPY(PERIODO,5,2);
     anio:= COPY(PERIODO,1,4);
     xSql := 'SELECT ''SALDOS'' SALDOS,SUM(CASE WHEN CUENTAID =''1710103'' THEN SALDMN'+mes+' ELSE 0 END) CTA1710103,'+
    'SUM(CASE WHEN CUENTAID =''1710503'' THEN SALDMN'+mes+' ELSE 0 END) CTA1710503,'+
    'SUM(CASE WHEN CUENTAID =''1710403'' THEN SALDMN'+mes+' ELSE 0END) CTA1710403,'+
    'abs(SUM(CASE WHEN CUENTAID =''196'' THEN SALDMN'+mes+' ELSE 0 END)) CTA196,'+
    ' '' '' CTA1,'' '' CTA2,'' '' CTA3,'' '' CTA4 '+
    'FROM CNT401 WHERE CIAID=''01'' AND ANO='+quotedstr(anio)+'  AND CUENTAID IN (''1710103'',''1710503'',''1710403'',''196'') AND TIPREG=''1'' ';
    DM1.cdsQry4.Close;
    DM1.cdsQry4.DataRequest(xSql);
    DM1.cdsQry4.Open;
    IF ((PCI_BDC01<> DM1.cdsQry4.FieldByName('CTA196').AsString) OR
    ( KVI_BDC01<> DM1.cdsQry4.FieldByName('CTA1710103').AsString) OR
    ( KVE_BDC01<> DM1.cdsQry4.FieldByName('CTA1710503').AsString) OR
    ( KRF_BDC01<> DM1.cdsQry4.FieldByName('CTA1710403').AsString) ) Then
    Begin
      estado:='2';
    End;

   End;
   grabar(estado);
   FValidacionBDC.cargarGrilla;
   Screen.Cursor := crDefault;

end;

procedure TFValidarBDC.btnSalirClick(Sender: TObject);
begin
   close
end;

procedure TFValidarBDC.btnAgregarClick(Sender: TObject);
var xSql,xExiste,S:String;
 Archivo: TextFile;
 codigoBDC:Integer;
 validPeridos:Boolean;
begin

  If trim(dbeNomArc.Text)='' Then
  Begin
    MessageDlg('Seleccione Archivo', mtinformation, [mbOk], 0);
    Exit;
  End;

  If not ((UpperCase(trim(EditArchivo.Text))='BDC01.CSV') OR
     (UpperCase(trim(EditArchivo.Text))='BDC02A.CSV') OR
     (UpperCase(trim(EditArchivo.Text))='BDC02B.CSV') OR
     (UpperCase(trim(EditArchivo.Text))='BDC_SC.CSV') OR
     (UpperCase(trim(EditArchivo.Text))='BDC04.CSV') )
  Then
  Begin
    MessageDlg('No es un archivo válido', mtinformation, [mbOk], 0);
    Exit;
  End;

  If cbBDC.Text='' Then
  Begin
     MessageDlg('Seleccione BDC ha validar', mtinformation, [mbOk], 0);
     Exit;
  End;

  codigoBDC:=DM1.cdsQry.FieldByName('CODBDC').AsInteger;
  assignfile(Archivo,dbeNomArc.Text);
  Reset(Archivo);
  Readln(Archivo, S);
  if Not EoF(Archivo) Then
  Begin
   if (codigoBDC=1) and (validarBDC01(S)=false) Then
   begin
      lbltotal.Caption:= '0';
      MessageDlg('El formato del archivo es incorrecto', mterror, [mbOk], 0);
      exit;
   End;
   if (codigoBDC=2) and (validarBDC02A(S)=false) Then
   begin
      lbltotal.Caption:= '0';
      MessageDlg('El formato del archivo es incorrecto', mterror, [mbOk], 0);
      exit;
   End;
  End;

  xExiste:='';
  validPeridos:=false;
  With DM1.cdsQry1 Do
  Begin
   ControlsDisabled;
   First;
   While Not Eof Do
   Begin
      IF FieldByName('NOMARC').AsString=trim(EditArchivo.Text) Then
      begin
        xExiste:='1';
      End;
      If FieldByName('CODPER').AsString<>(dbsAnoIni.Text+DM1.STRZERO(dbsMesIni.Text,2)) Then
      Begin
         validPeridos:=true;
      End;
      PERIODO:=FieldByName('CODPER').AsString;
      Next;
    End;
    First;
    EnableControls;
  End;
  IF xExiste='1' Then
  Begin
     MessageDlg('Archivo ya se encuentra agregado', mtInformation, [mbOk], 0);
     Exit;
  End;
  IF validPeridos Then
  Begin
     MessageDlg('El periodo es incorrecto', mtInformation, [mbOk], 0);
     Exit;
  End;
  DM1.cdsQry1.Insert;
  DM1.cdsQry1.FieldByName('CODPER').AsString:= dbsAnoIni.Text+DM1.STRZERO(dbsMesIni.Text,2);
  DM1.cdsQry1.FieldByName('CODBDC').AsString:= DM1.cdsQry.FieldByName('CODBDC').AsString;
  DM1.cdsQry1.FieldByName('NOMARC').AsString:= EditArchivo.Text;
  DM1.cdsQry1.FieldByName('RUTARC').AsString:= dbeNomArc.Text;
  DM1.cdsQry1.Post;
  dbeNomArc.Text:='';
  EditArchivo.Text:='';
end;

procedure TFValidarBDC.btnEliminarClick(Sender: TObject);
var Boton:Integer;
begin
   If DM1.cdsQry1.RecordCount =0 Then exit;
   Boton := Application.MessageBox ('¿Seguro de eliminar registro?','Aviso',MB_YESNO+MB_ICONQUESTION);
   If Boton = ID_YES Then
   Begin
    DM1.cdsQry1.Delete;
   End;
end;

procedure TFValidarBDC.grabar(estado:String);
var Boton:Integer;
SKCR_S,PCI_S,KVI_S,KRF_S,KVE_S,MCUO_S,TOTREG_S,CANDEU_S,NROCRE_S:String;
xSQL:String;
CODSEC:Integer;
begin
    DM1.DCOM1.AppServer.SOLStartTransaction;
    Try
    xSQl:='SELECT NVL(MAX(CODSEC),0)+1  CODSEC FROM RSG_CAB_VAL';
    DM1.cdsQry3.Close;
    DM1.cdsQry3.DataRequest(xSQL);
    DM1.cdsQry3.Open;
    CODSEC:=DM1.cdsQry3.FieldByName('CODSEC').AsInteger;

    xSQL:='INSERT INTO RSG_CAB_VAL(CODSEC,CODPER,FECREG,USUREG,CODEST) VALUES('+inttostr(CODSEC)+','+QuotedStr(PERIODO)+',SYSDATE,'+quotedstr(DM1.wUsuario)+','+estado+')';
    DM1.DCOM1.AppServer.EjecutaSql(xSQL);

    With DM1.cdsQry1 Do
    Begin
     ControlsDisabled;
     First;
     While Not Eof Do
     Begin
        SKCR_S:=FieldByName('SKCR').AsString;
        If trim(SKCR_S)='' Then SKCR_S:='NULL';

        PCI_S:=FieldByName('PCI').AsString;
        If trim(PCI_S)='' Then PCI_S:='NULL';

        KVI_S:=FieldByName('KVI').AsString;
        If trim(KVI_S)='' Then KVI_S:='NULL';

        KRF_S:=FieldByName('KRF').AsString;
        If trim(KRF_S)='' Then KRF_S:='NULL';

        KVE_S:=FieldByName('KVE').AsString;
        If trim(KVE_S)='' Then KVE_S:='NULL';

        MCUO_S:=FieldByName('MCUO').AsString;
        If trim(MCUO_S)='' Then MCUO_S:='NULL';

        TOTREG_S:=FieldByName('TOTREG').AsString;
        If trim(TOTREG_S)='' Then TOTREG_S:='NULL';

        CANDEU_S:=FieldByName('CANDEU').AsString;
        If trim(CANDEU_S)='' Then CANDEU_S:='NULL';

        NROCRE_S:=FieldByName('NROCRE').AsString;
        If trim(NROCRE_S)='' Then NROCRE_S:='NULL';

        xSQL:='INSERT INTO RSG_DET_VAL(CODSEC,CODPER,CODBDC,NOMARC,SKCR,PCI,KVI,KRF,KVE,MCUO,FECREG,USUREG,RUTARC,CODEST,TOTREG,CANDEU,NROCRE) VALUES('
        +inttostr(CODSEC)+','
        +quotedstr(FieldByName('CODPER').AsString)+','
        +FieldByName('CODBDC').AsString+','
        +quotedstr(FieldByName('NOMARC').AsString)+','
        +SKCR_S+','
        +PCI_S+','
        +KVI_S+','
        +KRF_S+','
        +KVE_S+','
        +MCUO_S+','
        +'SYSDATE,'
        +quotedstr(DM1.wUsuario)+','
        +quotedstr(FieldByName('RUTARC').AsString)+','
        +'1,'
        +TOTREG_S+','
        +CANDEU_S+','
        +NROCRE_S
        +')';
        DM1.DCOM1.AppServer.EjecutaSql(xSQL);
        Next;
      End;
      First;
      EnableControls;
    End;

    DM1.DCOM1.AppServer.SOLCommit;
    If estado='2' Then
    Begin
      MessageDlg('Se ha grabado la información con observaciones', mtInformation, [mbOk], 0);
    End
    Else
    Begin
      MessageDlg('Se ha grabado la información correctamente', mtInformation, [mbOk], 0);
    End;

    Except
      DM1.DCOM1.AppServer.SOLRollBack;
    End;
end;
// Fin HPC_201703_RSG : IMPLEMENTACIÓN DE OPCIÓN CONTROL BDC
end.
