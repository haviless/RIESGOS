// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : DM1
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Modulo de Datos
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG
// HPC_201801_RSG : Se modifca el procedimiento para exportar a excel

unit RSGDM1;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, MConnect, Wwdatsrc, wwclient, Provider,comctrls,
  StdCtrls, wwdblook, ExtCtrls, Mask, wwdbedit, IniFiles, Buttons, Wwdbdlg,
  wwdbdatetimepicker, DBCtrls, wwSpeedButton, wwDBNavigator, Grids,
  Wwdbigrd, Wwdbgrid, dbiProcs, Wwdotdot, Wwdbcomb,
  variants, RecError, Menus, Math, Excel2000, OleServer, DBGrids,
  ExcelXP,  DBTables,    shellapi,   ToolWin,
  clipbrd,wwExport, ImgList, wwclearbuttongroup, wwradiogroup, wwcheckbox,
   Wwquery, ppCtrls, ppBands, ppVar, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  Spin,  Wwdbspin, SConnect,

   Sockets,
   jpeg, winsock
  ;


type
  TDM1 = class(TDataModule)
    DCOM1: TSocketConnection;
    cdsUsuarios: TwwClientDataSet;
    dsUsuarios: TwwDataSource;
    cdsGrupos: TwwClientDataSet;
    dsGrupos: TwwDataSource;
    cdsMGrupo: TwwClientDataSet;
    dsMGrupo: TwwDataSource;
    cdsAcceso: TwwClientDataSet;
    dsAcceso: TwwDataSource;
    cdsDLabo: TwwClientDataSet;
    dsDLabo: TwwDataSource;
    cdsDFam: TwwClientDataSet;
    dsDFam: TwwDataSource;
    cdsEjecuta: TwwClientDataSet;
    dsEjecuta: TwwDataSource;
    cdsAso: TwwClientDataSet;
    dsAso: TwwDataSource;
    cdsCtasBco: TwwClientDataSet;
    dsCtasBco: TwwDataSource;
    cdsResol: TwwClientDataSet;
    dsResol: TwwDataSource;
    cdsDSocioE: TwwClientDataSet;
    dsDSocioE: TwwDataSource;
    cdsUSES: TwwClientDataSet;
    dsUSES: TwwDataSource;
    cdsUPro: TwwClientDataSet;
    dsUPro: TwwDataSource;
    cdsUPago: TwwClientDataSet;
    dsUPago: TwwDataSource;
    cdsTResol: TwwClientDataSet;
    dsTResol: TwwDataSource;
    cdsTPension: TwwClientDataSet;
    dsTPension: TwwDataSource;
    cdsTAso: TwwClientDataSet;
    dsTAso: TwwDataSource;
    cdsSAso: TwwClientDataSet;
    dsSAso: TwwDataSource;
    cdsCEdu: TwwClientDataSet;
    dsCEdu: TwwDataSource;
    cdsCAso: TwwClientDataSet;
    dsCAso: TwwDataSource;
    cdsTUSE: TwwClientDataSet;
    dsTUSE: TwwDataSource;
    cdsOfDes: TwwClientDataSet;
    dsOfDes: TwwDataSource;
    cdsCViv: TwwClientDataSet;
    dsCViv: TwwDataSource;
    cdsQry: TwwClientDataSet;
    dsQry: TwwDataSource;
    cdsDpto: TwwClientDataSet;
    cdsTVia: TwwClientDataSet;
    cdsDist: TwwClientDataSet;
    cdsTZona: TwwClientDataSet;
    cdsTDoc: TwwClientDataSet;
    cdsUbigeo: TwwClientDataSet;
    cdsProvin: TwwClientDataSet;
    cdsEstCiv: TwwClientDataSet;
    cdsBcos: TwwClientDataSet;
    dsTDoc: TwwDataSource;
    dsEstCiv: TwwDataSource;
    dsUbigeo: TwwDataSource;
    dsProvin: TwwDataSource;
    dsDpto: TwwDataSource;
    dsBcos: TwwDataSource;
    dsTVia: TwwDataSource;
    dsDist: TwwDataSource;
    dsTZona: TwwDataSource;
    cdsPais: TwwClientDataSet;
    dsPais: TwwDataSource;
    cdsGradoI: TwwClientDataSet;
    dsGradoI: TwwDataSource;
    cdsGradoA: TwwClientDataSet;
    dsGradoA: TwwDataSource;
    cdsProf: TwwClientDataSet;
    dsProf: TwwDataSource;
    cdsTRela: TwwClientDataSet;
    cdsCtasAso: TwwClientDataSet;
    dsCtasAso: TwwDataSource;
    cdsAportes: TwwClientDataSet;
    dsAportes: TwwDataSource;
    cdsSexo: TwwClientDataSet;
    dsSexo: TwwDataSource;
    cdsLugNac: TwwClientDataSet;
    dsLugNac: TwwDataSource;
    cdsTViaTIPVIADES: TStringField;
    cdsTViaTIPVIAID: TStringField;
    cdsTMoneda: TwwClientDataSet;
    cdsRepresentante: TwwClientDataSet;
    cdsCuentas: TwwClientDataSet;
    dsCuentas: TwwDataSource;
    dsTMoneda: TwwDataSource;
    dsRepresentante: TwwDataSource;
    cdsFPago: TwwClientDataSet;
    dsFPago: TwwDataSource;
    cdsDetRegCob: TwwClientDataSet;
    dsDetRegCob: TwwDataSource;
    cdsRegCob: TwwClientDataSet;
    cdsSitRepr: TwwClientDataSet;
    cdsFRepr: TwwClientDataSet;
    dsSitRepr: TwwDataSource;
    dsFRepr: TwwDataSource;
    cdsRepresentante1: TwwClientDataSet;
    dsRepresentante1: TwwDataSource;
    cdsSitCta: TwwClientDataSet;
    dsSitCta: TwwDataSource;
    cdsFormaPago: TwwClientDataSet;
    dsFormaPago: TwwDataSource;
    cdsModelo: TwwClientDataSet;
    cdsPlantilla: TwwClientDataSet;
    cdsPlanDet: TwwClientDataSet;
    dsModelo: TwwDataSource;
    dsPlantilla: TwwDataSource;
    dsPlandet: TwwDataSource;
    cdsDetalle: TwwClientDataSet;
    dsDetalle: TwwDataSource;
    cdsCambios: TwwClientDataSet;
    dsCambios: TwwDataSource;
    tbOrigen: TwwClientDataSet;
    ds1: TwwDataSource;
    cdsEstado: TwwClientDataSet;
    dsEstado: TwwDataSource;
    cdsConvenio: TwwClientDataSet;
    dsConvenio: TwwDataSource;
    cdsCuotas: TwwClientDataSet;
    dsCuotas: TwwDataSource;
    cdsDcuotas: TwwClientDataSet;
    dsDcuotas: TwwDataSource;
    cdsCredito: TwwClientDataSet;
    dsCredito: TwwDataSource;
    CdsCBcos: TwwClientDataSet;
    dsCBcos: TwwDataSource;
    cdsReclamo: TwwClientDataSet;
    dsReclamo: TwwDataSource;
    cdsReclamoDCob: TwwClientDataSet;
    dsReclamoDCob: TwwDataSource;
    cdsTransacciones: TwwClientDataSet;
    dstransacciones: TwwDataSource;
    cdsAsociados1: TwwClientDataSet;
    dsAsociados1: TwwDataSource;
    cdsReclamoMotiv: TwwClientDataSet;
    dsReclamoMotiv: TwwDataSource;
    cdsTCredito: TwwClientDataSet;
    dsTcredito: TwwDataSource;
    cdsReclamo1: TwwClientDataSet;
    dsReclamo1: TwwDataSource;
    cdsAsoX: TwwClientDataSet;
    dsAsoX: TwwDataSource;
    cdsAsociados: TwwClientDataSet;
    dsAsociados: TwwDataSource;
    cdsDevolucionCob: TwwClientDataSet;
    cdsTransDevol: TwwClientDataSet;
    cdsAgenciaBco: TwwClientDataSet;
    dsAgenciaBco: TwwDataSource;
    cdsTmone: TwwClientDataSet;
    dsTmone: TwwDataSource;
    cdsTtransaccion: TwwClientDataSet;
    cdsReporte: TwwClientDataSet;
    dsReporte: TwwDataSource;
    cdsATransp: TwwClientDataSet;
    cdsRecauda: TwwClientDataSet;
    cdsLiquid: TwwClientDataSet;
    cdsPersRep: TwwClientDataSet;
    dsATransp: TwwDataSource;
    dsRecauda: TwwDataSource;
    dsLiquid: TwwDataSource;
    dsPersRep: TwwDataSource;
    cdsDetRegGlob: TwwClientDataSet;
    dsDetRegGlob: TwwDataSource;
    cdsQry2: TwwClientDataSet;
    cdsCobxUse: TwwClientDataSet;
    dsCobxUse: TwwDataSource;
    cdsReporte1: TwwClientDataSet;
    dsReporte1: TwwDataSource;
    cdsAutdisk: TwwClientDataSet;
    cdsTransferencia: TwwClientDataSet;
    dsTransferencia: TwwDataSource;
    cdsCtaCtes: TwwClientDataSet;
    cdsPeriodo: TwwClientDataSet;
    dsPeriodo: TwwDataSource;
    cdsBancos: TwwClientDataSet;
    dsBancos: TwwDataSource;
    cdsTRecauda: TwwClientDataSet;
    dsTRecauda: TwwDataSource;
    cdsCuentaEst: TwwClientDataSet;
    dsCuentaEst: TwwDataSource;
    cdsPadre: TwwClientDataSet;
    dsPadre: TwwDataSource;
    cdsHijo: TwwClientDataSet;
    dsHijo: TwwDataSource;
    cdsNieto: TwwClientDataSet;
    dsNieto: TwwDataSource;
    cdsDevolucion: TwwClientDataSet;
    cdsCia: TwwClientDataSet;
    cdsSQL: TwwClientDataSet;
    cdsRTransporte: TwwClientDataSet;
    dsRTransporte: TwwDataSource;
    cdsTransporte: TwwClientDataSet;
    dsTransporte: TwwDataSource;
    cdsRRepresentante: TwwClientDataSet;
    dsRRepresentante: TwwDataSource;
    wwDataSource1: TwwDataSource;
    cdsCCosto: TwwClientDataSet;
    dsCCosto: TwwDataSource;
    cdsBoletaDCob: TwwClientDataSet;
    dsBoletaDCob: TwwDataSource;
    cdsBoletaCob: TwwClientDataSet;
    dsBoletaCob: TwwDataSource;
    cdsconcepto: TwwClientDataSet;
    dsconcepto: TwwDataSource;
    cdsTipBoleta: TwwClientDataSet;
    dsTipBoleta: TwwDataSource;
    cdsReprCtaCte: TwwClientDataSet;
    dsReprCtaCte: TwwDataSource;
    cdssitreclamo: TwwClientDataSet;
    dssitreclamo: TwwDataSource;
    cdsQry3: TwwClientDataSet;
    cdsQry4: TwwClientDataSet;
    dsQry3: TwwDataSource;
    dsQry4: TwwDataSource;
    cdsQry1: TwwClientDataSet;
    cdsSolicitudes: TwwClientDataSet;
    dsSolicitudes: TwwDataSource;
    cdsListaCred: TwwClientDataSet;
    dsListaCred: TwwDataSource;
    cdsSolicitudA: TwwClientDataSet;
    cdsSolicitud: TwwClientDataSet;
    cdsConcre: TwwClientDataSet;
    dsConcre: TwwDataSource;
    cdsListaCreA: TwwClientDataSet;
    dsListaCreA: TwwDataSource;
    cdsTipCreA: TwwClientDataSet;
    dsTipCreA: TwwDataSource;
    cdsRelCapCuo: TwwClientDataSet;
    dsRelCapCuo: TwwDataSource;
    cdsCompromiso: TwwClientDataSet;
    dsCompromiso: TwwDataSource;
    cdsConsulta: TwwClientDataSet;
    dsConsulta: TwwDataSource;
    cdsParam: TwwClientDataSet;
    dsParam: TwwDataSource;
    cdsCob336: TwwClientDataSet;
    dsCob336: TwwDataSource;
    cdsSobrino: TwwClientDataSet;
    dsSobrino: TwwDataSource;
    cdsQry5: TwwClientDataSet;
    dsqry5: TwwDataSource;
    cdsResultSet: TwwClientDataSet;
    cdsMovCre: TwwClientDataSet;
    dsMovCre: TwwDataSource;
    cdsAbonoCuotas: TwwClientDataSet;
    dsAbonoCuotas: TwwDataSource;
    cdsUser: TwwClientDataSet;
    cdsBancoEgr: TwwClientDataSet;
    cdsCCBco: TwwClientDataSet;
    dsCCBco: TwwDataSource;
    cdsFormPago: TwwClientDataSet;
    dsFormPago: TwwDataSource;
    cdsRec: TwwClientDataSet;
    dsRec: TwwDataSource;
    cdsClaseAux: TwwClientDataSet;
    cdsAux: TwwClientDataSet;
    cdsTMon: TwwClientDataSet;
    dsTMon: TwwDataSource;
    cdsProvCta: TwwClientDataSet;
    dsProvCta: TwwDataSource;
    cdsEquiv: TwwClientDataSet;
    dsEquiv: TwwDataSource;
    cdsCnpEgr: TwwClientDataSet;
    dsCnpEgr: TwwDataSource;
    cdsFEfec: TwwClientDataSet;
    cdsMovRec: TwwClientDataSet;
    dsMovRec: TwwDataSource;
    cdsDocPago: TwwClientDataSet;
    dsDocPago: TwwDataSource;
    cdsDetRegCob1: TwwClientDataSet;
    dsDetRegCob1: TwwDataSource;
    dsQry1: TwwDataSource;
    dsTtransaccion: TwwDataSource;
    dsDevolucionCob: TwwDataSource;
    dsTransDevol: TwwDataSource;
    dsQry2: TwwDataSource;
    dsUser: TwwDataSource;
    dsSolicitud: TwwDataSource;
    dsTRela: TwwDataSource;
    dsRegCob: TwwDataSource;
    dsAutdisk: TwwDataSource;
    dsDevolucion: TwwDataSource;
    dsCtaCtes: TwwDataSource;
    dsSolicitudA: TwwDataSource;
    MainMenu1: TMainMenu;
    ExcelApp: TExcelApplication;
    ExcelBook: TExcelWorkbook;
    WS: TExcelWorksheet;
    cdsQry6: TwwClientDataSet;
    dsQry6: TwwDataSource;
    cdsMovCnt1: TwwClientDataSet;
    dsMovCnt1: TwwDataSource;
    cdsTipDesem: TwwClientDataSet;
    dsTipdesem: TwwDataSource;
    cdsQry22: TwwClientDataSet;
    dsQry22: TwwDataSource;
    cdsQry23: TwwClientDataSet;
    dsQry23: TwwDataSource;
    cdsQry24: TwwClientDataSet;
    dsQry24: TwwDataSource;
    cdsQry25: TwwClientDataSet;
    dsQry25: TwwDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure FiltraCDS(xxCds: TwwClientDataSet; xxSQL: String);
    procedure DataModuleDestroy(Sender: TObject);
    procedure AbreCDS(xxCds: TwwClientDataSet; xxSelect: String);
    procedure cdsEjecutaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
		SeprDec: string;
		FormatCel: array of OleVariant;
    function ObtenerIpdeNetbios(Host: string): string;
    function ComputerName: string;
  public
    { Public declarations }
    wObjetoDescr: String;
    wCodigoError : Integer;
    wObjetoForma: String;
    wObjetoNombr: String;
    wObjetoDesPr: String;
    wGrupoTmp   : String;
    wAdmin, wRepFecServ      : String;
    wAreaPersonal : String; // variable que toma el nombre de departamento
    wciades       : String; // variable que toma el nombre de Compañia
    wComponente : TControl;
 	  wTipoCambioUsar ,
    sClose, wSRV,wTDatos, wModulo, wUsuario,wGrupo,xSgr :string;
    wMonedaNac,wMonedaExt, wModo :string;
		wTMonExt, wTMonLoc : String;
    wTCCompra,wTCVenta : String;
    xArea,xCnd,xSal,xGrabaExc,xOfiDes,sGrid,xperanomes:String;
    wIpServer : String;
    ideconex : String;
    cIP : String;

    Procedure AccesosUsuarios(xxModulo,xxUsuario,xxTipo,xxForma:String);
    function BuscaObjeto( Const xNombre:String; xForm:TForm):TControl;
    function DisplayDescrip(wPrv,wTabla,wCampos,wWhere,wResult:string):string;
    function MaxSQL(const sTabla, sMxCampo, sCondicion : String ) : String;
    function StrZero(wNumero:String;wLargo:Integer):string;
    function OperClientDataSet( cdsOrigen : TwwClientDataSet; wExpresion, wCondicion : String  ) : Double;
    procedure AccesosUsuariosR(xxModulo,xxUsuario,xxTipo:String; xxForma:TForm);
    function  FRound(xReal:double;xEnteros,xDecimal:Integer):double;
    function  NombreMes(wwMes:String):String;
    function  UltimoNum(wPrv,wTabla,wCampo,wWhere:string):string ;
    Function  DisplayDescripLocal(cds : TwwClientdataset; xCodigo,xDato,xMostrar : String) : String;
    function  RecuperarDatos(xTabla,xCampos,xWhere : String): Boolean ;
    procedure SQLSelect(const xTabla, xCampos, xWhere: WideString);
    procedure RecuperaCierre(var xFecha: TDateTime; xFrecu: Integer);
    function  EquivFPago(xFAGOID , xBANCOID : STRING): String ;
    function  NumeroNoNulo(xCampo : TField ) : double ;
    procedure LimpiaClientDataset(cds : TwwClientDataset);
    procedure LimpiaDatos();
    function FechaSys(): tDateTime;
    function HoraSys: String;
    function FechasOutPut(xFInput : tDateTime): tDateTime;
    function CrgDescrip(xCondicion, xTabla, xCampo :String):String;
    procedure CrgDatos();
    function Valores(Texto:String):Currency;
    function xIntToLletras(Numero:LongInt;Dec:Real):String;
    function DesMes(xMes:Integer; xAbr:Char):String;
    Function StrSpace(wNumero:String;wLargo:Integer):string;
    function RecuperaDatos(xTabla, xCampo, xVariable , xRecupera : String): String;
    function UltimoDia(xMes:Integer; xAno:Integer):String;
    function CalculaCuota(xTas_Int , xTas_Flt ,xMonOto: Real ; xNumCuo : Integer):Currency;
    function IniFinCrono(xFec_Pre:tDateTime ; xNum_Cuo: Integer; xPrdGra,xTipPre:String):String;
 		procedure HojaExcel(Tit: string; TDs: TDataSource; TDb: TDBGrid);
		procedure FormatosCeldas(N: Integer ; TDs: TDataSource);
    function CountReg(xSQL:String):Integer;
    function FormatoNumeros(xTexto:String):String;
    function xDesMes(id:String):String;
    procedure BlqComponentes(xForm:tForm);
    function ConsultaRiesgos(xPeriodo,xWhere:String) : String;
    function ConsultaRiesgosTri(xPeriodo,xWhere:String) : String;
    function ConsultaRiesgosSem(xPeriodo,xWhere:String) : String;
    function ConsultaRiesgosAnu(xPeriodo,xWhere:String) : String;
    function ConsultaDiasAtraso(xPeriodo:String; xAndWhere : string = '') : String;
    procedure AgruparGrid(Sender: TObject;IField:string);
    procedure ExportaGridExcel(xDataGrid:TwwDBGrid;xFileName:String);
    function CalculaTiempo(FechaIni: TDateTime; FechaFin: TDatetime): String;
    function SumaGrid(xDataSet:TwwClientDataSet;xColumna:String):Currency;
    function UltCartera:String;
    procedure limpiarTodosCDS;
  end;

