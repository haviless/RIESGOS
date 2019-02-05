// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FChart_SaldosVencidos
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Grafico de saldos vencidos
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

UNIT RSG120;

INTERFACE

USES
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, RSG114, RSG110, StdCtrls, Buttons, ExtCtrls, Mask, wwdblook,
   Wwdbdlg;

TYPE
   TFChart_SaldosVencidos = CLASS(TFChart)
      Panel1: TPanel;
      lblPeriodo: TLabel;
      btnMostrarGrafico: TBitBtn;
      Label1: TLabel;
      dblcdDptoId: TwwDBLookupComboDlg;
      meDptoDes: TMaskEdit;
      rgReporte: TRadioGroup;
      PROCEDURE FormShow(Sender: TObject);
      PROCEDURE btnMostrarGraficoClick(Sender: TObject);
      PROCEDURE dblcdDptoIdChange(Sender: TObject);
      PROCEDURE dblcdDptoIdExit(Sender: TObject);
   Private
      { Private declarations }
   Public
      xAnhoInicio: STRING;
      xMesInicio: STRING;
      xAnhoFin: STRING;
      xMesFin: STRING;
   END;

VAR
   FChart_SaldosVencidos: TFChart_SaldosVencidos;

IMPLEMENTATION

USES RSGDM1;

{$R *.dfm}

(******************************************************************************)

PROCEDURE TFChart_SaldosVencidos.FormShow(Sender: TObject);
VAR
   vSQL: STRING;
