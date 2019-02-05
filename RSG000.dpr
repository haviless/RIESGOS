program RSG000;
uses
  Forms,
  Windows,
  Controls,
  dialogs,
  RSG001 in 'RSG001.pas' {FPrincipal},
  RSG002 in 'RSG002.pas' {fMatDesplaz},
  RSG003 in 'RSG003.pas' {fSaldosVen},
  RSG004 in 'RSG004.pas' {fDetDesplaz},
  RSG005 in 'RSG005.pas' {fDetDesplazUgel},
  RSG006 in 'RSG006.pas' {fIndGestion},
  RSG007 in 'RSG007.pas' {fEstDepMeses},
  RSG008 in 'RSG008.pas' {fEstMesUgel},
  RSG010 in 'RSG010.pas' {fTabControl},
  RSG017 in 'RSG017.pas' {fCalfCtaxCob},
  RSG018 in 'RSG018.pas' {fAnalisisdeCosechas},
  RSG020 in 'RSG020.pas' {FCtrlAcceso},
  RSG022 in 'RSG022.pas' {FCPassw},
  RSG110 in 'RSG110.pas' {FraChartP: TFrame},
  RSG111 in 'RSG111.pas' {FChartN},
  RSG112 in 'RSG112.pas' {FChartT},
  RSG113 in 'RSG113.pas' {FComentarioImg},
  RSG114 in 'RSG114.pas' {FChart},
  RSG115 in 'RSG115.pas' {FListaReportesGraficos},
  RSG116 in 'RSG116.pas' {FChart_MatrizDespDptoUgel},
  RSG117 in 'RSG117.pas' {FChart_MatrizDespGral},
  RSG118 in 'RSG118.pas' {FChart_MatrizDespGralDetalle},
  RSG119 in 'RSG119.pas' {FChart_MatrizDespDAtraConc},
  RSG120 in 'RSG120.pas' {FChart_SaldosVencidos},
  RSG121 in 'RSG121.pas' {fGrafCosechas},
  RSG122 in 'RSG122.pas' {fGrafIndGestion},
  RSG123 in 'RSG123.pas' {fGrafDepMeses},
  RSG127 in 'RSG127.pas' {fCtrlAutorizacionAcceso},
  RSG128 in 'RSG128.pas' {fPermisos},
  RSGDM1 in 'RSGDM1.pas' {DM1: TDataModule},
  RSG129 in 'RSG129.pas' {fVisorComp};

{$R *.RES}
var
  HMutex: THandle;
begin
  HMutex := CreateMutex (nil, False, 'OneCopyMutexRSG');
  if WaitForSingleObject (HMutex, 0) <> wait_TimeOut then
  begin
     Application.Initialize;
     Application.Title := 'Riesgos    ';
     Application.CreateForm(TDM1, DM1);
  Application.Run;
  end
  else
     MessageDlg('Sistema de Riesgos - Ya se Encuentra en ejecución el Modulo', mtError, [mbOk], 0);
end.