var
  DM1: TDM1;
  SRV_E, SRV_D, SRV_V : String;
  xBorrar : String;
  xLogAsoid, xLogCodMo : Integer;
  wCiaDef, wTipoCambio : String;
  wRptCia, wRutaRpt, wUrqCia : String;
  xFec_Sis, xHor_Sis, wRutaFTP, wFormatFecha, wFormatHoras,  wReplacCeros, wRepFecServi, wRepTimeServi, wRepFuncDate, wRepFuncChar : String;

  procedure cdsPost(xxCds: TwwClientDataSet);
  function  MaxValue(const sDetail : String; CD : TDataSet ): String;
  function  GetSystemTimeUTC : String;

implementation

{$R *.DFM}

uses RSG001, RSG020;


procedure cdsPost( xxCds:TwwClientDataSet);
var
  i:integer;
begin
  for i:=0 to xxCds.Fields.Count-1 do
  begin
    if xxCds.Fields[i].Classtype=TStringField then
    begin
      if xxCds.Fields[i].AsString='' then xxCds.Fields[i].clear;
    end;
    if xxCds.Fields[i].Classtype=TMemoField then
    begin
      if xxCds.Fields[i].AsString='' then xxCds.Fields[i].AsString:='.';
    end;
  end;
end;

function MaxValue(const sDetail: String; CD: TDataSet): String;
var
	iMx : LongInt;
 	bmk : TBookMark;
 	dsI, dsE : Boolean;