BEGIN
   INHERITED;
   vSQL := 'SELECT ''**'' DPTOID, ''- TODO LOS PERIODOS -'' DPTODES '
      + '  FROM DUAL '
      + 'UNION ALL '
      + 'SELECT ''*'' DPTOID, ''- TODOS LOS DEPARTAMENTOS -'' DPTODES '
      + '  FROM DUAL '
      + 'UNION ALL '
      + 'SELECT DPTOID, DPTODES '
      + '  FROM (SELECT DPTOID, DPTODES '
      + '          FROM APO158 '
      + '         ORDER BY DPTOID)';
   DM1.cdsQry23.Close;
   DM1.cdsQry23.DataRequest(vSQL);
   DM1.cdsQry23.Open;
   dblcdDptoId.LookupField := '';
   dblcdDptoId.LookupTable := DM1.cdsQry23;
   dblcdDptoId.LookupField := 'DPTOID';
   dblcdDptoId.Selected.Clear;
   dblcdDptoId.Selected.Add('DPTOID'#9'6'#9'CODIGO'#9#9);
   dblcdDptoId.Selected.Add('DPTODES'#9'25'#9'NOMBRE'#9#9);
   dblcdDptoId.SetFocus;
   IF DM1.cdsQry23.RecordCount > 0 THEN dblcdDptoId.Text := '**';
   lblPeriodo.Caption := xAnhoInicio + xMesInicio + ' - ' + xAnhoFin + xMesFin;
END;
(******************************************************************************)

PROCEDURE TFChart_SaldosVencidos.btnMostrarGraficoClick(Sender: TObject);
VAR
   vSQL: STRING;
   vTit: TStrings;
BEGIN
   IF TRIM(dblcdDptoId.Text) = '' THEN
   BEGIN
      showmessage('Seleccione un Departamento');
      exit;
   END;

   vTit := TStringList.Create;
   IF DM1.cdsQry23.FieldByName('DPTOID').AsString = '**' THEN
   BEGIN
      vSQL := 'SELECT PERIODO, ';
      CASE rgReporte.ItemIndex OF
         0: vSQL := vSQL + ' SUM(PROPOT) PROPOT, '
            + '       SUM(DEFICIENTE) DEFICIENTE, '
               + '       SUM(DUDOSO) DUDOSO, '
               + '       SUM(PERDIDA) PERDIDA, '
               + '       SUM(TOTAL) TOTAL ';
         1: vSQL := vSQL + ' SUM(NUMPOT) NUMPOT, '
            + '       SUM(NUMDEF) NUMDEF, '
               + '       SUM(NUMDUD) NUMDUD, '
               + '       SUM(NUMPER) NUMPER, '
               + '       COUNT(*) NUMTOT ';
      END;
      vSQL := vSQL + '  FROM (SELECT DPTOID, DPTODES, USEID, USENOM, MESANNO, PERIODO, '
         + '               CASE WHEN CFC_F=''0'' THEN SALDOS_FV ELSE 0 END NORMAL, '
         + '               CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR, '
         + '               CASE WHEN CFC_F=''A'' THEN SALDOS_FV ELSE 0 END PROPOT, '
         + '               CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT, '
         + '               CASE WHEN CFC_F=''B'' THEN SALDOS_FV ELSE 0 END DEFICIENTE, '
         + '               CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF, '
         + '               CASE WHEN CFC_F=''C'' THEN SALDOS_FV ELSE 0 END DUDOSO, '
         + '               CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD, '
         + '               CASE WHEN CFC_F=''D'' THEN SALDOS_FV ELSE 0 END PERDIDA, '
         + '               CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER, '
         + '               SALDOS_FV TOTAL '
         + '           FROM (SELECT PERIODO, CFC_F, CFCDES_F, B.DPTOID, C.DPTODES, A.UPROID, '
         + '                         A.UPAGOID, A.USEID, B.USENOM, DIASTRANS, SALDOS_FV, '
         + '                         CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''01'' '
         + '                              WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''02'' '
         + '                              WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''03'' '
         + '                              WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''04'' '
         + '                              WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''05'' '
         + '                              WHEN DIASTRANS > 123 THEN  ''06'' '
         + '                          END IDDIAS, '
         + '                         CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''ENTRE 0 Y 8 DIAS'' '
         + '                              WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''ENTRE 9 Y 31 DIAS'' '
         + '                              WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE 32 Y 62 DIAS'' '
         + '                              WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE 63 Y 93 DIAS'' '
         + '                              WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE 94 Y 123 DIAS'' '
         + '                              WHEN DIASTRANS > 123 THEN  '' pMAS DE 123 DIAS '' '
         + '                          END DIASDESC, '
         + '                         1 ASOCIADOS, '
         + '                         MESDESC || ''-'' || SUBSTR(PERIODO, 1, 4) MESANNO '
         + '                    FROM CFC000 A, APO101 B, APO158 C, TGE181 D '
         + '                   WHERE A.PERIODO >= ' + QuotedStr(xAnhoInicio + xMesInicio)
         + '                     AND A.PERIODO <= ' + QuotedStr(xAnhoFin + xMesFin)
         + '                     AND A.UPROID = B.UPROID(+) '
         + '                     AND A.UPAGOID = B.UPAGOID(+) '
         + '                     AND A.USEID = B.USEID(+) '
         + '                     AND B.DPTOID = C.DPTOID(+) '
         + '                     AND NVL(SALDOS_FV, 0) > 0 '
         + '                     AND SUBSTR(PERIODO, 5, 2) = D.MESIDR)) '
         + ' GROUP BY PERIODO '
         + ' ORDER BY PERIODO ';

      vTit.Add('Todos los Periodos'); // por ahora una sola linea, xq se descuadran los comentarios
   END
   ELSE
      IF DM1.cdsQry23.FieldByName('DPTOID').AsString = '*' THEN
      BEGIN
         vSQL := 'SELECT DPTODES, ';
         CASE rgReporte.ItemIndex OF
            0: vSQL := vSQL + ' SUM(PROPOT) PROPOT, '
               + '       SUM(DEFICIENTE) DEFICIENTE, '
                  + '       SUM(DUDOSO) DUDOSO, '
                  + '       SUM(PERDIDA) PERDIDA, '
                  + '       SUM(TOTAL) TOTAL ';
            1: vSQL := vSQL + ' SUM(NUMPOT) NUMPOT, '
               + '       SUM(NUMDEF) NUMDEF, '
                  + '       SUM(NUMDUD) NUMDUD, '
                  + '       SUM(NUMPER) NUMPER, '
                  + '       COUNT(*) NUMTOT ';
         END;
         vSQL := vSQL + '  FROM (SELECT DPTOID, DPTODES, USEID, USENOM, MESANNO, PERIODO, '
            + '               CASE WHEN CFC_F=''0'' THEN SALDOS_FV ELSE 0 END NORMAL, '
            + '               CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR, '
            + '               CASE WHEN CFC_F=''A'' THEN SALDOS_FV ELSE 0 END PROPOT, '
            + '               CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT, '
            + '               CASE WHEN CFC_F=''B'' THEN SALDOS_FV ELSE 0 END DEFICIENTE, '
            + '               CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF, '
            + '               CASE WHEN CFC_F=''C'' THEN SALDOS_FV ELSE 0 END DUDOSO, '
            + '               CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD, '
            + '               CASE WHEN CFC_F=''D'' THEN SALDOS_FV ELSE 0 END PERDIDA, '
            + '               CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER, '
            + '               SALDOS_FV TOTAL '
            + '           FROM (SELECT PERIODO, CFC_F, CFCDES_F, B.DPTOID, C.DPTODES, A.UPROID, '
            + '                         A.UPAGOID, A.USEID, B.USENOM, DIASTRANS, SALDOS_FV, '
            + '                         CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''01'' '
            + '                              WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''02'' '
            + '                              WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''03'' '
            + '                              WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''04'' '
            + '                              WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''05'' '
            + '                              WHEN DIASTRANS > 123 THEN  ''06'' '
            + '                          END IDDIAS, '
            + '                         CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''ENTRE 0 Y 8 DIAS'' '
            + '                              WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''ENTRE 9 Y 31 DIAS'' '
            + '                              WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE 32 Y 62 DIAS'' '
            + '                              WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE 63 Y 93 DIAS'' '
            + '                              WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE 94 Y 123 DIAS'' '
            + '                              WHEN DIASTRANS > 123 THEN  '' pMAS DE 123 DIAS '' '
            + '                          END DIASDESC, '
            + '                         1 ASOCIADOS, '
            + '                         MESDESC || ''-'' || SUBSTR(PERIODO, 1, 4) MESANNO '
            + '                    FROM CFC000 A, APO101 B, APO158 C, TGE181 D '
            + '                   WHERE A.PERIODO >= ' + QuotedStr(xAnhoInicio + xMesInicio)
            + '                     AND A.PERIODO <= ' + QuotedStr(xAnhoFin + xMesFin)
            + '                     AND A.UPROID = B.UPROID(+) '
            + '                     AND A.UPAGOID = B.UPAGOID(+) '
            + '                     AND A.USEID = B.USEID(+) '
            + '                     AND B.DPTOID = C.DPTOID(+) '
            + '                     AND NVL(SALDOS_FV, 0) > 0 '
            + '                     AND SUBSTR(PERIODO, 5, 2) = D.MESIDR)) '
            + ' GROUP BY DPTODES '
            + ' ORDER BY DPTODES ';

         vTit.Add('Todos los Departamentos'); // por ahora una sola linea, xq se descuadran los comentarios
      END
      ELSE
      BEGIN
         vSQL := 'SELECT PERIODO, ';
         CASE rgReporte.ItemIndex OF
            0: vSQL := vSQL + ' SUM(PROPOT) PROPOT, '
               + '       SUM(DEFICIENTE) DEFICIENTE, '
                  + '       SUM(DUDOSO) DUDOSO, '
                  + '       SUM(PERDIDA) PERDIDA, '
                  + '       SUM(TOTAL) TOTAL ';
            1: vSQL := vSQL + ' SUM(NUMPOT) NUMPOT, '
               + '       SUM(NUMDEF) NUMDEF, '
                  + '       SUM(NUMDUD) NUMDUD, '
                  + '       SUM(NUMPER) NUMPER, '
                  + '       COUNT(*) NUMTOT ';
         END;
         vSQL := vSQL + '  FROM (SELECT DPTOID, DPTODES, USEID, USENOM, MESANNO, PERIODO, '
            + '               CASE WHEN CFC_F=''0'' THEN SALDOS_FV ELSE 0 END NORMAL, '
            + '               CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR, '
            + '               CASE WHEN CFC_F=''A'' THEN SALDOS_FV ELSE 0 END PROPOT, '
            + '               CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT, '
            + '               CASE WHEN CFC_F=''B'' THEN SALDOS_FV ELSE 0 END DEFICIENTE, '
            + '               CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF, '
            + '               CASE WHEN CFC_F=''C'' THEN SALDOS_FV ELSE 0 END DUDOSO, '
            + '               CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD, '
            + '               CASE WHEN CFC_F=''D'' THEN SALDOS_FV ELSE 0 END PERDIDA, '
            + '               CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER, '
            + '               SALDOS_FV TOTAL '
            + '           FROM (SELECT PERIODO, CFC_F, CFCDES_F, B.DPTOID, C.DPTODES, A.UPROID, '
            + '                         A.UPAGOID, A.USEID, B.USENOM, DIASTRANS, SALDOS_FV, '
            + '                         CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''01'' '
            + '                              WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''02'' '
            + '                              WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''03'' '
            + '                              WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''04'' '
            + '                              WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''05'' '
            + '                              WHEN DIASTRANS > 123 THEN  ''06'' '
            + '                          END IDDIAS, '
            + '                         CASE WHEN DIASTRANS BETWEEN 0 AND 8 THEN ''ENTRE 0 Y 8 DIAS'' '
            + '                              WHEN DIASTRANS BETWEEN 9 AND 31 THEN  ''ENTRE 9 Y 31 DIAS'' '
            + '                              WHEN DIASTRANS BETWEEN 32 AND 62 THEN ''ENTRE 32 Y 62 DIAS'' '
            + '                              WHEN DIASTRANS BETWEEN 63 AND 93 THEN ''ENTRE 63 Y 93 DIAS'' '
            + '                              WHEN DIASTRANS BETWEEN 94 AND 123 THEN ''ENTRE 94 Y 123 DIAS'' '
            + '                              WHEN DIASTRANS > 123 THEN  '' pMAS DE 123 DIAS '' '
            + '                          END DIASDESC, '
            + '                         1 ASOCIADOS, '
            + '                         MESDESC || ''-'' || SUBSTR(PERIODO, 1, 4) MESANNO '
            + '                    FROM CFC000 A, APO101 B, APO158 C, TGE181 D '
            + '                   WHERE A.PERIODO >= ' + QuotedStr(xAnhoInicio + xMesInicio)
            + '                     AND A.PERIODO <= ' + QuotedStr(xAnhoFin + xMesFin)
            + '                     AND A.UPROID = B.UPROID(+) '
            + '                     AND A.UPAGOID = B.UPAGOID(+) '
            + '                     AND A.USEID = B.USEID(+) '
            + '                     AND B.DPTOID = C.DPTOID(+) '
            + '                     AND C.DPTOID = ' + QuotedStr(DM1.cdsQry23.FieldByName('DPTOID').AsString)
            + '                     AND NVL(SALDOS_FV, 0) > 0 '
            + '                     AND SUBSTR(PERIODO, 5, 2) = D.MESIDR)) '
            + ' GROUP BY PERIODO '
            + ' ORDER BY PERIODO ';

         vTit.Add('Por Departamento(' + DM1.cdsQry23.FieldByName('DPTOID').AsString + ')'); // por ahora una sola linea, xq se descuadran los comentarios
      END;
   crearGrafico(DM1.wModulo, vTit, vSQL);
END;
(******************************************************************************)

PROCEDURE TFChart_SaldosVencidos.dblcdDptoIdChange(Sender: TObject);
BEGIN
   INHERITED;
   dblcdDptoIdExit(dblcdDptoId);
END;
(******************************************************************************)

PROCEDURE TFChart_SaldosVencidos.dblcdDptoIdExit(Sender: TObject);
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
END.

