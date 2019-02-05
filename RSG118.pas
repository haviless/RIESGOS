// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FChart_MatrizDespGralDetalle
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Grafico de matriz de desplazamiento general - Detalle
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

UNIT RSG118;

INTERFACE

USES
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, RSG114, StdCtrls, Buttons, ExtCtrls, Mask, wwdblook, Wwdbdlg,
   RSG110;

TYPE
   TFChart_MatrizDespGralDetalle = CLASS(TFChart)
      Panel1: TPanel;
      Label2: TLabel;
      dblcdCategoriaId: TwwDBLookupComboDlg;
      meCategoriaDes: TMaskEdit;
      rgReporte: TRadioGroup;
      btnMostrarGrafico: TBitBtn;
      lblPeriodo: TLabel;
      pDepartamento: TPanel;
      Label1: TLabel;
      dblcdDptoId: TwwDBLookupComboDlg;
      meDptoDes: TMaskEdit;
      pCategoriaF: TPanel;
      Label3: TLabel;
      dblcdCatFId: TwwDBLookupComboDlg;
      meCatFDes: TMaskEdit;
      PROCEDURE btnMostrarGraficoClick(Sender: TObject);
      PROCEDURE FormShow(Sender: TObject);
      PROCEDURE dblcdCategoriaIdChange(Sender: TObject);
      PROCEDURE dblcdCategoriaIdExit(Sender: TObject);
      PROCEDURE dblcdDptoIdChange(Sender: TObject);
      PROCEDURE dblcdDptoIdExit(Sender: TObject);
      PROCEDURE dblcdCatFIdChange(Sender: TObject);
      PROCEDURE dblcdCatFIdExit(Sender: TObject);
   Private
      { Private declarations }
   Public
      xAnho: STRING;
      xMes: STRING;
   END;

VAR
   FChart_MatrizDespGralDetalle: TFChart_MatrizDespGralDetalle;

IMPLEMENTATION

USES RSGDM1;

{$R *.dfm}
(******************************************************************************)

PROCEDURE TFChart_MatrizDespGralDetalle.FormShow(Sender: TObject);
VAR
   vSQL: STRING;