begin
  // --------------------------- ADVERTENCIA !!!!!!!! --------------------------
  //  ESTO NO FUNCIONA EN EL CACHÉ
  // ---------------------------------------------------------------------------
  //  result := MaxSQL('LOG309','DRQSID',
  //                   'where CIAID='''+sCIA+''' and '+'RQSID = '''+sRqs+'''' );
  // ---------------------------------------------------------------------------
	iMx := 0;
  bmk:=Nil;
  CD.DisableControls;
  dsI := (CD.State = dsInsert);
  dsE := (CD.State = dsEdit);
  if CD.RecordCount > 0 then
  begin
  	if dsE then bmk:=CD.GetBookmark;
  	if dsI or dsE then CD.Cancel;

  	CD.First;
  	while not CD.Eof do
  	begin
    	if CD.FieldByName(sDetail).isNull then
      	iMx := 0
    	else
      if (CD.FieldByName(sDetail).AsInteger > iMx) and (CD.FieldByName(sDetail).AsInteger <> 999) then
      	iMx := CD.FieldByName(sDetail).AsInteger;
    	CD.Next;
  	end;
  	if dsI then
    	CD.Insert
  	else
  	if dsE then
    	CD.Edit;
  	if dsE then
  	begin
    	CD.GotoBookmark(bmk);
    	CD.FreeBookmark(bmk);
  	end;
  end;
  CD.EnableControls;
  Result := IntToStr(iMx+1);
end;

function GetSystemTimeUTC : String;
var
   stSystemTime : TSystemTime;
begin
   Windows.GetSystemTime(stSystemTime);
   Result := DateTimeToStr( SystemTimeToDateTime( stSystemTime ) );
end;

function TDM1.OperClientDataSet( cdsOrigen : TwwClientDataSet; wExpresion, wCondicion : String  ) : Double;
var
  cdsClone    : TwwClientDataSet;
  bmk         : TBookmark;
  Agg         : TAggregate;
begin
  result := 0;
  if trim(wExpresion)= '' then Exit;
  bmk:=cdsOrigen.GetBookmark;
  cdsClone    := TwwClientDataSet.Create(nil);
  try
    with cdsClone do
    begin
      CloneCursor(cdsOrigen,True);

      Agg := Aggregates.Add;
      Agg.AggregateName := 'OPER';
      Agg.Expression := wExpresion;
      Agg.Active := True;

      if Trim(wCondicion)<>'' then
      begin
        Filtered     := False;
        Filter       := wCondicion;
        Filtered     := True;
      end;
      if Aggregates.Items[Aggregates.IndexOf('OPER')].Value <> NULL then
         result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;
      Aggregates.Clear;
    end;
    cdsOrigen.GotoBookmark(bmk);
    cdsOrigen.FreeBookmark(bmk);
  finally
    cdsClone.Free;
  end;
end;

function TDM1.ObtenerIpdeNetbios(Host: string): string;
var
  WSAData: TWSADATA;
  HostEnt: phostent;
begin
  Result:= '';
  if WSAStartup(MAKEWORD(1, 1), WSADATA) = 0 then
  begin
    HostEnt:= gethostbyname(PChar(Host));
    if HostEnt <> nil then
      Result:= String(inet_ntoa(PInAddr(HostEnt.h_addr_list^)^));
    WSACleanup;
  end;
end;

function TDM1.ComputerName: string;
var
  Buffer: array[ 0..100 ] of Char;
  MaxSize: Cardinal ;
begin
  MaxSize := SizeOf( Buffer );
  if not GetComputerName( @Buffer, MaxSize ) then
    raise Exception.Create( 'No puedo determinar el nombre de la máquina' );
  Result := StrPas( @Buffer );
end;

Procedure TDM1.DataModuleCreate(Sender: TObject);
Var
   xWhere, xSQL: String;
   inifile: TIniFile;
Begin
   // <>'' Cuando el servidor se ejecuta Localmente
   //  =''  Ejecucion Servidor Remoto
   DCOM1.Connected := False;

  // LEE LOS DATOS DE CONEXION
  if ParamStr(1)='' then
  begin
     inifile:=TIniFile.Create('C:\SOLExes\DM_Conf_CLI.ini');
     DCOM1.Address:=IniFile.ReadString('TCPIP','ADDRESS','');
     DCOM1.Port   :=STRTOINT( IniFile.ReadString('TCPIP','PORT','') );
     wSRV:=IniFile.ReadString('MOTOR','NAME','');
  end;

  // OBTIENE EL IP DE LA PC
  try
      cIP:= ObtenerIpdeNetbios( computerName);
  except
      ShowMessage( 'ERROR de Conexión.');
      DCOM1.Connected:=False;
      Exit;
  end;

  // Conexion con la Aplicación Servidor
  try
     DCOM1.Connected:=true;
  except
     ShowMessage( 'ERROR de Conexión.');
     Exit;
  end;

  // Accesos al Sistemas
  wModulo := 'RSG';
  sClose  := '0';
  FCtrlAcceso := TFCtrlAcceso.Create(Application);
  FCtrlAcceso.ShowModal;

  if FCtrlAcceso.cAccesoSistema='S' then
  begin
     // SI Ingreso al Sistema
     wUsuario := FCtrlAcceso.dbeUsuario.Text;
     FCtrlAcceso.free;
  end
  else
  begin
     // NO Ingreso al Sistema
     sClose:='1';
     DCOM1.Connected:=False;
     FCtrlAcceso.free;
     Exit;
  end;

   If sClose <> '1' Then
   Begin
      wTipoCambioUsar := 'TCAMVOV';
      wAreaPersonal := 'Departamento de Riesgos';
      xwhere := 'CNTCONSOL=' + quotedstr('S');
      wciades := DM1.DisplayDescrip('prvSQL', 'TGE101', 'CIADES', xWhere, 'CIADES');
      wCiaDef := '02';
      xBorrar := '0';
      wTCCompra := 'TCAMVBC';
      wTipoCambio := 'TCAMVBC';
      cdsUsuarios.Open;
      cdsGrupos.Open;
      cdsMGRupo.Open;
      cdsAcceso.Open;
      xLogAsoid := 10;
      xLogCodMo := 10;
      DM1.cdsSexo.Close;
      xSQL := 'SELECT ''M'' SEXO, ''MASCULINO'' DESCRIP FROM TGE101 '
         + 'UNION '
         + 'SELECT ''F'' SEXO, ''FEMENINO'' DESCRIP FROM TGE101';
      DM1.cdsSexo.DataRequest(xSQL);
      DM1.cdsSexo.Open;
      wTMonExt := displaydescrip('prvTGE', 'TGE103', 'TMONID', 'TMON_LOC=' + quotedStr('E'), 'TMONID');
      wTMonLoc := displaydescrip('prvTGE', 'TGE103', 'TMONID', 'TMON_LOC=' + quotedStr('L'), 'TMONID');
      wFormatFecha := 'DD/MM/YYYY';
      wFormatHoras := 'HH24:MI:SS';
      wReplacCeros := 'NVL';
      wRepFecServi := 'SYSDATE';
      wRepFecServ := 'SYSDATE';
      wRepTimeServi := 'SYSDATE'; //                     'TO_DATE(SYSDATE,'+QuotedStr('DD/MM/YYY')+'), SYSDATE, '+
      wRepFuncDate := 'TO_DATE(';
      wRepFuncChar := 'TO_CHAR(';
      FPrincipal := TFPrincipal.Create(self);
      Try
         FPrincipal.ShowModal;
      Finally
         FPrincipal.free;
      End;
   End
   Else
   Begin
      If DM1 <> Nil Then
         dm1.DCOM1.Connected := False;
      Application.Terminate;
   End;
End;

Procedure TDM1.AccesosUsuarios(xxModulo,xxUsuario,xxTipo,xxForma:String);
begin
  if Trim(cdsUsuarios.FieldByName('GRUPOID').AsString) = '' then
  begin
    cdsUsuarios.SetKey;
    cdsUsuarios.FieldByName('USERID').AsString := xxUsuario;
    If not cdsUsuarios.GotoKey then Exit;
  end;

  DM1.cdsGrupos.Filter := '';
  If xxTipo='1' then
  begin
    cdsGrupos.Filter:='GRUPOID='+''''+cdsUsuarios.FieldByName('GRUPOID').AsString+''''+' AND '
                     +'MODULOID='+''''+xxModulo+''''+' AND '
                     +'TIPO='+''''+xxTipo+'''';
    cdsGrupos.Filtered := True;
    cdsGrupos.First;
    While not cdsGrupos.Eof do
    begin
      wComponente := BuscaObjeto( cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
      wComponente.Enabled := False;
      cdsGrupos.Next;
    end;
  end;

  If xxTipo='2' then
  begin
    cdsGrupos.Filter:='GRUPOID=' +''''+cdsUsuarios.FieldByName('GRUPOID').AsString+''''+' AND '
                     +'MODULOID='+''''+xxModulo+''''+' AND '
                     +'FORMA='   +''''+xxForma +''''+' AND '
                     +'TIPO='    +''''+xxTipo  +'''';
    cdsGrupos.Filtered := True;
    cdsGrupos.First;
    While not cdsGrupos.Eof do
    begin
      wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm );
      If (wComponente.Name='Z2bbtnModifica') or
         (wComponente.Name='Z2bbtnConsulta') then
        wComponente.Enabled := False
      else
      begin
        wComponente.Visible := False;
      end;
      cdsGrupos.Next;
    end;
  end;
end;

function TDM1.BuscaObjeto( Const xNombre:String; xForm:TForm):TControl;
var
  ic : Integer;
begin
  ic := xForm.ComponentCount-1;
  while (xForm.Components[ic].Name<>xNombre) and (ic>-1) do
  begin
    Dec(ic);
  end;
  If xForm.Components[ic].Name=xNombre then
    Result := TControl( xForm.Components[ic])
  else
    Result:=Nil;
end;

