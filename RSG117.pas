// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FChart_MatrizDespGral
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Grafico de matriz de desplazamiento general
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

UNIT RSG117;

INTERFACE

USES
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, RSG114, RSG110, StdCtrls, Buttons, ExtCtrls;

TYPE
   TFChart_MatrizDespGral = CLASS(TFChart)
      Panel1: TPanel;
      rgReporte: TRadioGroup;
      btnMostrarGrafico: TBitBtn;
    lblPeriodo: TLabel;
      PROCEDURE btnMostrarGraficoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
   Private
      { Private declarations }
   Public
      xTipo: STRING;
      xAnho: STRING;
      xMes: STRING;
   END;

VAR
   FChart_MatrizDespGral: TFChart_MatrizDespGral;

IMPLEMENTATION

uses RSGDM1;

{$R *.dfm}
(******************************************************************************)

PROCEDURE TFChart_MatrizDespGral.btnMostrarGraficoClick(
   Sender: TObject);
VAR
   vSQL: STRING;
   vTit: TStrings;
BEGIN
   INHERITED;
   vTit := TStringList.Create;
   IF (xTipo = 'XNUMERO') THEN
   BEGIN
      CASE rgReporte.ItemIndex OF
         0:
            BEGIN
               vSQL := 'SELECT CFCDES_A, SUM(CANCELADO) CANCELADO, SUM(NORMAL) NORMAL, '
                  + '       SUM(PROPOT) PROPOT, SUM(DEFICIENTE) DEFICIENTE, SUM(DUDOSO) DUDOSO, '
                  + '       SUM(PERDIDA) PERDIDA, '
                  + '       SUM(CANCELADO) + SUM(NORMAL) + SUM(PROPOT) + SUM(DEFICIENTE) + '
                  + '        SUM(DUDOSO) + SUM(PERDIDA) TOTAL '
                  + '  FROM (SELECT CFC_A, CFCDES_A, '
                  + '               CASE WHEN CFC_F IS NULL THEN 1 ELSE 0 END CANCELADO, '
                  + '               CASE WHEN CFC_F = ''0'' THEN 1 ELSE 0 END NORMAL, '
                  + '               CASE WHEN CFC_F = ''A'' THEN 1 ELSE 0 END PROPOT, '
                  + '               CASE WHEN CFC_F = ''B'' THEN 1 ELSE 0 END DEFICIENTE, '
                  + '               CASE WHEN CFC_F = ''C'' THEN 1 ELSE 0 END DUDOSO, '
                  + '               CASE WHEN CFC_F = ''D'' THEN 1 ELSE 0 END PERDIDA '
                  + '           FROM RIE_EST_GEN '
                  + '          WHERE PERACT = ' + QuotedStr(xAnho + xMes)
                  + '            AND CFC_A IS NOT NULL) '
                  + ' GROUP BY CFC_A, CFCDES_A ';
               vTit.Add('Reporte General por Numero en Cantidades'); // por ahora una sola linea, xq se descuadran los comentarios
            END;
         1:
            BEGIN
               vSQL := 'SELECT CFCDES_A, ROUND((CANCELADO / TOTAL) * 100, 2) CANCELADO, '
                  + '       ROUND((NORMAL / TOTAL) * 100, 2) NORMAL, '
                  + '       ROUND((PROPOT / TOTAL) * 100, 2) PROPOT, '
                  + '       ROUND((DEFICIENTE / TOTAL) * 100, 2) DEFICIENTE, '
                  + '       ROUND((DUDOSO / TOTAL) * 100, 2) DUDOSO, '
                  + '       ROUND((PERDIDA / TOTAL) * 100, 2) PERDIDA '
                  + '  FROM (SELECT CFC_A, CFCDES_A, SUM(CANCELADO) CANCELADO, SUM(NORMAL) NORMAL, '
                  + '                SUM(PROPOT) PROPOT, SUM(DEFICIENTE) DEFICIENTE, '
                  + '                SUM(DUDOSO) DUDOSO, SUM(PERDIDA) PERDIDA, '
                  + '                SUM(NORMAL) + SUM(PROPOT) + SUM(DEFICIENTE) + SUM(DUDOSO) + '
                  + '                 SUM(PERDIDA) TOTAL '
                  + '           FROM (SELECT CFC_A, CFCDES_A, '
                  + '                        CASE WHEN CFC_F IS NULL THEN 1 ELSE 0 END CANCELADO, '
                  + '                        CASE WHEN CFC_F = ''0'' THEN 1 ELSE 0 END NORMAL, '
                  + '                        CASE WHEN CFC_F = ''A'' THEN 1 ELSE 0 END PROPOT, '
                  + '                        CASE WHEN CFC_F = ''B'' THEN 1 ELSE 0 END DEFICIENTE, '
                  + '                        CASE WHEN CFC_F = ''C'' THEN 1 ELSE 0 END DUDOSO, '
                  + '                        CASE WHEN CFC_F = ''D'' THEN 1 ELSE 0 END PERDIDA '
                  + '                    FROM RIE_EST_GEN '
                  + '                   WHERE PERACT = ' + QuotedStr(xAnho + xMes)
                  + '            AND CFC_A IS NOT NULL) '
                  + '          GROUP BY CFC_A, CFCDES_A) ';
               vTit.Add('Reporte General por Numero en Porcentajes'); // por ahora una sola linea, xq se descuadran los comentarios
            END;
      END;
   END;
   IF (xTipo = 'XMONTO') THEN
   BEGIN
      CASE rgReporte.ItemIndex OF
         0:
            BEGIN
               vSQL := 'SELECT CFCDES_A, SUM(CANCELADO) CANCELADO, SUM(NORMAL) NORMAL, '
                  + '       SUM(PROPOT) PROPOT, SUM(DEFICIENTE) DEFICIENTE, SUM(DUDOSO) DUDOSO, '
                  + '       SUM(PERDIDA) PERDIDA, '
                  + '       SUM(CANCELADO) + SUM(NORMAL) + SUM(PROPOT) + SUM(DEFICIENTE) + '
                  + '        SUM(DUDOSO) + SUM(PERDIDA) TOTAL '
                  + '  FROM (SELECT CFC_A, CFCDES_A, '
                  + '               CASE WHEN CFC_F IS NULL THEN SALDOS_AT ELSE 0 END CANCELADO, '
                  + '               CASE WHEN CFC_F = ''0'' THEN SALDOS_AT ELSE 0 END NORMAL, '
                  + '               CASE WHEN CFC_F = ''A'' THEN SALDOS_AT ELSE 0 END PROPOT, '
                  + '               CASE WHEN CFC_F = ''B'' THEN SALDOS_AT ELSE 0 END DEFICIENTE, '
                  + '               CASE WHEN CFC_F = ''C'' THEN SALDOS_AT ELSE 0 END DUDOSO, '
                  + '               CASE WHEN CFC_F = ''D'' THEN SALDOS_AT ELSE 0 END PERDIDA '
                  + '           FROM RIE_EST_GEN '
                  + '          WHERE PERACT = ' + QuotedStr(xAnho + xMes)
                  + '            AND CFC_A IS NOT NULL) '
                  + ' GROUP BY CFC_A, CFCDES_A';
               vTit.Add('Reporte General por Monto en Cantidades'); // por ahora una sola linea, xq se descuadran los comentarios
            END;
         1:
            BEGIN
               vSQL := 'SELECT CFCDES_A, ROUND((CANCELADO / TOTAL) * 100, 2) CANCELADO, '
                  + '       ROUND((NORMAL / TOTAL) * 100, 2) NORMAL, '
                  + '       ROUND((PROPOT / TOTAL) * 100, 2) PROPOT, '
                  + '       ROUND((DEFICIENTE / TOTAL) * 100, 2) DEFICIENTE, '
                  + '       ROUND((DUDOSO / TOTAL) * 100, 2) DUDOSO, '
                  + '       ROUND((PERDIDA / TOTAL) * 100, 2) PERDIDA '
                  + '  FROM (SELECT CFC_A, CFCDES_A, SUM(CANCELADO) CANCELADO, SUM(NORMAL) NORMAL, '
                  + '                SUM(PROPOT) PROPOT, SUM(DEFICIENTE) DEFICIENTE, '
                  + '                SUM(DUDOSO) DUDOSO, SUM(PERDIDA) PERDIDA, '
                  + '                SUM(NORMAL) + SUM(PROPOT) + SUM(DEFICIENTE) + SUM(DUDOSO) + '
                  + '                 SUM(PERDIDA) TOTAL '
                  + '           FROM (SELECT CFC_A, CFCDES_A, '
                  + '                        CASE WHEN CFC_F IS NULL THEN SALDOS_AT ELSE 0 END CANCELADO, '
                  + '                        CASE WHEN CFC_F = ''0'' THEN SALDOS_AT ELSE 0 END NORMAL, '
                  + '                        CASE WHEN CFC_F = ''A'' THEN SALDOS_AT ELSE 0 END PROPOT, '
                  + '                        CASE WHEN CFC_F = ''B'' THEN SALDOS_AT ELSE 0 END DEFICIENTE, '
                  + '                        CASE WHEN CFC_F = ''C'' THEN SALDOS_AT ELSE 0 END DUDOSO, '
                  + '                        CASE WHEN CFC_F = ''D'' THEN SALDOS_AT ELSE 0 END PERDIDA '
                  + '                    FROM RIE_EST_GEN '
                  + '                   WHERE PERACT = ' + QuotedStr(xAnho + xMes)
                  + '            AND CFC_A IS NOT NULL) '
                  + '          GROUP BY CFC_A, CFCDES_A)';

               vTit.Add('Reporte General por Monto en Porcentajes'); // por ahora una sola linea, xq se descuadran los comentarios
            END;
      END;
   END;
   crearGrafico(DM1.wModulo, vTit, vSQL);
END;
(******************************************************************************)
procedure TFChart_MatrizDespGral.FormShow(Sender: TObject);
begin
  inherited;
  lblPeriodo.Caption:=xAnho+xMes;
end;

END.

