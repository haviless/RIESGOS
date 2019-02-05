// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FListaReportesGraficos
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Lista los Graficos guardado por un Usuario
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

UNIT RSG115;

INTERFACE

USES
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DB;

TYPE
   TFListaReportesGraficos = CLASS(TForm)
      dbgPrincipal: TwwDBGrid;
      BitGrafico: TBitBtn;
      BitSalir: TBitBtn;
    lblUserSave: TLabel;
      PROCEDURE BitSalirClick(Sender: TObject);
      PROCEDURE BitGraficoClick(Sender: TObject);
      PROCEDURE FormCreate(Sender: TObject);
    procedure dbgPrincipalDblClick(Sender: TObject);
   Private
      PROCEDURE cargarDxs();
   Public
      { Public declarations }
   END;

VAR
   FListaReportesGraficos: TFListaReportesGraficos;

IMPLEMENTATION

USES RSGDM1, RSG114, RSG001;

{$R *.dfm}
(******************************************************************************)

PROCEDURE TFListaReportesGraficos.cargarDxs();
VAR
   xSQL: STRING;
BEGIN
   // PARA Q NO SALGA COMO [MEMO], SE SACA UN SUBSTRING DE 100 CARACTERES
   xSQL := 'SELECT CODIGO, SUBSTR(NOMBRE,1,100) NOMBRE, FREG, UREG, SUBSTR(REPLACE(TITULO,''<:>'', '' '' ),1,100) TITULO, IS3D '
      + '  FROM REP_EST_GRAFICO  '
      + ' WHERE MODULO =' + QuotedStr(DM1.wModulo)
      + '   AND UREG =' + QuotedStr(DM1.wUsuario)
      + '   AND ACTIVO = ''S'' '
      + '   AND GRABO_COMPLETO = ''S'' '
      + ' ORDER BY FREG DESC';
   DM1.cdsNieto.Close;
   DM1.cdsNieto.DataRequest(xSQL);
   DM1.cdsNieto.Open;
   dbgPrincipal.DataSource := DM1.dsNieto;
   dbgPrincipal.Selected.Clear;
   dbgPrincipal.Selected.Add('CODIGO'#9'10'#9'CODIGO'#9);
   dbgPrincipal.Selected.Add('NOMBRE'#9'50'#9'NOMBRE'#9);
   dbgPrincipal.Selected.Add('FREG'#9'25'#9'FECHA DE CREACION'#9);
   dbgPrincipal.Selected.Add('TITULO'#9'50'#9'TITULO'#9);
   dbgPrincipal.ApplySelected;
END;
(******************************************************************************)

PROCEDURE TFListaReportesGraficos.FormCreate(Sender: TObject);
BEGIN
   lblUserSave.Caption:= 'Graficos Estadísticos Guardados por el Usuario : ' + DM1.wUsuario + ' -   '+ Trim(DM1.CrgDescrip('USERID=' + QuotedStr(Trim(DM1.wUsuario)), 'TGE006', 'USERNOM'));
   cargarDxs();
END;
(******************************************************************************)

PROCEDURE TFListaReportesGraficos.BitSalirClick(Sender: TObject);
BEGIN
   close;
END;
(******************************************************************************)

PROCEDURE TFListaReportesGraficos.BitGraficoClick(Sender: TObject);
VAR
   bm: TBookmark;
BEGIN
   IF NOT DM1.cdsNieto.Active THEN
   BEGIN
      showmessage('No hay Graficos en la Lista');
      exit;
   END;
   FChart := TFChart.Create(self);
   TRY
      FChart.crearGrafico(DM1.cdsNieto.FieldByName('CODIGO').AsString);
      FChart.ShowModal;
   FINALLY
      FChart.Free;
      bm := DM1.cdsNieto.GetBookmark;
      cargarDxs();
      DM1.cdsNieto.GotoBookmark(bm);
   END;
END;
(******************************************************************************)
procedure TFListaReportesGraficos.dbgPrincipalDblClick(Sender: TObject);
begin
    BitGraficoClick(BitGrafico);
end;
(******************************************************************************)
END.