function TDM1.DisplayDescrip(wPrv,wTabla,wCampos,wWhere,wResult:string):string;
var
  xSQL : string;
begin
  xSQL := '';
  xSQL := 'SELECT '+wCampos+' FROM '+wTabla;
  if length(wWhere)>0 then xSQL:=xSQL+' WHERE '+wWhere;
  cdsQry.Close;
  cdsQry.IndexFieldNames:='';
  cdsQry.DataRequest(xSQL);
  cdsQry.Open;
  result:=cdsQry.FieldByName(wResult).Asstring;
end;

procedure TDM1.Filtracds(xxCds: TwwClientDataSet; xxSQL: String);
begin
  if Length( xxSQL )>0 then
  begin
    xxCds.Close;
    xxCds.DataRequest( xxSQL );
  end;
  xxCds.Open;
end;

function TDM1.MaxSQL(const sTabla, sMxCampo, sCondicion : String): String;
var
	xnum : integer;
  sSQL, sWhere : String;
	D, M, Y : Word;
begin
	DecodeDate(Date, Y, M, D);
	sWhere:='WHERE '+sMxCampo+' not like (''%A%'') and '+sMxCampo+' not like (''%B%'') and '+sMxCampo+' not like (''%C%'') '+
            'and '+sMxCampo+' not like (''%D%'') and '+sMxCampo+' not like (''%E%'') and '+sMxCampo+' not like (''%F%'') '+
            'and '+sMxCampo+' not like (''%G%'') and '+sMxCampo+' not like (''%H%'') and '+sMxCampo+' not like (''%I%'') '+
            'and '+sMxCampo+' not like (''%J%'') and '+sMxCampo+' not like (''%K%'') and '+sMxCampo+' not like (''%L%'') '+
            'and '+sMxCampo+' not like (''%M%'') and '+sMxCampo+' not like (''%N%'') and '+sMxCampo+' not like (''%O%'') '+
            'and '+sMxCampo+' not like (''%P%'') and '+sMxCampo+' not like (''%Q%'') and '+sMxCampo+' not like (''%R%'') '+
            'and '+sMxCampo+' not like (''%S%'') and '+sMxCampo+' not like (''%T%'') and '+sMxCampo+' not like (''%U%'') '+
						'and '+sMxCampo+' not like (''%V%'') and '+sMxCampo+' not like (''%W%'') and '+sMxCampo+' not like (''%X%'') '+
						'and '+sMxCampo+' not like (''%Y%'') and '+sMxCampo+' not like (''%Z%'') ';
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    sWhere:=sWhere+'and '+SMXCAMPO+' <> '''' '
  else
  if SRV_D = 'ORACLE' then
    sWhere:=sWhere+'and NVL('+SMXCAMPO+',''VACIO'') <> ''VACIO'' ';
  if Length(Trim(sCondicion))>0 then
  sWhere:=sWhere+'and '+sCondicion;

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  	sSQL:='SELECT MAX(CAST(COALESCE('+SMXCAMPO+',''0'') AS DECIMAL(10))) AS X FROM '+sTabla+' '+ sWhere
  else
  if SRV_D = 'ORACLE' then
  	sSQL:='SELECT MAX(TO_NUMBER('+SMXCAMPO+')) AS X FROM '+sTabla+' '+ sWhere;

  cdsQry.Close;
  cdsQry.DataRequest(sSQL);
  cdsQry.Open;
  if cdsQry.FieldByName('X').IsNull then
    result := '1'
  else
  begin
    xnum := StrToInt(Trim(cdsQry.FieldByName('X').AsString));
    result := IntToStr(xnum+1);
  end;


end;

procedure TDM1.DataModuleDestroy(Sender: TObject);
begin
  cdsUsuarios.Close;
  cdsGrupos.Close;
  cdsMGRupo.Close;
  cdsAcceso.Close;
  DM1.DCOM1.Connected:=False;
end;

function TDM1.StrZero(wNumero:String;wLargo:Integer):string;
var
  i : integer;
  s, xTemp : string;
begin
  s := '';
  for i:=1 to wLargo do
  	s := s+'0';
  s := s+trim(wNumero);
  xTemp := copy(s,length(s)-(wLargo-1),wLargo);
	result := xTemp;
end;


procedure TDM1.AbreCDS(xxCds: TwwClientDataSet; xxSelect: String);
begin
  xxCds.Close;
  xxCds.DataRequest( xxSelect );
  xxCds.Open;
end;

procedure TDM1.AccesosUsuariosR(xxModulo,xxUsuario,xxTipo:String; xxForma:TForm);
begin
  if Trim(cdsUsuarios.FieldByname('GRUPOID').AsString)='' then
  begin
    cdsUsuarios.SetKey;
    cdsUsuarios.FieldByname('USERID').AsString := xxUsuario;
    if not cdsUsuarios.GotoKey then
      Exit;
  end;

  cdsGrupos.Filter := '';
  If xxTipo = '1' then
  begin
    cdsGrupos.Filter:='GRUPOID='+''''+cdsUsuarios.FieldByname('GRUPOID').AsString+''''+' AND '
                     +'MODULOID='+''''+xxModulo+''''+' AND '
                     +'TIPO='+''''+xxTipo+'''';
    cdsGrupos.Filtered := True;
    if (DM1.wAdmin='S') or (DM1.wAdmin='P') then
      Exit;
    cdsGrupos.First;
    While not cdsGrupos.Eof do
    begin
      wComponente := BuscaObjeto( cdsGrupos.FieldByName('OBJETO').AsString, xxForma );
      wComponente.Enabled := False;
      cdsGrupos.Next;
    end;
  end;

  If xxTipo='2' then
  begin
    cdsGrupos.Filter:='GRUPOID=' +''''+cdsUsuarios.FieldByname('GRUPOID').AsString+''''+' AND '
                     +'MODULOID='+''''+xxModulo                +''''+' AND '
                     +'FORMA='   +''''+xxForma.Name            +''''+' AND '
                     +'TIPO='    +''''+xxTipo                  +'''';
    cdsGrupos.Filtered := True;

    if (DM1.wAdmin='S') or (DM1.wAdmin='P') then Exit;

    cdsGrupos.First;
    While not cdsGrupos.Eof do
    begin
      wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma );
      If (wComponente.Name='Z2bbtnModifica') or
         (wComponente.Name='Z2bbtnConsulta') then
        wComponente.Enabled := False
      else
      begin
        wComponente.Visible := False;
      end;
      cdsGrupos.Next;
    end;
  end;
end;

function TDM1.FRound(xReal: double; xEnteros, xDecimal: Integer): double;
Var
  xParteDec,xflgneg   : String;
  xDec: Integer;
  xMultiplo10, xUltdec, xNReal, xPDec : Double;
begin
  Result:=0;
  xflgneg:='0';
  xMultiplo10:=0;

  if xReal<0 then
  begin
  xflgneg:='1';
  xReal:=xReal*-1;
  end;
  xReal := strtofloat(floattostr(xReal));

  if xReal=0 then exit;
	// primer redondeo a un decimal + de lo indicado en los parámetros
  xDec := xDecimal+1;
  if xDec=0 then xMultiplo10:=1;
  if xDec=1 then xMultiplo10:=10;
  if xDec=2 then xMultiplo10:=100;
  if xDec=3 then xMultiplo10:=1000;
  if xDec=4 then xMultiplo10:=10000;
  if xDec=5 then xMultiplo10:=100000;
  if xDec=6 then xMultiplo10:=1000000;
  if xDec=7 then xMultiplo10:=10000000;

  xNreal := strtofloat(floattostr(xReal*xMultiplo10));
  xPdec  := int(strtofloat(floattostr(xReal)))*xMultiplo10;
  xPdec  := xNReal - xPDec;

  xPDec  := int(xPDec);
  xParteDec := floattostr(xPDec);
  if length(xParteDec)<xDec then
     xParteDec:=strZero(xParteDec,xDec);


  if length(xParteDec)>=xDec then
     xultdec:=  strtofloat(copy(xParteDec,xDec,1))
  else begin
     xUltDec := 0;
  end;
  xNReal := strtofloat(floattostr(xReal*xMultiplo10/10));
  xNReal := int(xNReal);
  if xultdec>=5 then xNReal := xNReal+1;

  if xflgneg='1' then
  begin
  Result := (xNReal/(xMultiplo10/10))*-1;
  end
  else
  begin
  Result := xNReal/(xMultiplo10/10);
  end;
end;

function TDM1.NombreMes(wwMes: String): String;
begin
   If StrToInt(wwMes) = 1 Then Result := 'Enero';
   If StrToInt(wwMes) = 2 Then Result := 'Febrero';
   If StrToInt(wwMes) = 3 Then Result := 'Marzo';
   If StrToInt(wwMes) = 4 Then Result := 'Abril';
   If StrToInt(wwMes) = 5 Then Result := 'Mayo';
   If StrToInt(wwMes) = 6 Then Result := 'Junio';
   If StrToInt(wwMes) = 7 Then Result := 'Julio';
   If StrToInt(wwMes) = 8 Then Result := 'Agosto';
   If StrToInt(wwMes) = 9 Then Result := 'Setiembre';
   If StrToInt(wwMes) = 10 Then Result := 'Octubre';
   If StrToInt(wwMes) = 11 Then Result := 'Noviembre';
   If StrToInt(wwMes) = 12 Then Result := 'Diciembre';
end;

function TDM1.UltimoNum(wPrv, wTabla, wCampo, wWhere: string): string;
var
  xSQL : string;
begin
  xSQL := 'SELECT MAX('+wCampo+') ULTNUM FROM '+wTabla;
  if length(wWhere)>0 then xSQL:=xSQL+' WHERE '+wWhere;
  cdsQry.Close;
  cdsQry.DataRequest(xSQL);
  cdsQry.Open;
  If (cdsQry.FieldbyName('ULTNUM').value = null) or (cdsQry.FieldbyName('ULTNUM').AsString = '') then
    result:='1'
  else
    result:=inttostr(cdsQry.FieldbyName('ULTNUM').asInteger+1);
end;

function TDM1.DisplayDescripLocal(cds: TwwClientdataset; xCodigo, xDato, xMostrar: String): String;
begin
  if cds.Locate(xcodigo,VarArrayOf([xDato]),[]) then
    Result := cds.fieldbyname(xMostrar).AsString
  else
    Result := '' ;
end;

function TDM1.RecuperarDatos(xTabla, xCampos, xWhere: String): Boolean;
begin
  DM1.SQLSelect(xTabla,xCampos,xWhere);
  DM1.cdsRec.active := False ;
  DM1.cdsRec.active := True ;

  if DM1.cdsRec.RecordCount=0 then
    Result := False
  else
    Result := True ;
end;

procedure TDM1.SQLSelect(const xTabla, xCampos, xWhere: WideString);
var
  xSQL : String ;
begin
  if xWhere = '' then
    xSQL := 'SELECT '+xCampos+ ' FROM '+ xTabla
  else
    xSQL := 'SELECT '+xCampos+ ' FROM '+ xTabla +' WHERE '+xWhere ;
  DM1.cdsRec.close;
  DM1.cdsRec.dataRequest(xSQL);
end;

procedure TDM1.RecuperaCierre(var xFecha: TDateTime; xFrecu: Integer);
begin
  if RecuperarDatos( 'CAJA309','FECCIERRE, FRECUCIERRE','FACTIVO = ''S''' ) then
  begin
    xFecha := dm1.cdsRec.fieldbyname('FECCIERRE').asdatetime ;
    xFrecu := dm1.cdsRec.fieldbyname('FRECUCIERRE').AsInteger  ;
  end
  else
  begin
    xFecha := 0 ;
    xFrecu := 0 ;
  end ;