BEGIN
   INHERITED;
   vSQL := 'SELECT ''*'' CFC_A, ''- MOSTRAR RESUMEN -'' CFCDES_A '
      + '  FROM DUAL '
      + ' UNION ALL '
      + 'SELECT RESUMEID CFC_A, RESUMEDES CFCDES_A '
      + '  FROM COB113 '
      + ' UNION ALL '
      + 'SELECT ''R'' CFC_A, ''BLOQUEADOS'' CFCDES_A '
      + '  FROM DUAL '
      + ' UNION ALL '
      + 'SELECT ''Y'' CFC_A, ''NUEVAS COLOCACIONES'' CFCDES_A '
      + '  FROM DUAL ';
   DM1.cdsQry22.Close;
   DM1.cdsQry22.DataRequest(vSQL);
   DM1.cdsQry22.Open;
   dblcdCategoriaId.LookupField := '';
   dblcdCategoriaId.LookupTable := DM1.cdsQry22;
   dblcdCategoriaId.LookupField := 'CFC_A';
   dblcdCategoriaId.Selected.Clear;
   dblcdCategoriaId.Selected.Add('CFC_A'#9'6'#9'CODIGO'#9#9);
   dblcdCategoriaId.Selected.Add('CFCDES_A'#9'25'#9'NOMBRE'#9#9);
   IF DM1.cdsQry22.RecordCount > 0 THEN dblcdCategoriaId.Text := '*';

   vSQL := 'SELECT ''*'' CFC_F, ''- TODOS -'' CFCDES_F '
      + '  FROM DUAL '
      + ' UNION ALL '
      + 'SELECT RESUMEID CFC_F, RESUMEDES CFCDES_F '
      + '  FROM COB113 ';

   DM1.cdsQry24.Close;
   DM1.cdsQry24.DataRequest(vSQL);
   DM1.cdsQry24.Open;
   dblcdCatFId.LookupField := '';
   dblcdCatFId.LookupTable := DM1.cdsQry24;
   dblcdCatFId.LookupField := 'CFC_F';
   dblcdCatFId.Selected.Clear;
   dblcdCatFId.Selected.Add('CFC_F'#9'6'#9'CODIGO'#9#9);
   dblcdCatFId.Selected.Add('CFCDES_F'#9'25'#9'NOMBRE'#9#9);

   lblPeriodo.Caption := xAnho + xMes;

   vSQL := 'SELECT ''*'' DPTOID, ''- TODOS LOS DEPARTAMENTOS -'' DPTODES '
      + '  FROM DUAL '
      + 'UNION ALL '
      + 'SELECT DPTOID, DPTODES '
      + '  FROM APO158 '
      + 'ORDER BY DPTOID';
   DM1.cdsQry23.Close;
   DM1.cdsQry23.DataRequest(vSQL);
   DM1.cdsQry23.Open;
   dblcdDptoId.LookupField := '';
   dblcdDptoId.LookupTable := DM1.cdsQry23;
   dblcdDptoId.LookupField := 'DPTOID';
   dblcdDptoId.Selected.Clear;
   dblcdDptoId.Selected.Add('DPTOID'#9'6'#9'CODIGO'#9#9);
   dblcdDptoId.Selected.Add('DPTODES'#9'25'#9'NOMBRE'#9#9);

END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespGralDetalle.dblcdCategoriaIdExit(
   Sender: TObject);
VAR
   vSQL: STRING;
BEGIN
   INHERITED;
   IF DM1.cdsQry22.Locate('CFC_A', dblcdCategoriaId.Text, []) THEN
   BEGIN
      meCategoriaDes.Text := DM1.cdsQry22.FieldByName('CFCDES_A').AsString;
      IF DM1.cdsQry22.FieldByName('CFC_A').AsString = '*' THEN
      BEGIN
         pDepartamento.Visible := false;
         pCategoriaF.Visible := false;
         btnMostrarGrafico.SetFocus;
      END
      ELSE
      BEGIN
         pCategoriaF.Visible := true;
         IF DM1.cdsQry24.RecordCount > 0 THEN dblcdCatFId.Text := '*';
      END;
   END
   ELSE
      meCategoriaDes.Text := '';
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespGralDetalle.dblcdCategoriaIdChange(
   Sender: TObject);
BEGIN
   INHERITED;
   dblcdCategoriaIdExit(dblcdCategoriaId);
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespGralDetalle.btnMostrarGraficoClick(Sender: TObject);
VAR
   vSQL: STRING;
   vTit: TStrings;
BEGIN
   INHERITED;
   IF TRIM(dblcdCategoriaId.Text) = '' THEN
   BEGIN
      showmessage('Seleccione una Categoria');
      exit;
   END;

   IF pCategoriaF.Visible THEN
      IF TRIM(dblcdCategoriaId.Text) = '' THEN
      BEGIN
         showmessage('Seleccione una Categoria Anterioro');
         exit;
      END;

   IF pDepartamento.Visible THEN
      IF TRIM(dblcdDptoId.Text) = '' THEN
      BEGIN
         showmessage('Seleccione un Departamento');
         exit;
      END;

   vTit := TStringList.Create;
   IF DM1.cdsQry22.FieldByName('CFC_A').AsString = '*' THEN
   BEGIN
      vSQL := 'SELECT CFCDES_A, ';
      CASE rgReporte.ItemIndex OF
         0: vSQL := vSQL + '       SUM(SALDOS_AT) SALDOS ';
         1: vSQL := vSQL + '       SUM(NUM_AT) ASOCIADOS ';
      END;
      vSQL := vSQL + '  FROM (SELECT CASE WHEN CFCDES_A IS NULL AND CFC_F = ''0'' THEN ''NUEVAS COLOCACIONES'' '
         + '                    WHEN CFCDES_A IS NULL AND CFC_F <> ''0'' THEN ''BLOQUEADOS'' '
         + '                    WHEN CFCDES_A IS NOT NULL THEN CFCDES_A '
         + '                END CFCDES_A, '
         + '               CASE WHEN CFC_A IS NULL AND CFC_F = ''0'' THEN ''Y'' '
         + '                    WHEN CFC_A IS NULL AND CFC_F <> ''0'' THEN ''R'' '
         + '                    WHEN CFC_A IS NOT NULL THEN CFC_A '
         + '                END CFC_A, '
         + '               NVL(SALDOS_AT, 0) SALDOS_AT, '
         + '               CASE WHEN NVL(SALDOS_AT, 0) > 0 THEN 1 ELSE 0 END NUM_AT '
         + '          FROM RIE_EST_GEN '
         + '         WHERE PERACT = ' + QuotedStr(xAnho + xMes) + ') '
         + 'GROUP BY CFC_A, CFCDES_A';

      vTit.Add('Por Categorias'); // por ahora una sola linea, xq se descuadran los comentarios
   END
   ELSE
   BEGIN
      IF DM1.cdsQry24.FieldByName('CFC_F').AsString = '*' THEN
      BEGIN
         vSQL := 'SELECT CFCDES_F, ';
         CASE rgReporte.ItemIndex OF
            0: vSQL := vSQL + '       SUM(SALDOS_FT) SALDOS ';
            1: vSQL := vSQL + '       SUM(NUM_FT) ASOCIADOS ';
         END;
         vSQL := vSQL + '  FROM (SELECT CASE WHEN CFC_A IS NULL AND CFC_F = ''0'' THEN ''Y'' '
            + '                    WHEN CFC_A IS NULL AND CFC_F <> ''0'' THEN ''R'' '
            + '                    WHEN CFC_A IS NOT NULL THEN CFC_A '
            + '                END CFC_A, '
            + '                NVL(CFC_F, ''X'') CFC_F, '
            + '                NVL(CFCDES_F, ''CANCELADO'') CFCDES_F, '
            + '                NVL(SALDOS_FT, 0) SALDOS_FT, '
            + '                CASE WHEN NVL(SALDOS_FT, 0) > 0 THEN 1 ELSE 0 END NUM_FT '
            + '           FROM RIE_EST_GEN '
            + '          WHERE PERACT = ' + QuotedStr(xAnho + xMes) + ') '
            + ' WHERE CFC_A = ' + QuotedStr(DM1.cdsQry22.FieldByName('CFC_A').AsString)
            + ' GROUP BY CFC_F, CFCDES_F';

         vTit.Add('Por Categorias(' + DM1.cdsQry22.FieldByName('CFC_A').AsString + ')'); // por ahora una sola linea, xq se descuadran los comentarios
      END
      ELSE
      BEGIN
         IF DM1.cdsQry23.FieldByName('DPTOID').AsString = '*' THEN
         BEGIN
            vSQL := 'SELECT C.DPTODES DPTODES, ';
            CASE rgReporte.ItemIndex OF
               0: vSQL := vSQL + ' SUM(NVL(SALDOS_FT,0)) TOTAL, '
                  + ' SUM(NVL(SALDOS_FP,0)) NO_VENCIDO, SUM(NVL(SALDOS_FV,0)) VENCIDO, '
                     + ' SUM(NVL(SALDOS_PV,0)) PROVISION ';

               1: vSQL := vSQL + '       COUNT(*) ASOCIADOS ';
            END;
            vSQL := vSQL + ' FROM RIE_EST_GEN A,APO101 B,APO158 C '
               + ' WHERE PERACT=' + QuotedStr(xAnho + xMes)
               + ' AND  CFC_F=' + QuotedStr(DM1.cdsQry24.FieldByName('CFC_F').AsString)
               + ' AND  CFC_A=' + QuotedStr(DM1.cdsQry22.FieldByName('CFC_A').AsString)
               + ' AND A.UPROID=B.UPROID(+) '
               + ' AND A.UPAGOID=B.UPAGOID(+) '
               + ' AND A.USEID=B.USEID(+) '
               + ' AND B.DPTOID=C.DPTOID(+) '
               + ' GROUP BY C.DPTODES '
               + ' ORDER BY C.DPTODES';
            vTit.Add('DE ' + QuotedStr(DM1.cdsQry22.FieldByName('CFCDES_A').AsString) + ' A ' + QuotedStr(DM1.cdsQry24.FieldByName('CFCDES_F').AsString)); // por ahora una sola linea, xq se descuadran los comentarios
         END
         ELSE
         BEGIN

            vSQL := 'SELECT B.USENOM USENOM, ';
            CASE rgReporte.ItemIndex OF
               0: vSQL := vSQL + ' SUM(NVL(SALDOS_FT,0)) TOTAL, SUM(NVL(SALDOS_FP,0)) NO_VENCIDO, '
                  + ' SUM(NVL(SALDOS_FV,0)) VENCIDO, SUM(NVL(SALDOS_PV,0)) PROVISION ';

               1: vSQL := vSQL + ' COUNT(*) ASOCIADOS ' ;
            END;
            vSQL := vSQL + ' FROM RIE_EST_GEN A,APO101 B,APO158 C  '
               + ' WHERE PERACT=' +  QuotedStr(xAnho + xMes)
               + ' AND  CFC_F=' + QuotedStr(DM1.cdsQry24.FieldByName('CFC_F').AsString)
               + ' AND CFC_A=' + QuotedStr(DM1.cdsQry22.FieldByName('CFC_A').AsString)
               + ' AND B.DPTOID=' + QuotedStr(DM1.cdsQry23.FieldByName('DPTOID').AsString)
               + ' AND A.UPROID=B.UPROID(+) '
               + ' AND A.UPAGOID=B.UPAGOID(+) '
               + ' AND A.USEID=B.USEID(+) '
               + ' AND B.DPTOID=C.DPTOID(+) '
               + ' GROUP BY B.DPTOID,C.DPTODES,B.USEID,B.USENOM '
               + ' ORDER BY B.DPTOID,C.DPTODES,B.USEID,B.USENOM ';

            vTit.Add('DE ' + QuotedStr(DM1.cdsQry22.FieldByName('CFCDES_A').AsString) + ' A ' + QuotedStr(DM1.cdsQry24.FieldByName('CFCDES_F').AsString)
               + '(' + DM1.cdsQry23.FieldByName('DPTODES').AsString + ')'); // por ahora una sola linea, xq se descuadran los comentarios

         END;
      END;
   END;
   crearGrafico(DM1.wModulo, vTit, vSQL);
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespGralDetalle.dblcdDptoIdChange(Sender: TObject);
BEGIN
   INHERITED;
   dblcdDptoIdExit(dblcdDptoId);
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespGralDetalle.dblcdDptoIdExit(Sender: TObject);
VAR
   vSQL: STRING;
BEGIN
   INHERITED;

   IF DM1.cdsQry23.Locate('DPTOID', dblcdDptoId.Text, []) THEN
   BEGIN
      meDptoDes.Text := DM1.cdsQry23.FieldByName('DPTODES').AsString;
      btnMostrarGrafico.SetFocus;
   END
   ELSE
      meDptoDes.Text := '';

END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespGralDetalle.dblcdCatFIdChange(Sender: TObject);
BEGIN
   INHERITED;
   dblcdCatFIdExit(dblcdDptoId);
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespGralDetalle.dblcdCatFIdExit(Sender: TObject);
BEGIN
   INHERITED;

   IF DM1.cdsQry24.Locate('CFC_F', dblcdCatFId.Text, []) THEN
   BEGIN
      meCatFDes.Text := DM1.cdsQry24.FieldByName('CFCDES_F').AsString;

      IF DM1.cdsQry24.FieldByName('CFC_F').AsString = '*' THEN
      BEGIN
         pDepartamento.Visible := false;
         btnMostrarGrafico.SetFocus;
      END
      ELSE
      BEGIN
         pDepartamento.Visible := true;
         IF DM1.cdsQry23.RecordCount > 0 THEN dblcdDptoId.Text := '*';
      END;
   END
   ELSE
      meCatFDes.Text := '';
END;
(******************************************************************************)
END.

