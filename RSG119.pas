// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FChart_MatrizDespDAtraConc
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Grafico de matriz de desplazamiento por dias de atraso / concentracion
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

UNIT RSG119;

INTERFACE

USES
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, RSG114, RSG110, StdCtrls, Buttons, ExtCtrls, Mask, wwdblook,
   Wwdbdlg;

TYPE
   TFChart_MatrizDespDAtraConc = CLASS(TFChart)
      Panel1: TPanel;
      rgReporte: TRadioGroup;
      btnMostrarGrafico: TBitBtn;
      rgTotalVencidos: TRadioGroup;
      gbDias: TGroupBox;
      Label2: TLabel;
      dblcdCategoriaId: TwwDBLookupComboDlg;
      meCategoriaDes: TMaskEdit;
      rgDias_SalAso: TRadioGroup;
      gbDptoUgel: TGroupBox;
      pDepartamento: TPanel;
      Label1: TLabel;
      dblcdDptoId: TwwDBLookupComboDlg;
      meDptoDes: TMaskEdit;
      Label3: TLabel;
      dblcCategoriaIdDpto: TwwDBLookupComboDlg;
      meCategoriaDpto: TMaskEdit;
      rgDptoUgel: TRadioGroup;
    lblPeriodo: TLabel;
    rdbTipCar: TRadioGroup;
    rdbTipAso: TRadioGroup;
      PROCEDURE btnMostrarGraficoClick(Sender: TObject);
      PROCEDURE rgReporteClick(Sender: TObject);
      PROCEDURE FormShow(Sender: TObject);
      PROCEDURE dblcdCategoriaIdChange(Sender: TObject);
      PROCEDURE dblcdCategoriaIdExit(Sender: TObject);
      PROCEDURE dblcCategoriaIdDptoExit(Sender: TObject);
      PROCEDURE dblcCategoriaIdDptoChange(Sender: TObject);
      PROCEDURE dblcdDptoIdChange(Sender: TObject);
      PROCEDURE dblcdDptoIdExit(Sender: TObject);
   Private
      { Private declarations }
   Public
      xAnho: STRING;
      xMes: STRING;
   END;

VAR
   FChart_MatrizDespDAtraConc: TFChart_MatrizDespDAtraConc;

IMPLEMENTATION

USES RSGDM1;

{$R *.dfm}

(******************************************************************************)

PROCEDURE TFChart_MatrizDespDAtraConc.FormShow(Sender: TObject);
VAR
   vSQL: STRING;