end;

function TDM1.EquivFPago(xFAGOID, xBANCOID: STRING): String;
begin
  cdsEquiv.Open;
  if cdsEquiv.Locate('FPAGOID;BANCOID',VarArrayOf([xFAGOID,xBANCOID]),[]) then
    Result := cdsEQuiv.fieldbyname('EQUIID').AsString
  else
    Result := '' ;
end;

function TDM1.NumeroNoNulo(xCampo: TField): double;
begin
  if not xCampo.IsNull then
    Result := xCampo.asFloat
  else
    Result := 0;
end;

procedure TDM1.cdsEjecutaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDM1.LimpiaClientDataset(cds: TwwClientDataset);
begin
   with cds do
   begin
     IndexFieldNames := '' ;
     Filter := '' ;
     Filtered := False ;
     if active then
       Close ;
   end ;
end;

function TDM1.CrgDescrip(xCondicion, xTabla, xCampo : String): String;
begin
cdsQry.Close;
cdsQry.DataRequest('Select '+xCampo+' From '+xTabla+' Where '+xCondicion);
cdsQry.Open;
If cdsQry.RecordCount=1 Then
   Result:=cdsQry.fieldbyname(xCampo).AsString
Else
   Result:='';

cdsQry.Close;

end;

procedure TDM1.CrgDatos;

begin
end;

procedure TDM1.LimpiaDatos;
begin

end;

function TDM1.FechaSys: tDateTime;
var
   FormatoFecha: PChar;
begin
FormatoFecha:='dd/MM/yyyy';
SetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SSHORTDATE,FormatoFecha);
cdsAux.Close;
cdsAux.DataRequest('SELECT TO_CHAR(SYSDATE,''dd/mm/yyyy'') AS FECHA FROM DUAL');
cdsAux.Open;
If cdsAux.RecordCount > 0 Then
    Result:=FechasOutPut(cdsAux.fieldbyname('FECHA').AsDateTime)
Else
    Result:=FechasOutPut(Date);
cdsAux.Close;
end;

function TDM1.FechasOutPut(xFInput: tDateTime): tDateTime;
begin
   Result:=StrToDate(Copy(DateToStr(xFInput),1,10));
end;

function TDM1.Valores(Texto: String): Currency;
var xMont,xValor:String;
    I:Integer;
begin
   For I := 1 To Length(Trim(Texto)) Do
   Begin
       xMont:=Copy(Texto,I,1);
       If xMont <> ',' Then
          xValor := Trim(xValor)+Trim(xMont);
   End;
   Result:=StrToFloat(xValor);
end;

function TDM1.xIntToLletras(Numero: Integer; Dec: Real): String;
  function xxIntToLletras(Valor:LongInt):String;
  const
   aUnidad : array[1..15] of string =
     ('UN','DOS','TRES','CUATRO','CINCO','SEIS',
      'SIETE','OCHO','NUEVE','DIEZ','ONCE','DOCE',
      'TRECE','CATORCE','QUINCE');
   aCentena: array[1..9]  of string =
     ('CIENTO','DOSCIENTOS','TRESCIENTOS',
      'CUATROCIENTOS','QUINIENTOS','SEISCIENTOS',
      'SETECIENTOS','OCHOCIENTOS','NOVECIENTOS');
   aDecena : array[1..9]  of string =
    ('DIECI','VEINTI','TREINTA','CUARENTA','CINCUENTA',
     'SESENTA','SETENTA','OCHENTA','NOVENTA');
  var
   Centena, Decena, Unidad, Doble: LongInt;
   Linea: String;
  begin
   if valor=100 then Linea:=' CIEN '
   else begin
     Linea:='';
     Centena := Valor div 100;
     Doble   := Valor - (Centena*100);
     Decena  := (Valor div 10) - (Centena*10);
     Unidad  := Valor - (Decena*10) - (Centena*100);

     if Centena>0 then Linea := Linea + Acentena[centena]+' ';

     if Doble>0 then begin
       if Doble=20 then Linea := Linea +' VEINTE '
         else begin
          if doble<16 then Linea := Linea + aUnidad[Doble]
            else begin
                 Linea := Linea +' '+ Adecena[Decena];
                 if (Decena>2) and (Unidad<>0) then Linea := Linea+' Y ';
                 if Unidad>0 then Linea := Linea + aUnidad[Unidad];
            end;
         end;
     end;
   end;
   Result := Linea;
  end;


var
   Millones,Miles,Unidades: LongInt;
   Linea : String;
   xnum,xdec:Real;


begin
  {Inicializamos el string que contendrá las letras según el valor
  numérico}

  xnum:=Int(Numero);
  xdec:= (dec-xnum)*100;

  if numero=0 then Linea := 'CERO'
  else if numero<0 then Linea := 'MENOS '
       else if numero=1 then
            begin
              Linea := 'UN';
              xIntToLletras := Linea;
              exit
            end
            else if numero>1 then Linea := '';

  {Determinamos el Nº de millones, miles y unidades de numero en
  positivo}
  Numero   := Abs(Numero);
  Millones := numero div 1000000;
  Miles     := (numero - (Millones*1000000)) div 1000;
  Unidades  := numero - ((Millones*1000000)+(Miles*1000));

  {Vamos poniendo en el string las cadenas de los números(llamando
  a subfuncion)}
  if Millones=1 then Linea:= Linea + ' UN MILLON '
  else if Millones>1 then Linea := Linea + xxIntToLletras(Millones)
                                   + ' MILLONES ';

  if Miles =1 then Linea:= Linea + ' MIL '
  else if Miles>1 then Linea := Linea + xxIntToLletras(Miles)+
                                ' MIL ';

  if Unidades >0 then Linea := Linea + xxIntToLletras(Unidades);
   xIntToLletras := Linea+' y '+ Format( '%.2d',[round(xdec)])+ '/100 Nuevos Soles';

end;


function TDM1.DesMes(xMes: Integer; xAbr: Char): String;
Const
    NomMes: Array [1..12] of String = ('ENERO','FEBRERO','MARZO','ABRIL','MAYO','JUNIO','JULIO','AGOSTO','SETIEMBRE','OCTUBRE','NOVIEMBRE','DICIEMBRE');
begin
  If xAbr='S' Then
     Result:=Copy(NomMes[xMes],1,3)
  Else Result:=NomMes[xMes];
end;

function TDM1.StrSpace(wNumero: String; wLargo: Integer): string;
var
  i : integer;
  s, xTemp : string;
begin
  s := '';
  for i:=1 to wLargo do
  	s := s+' ';
  s := s+trim(wNumero);
  xTemp := copy(s,length(s)-(wLargo-1),wLargo);
	result := xTemp;
end;


function TDM1.RecuperaDatos(xTabla, xCampo, xVariable,  xRecupera: String): String;
begin
  cdsQry2.Close;
  cdsQry2.DataRequest('Select '+xCampo+' From '+xTabla+' WHERE '+xCampo+'='+ QuotedStr(Trim(xVariable)));
  cdsQry2.Open;
  If cdsQry2.RecordCount = 1 Then
     Result:=cdsQry2.fieldbyname(xRecupera).AsString
  Else
     Result:='';
     cdsQry2.Close;


end;

function TDM1.UltimoDia(xMes, xAno: Integer): String;
Const
   FinDia: Array [1..13] of String = ('31','28','31','30','31','30','31','31','30','31','30','31','29');
Begin
   If xAno Mod 4 = 0 Then
      Begin
         If xMes=2 Then
            xMes:=13;
      End ; Result:=FinDia[xMes];




end;

function TDM1.CalculaCuota(xTas_Int, xTas_Flt, xMonOto: Real;  xNumCuo: Integer): Currency;
var xMon_Cuo,sFlt_Pag,cNumer,cDenom:Real;
begin
sFlt_Pag:=0;
If xTas_Int <> 0 Then
   Begin
     xTas_Int:= StrToFloat(FloatToStrF(xTas_Int/100,ffFixed,15,4));
     xTas_Flt:= StrToFloat(FloatToStrF(xTas_Flt/100,ffFixed,15,4));
     cNumer  := xTas_Int * Power((1+xTas_Int),xNumCuo);
     cDenom  := Power((1+xTas_Int),xNumCuo)-1 ;
     xMon_Cuo:= StrToFloat(FloatToStrF(xMonOto * (cNumer/cDenom),ffFixed,15,2));
     sFlt_Pag:= StrToFloat(FloatToStrF(xMonOto * xTas_Flt / xNumCuo,ffFixed,15,2)) ;
   End
Else
   Begin
     xMon_Cuo:=xMonOto / xNumCuo;
     xMon_Cuo:= StrToFloat(FloatToStrF(xMon_Cuo,ffFixed,15,2));
   End;
   Result:= xMon_Cuo+sFlt_Pag;


end;

function TDM1.IniFinCrono(xFec_Pre: tDateTime; xNum_Cuo: Integer; xPrdGra,  xTipPre: String): String;
var
    i,j:Integer;
    xPeriodo,xDia,tDia:String;
    xFecIni,xFecFin,xFec_Ven:tDateTime;
    tMes,tAno,xMes,xAno:Integer;

