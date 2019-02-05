// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FChart_MatrizDespDptoUgel
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Grafico de matriz de desplazamiento por Departamento / Ugel
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

UNIT RSG116;

INTERFACE

USES
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, RSG114, RSG110,
   Series, Chart, DbChart, TeeProcs, TeEngine, StdCtrls, DB, DBClient,
   Mask, wwdbedit, Wwdotdot, Wwdbcomb, ExtCtrls, wwdblook, Wwdbdlg, Buttons;

TYPE
   TFChart_MatrizDespDptoUgel = CLASS(TFChart)
      Panel1: TPanel;
      dblcdCategoriaId: TwwDBLookupComboDlg;
      meCategoriaDes: TMaskEdit;
      Label2: TLabel;
      pDepartamento: TPanel;
      Label1: TLabel;
      dblcdDptoId: TwwDBLookupComboDlg;
      meDptoDes: TMaskEdit;
      rgReporte: TRadioGroup;
      btnMostrarGrafico: TBitBtn;
    lblPeriodo: TLabel;
    rdbTipCar: TRadioGroup;
    rdbTipAso: TRadioGroup;
      PROCEDURE FormShow(Sender: TObject);
      PROCEDURE dblcdCategoriaIdExit(Sender: TObject);
      PROCEDURE dblcdDptoIdExit(Sender: TObject);
      PROCEDURE dblcdCategoriaIdChange(Sender: TObject);
      PROCEDURE dblcdDptoIdChange(Sender: TObject);
      PROCEDURE btnMostrarGraficoClick(Sender: TObject);
   Private
      { Private declarations }
   Public
      xAnho: STRING;
      xMes: STRING;
   END;

VAR
   FChart_MatrizDespDptoUgel: TFChart_MatrizDespDptoUgel;

IMPLEMENTATION

USES RSGDM1;

{$R *.dfm}
(******************************************************************************)

PROCEDURE TFChart_MatrizDespDptoUgel.FormShow(Sender: TObject);
VAR
   vSQL: STRING;
BEGIN
   INHERITED;
   vSQL := 'SELECT ''*'' CFC_F, ''- MOSTRAR RESUMEN -'' CFCDES_F '
      + '  FROM DUAL '
      + 'UNION ALL '
      + 'SELECT RESUMEID CFC_F, RESUMEDES CFCDES_F '
      + '  FROM COB113';
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
   lblPeriodo.Caption:=xAnho+xMes;
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespDptoUgel.dblcdCategoriaIdChange(
   Sender: TObject);
BEGIN
   INHERITED;
   dblcdCategoriaIdExit(dblcdCategoriaId);
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespDptoUgel.dblcdCategoriaIdExit(Sender: TObject);
VAR
   vSQL: STRING;
BEGIN
   INHERITED;
   IF DM1.cdsQry22.Locate('CFC_F', dblcdCategoriaId.Text, []) THEN
   BEGIN
      meCategoriaDes.Text := DM1.cdsQry22.FieldByName('CFCDES_F').AsString;
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
      END;
   END
   ELSE
      meCategoriaDes.Text := '';
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespDptoUgel.dblcdDptoIdExit(Sender: TObject);
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

PROCEDURE TFChart_MatrizDespDptoUgel.dblcdDptoIdChange(Sender: TObject);
BEGIN
   INHERITED;
   dblcdDptoIdExit(dblcdDptoId);
END;
(******************************************************************************)

PROCEDURE TFChart_MatrizDespDptoUgel.btnMostrarGraficoClick(
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



   IF TRIM(dblcdCategoriaId.Text) = '' THEN
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

   vTit := TStringList.Create;
   IF DM1.cdsQry22.FieldByName('CFC_F').AsString = '*' THEN
   BEGIN
      vSQL := 'SELECT SUBSTR(CFCDES_F,1,15) CATEGORIA, ';
      CASE rgReporte.ItemIndex OF
         0: vSQL := vSQL + '       SUM(SALDOS_FT) SALDO_ACTUAL ';
         1: vSQL := vSQL + '       SUM(NUM_FT) NUMERO_ASOCIADOS ';
      END;
      vSQL := vSQL + '  FROM (' + DM1.ConsultaRiesgos(xAnho + xMes, xWhere) + ') '
         + ' WHERE CFC_F IS NOT NULL '
         + ' GROUP BY CFC_F,CFCDES_F ';
      vTit.Add('Por Categorias'); // por ahora una sola linea, xq se descuadran los comentarios
   END
   ELSE
   BEGIN
      IF DM1.cdsQry23.FieldByName('DPTOID').AsString = '*' THEN
      BEGIN
         vSQL := 'SELECT SUBSTR(DPTODES,1,15) DPTODES,';
         CASE rgReporte.ItemIndex OF
            0: vSQL := vSQL + '       SUM(SALDOS_FT) SALDO_ACTUAL ';
            1: vSQL := vSQL + '       SUM(NUM_FT) NUMERO_ASOCIADOS ';
         END;
         vSQL := vSQL + '  FROM (' + DM1.ConsultaRiesgos(xAnho + xMes, xWhere) + ') '
            + ' WHERE CFC_F=' + QuotedStr(DM1.cdsQry22.FieldByName('CFC_F').AsString)
            + ' GROUP BY CFCDES_F,DPTOID,DPTODES ';
         vTit.Add('Por Departamentos(' + DM1.cdsQry22.FieldByName('CFCDES_F').AsString + ')'); // por ahora una sola linea, xq se descuadran los comentarios
      END
      ELSE
      BEGIN
         vSQL := 'SELECT SUBSTR(USENOM,1,15) USENOM, ';
         CASE rgReporte.ItemIndex OF
            0: vSQL := vSQL + '       SUM(SALDOS_FT) SALDO_ACTUAL ';
            1: vSQL := vSQL + '       SUM(NUM_FT) NUMERO_ASOCIADOS ';
         END;
         vSQL := vSQL + 'FROM (' + DM1.ConsultaRiesgos(xAnho + xMes, xWhere) + ') '
            + 'WHERE CFC_F=' + QuotedStr(DM1.cdsQry22.FieldByName('CFC_F').AsString)
            + ' AND DPTOID=' + QuotedStr(DM1.cdsQry23.FieldByName('DPTOID').AsString)
            + ' GROUP BY USEID,USENOM ';
         vTit.Add('Por Ugeles(' + DM1.cdsQry23.FieldByName('DPTODES').AsString + ')'); // por ahora una sola linea, xq se descuadran los comentarios
      END;
   END;
   crearGrafico(DM1.wModulo, vTit, vSQL);

END;
(******************************************************************************)
END.