BEGIN
   INHERITED;
   vSQL := 'SELECT ''*'' CFC_F, ''- MOSTRAR RESUMEN -'' CFCDES_F '
      + '  FROM DUAL '
      + ' UNION ALL '
      + 'SELECT RESUMEID CFC_F, RESUMEDES CFCDES_F '
      + '  FROM COB113 ';
   DM1.cdsQry22.Close;
   DM1.cdsQry22.DataRequest(vSQL);
   DM1.cdsQry22.Open;
   dblcdCategoriaId.LookupField := '';
   dblcdCategoriaId.LookupTable := DM1.cdsQry22;
   dblcdCategoriaId.LookupField := 'CFC_F';
   dblcdCategoriaId.Selected.Clear;
   dblcdCategoriaId.Selected.Add('CFC_F'#9'6'#9'CODIGO'#9#9);
   dblcdCategoriaId.Selected.Add('CFCDES_F'#9'25'#9'NOMBRE'#9#9);
   IF DM1.cdsQry22.RecordCount > 0 THEN dblcdCategoriaId.Text := '*';

   dblcCategoriaIdDpto.LookupField := '';
   dblcCategoriaIdDpto.LookupTable := DM1.cdsQry22;
   dblcCategoriaIdDpto.LookupField := 'CFC_F';
   dblcCategoriaIdDpto.Selected.Clear;
   dblcCategoriaIdDpto.Selected.Add('CFC_F'#9'6'#9'CODIGO'#9#9);
   dblcCategoriaIdDpto.Selected.Add('CFCDES_F'#9'25'#9'NOMBRE'#9#9);
   IF DM1.cdsQry22.RecordCount > 0 THEN dblcCategoriaIdDpto.Text := '*';

   rgReporte.ItemIndex := 0;
   rgReporteClick(rgReporte);
   lblPeriodo.Caption:=xAnho+xMes;   
END;

(******************************************************************************)

PROCEDURE TFChart_MatrizDespDAtraConc.rgReporteClick(Sender: TObject);
BEGIN
   INHERITED;
   rgTotalVencidos.visible := ((rgReporte.ItemIndex = 0) OR (rgReporte.ItemIndex = 1));
   gbDias.visible := (rgReporte.ItemIndex = 2);
   gbDptoUgel.Visible := (rgReporte.ItemIndex = 3);
   IF gbDias.visible THEN dblcdCategoriaIdChange(dblcdCategoriaId);
   IF gbDptoUgel.Visible THEN dblcCategoriaIdDptoChange(dblcCategoriaIdDpto);
END;

(******************************************************************************)

PROCEDURE TFChart_MatrizDespDAtraConc.btnMostrarGraficoClick(
   Sender: TObject);
VAR
   vSQL: STRING;
   vTit: TStrings;
   xWhere,xTitulo: String;
BEGIN
   INHERITED;

    Case rdbTipCar.ItemIndex Of
         0:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND TIPASO=''DO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND TIPASO=''CE'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND TIPASO=''CO'' '; xTitulo:='Tipo de Cartera : GENERAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         1:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND TIPCAR=''1''  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND TIPCAR=''1'' AND TIPASO=''DO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND TIPCAR=''1'' AND TIPASO=''CE''  '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND TIPCAR=''1'' AND TIPASO=''CO'' '; xTitulo:='Tipo de Cartera : NORMAL    Tipo Asociado: CONTRATADOS';
                      End;
               End;
           End;
         2:Begin
               Case rdbTipAso.ItemIndex Of
                    0:Begin
                        xWhere:=' AND TIPCAR=''2'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: GENERAL';
                      End;
                    1:Begin
                        xWhere:=' AND TIPCAR=''2'' AND TIPASO=''DO'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: ACTIVOS';
                      End;
                    2:Begin
                        xWhere:=' AND TIPCAR=''2'' AND TIPASO=''CE'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: CESANTES';
                      End;
                    3:Begin
                        xWhere:=' AND TIPCAR=''2'' AND TIPASO=''CO'' '; xTitulo:='Tipo de Cartera : REFIANCIADA    Tipo Asociado: CONTRATADOS';
                      End;
               End;

           End;
    End;



   vTit := TStringList.Create;
   CASE rgReporte.ItemIndex OF
      0:
         BEGIN
            vSQL := 'SELECT OFDESNOM, ';
            CASE rgTotalVencidos.ItemIndex OF
               0:
                  vSQL := vSQL + 'SUM(NUMNOR) NUMNOR, '
                     + 'SUM(NUMPOT) NUMPOT, '
                     + 'SUM(NUMDEF) NUMDEF, '
                     + 'SUM(NUMDUD) NUMDUD,'
                     + 'SUM(NUMPER) NUMPER, '
                     + 'COUNT(*) NUMTOT ';
               1: vSQL := vSQL + ' SUM(NORMAL) NORMAL, '
                  + 'SUM(PROPOT) PROPOT, '
                     + 'SUM(DEFICIENTE) DEFICIENTE, '
                     + 'SUM(DUDOSO) DUDOSO, '
                     + 'SUM(PERDIDA) PERDIDA,SUM(TOTAL) TOTAL ';
            END;
            vSQL := vSQL + 'FROM (SELECT CFC_F,CFCDES_F,OFDESID, CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NORMAL, ' +
               'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR, CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END PROPOT, ' +
               'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT,CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEFICIENTE, ' +
               'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF,CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUDOSO, ' +
               'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD,CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PERDIDA, ' +
               'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER ,SALDOS_FT TOTAL FROM RIE_EST_GEN '
               + 'WHERE PERACT=' + QuotedStr(xAnho + xMes) + ' AND CFC_F IS NOT NULL) A,APO110 B '
               + 'WHERE A.OFDESID=B.OFDESID(+) '
               + 'GROUP BY A.OFDESID,OFDESNOM ';
            vTit.Add('Total - Asociados'); // por ahora una sola linea, xq se descuadran los comentarios

         END;
      1:
         BEGIN
            vSQL := 'SELECT OFDESNOM, ';
            CASE rgTotalVencidos.ItemIndex OF
               0: vSQL := vSQL + 'SUM(NUMNOR) NUMNOR, '
                  + '       SUM(NUMPOT) NUMPOT, '
                     + '       SUM(NUMDEF) NUMDEF, '
                     + '       SUM(NUMDUD) NUMDUD, '
                     + '       SUM(NUMPER) NUMPER, '
                     + '       COUNT(*) NUMTOT ';
               1: vSQL := vSQL + 'SUM(NORMAL) NORMAL, '
                  + '       SUM(PROPOT) PROPOT, '
                     + '       SUM(DEFICIENTE) DEFICIENTE, '
                     + '       SUM(DUDOSO) DUDOSO, '
                     + '       SUM(PERDIDA) PERDIDA, '
                     + '       SUM(TOTAL) TOTAL ';
            END;

            vSQL := vSQL + 'FROM (SELECT CFC_F,CFCDES_F,OFDESID, CASE WHEN CFC_F=''0'' THEN SALDOS_FV ELSE 0 END NORMAL, ' +
               'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NUMNOR, CASE WHEN CFC_F=''A'' THEN SALDOS_FV ELSE 0 END PROPOT, ' +
               'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END NUMPOT,CASE WHEN CFC_F=''B'' THEN SALDOS_FV ELSE 0 END DEFICIENTE, ' +
               'CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END NUMDEF,CASE WHEN CFC_F=''C'' THEN SALDOS_FV ELSE 0 END DUDOSO, ' +
               'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END NUMDUD,CASE WHEN CFC_F=''D'' THEN SALDOS_FV ELSE 0 END PERDIDA, ' +
               'CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END NUMPER ,SALDOS_FV TOTAL '
               + 'FROM RIE_EST_GEN '
               + 'WHERE PERACT=' + QuotedStr(xAnho + xMes) + ' AND CFC_F IS NOT NULL) A,APO110 B ' +
               'WHERE A.OFDESID=B.OFDESID(+) GROUP BY A.OFDESID,OFDESNOM ';

         END;
      2:
         BEGIN
            IF TRIM(dblcdCategoriaId.Text) = '' THEN
            BEGIN
               showmessage('Seleccione una Categoria');
               exit;
            END;

            IF DM1.cdsQry22.FieldByName('CFC_F').AsString = '*' THEN
            BEGIN
               vSQL := 'SELECT CFCDES_F, ';
               CASE rgDias_SalAso.ItemIndex OF
                  0: vSQL := vSQL + '       SUM(SALDOS_FT) TOTAL,SUM(SALDOS_FV) VENCIDO,SUM(SALDOS_FP) NO_VENCIDO, '
                     + '       SUM(SALDOS_PV) PROVISION,SUM(SALDOS_CB) SALDOS_CB,SUM(SALDOS_NC) SALDOS_NC ';
                  1: vSQL := vSQL + '       SUM(ASOCIADOS) ASOCIADOS ';
               END;
               vSQL := vSQL + '  FROM (' + DM1.ConsultaDiasAtraso(xAnho + xMes) + ')'
                  + ' GROUP BY CFC_F,CFCDES_F ';
               vTit.Add('Días/Por Categorias'); // por ahora una sola linea, xq se descuadran los comentarios
            END
            ELSE
            BEGIN

               vSQL := 'SELECT DIASDESC, ';
               CASE rgDias_SalAso.ItemIndex OF
                  0: vSQL := vSQL + '       SUM(SALDOS_FT) TOTAL,SUM(SALDOS_FV) VENCIDO,SUM(SALDOS_FP) NO_VENCIDO, '
                     + '       SUM(SALDOS_PV) PROVISION,SUM(SALDOS_CB) SALDOS_CB,SUM(SALDOS_NC) SALDOS_NC ';
                  1: vSQL := vSQL + '       SUM(ASOCIADOS) ASOCIADOS ';
               END;
               vSQL := vSQL + '  FROM (' + DM1.ConsultaDiasAtraso(xAnho + xMes) + ')'
                  + ' WHERE CFC_F =' + QuotedStr(DM1.cdsQry22.FieldByName('CFC_F').AsString)
                  + ' GROUP BY DIASDESC ';

               vTit.Add('Días(' + DM1.cdsQry22.FieldByName('CFC_F').AsString + ')'); // por ahora una sola linea, xq se descuadran los comentarios
            END;
         END;
      3:
         BEGIN

            IF TRIM(dblcCategoriaIdDpto.Text) = '' THEN
            BEGIN
               showmessage('Seleccione una Categoria');
               exit;
            END;

            IF pDepartamento.Visible THEN
               IF TRIM(dblcdDptoId.Text) = '' THEN
               BEGIN
                  showmessage('Seleccione un Departamento');
                  exit;
               END;

            IF DM1.cdsQry22.FieldByName('CFC_F').AsString = '*' THEN
            BEGIN

               vSQL := 'SELECT CFCDES_F, ';

               CASE rgDptoUgel.ItemIndex OF
                  0: vSQL := vSQL + ' SUM(NORMAL) NORMAL, '
                     + '       SUM(PROPOT) PROPOT, '
                        + '       SUM(DEFICIENTE) DEFICIENTE, '
                        + '       SUM(DUDOSO) DUDOSO, '
                        + '       SUM(PERDIDA) PERDIDA, '
                        + '       SUM(TOTAL) TOTAL ';
                  1: vSQL := vSQL + ' SUM(NUMNOR) NUMNOR, '
                     + '       SUM(NUMPOT) NUMPOT, '
                        + '       SUM(NUMDEF) NUMDEF, '
                        + '       SUM(NUMDUD) NUMDUD, '
                        + '       SUM(NUMPER) NUMPER, '
                        + '       COUNT(*) NUMTOT ';
               END;

               vSQL := vSQL + '  FROM (SELECT DPTOID, CFC_F, CFCDES_F, OFDESID, UPROID, UPAGOID, USEID, '
                  + '               CASE WHEN CFC_F = '' 0 '' THEN SALDOS_FV ELSE 0 END NORMAL, '
                  + '               CASE WHEN CFC_F = '' A '' THEN SALDOS_FV ELSE 0 END PROPOT, '
                  + '               CASE WHEN CFC_F = '' B '' THEN SALDOS_FV ELSE 0 END DEFICIENTE, '
                  + '               CASE WHEN CFC_F = '' C '' THEN SALDOS_FV ELSE 0 END DUDOSO, '
                  + '               CASE WHEN CFC_F = '' D '' THEN SALDOS_FV ELSE 0 END PERDIDA, '
                  + '               CASE WHEN CFC_F = '' 0 '' THEN 1 ELSE 0 END NUMNOR, '
                  + '               CASE WHEN CFC_F = '' A '' THEN 1 ELSE 0 END NUMPOT, '
                  + '               CASE WHEN CFC_F = '' B '' THEN 1 ELSE 0 END NUMDEF, '
                  + '               CASE WHEN CFC_F = '' C '' THEN 1 ELSE 0 END NUMDUD, '
                  + '               CASE WHEN CFC_F = '' D '' THEN 1 ELSE 0 END NUMPER, '
                  + '               SALDOS_FV TOTAL '
                  + '           FROM RIE_EST_GEN '
                  + '          WHERE PERACT = ' + QuotedStr(xAnho + xMes)
                  + '            AND CFC_F IS NOT NULL'
                  + ' ) A, APO101 B, APO158 C '
                  + ' WHERE A.UPROID = B.UPROID(+) '
                  + '   AND A.UPAGOID = B.UPAGOID(+) '
                  + '   AND A.USEID = B.USEID(+) '
                  + '   AND A.DPTOID = C.DPTOID(+) '
                  + ' GROUP BY CFCDES_F '
                  + ' ORDER BY CFCDES_F ';
            END
            ELSE
            BEGIN
               IF DM1.cdsQry23.FieldByName('DPTOID').AsString = '*' THEN
               BEGIN
                  vSQL := 'SELECT DPTODES, ';

                  CASE rgDptoUgel.ItemIndex OF
                     0: vSQL := vSQL + ' SUM(NORMAL) NORMAL, '
                        + '       SUM(PROPOT) PROPOT, '
                           + '       SUM(DEFICIENTE) DEFICIENTE, '
                           + '       SUM(DUDOSO) DUDOSO, '
                           + '       SUM(PERDIDA) PERDIDA, '
                           + '       SUM(TOTAL) TOTAL ';
                     1: vSQL := vSQL + ' SUM(NUMNOR) NUMNOR, '
                        + '       SUM(NUMPOT) NUMPOT, '
                           + '       SUM(NUMDEF) NUMDEF, '
                           + '       SUM(NUMDUD) NUMDUD, '
                           + '       SUM(NUMPER) NUMPER, '
                           + '       COUNT(*) NUMTOT ';
                  END;

                  vSQL := vSQL + '  FROM (SELECT DPTOID, CFC_F, CFCDES_F, OFDESID, UPROID, UPAGOID, USEID, '
                     + '               CASE WHEN CFC_F = '' 0 '' THEN SALDOS_FV ELSE 0 END NORMAL, '
                     + '               CASE WHEN CFC_F = '' A '' THEN SALDOS_FV ELSE 0 END PROPOT, '
                     + '               CASE WHEN CFC_F = '' B '' THEN SALDOS_FV ELSE 0 END DEFICIENTE, '
                     + '               CASE WHEN CFC_F = '' C '' THEN SALDOS_FV ELSE 0 END DUDOSO, '
                     + '               CASE WHEN CFC_F = '' D '' THEN SALDOS_FV ELSE 0 END PERDIDA, '
                     + '               CASE WHEN CFC_F = '' 0 '' THEN 1 ELSE 0 END NUMNOR, '
                     + '               CASE WHEN CFC_F = '' A '' THEN 1 ELSE 0 END NUMPOT, '
                     + '               CASE WHEN CFC_F = '' B '' THEN 1 ELSE 0 END NUMDEF, '
                     + '               CASE WHEN CFC_F = '' C '' THEN 1 ELSE 0 END NUMDUD, '
                     + '               CASE WHEN CFC_F = '' D '' THEN 1 ELSE 0 END NUMPER, '
                     + '               SALDOS_FV TOTAL '
                     + '           FROM RIE_EST_GEN '
                     + '          WHERE PERACT = ' + QuotedStr(xAnho + xMes)
                     + '            AND CFC_F IS NOT NULL'
                     + '            AND CFC_F =' + QuotedStr(DM1.cdsQry22.FieldByName('CFC_F').AsString)
                     + ' ) A, APO101 B, APO158 C '
                     + ' WHERE A.UPROID = B.UPROID(+) '
                     + '   AND A.UPAGOID = B.UPAGOID(+) '
                     + '   AND A.USEID = B.USEID(+) '
                     + '   AND A.DPTOID = C.DPTOID(+) '
                     + ' GROUP BY DPTODES '
                     + ' ORDER BY DPTODES ';
                  vTit.Add('Por Categorias'); // por ahora una sola linea, xq se descuadran los comentarios

               END
               ELSE
               BEGIN
                  vSQL := 'SELECT B.USENOM,';
                  CASE rgDptoUgel.ItemIndex OF
                     0: vSQL := vSQL + ' SUM(NORMAL) NORMAL, '
                        + '       SUM(PROPOT) PROPOT, '
                           + '       SUM(DEFICIENTE) DEFICIENTE, '
                           + '       SUM(DUDOSO) DUDOSO, '
                           + '       SUM(PERDIDA) PERDIDA, '
                           + '       SUM(TOTAL) TOTAL ';
                     1: vSQL := vSQL + ' SUM(NUMNOR) NUMNOR, '
                        + '       SUM(NUMPOT) NUMPOT, '
                           + '       SUM(NUMDEF) NUMDEF, '
                           + '       SUM(NUMDUD) NUMDUD, '
                           + '       SUM(NUMPER) NUMPER, '
                           + '       COUNT(*) NUMTOT ';
                  END;
                  vSQL := vSQL + '  FROM (SELECT DPTOID, CFC_F, CFCDES_F, OFDESID, UPROID, UPAGOID, USEID, '
                     + '               CASE WHEN CFC_F = ''0'' THEN SALDOS_FV ELSE 0 END NORMAL, '
                     + '               CASE WHEN CFC_F = ''A'' THEN SALDOS_FV ELSE 0 END PROPOT, '
                     + '               CASE WHEN CFC_F = ''B'' THEN SALDOS_FV ELSE 0 END DEFICIENTE, '
                     + '               CASE WHEN CFC_F = ''C'' THEN SALDOS_FV ELSE 0 END DUDOSO, '
                     + '               CASE WHEN CFC_F = ''D'' THEN SALDOS_FV ELSE 0 END PERDIDA, '
                     + '               CASE WHEN CFC_F = ''0'' THEN 1 ELSE 0 END NUMNOR, '
                     + '               CASE WHEN CFC_F = ''A'' THEN 1 ELSE 0 END NUMPOT, '
                     + '               CASE WHEN CFC_F = ''B'' THEN 1 ELSE 0 END NUMDEF, '
                     + '               CASE WHEN CFC_F = ''C'' THEN 1 ELSE 0 END NUMDUD, '
                     + '               CASE WHEN CFC_F = ''D'' THEN 1 ELSE 0 END NUMPER, '
                     + '               SALDOS_FV TOTAL '
                     + '           FROM RIE_EST_GEN '
                     + '          WHERE PERACT = ' + QuotedStr(xAnho + xMes)
                     + '            AND CFC_F IS NOT NULL '
                     + '            AND CFC_F =' + QuotedStr(DM1.cdsQry22.FieldByName('CFC_F').AsString)
                     + '            AND DPTOID =' + QuotedStr(DM1.cdsQry23.FieldByName('DPTOID').AsString) + ') A, APO101 B, APO158 C '
                     + ' WHERE A.UPROID = B.UPROID(+) '
                     + '   AND A.UPAGOID = B.UPAGOID(+) '
                     + '   AND A.USEID = B.USEID(+) '
                     + '   AND A.DPTOID = C.DPTOID(+) '
                     + ' GROUP BY B.USENOM '
                     + ' ORDER BY B.USENOM';
                  vTit.Add('Por Departamentos(' + DM1.cdsQry22.FieldByName('CFCDES_F').AsString + ')'); // por ahora una sola linea, xq se descuadran los comentarios
               END;
            END;
         END;
      4:
         BEGIN
            showmessage('Este reporte aun se esta implementando.. Muchas Gracias!!');
            self.FraChartP1.LimpiarDatos();
            exit;
         END;
   END;
   crearGrafico(DM1.wModulo, vTit, vSQL);
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespDAtraConc.dblcdCategoriaIdChange(
   Sender: TObject);
BEGIN
   INHERITED;
   dblcdCategoriaIdExit(dblcdCategoriaId);
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespDAtraConc.dblcdCategoriaIdExit(
   Sender: TObject);
VAR
   vSQL: STRING;
BEGIN
   INHERITED;
   IF DM1.cdsQry22.Locate('CFC_F', dblcdCategoriaId.Text, []) THEN
   BEGIN
      meCategoriaDes.Text := DM1.cdsQry22.FieldByName('CFCDES_F').AsString;
      btnMostrarGrafico.SetFocus;
   END
   ELSE
      meCategoriaDes.Text := '';
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespDAtraConc.dblcCategoriaIdDptoExit(
   Sender: TObject);
VAR
   vSQL: STRING;
BEGIN
   INHERITED;
   IF DM1.cdsQry22.Locate('CFC_F', dblcCategoriaIdDpto.Text, []) THEN
   BEGIN
      meCategoriaDpto.Text := DM1.cdsQry22.FieldByName('CFCDES_F').AsString;
      IF DM1.cdsQry22.FieldByName('CFC_F').AsString = '*' THEN
      BEGIN
         pDepartamento.Visible := false;
         btnMostrarGrafico.SetFocus;
      END
      ELSE
      BEGIN
         pDepartamento.Visible := true;
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
         dblcdDptoId.SetFocus;
         IF DM1.cdsQry23.RecordCount > 0 THEN dblcdDptoId.Text := '*';
      END
   END
   ELSE
      meCategoriaDpto.Text := '';
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespDAtraConc.dblcCategoriaIdDptoChange(
   Sender: TObject);
BEGIN
   INHERITED;
   dblcCategoriaIdDptoExit(dblcCategoriaIdDpto);
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespDAtraConc.dblcdDptoIdChange(Sender: TObject);
BEGIN
   INHERITED;
   dblcdDptoIdExit(dblcdDptoId);
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespDAtraConc.dblcdDptoIdExit(Sender: TObject);
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