begin
    If xPrdGra='S' Then
       Begin
         xPeriodo:=Trim(DM1.RecuperaDatos('CRE110','TIPCREID',Trim(xTipPre),'PER_GRA'));
         If xPeriodo>'0' Then
         Begin
           For j:= 1 to StrToInt(xPeriodo) Do
           Begin
              tDia:=Copy(DateToStr(xFec_Pre),1,2);
              tMes:=StrToInt(Copy(DateToStr(xFec_Pre),4,2)) + 1;
              tAno:=StrToInt(Copy(DateToStr(xFec_Pre),7,4));
              If tMes > 12 Then
                 Begin
                  tMes := 1;
                  tAno := tAno + 1 ;
                 End;
             xFec_Pre:=StrToDate(tDia+'/'+Format('%.2d',[tMes])+'/'+ Trim(IntToStr(tAno)));
           End;
         End;
       End;

    For i:= 1 to xNum_Cuo Do
    Begin
      xMes:=StrToInt(Copy(DateToStr(xFec_Pre),4,2)) + 1;
      xAno:=StrToInt(Copy(DateToStr(xFec_Pre),7,4));
      If xMes > 12 Then
         Begin
           xMes := 1;
           xAno := xAno + 1 ;
         End;
      xDia:=DM1.UltimoDia(xMes,xAno);
      xFec_Ven := StrToDate(xDia+'/'+Format('%.2d',[xMes])+'/'+ Trim(IntToStr(xAno)));
      If i=1 Then  xFecIni:=xFec_Ven;
      If i=xNum_Cuo Then xFecFin:=xFec_Ven;

       xFec_Pre:=xFec_Ven;
    End;
    Result:= Copy(DateToStr(xFecIni),7,4)+Copy(DateToStr(xFecIni),4,2)+Copy(DateToStr(xFecIni),1,2)+Copy(DateToStr(xFecFin),7,4)+Copy(DateToStr(xFecFin),4,2)+Copy(DateToStr(xFecFin),1,2) ;

end;

// Inicio: HPC_201801_RSG
// Se modifica el procedimiento de exportar a Excel
// procedure TDM1.HojaExcel(Tit: string; TDs: TDataSource; TDb: TDBGrid);
// var Lcid, C, CH, CH1, I, W, X, Y, TotHoja: Integer; Bk: TBookmarkStr;
// Tabla: Variant; L, A: OleVariant; HH: Extended;
// begin
// 	if not TDs.DataSet.Active then Exit;
// 	if TDs.DataSet.RecordCount = 0 then Exit;
// 
// 	Lcid:= GetUserDefaultLCID;
// 	C:= TDb.Columns.Count;
// 	CH:= 1;
// 	if TDs.DataSet.RecordCount > 15100 then
// 		begin
// 			HH:= TDs.DataSet.RecordCount / 15100;
// 			CH:= Trunc(HH);
// 			if Frac(HH) > 0 then CH:= CH + 1;
// 		end;
// 
// 	ExcelApp.Visible[Lcid]:= True;
// 	ExcelApp.Caption:= 'Consultas en EXCEL';
// 	ExcelBook.ConnectTo(ExcelApp.Workbooks.Add(1, Lcid));
// 	if CH > 1 then
// 		begin
// 			ExcelBook.Worksheets.Add(NULL, NULL, (CH - 1), NULL, Lcid);
// 			for I:= 1 to CH do
// 				begin
// 					WS.ConnectTo(ExcelBook.Worksheets[I] as _Worksheet);
// 					WS.Name:= Tit + '_' + IntToStr(I);
// 				end;
// 		end;
// 
// 	WS.ConnectTo(ExcelBook.Worksheets[1] as _Worksheet);
// 	WS.Activate(Lcid);
// 	if CH = 1 then WS.Name:= Tit;
// 	ExcelApp.ScreenUpdating[Lcid]:= False;
// 	for X:= 1 to CH do
// 		begin
// 			WS.ConnectTo(ExcelBook.Worksheets[X] as _Worksheet);
// 			WS.Activate(Lcid);
// 			for I:= 0 to (C - 1) do
// 				begin
// 					L:= WS.Cells.Item[1, I + 1];
// 					WS.Range[L, L].Value2:= TDb.Columns[I].Title.Caption;
// 				end;
// 		end;
// 	WS.ConnectTo(ExcelBook.Worksheets[1] as _Worksheet);
// 	WS.Activate(Lcid);
// 
// 	CH1:= 1;
// 	W:= 2;
// 	I:= 1;
// 	Y:= 1;
// 	TotHoja:= 0;
// 	TDs.DataSet.DisableControls;
// 	Bk:= TDs.DataSet.Bookmark;
// 	Tabla:= VarArrayCreate([1, 5000, 0, C], varVariant);
// 	TDs.DataSet.First;
// 	while not TDs.DataSet.Eof do
// 		begin
// 			for X:= 0 to (C - 1) do Tabla[Y, X]:= TDs.DataSet.Fields[X].AsString;
// 			if Y = 5000 then
// 				begin
// 					L:= 'A' + IntToStr(W);
// 					WS.Range[L, WS.Cells.Item[I + 1, C]].Value2:= Tabla;
// 					try
// 						Tabla:= Unassigned;
// 					finally
// 						Tabla:= VarArrayCreate([1, 5000, 0, C], varVariant);
// 					end;
// 					Y:= 0;
// 					W:= I + 2;
// 				end;
// 			Inc(Y, 1);
// 			Inc(I, 1);
// 			Inc(TotHoja, 1);
// 			if TotHoja = 15100 then
// 				begin
// 					L:= 'A' + IntToStr(W);
// 					WS.Range[L, WS.Cells.Item[I, C]].Value2:= Tabla;
// 					try
// 						Tabla:= Unassigned;
// 					finally
// 						Tabla:= VarArrayCreate([1, 5000, 0, C], varVariant);
// 					end;
// 					CH1:= CH1 + 1;
// 					WS.ConnectTo(ExcelBook.Worksheets[CH1] as _Worksheet);
// 					WS.Activate(Lcid);
// 					Y:= 1;
// 					W:= 2;
// 					I:= 1;
// 					TotHoja:= 0;
// 				end;
// 			Application.ProcessMessages;
// 			TDs.DataSet.Next;
// 		end;
// 	CH1:= I;
// 	try
// 	   WS.Range['A' + IntToStr(W), WS.Cells.Item[CH1, C]].Value2:= Tabla;
// 	finally
// 		Tabla:= Unassigned;
// 	end;
// 	for X:= 1 to CH do
// 		begin
// 			WS.ConnectTo(ExcelBook.Worksheets[X] as _Worksheet);
// 			WS.Activate(Lcid);
// 			SetLength(FormatCel, C + 1);
// 			FormatosCeldas(C,TDs);
// 			for I:= 1 to C do
// 				begin
// 					L:= WS.Cells.Item[1, I];
// 					WS.Range[L, L].EntireColumn.NumberFormat:= FormatCel[I];
// 				end;
// 			for I:= 0 to (C - 1) do
// 				begin
// 					L:= WS.Cells.Item[1, I + 1];
// 					Y:= TDs.DataSet.Fields[I].DisplayWidth;
// 					if Length(TDb.Columns[I].Title.Caption) > Y then
// 						Y:= Length(TDb.Columns[I].Title.Caption);
// 					  WS.Range[L, L].EntireColumn.ColumnWidth:= Y + 2;
// 					if TDb.Columns[I].Alignment = taLeftJustify then A:= 2;
// 					if TDb.Columns[I].Alignment = taCenter then A:= 3;
// 					if TDb.Columns[I].Alignment = taRightJustify then A:= 4;
// 					WS.Range[L, L].EntireColumn.HorizontalAlignment:= A;
// 				end;
// 			L:= WS.Cells.Item[1, C];
// 			WS.Range['A1', L].HorizontalAlignment:= 3;
// 			WS.Range['A1', L].Interior.Color:= clMaroon;
// 			WS.Range['A1', L].Font.Color:= clWhite;
// 			WS.Range['A1', L].Font.Bold:= True;
// 			if CH = 1 then W:= TDs.DataSet.RecordCount + 1
// 			else if (CH > 1) and (X < CH) then W:= 15101
// 			else if (CH > 1) and (X = CH) then W:= CH1;
// 			WS.PageSetup.PrintGridlines:= True;
// 			WS.PageSetup.PrintTitleRows:= '1:1';
// 			WS.DefaultInterface.Set_DisplayAutomaticPageBreaks(Lcid, True);
// 		end;
// 	WS.ConnectTo(ExcelBook.Worksheets[1] as _Worksheet);
// 	WS.Activate(Lcid);
// 	ExcelApp.ScreenUpdating[Lcid]:= True;
// 	TDs.DataSet.EnableControls;
// 	TDs.DataSet.Bookmark:= Bk;
// end;
Procedure TDM1.HojaExcel(Tit: String; TDs: TDataSource; TDb: TDBGrid);
Var
   Lcid, C, CH, CH1, I, W, X, Y, TotHoja: Integer;
   Bk: TBookmarkStr;
   Tabla: Variant;
   L, A: OleVariant;
   HH: Extended;
   F: TFieldDef;
Begin
   If Not TDs.DataSet.Active Then Exit;
   If TDs.DataSet.RecordCount = 0 Then Exit;
   Lcid := GetUserDefaultLCID;
   C := TDb.Columns.Count;
   CH := 1;
   If TDs.DataSet.RecordCount > 20100 Then
   Begin
      HH := TDs.DataSet.RecordCount / 20100;
      CH := Trunc(HH);
      If Frac(HH) > 0 Then CH := CH + 1;
   End;
   ExcelApp.Visible[Lcid] := True;
   ExcelApp.Caption := 'Consultas en EXCEL';
   ExcelBook.ConnectTo(ExcelApp.Workbooks.Add(1, Lcid));
   If CH > 1 Then
   Begin
      ExcelBook.Worksheets.Add(NULL, NULL, (CH - 1), NULL, Lcid);
      For I := 1 To CH Do
      Begin
         WS.ConnectTo(ExcelBook.Worksheets[I] As _Worksheet);
         WS.Name := Tit + '_' + IntToStr(I);
      End;
   End;
   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);
   If CH = 1 Then WS.Name := Tit;
   ExcelApp.ScreenUpdating[Lcid] := False;
   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);
      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         WS.Range[L, L].Value2 := TDb.Columns[I].Title.Caption;
      End;
   End;
   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);
   CH1 := 1;
   W := 2;
   I := 1;
   Y := 1;
   TotHoja := 0;
   TDs.DataSet.DisableControls;
   Bk := TDs.DataSet.Bookmark;
   Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
   TDs.DataSet.First;
   While Not TDs.DataSet.Eof Do
   Begin
      For X := 0 To (C - 1) Do
      Begin
         F:= TDs.DataSet.FieldDefs.Items[X];
         If ((F.DataType =  ftDate) or
            (F.DataType =  ftDateTime) or
            (F.DataType =  ftTimeStamp)) AND
            (Length(TRIM(TDs.DataSet.Fields[X].AsString))<>0) Then
            Begin
              Tabla[Y, X] := ''''+TDs.DataSet.Fields[X].AsString;
            end
         Else If F.DataType =  ftFMTBcd Then
            Tabla[Y, X] := TDs.DataSet.Fields[X].AsString
         Else
            Tabla[Y, X] := ''''+TDs.DataSet.Fields[X].AsString;
      end;
      If Y = 5000 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I + 1, C]].Value2 := Tabla;
         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;
         Y := 0;
         W := I + 2;
      End;
      Inc(Y, 1);
      Inc(I, 1);
      Inc(TotHoja, 1);
      If TotHoja = 20100 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I, C]].Value2 := Tabla;
         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;
         CH1 := CH1 + 1;
         WS.ConnectTo(ExcelBook.Worksheets[CH1] As _Worksheet);
         WS.Activate(Lcid);
         Y := 1;
         W := 2;
         I := 1;
         TotHoja := 0;
      End;
      Application.ProcessMessages;
      TDs.DataSet.Next;
   End;
   CH1 := I;
   Try
      WS.Range['A' + IntToStr(W), WS.Cells.Item[CH1, C]].Value2 := Tabla;
   Finally
      Tabla := Unassigned;
   End;
   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);
      SetLength(FormatCel, C + 1);
      FormatosCeldas(C, TDs);
      For I := 1 To C Do
      Begin
         L := WS.Cells.Item[1, I];
         WS.Range[L, L].EntireColumn.NumberFormat := FormatCel[I];
      End;
      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         Y := TDs.DataSet.Fields[I].DisplayWidth;
         If Length(TDb.Columns[I].Title.Caption) > Y Then
            Y := Length(TDb.Columns[I].Title.Caption);
         If Y>=255 Then Y:=243;
         WS.Range[L, L].EntireColumn.ColumnWidth := Y + 2;
         If TDb.Columns[I].Alignment = taLeftJustify Then A := 2;
         If TDb.Columns[I].Alignment = taCenter Then A := 3;
         If TDb.Columns[I].Alignment = taRightJustify Then A := 4;
         WS.Range[L, L].EntireColumn.HorizontalAlignment := A;
      End;
      L := WS.Cells.Item[1, C];
      WS.Range['A1', L].HorizontalAlignment := 3;
      WS.Range['A1', L].Interior.Color := clMaroon;
      WS.Range['A1', L].Font.Color := clWhite;
      WS.Range['A1', L].Font.Bold := True;
      If CH = 1 Then
         W := TDs.DataSet.RecordCount + 1
      Else
         If (CH > 1) And (X < CH) Then
            W := 15101
         Else
            If (CH > 1) And (X = CH) Then W := CH1;
      WS.PageSetup.PrintGridlines := True;
      WS.PageSetup.PrintTitleRows := '1:1';
      WS.DefaultInterface.Set_DisplayAutomaticPageBreaks(Lcid, True);
   End;
   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);
   ExcelApp.ScreenUpdating[Lcid] := True;
   TDs.DataSet.EnableControls;
   TDs.DataSet.Bookmark := Bk;
End;
// Fin: HPC_201801_RSG


procedure TDM1.FormatosCeldas(N: Integer; TDs: TDataSource);
var I: Integer; F: TFieldDef;
begin
    for I:= 1 to N do
    Begin
          F := TDs.DataSet.FieldDefs.Items[I-1];
          Case F.DataType of
               ftString: FormatCel[I]:= DM1.StrZero('0',Length(TDs.DataSet.Fields[I-1].AsString));
               ftDate: FormatCel[I]:= 'dd/mm/yyyy';
               ftDateTime: FormatCel[I]:= 'dd/mm/yyyy';
               ftUnknown: FormatCel[I]:= DM1.StrZero('0',Length(TDs.DataSet.Fields[I-1].AsString));
               ftInteger: FormatCel[I]:= '###,###';
               ftFloat: FormatCel[I]:= '######.00';
          Else
               FormatCel[I]:= Null;
          End;
     End;

end;



function TDM1.CountReg(xSQL: String): Integer;
Var xCount:Integer;
begin
  cdsQry.Close;
  cdsQry.DataRequest(xSQL);
  cdsQry.Open;
  xCount:=cdsQry.RecordCount;
  cdsQry.Close;
  Result:=xCount;

end;

function TDM1.FormatoNumeros(xTexto: String): String;
begin
   Try
      Result:=FormatFloat('###,###.#0',DM1.Valores(xTexto));
   Except
   End;

end;

function TDM1.HoraSys: String;
begin
cdsEjecuta.Close;
cdsEjecuta.DataRequest('SELECT TO_CHAR(SYSDATE,''HH24:MI:SS'') AS HORA FROM DUAL');
cdsEjecuta.Open;
If cdsEjecuta.RecordCount > 0 Then
    Result:=cdsEjecuta.fieldbyname('HORA').AsString
Else
    Result:='';

cdsEjecuta.Close;


end;

function TDM1.xDesMes(id: String): String;
begin
  If id = '01' Then Result := 'ENERO';
  If id = '02' Then Result := 'FEBRERO';
  If id = '03' Then Result := 'MARZO';
  If id = '04' Then Result := 'ABRIL';
  If id = '05' Then Result := 'MAYO';
  If id = '06' Then Result := 'JUNIO';
  If id = '07' Then Result := 'JULIO';
  If id = '08' Then Result := 'AGOSTO';
  If id = '09' Then Result := 'SETIEMBRE';
  If id = '10' Then Result := 'OCTUBRE';
  If id = '11' Then Result := 'NOVIEMBRE';
  If id = '12' Then Result := 'DICIEMBRE';
end;

procedure TDM1.BlqComponentes(xForm: tForm);
var xSQL,xComponente,x,y:String;
    i:Integer;
begin
   xSQL:='SELECT USERID,COMPONENTE FROM RIE_AUT_USU WHERE USERID='+QuotedStr(DM1.wUsuario)+' AND COMPONENTE IS NOT NULL ';
   cdsEjecuta.Close;  cdsEjecuta.DataRequest(xSQL); cdsEjecuta.Open;
   If DM1.cdsEjecuta.RecordCount >0 Then
   Begin
      DM1.cdsEjecuta.First;
      While Not DM1.cdsEjecuta.Eof Do
      Begin
       xComponente:=Trim(DM1.cdsEjecuta.FieldByName('COMPONENTE').AsString);
       for i := 0 To xForm.ComponentCount-1 do begin
         If UpperCase(xComponente)=UpperCase(xForm.Components[i].Name) Then
            Begin
              TwwDBEdit(xForm.Components[i]).Enabled  := True;
            End;
       End;
       DM1.cdsEjecuta.Next;
      End;

   End;
   cdsEjecuta.Close;





end;

function TDM1.ConsultaRiesgos(xPeriodo,xWhere: String): String;
begin
Result:='SELECT B.DPTOID,C.DPTODES,A.UPROID,A.UPAGOID,A.USEID,USENOM,CFC_A,CFCDES_A,SUM(SALDOS_AT) SALDOS_AT,SUM(NUM_AT) NUM_AT, '+
        'CFC_F,CFCDES_F,DIASDESC,SUM(SALDOS_FT) SALDOS_FT,SUM(NUM_FT) NUM_FT,SUM(SALDOS_PV) SALDOS_PV,SUM(SALDOS_FV) SALDOS_FV FROM '+
        '(SELECT UPROID,UPAGOID,USEID,CFC_A,CFCDES_A,NVL(SALDOS_AT,0) SALDOS_AT,CASE WHEN NVL(SALDOS_AT,0)>0 THEN 1 ELSE 0 END NUM_AT, '+
        'CFC_F,CFCDES_F,NVL(SALDOS_FT,0) SALDOS_FT,CASE WHEN NVL(SALDOS_FT,0)>0 THEN 1 ELSE 0 END NUM_FT, ' +
        'CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''ENTRE_0_Y_8_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 9 AND 31 THEN ''ENTRE_9_Y_31_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE_32_Y_62_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE_63_Y_93_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE_94_Y_123_DIAS'' '+
        '     WHEN DIASTRANS>123 THEN ''MAS_DE_123_DIAS''  END DIASDESC,SALDOS_FV,SALDOS_PV,TIPCAR,TIPASO '+
        'FROM RIE_EST_GEN WHERE PERACT='+QuotedStr(xPeriodo)+xWhere+')  A, APO101 B, APO158 C WHERE A.UPROID=B.UPROID(+) '+
        'AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) AND B.DPTOID=C.DPTOID(+) '+
        'GROUP BY B.DPTOID,C.DPTODES,A.UPROID,A.UPAGOID,A.USEID,USENOM,CFC_A,CFCDES_A,CFC_F,CFCDES_F,DIASDESC ';

end;

function TDM1.ConsultaDiasAtraso(xPeriodo: String; xAndWhere : string): String;
begin

Result:='SELECT ORDENCFC,ORDENDIAS,CFC_F,CFCDES_F,DIASDESC,SUM(ASOCIADOS) ASOCIADOS,SUM(SALDOS_FT) SALDOS_FT,SUM(SALDOS_FV) SALDOS_FV,SUM(SALDOS_FP) SALDOS_FP,  '
        +'SUM(SALDOS_PV) SALDOS_PV,SUM(SALDOS_CB) SALDOS_CB,SUM(SALDOS_NC) SALDOS_NC  '
        +'FROM (SELECT  '
        +'CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''ENTRE 0 Y 8 DIAS''  '
        +'     WHEN DIASTRANS BETWEEN 9 AND 31 THEN ''ENTRE 9 Y 31 DIAS''  '
        +'     WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE 32 Y 62 DIAS''  '
        +'     WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE 63 Y 93 DIAS''  '
        +'     WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE 94 Y 123 DIAS''  '
        +'     WHEN DIASTRANS > 123 THEN ''MAS DE 123 DIAS''  '
        +'END DIASDESC,  '
        +'CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN 0 '
        +'     WHEN DIASTRANS BETWEEN 9 AND 31 THEN 1 '
        +'     WHEN DIASTRANS BETWEEN 32 AND 62 THEN 2 '
        +'     WHEN DIASTRANS BETWEEN 63 AND 93 THEN 3 '
        +'     WHEN DIASTRANS BETWEEN 94 AND 123 THEN 4 '
        +'     WHEN DIASTRANS > 123 THEN 5 '
        +'END ORDENDIAS,               '
        +'CASE WHEN CFC_F=''0'' THEN 0 '
        +'     WHEN CFC_F=''A'' THEN 1 '
        +'     WHEN CFC_F=''B'' THEN 2 '
        +'     WHEN CFC_F=''C'' THEN 3 '
        +'     WHEN CFC_F=''D'' THEN 4 '
        +'END ORDENCFC, '
        +'A.DPTOID,B.DPTODES,A.UPROID,A.UPAGOID,A.USEID,C.USENOM,CFC_F, '
        +'CFCDES_F,DIASTRANS,1 ASOCIADOS,SALDOS_FT,SALDOS_FV,SALDOS_FP,SALDOS_PV,SALDOS_CB,SALDOS_NC,TIPCAR,TIPASO '
        +'FROM RIE_EST_GEN A,APO158 B,APO101 C WHERE PERACT='+QuotedStr(xPeriodo)+' AND CFC_F IS NOT NULL AND A.DPTOID=B.DPTOID(+) '
        +'AND A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND A.USEID=C.USEID(+) ' +  xAndWhere + ' ) '
        +'GROUP BY ORDENCFC,ORDENDIAS,CFC_F,CFCDES_F,DIASDESC';


end;

procedure TDM1.AgruparGrid(Sender: TObject; IField: string);
begin
     (Sender as TwwDBGrid).GroupFieldName:= IField;
     (Sender as TwwDBGrid).Datasource.Dataset.FieldByName(IField).Index := 0;
     (Sender as TwwDBGrid).Invalidate;
end;

procedure TDM1.ExportaGridExcel(xDataGrid: TwwDBGrid; xFileName: String);
begin
     Screen.Cursor:=crHourGlass;
     with xDataGrid,xDataGrid.ExportOptions do begin
        ExportType := wwgetSYLK;
        FileName := xFileName+'.xls';
        Save;
        if not(esoClipboard in Options) then
        ShellExecute(Handle, 'Open', PChar(xDataGrid.exportoptions.Filename), nil, nil, sw_shownormal);
     end;
     Screen.Cursor:=crDefault;
end;

function TDM1.CalculaTiempo(FechaIni, FechaFin: TDatetime): String;
var Dias, Meses, Horas, Minutos, Segundos: integer;
    ValorFecha: real;
begin
ValorFecha:=FechaFin-FechaIni;
  Dias:=Trunc(ValorFecha);
  Meses:=Trunc((ValorFecha)/30.4);
  Horas:=Trunc(Frac(ValorFecha)*24);
  Minutos:=Trunc((Frac(Frac(ValorFecha)*24))*60);
  Segundos:=Trunc((Frac((Frac(Frac(ValorFecha)*24))*60))*60);
  CalculaTiempo:=IntToStr(Segundos)+' Seg.Transcurridos';
end;

function TDM1.SumaGrid(xDataSet: TwwClientDataSet; xColumna: String): Currency;
begin
Result:=0;
xDataSet.First;
While Not xDataSet.Eof  Do
Begin
    Result := Result + xDataSet.FieldByName(xColumna).AsCurrency;
    xDataSet.Next;
End;
end;

function TDM1.UltCartera: String;
var xSQL:String;
begin
   xSQL:='SELECT MAX(PERIODO) PERIODO FROM CFC000';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   Result:= DM1.cdsQry.FieldByName('PERIODO').AsString;
end;

function TDM1.ConsultaRiesgosTri(xPeriodo,xWhere: String): String;
begin
Result:='SELECT B.DPTOID,C.DPTODES,A.UPROID,A.UPAGOID,A.USEID,USENOM,CFC_T CFC_A,CFCDES_T CFCDES_A,SUM(SALDOS_TT) SALDOS_AT,SUM(NUM_TT) NUM_AT, '+
        'CFC_F,CFCDES_F,DIASDESC,SUM(SALDOS_FT) SALDOS_FT,SUM(NUM_FT) NUM_FT,SUM(SALDOS_PV) SALDOS_PV,SUM(SALDOS_FV) SALDOS_FV FROM '+
        '(SELECT UPROID,UPAGOID,USEID,CFC_T,CFCDES_T,NVL(SALDOS_TT,0) SALDOS_TT,CASE WHEN NVL(SALDOS_TT,0)>0 THEN 1 ELSE 0 END NUM_TT, '+
        'CFC_F,CFCDES_F,NVL(SALDOS_FT,0) SALDOS_FT,CASE WHEN NVL(SALDOS_FT,0)>0 THEN 1 ELSE 0 END NUM_FT, ' +
        'CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''ENTRE_0_Y_8_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 9 AND 31 THEN ''ENTRE_9_Y_31_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE_32_Y_62_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE_63_Y_93_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE_94_Y_123_DIAS'' '+
        '     WHEN DIASTRANS>123 THEN ''MAS_DE_123_DIAS''  END DIASDESC,SALDOS_FV,SALDOS_PV,TIPCAR,TIPASO  '+
        'FROM RIE_EST_GEN WHERE PERACT='+QuotedStr(xPeriodo)+xWhere+')  A, APO101 B, APO158 C WHERE A.UPROID=B.UPROID(+) '+
        'AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) AND B.DPTOID=C.DPTOID(+) '+
        'GROUP BY B.DPTOID,C.DPTODES,A.UPROID,A.UPAGOID,A.USEID,USENOM,CFC_T,CFCDES_T,CFC_F,CFCDES_F,DIASDESC ';

end;

function TDM1.ConsultaRiesgosSem(xPeriodo,xWhere: String): String;
begin
Result:='SELECT B.DPTOID,C.DPTODES,A.UPROID,A.UPAGOID,A.USEID,USENOM,CFC_S CFC_A,CFCDES_S CFCDES_A,SUM(SALDOS_ST) SALDOS_AT,SUM(NUM_ST) NUM_AT, '+
        'CFC_F,CFCDES_F,DIASDESC,SUM(SALDOS_FT) SALDOS_FT,SUM(NUM_FT) NUM_FT,SUM(SALDOS_PV) SALDOS_PV,SUM(SALDOS_FV) SALDOS_FV FROM '+
        '(SELECT UPROID,UPAGOID,USEID,CFC_S,CFCDES_S,NVL(SALDOS_ST,0) SALDOS_ST,CASE WHEN NVL(SALDOS_ST,0)>0 THEN 1 ELSE 0 END NUM_ST, '+
        'CFC_F,CFCDES_F,NVL(SALDOS_FT,0) SALDOS_FT,CASE WHEN NVL(SALDOS_FT,0)>0 THEN 1 ELSE 0 END NUM_FT, ' +
        'CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''ENTRE_0_Y_8_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 9 AND 31 THEN ''ENTRE_9_Y_31_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE_32_Y_62_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE_63_Y_93_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE_94_Y_123_DIAS'' '+
        '     WHEN DIASTRANS>123 THEN ''MAS_DE_123_DIAS''  END DIASDESC,SALDOS_FV,SALDOS_PV,TIPCAR,TIPASO  '+
        'FROM RIE_EST_GEN WHERE PERACT='+QuotedStr(xPeriodo)+xWhere+')  A, APO101 B, APO158 C WHERE A.UPROID=B.UPROID(+) '+
        'AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) AND B.DPTOID=C.DPTOID(+) '+
        'GROUP BY B.DPTOID,C.DPTODES,A.UPROID,A.UPAGOID,A.USEID,USENOM,CFC_S,CFCDES_S,CFC_F,CFCDES_F,DIASDESC ';

end;

function TDM1.ConsultaRiesgosAnu(xPeriodo,xWhere: String): String;
begin
Result:='SELECT B.DPTOID,C.DPTODES,A.UPROID,A.UPAGOID,A.USEID,USENOM,CFC_Y CFC_A,CFCDES_Y CFCDES_A,SUM(SALDOS_YT) SALDOS_AT,SUM(NUM_YT) NUM_AT, '+
        'CFC_F,CFCDES_F,DIASDESC,SUM(SALDOS_FT) SALDOS_FT,SUM(NUM_FT) NUM_FT,SUM(SALDOS_PV) SALDOS_PV,SUM(SALDOS_FV) SALDOS_FV FROM '+
        '(SELECT UPROID,UPAGOID,USEID,CFC_Y,CFCDES_Y,NVL(SALDOS_YT,0) SALDOS_YT,CASE WHEN NVL(SALDOS_YT,0)>0 THEN 1 ELSE 0 END NUM_YT, '+
        'CFC_F,CFCDES_F,NVL(SALDOS_FT,0) SALDOS_FT,CASE WHEN NVL(SALDOS_FT,0)>0 THEN 1 ELSE 0 END NUM_FT, ' +
        'CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''ENTRE_0_Y_8_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 9 AND 31 THEN ''ENTRE_9_Y_31_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE_32_Y_62_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE_63_Y_93_DIAS'' '+
        '     WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE_94_Y_123_DIAS'' '+
        '     WHEN DIASTRANS>123 THEN ''MAS_DE_123_DIAS''  END DIASDESC,SALDOS_FV,SALDOS_PV,TIPCAR,TIPASO  '+
        'FROM RIE_EST_GEN WHERE PERACT='+QuotedStr(xPeriodo)+xWhere+')  A, APO101 B, APO158 C WHERE A.UPROID=B.UPROID(+) '+
        'AND A.UPAGOID=B.UPAGOID(+) AND A.USEID=B.USEID(+) AND B.DPTOID=C.DPTOID(+) '+
        'GROUP BY B.DPTOID,C.DPTODES,A.UPROID,A.UPAGOID,A.USEID,USENOM,CFC_Y,CFCDES_Y,CFC_F,CFCDES_F,DIASDESC ';

end;

Procedure TDM1.limpiarTodosCDS();

   Procedure LimpiaClientDataset(cds : TwwClientDataSet);
   Begin
      cds.IndexFieldNames := '';
      cds.Filter := '';
      cds.Filtered := False;
      If cds.active Then
         cds.Close;
   End;
Begin
   // no se hace un bucle que recorra todos los controles
   // xq existen algunos controles que ya tienen por defecto un select
   // y se abre por defecto
   LimpiaClientDataset(self.cdsDLabo);
   LimpiaClientDataset(self.cdsDSocioE);

End;




end.
