// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : fEstDepMeses
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Analisis de cosechas por departamento / meses
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

unit RSG007;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, Db, Buttons;

type
  TfEstDepMeses = class(TForm)
    dtgCosDpto: TwwDBGrid;
    rdbSelxMonDep: TRadioGroup;
    BitExporta: TBitBtn;
    BitGrafico: TBitBtn;
    BitSalir: TBitBtn;
    lblTitulo01: TLabel;
    lblTitulo02: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure dtgCosDptoDblClick(Sender: TObject);
    procedure dtgCosDptoDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BitSalirClick(Sender: TObject);
    procedure BitExportaClick(Sender: TObject);
    procedure BitGraficoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    publicSQL:String;
  end;

var
  fEstDepMeses: TfEstDepMeses;

implementation

uses RSG018, RSGDM1, RSG008, RSG123;

{$R *.dfm}

procedure TfEstDepMeses.FormActivate(Sender: TObject);
begin
if fAnalisisdeCosechas.rdbSelxMon.ItemIndex=0 Then
   Begin
       rdbSelxMonDep.Visible:=True;
   End;

   fEstDepMeses.dtgCosDpto.ColumnByName('DESCRIPCION').FooterValue := 'Totales';
   fEstDepMeses.dtgCosDpto.ColumnByName('NOR').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSobrino,'NOR'), ffNumber, 15, 0);
   fEstDepMeses.dtgCosDpto.ColumnByName('CPP').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSobrino,'CPP'), ffNumber, 15, 0);
   fEstDepMeses.dtgCosDpto.ColumnByName('DEF').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSobrino,'DEF'), ffNumber, 15, 0);
   fEstDepMeses.dtgCosDpto.ColumnByName('DUD').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSobrino,'DUD'), ffNumber, 15, 0);
   fEstDepMeses.dtgCosDpto.ColumnByName('PER').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSobrino,'PER'), ffNumber, 15, 0);
   fEstDepMeses.dtgCosDpto.ColumnByName('TOTAL').FooterValue := FloatToStrF(DM1.SumaGrid(DM1.cdsSobrino,'TOTAL'), ffNumber, 15, 0);



end;

procedure TfEstDepMeses.dtgCosDptoDblClick(Sender: TObject);
var xSQL,xAno:String;
begin
Exit;
If fAnalisisdeCosechas.rdbSelxMon.ItemIndex=1 Then Exit;
   fEstMesUgel:= TfEstMesUgel.Create(self);
   fEstMesUgel.dtgMesUgel.Selected.Clear;
   If fAnalisisdeCosechas.PageControlPrincipal.TabIndex=0 Then
      xAno:=DM1.cdsSolicitud.FieldByname('DESCRIPCION').AsString
   Else
      xAno:=DM1.cdsSolicitudA.FieldByname('DESCRIPCION').AsString;
   Case rdbSelxMonDep.ItemIndex Of
        0:Begin
          If fAnalisisdeCosechas.PageControlPrincipal.TabIndex=0 Then
             xSQL:='SELECT ANNO,MESDESL DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL '+
                   'FROM (SELECT MESANNO ANNO, SUM(NVL(NOR,0)) NOR, SUM(NVL(CPP,0)) CPP, '+
                   'SUM(NVL(DEF,0)) DEF, SUM(NVL(DUD,0)) DUD, SUM(NVL(PER,0)) PER, SUM(TOTAL) TOTAL '+
                   'FROM ( SELECT TO_CHAR(CREFOTORG,''YYYYMM'') MESANNO,1 ASOCIADOS,SALDOS_FT TOTAL,CFC_F,  '+
                   'NOR,CPP,DEF,DUD,PER FROM (SELECT A.ASOID,B.CREFOTORG,SALDOS_FT,CFC_F,CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NOR, '+
                   'CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END CPP,  CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEF,  '+
                   'CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUD,  CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PER '+
                   'FROM CFC000 A,(SELECT ASOID,MIN(CREFOTORG) CREFOTORG FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(fAnalisisdeCosechas.dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(fAnalisisdeCosechas.dbsMesIni.Text))])))+' GROUP BY ASOID) B,APO101 C  '+
                   'WHERE PERIODO='+QuotedStr(Trim(fAnalisisdeCosechas.dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(fAnalisisdeCosechas.dbsMesIni.Text))])))+' AND A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND A.USEID=C.USEID(+) AND C.DPTOID='+QuotedStr(DM1.cdsSobrino.FieldByName('DPTOID').AsString )+'  AND A.ASOID=B.ASOID)  ) WHERE SUBSTR(MESANNO,1,4)='+QuotedStr(Trim(xAno))+'  GROUP BY MESANNO) A,TGE181 B '+
                   'WHERE SUBSTR(ANNO,5,2)=B.MESIDR ORDER BY ANNO ';
          If fAnalisisdeCosechas.PageControlPrincipal.TabIndex=1 Then
             xSQL:='SELECT ANNO,MESDESL DESCRIPCION,NOR,CPP,DEF,DUD,PER,TOTAL '+
                   'FROM (SELECT MESANNO ANNO, SUM(NVL(NOR,0)) NOR, SUM(NVL(CPP,0)) CPP, '+
                   'SUM(NVL(DEF,0)) DEF, SUM(NVL(DUD,0)) DUD, SUM(NVL(PER,0)) PER, SUM(TOTAL) TOTAL '+
                   'FROM ( SELECT TO_CHAR(CREFOTORG,''YYYYMM'') MESANNO,1 ASOCIADOS,1 TOTAL,CFC_F,  '+
                   'NOR,CPP,DEF,DUD,PER FROM (SELECT A.ASOID,B.CREFOTORG,SALDOS_FT,CFC_F,CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NOR, '+
                   'CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END CPP,  CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEF,  '+
                   'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUD,  CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PER '+
                   'FROM CFC000 A,(SELECT ASOID,MIN(CREFOTORG) CREFOTORG FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(fAnalisisdeCosechas.dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(fAnalisisdeCosechas.dbsMesIni.Text))])))+' GROUP BY ASOID) B,APO101 C  '+
                   'WHERE PERIODO='+QuotedStr(Trim(fAnalisisdeCosechas.dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(fAnalisisdeCosechas.dbsMesIni.Text))])))+' AND A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND A.USEID=C.USEID(+) AND C.DPTOID='+QuotedStr(DM1.cdsSobrino.FieldByName('DPTOID').AsString )+'  AND A.ASOID=B.ASOID)  ) WHERE SUBSTR(MESANNO,1,4)='+QuotedStr(Trim(xAno))+'  GROUP BY MESANNO) A,TGE181 B '+
                   'WHERE SUBSTR(ANNO,5,2)=B.MESIDR ORDER BY ANNO ';



          fEstMesUgel.dtgMesUgel.Selected.Add('DESCRIPCION'#9'23'#9'Meses'#9#9);
          End;
        1:Begin     // Ugeles
          If fAnalisisdeCosechas.PageControlPrincipal.TabIndex=0 Then
            If fAnalisisdeCosechas.xBoton='A' Then Exit;

            If fAnalisisdeCosechas.xBoton='B' Then
             xSQL:='SELECT USEID,USENOM DESCRIPCION,SUM(NVL(NOR,0)) NOR,SUM(NVL(CPP,0)) CPP,SUM(NVL(DEF,0)) DEF,SUM(NVL(DUD,0)) DUD,SUM(NVL(PER,0)) PER, '+
                   'SUM(TOTAL) TOTAL FROM (SELECT USEID,USENOM,CREMTOOTOR,CASE WHEN CREMTOOTOR BETWEEN 0 AND 3000 THEN ''DE 0 A 3,000''  '+
                   'WHEN CREMTOOTOR BETWEEN 3001 AND 5000 THEN ''DE 3,001 A 5,000''  WHEN CREMTOOTOR BETWEEN 5001 AND 7000 THEN ''DE 5,001 A 7,000''  '+
                   'WHEN CREMTOOTOR BETWEEN 7001 AND 9000 THEN ''DE 7,001 A 9,000''  WHEN CREMTOOTOR BETWEEN 9001 AND 11000 THEN ''DE 9,001 A 11,000'' '+
                   'WHEN CREMTOOTOR BETWEEN 11001 AND 13000 THEN ''DE 11,001 A 13,000''  WHEN CREMTOOTOR BETWEEN 13001 AND 15000 THEN ''DE 13,001 A 15,000'' '+
                   'WHEN CREMTOOTOR BETWEEN 15001 AND 17000 THEN ''DE 15,001 A 17,000''  WHEN CREMTOOTOR > 17000 THEN ''MAYOR 17,000'' END MONTOS,  '+
                   'CASE WHEN CREMTOOTOR BETWEEN 0 AND 3000 THEN ''01''  WHEN CREMTOOTOR BETWEEN 3001 AND 5000 THEN ''02'' WHEN CREMTOOTOR BETWEEN 5001 AND 7000 THEN ''03'' '+
                   'WHEN CREMTOOTOR BETWEEN 7001 AND 9000 THEN ''04'' WHEN CREMTOOTOR BETWEEN 9001 AND 11000 THEN ''05'' WHEN CREMTOOTOR BETWEEN 11001 AND 13000 THEN ''06'' '+
                   'WHEN CREMTOOTOR BETWEEN 13001 AND 15000 THEN ''07''  WHEN CREMTOOTOR BETWEEN 15001 AND 17000 THEN ''08''  WHEN CREMTOOTOR > 17000 THEN ''09''  END IDMON, '+
                   '1 ASOCIADOS,SALDOS_FT TOTAL,CFC_F, NOR,CPP,DEF,DUD,PER FROM ( SELECT C.USEID,C.USENOM,A.ASOID,TRUNC(B.CREMTOOTOR) CREMTOOTOR,SALDOS_FT,CFC_F, '+
                   'CASE WHEN CFC_F=''0'' THEN SALDOS_FT ELSE 0 END NOR, CASE WHEN CFC_F=''A'' THEN SALDOS_FT ELSE 0 END CPP, CASE WHEN CFC_F=''B'' THEN SALDOS_FT ELSE 0 END DEF, '+
                   'CASE WHEN CFC_F=''C'' THEN SALDOS_FT ELSE 0 END DUD, CASE WHEN CFC_F=''D'' THEN SALDOS_FT ELSE 0 END PER FROM CFC000 A, (SELECT ASOID,MAX(CREMTOOTOR) CREMTOOTOR FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(fAnalisisdeCosechas.dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(fAnalisisdeCosechas.dbsMesIni.Text))])))+' GROUP BY ASOID) B,APO101 C '+
                   'WHERE PERIODO='+QuotedStr(Trim(fAnalisisdeCosechas.dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(fAnalisisdeCosechas.dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID AND A.UPROID=C.UPROID(+) AND  A.UPAGOID=C.UPAGOID(+)  AND A.USEID=C.USEID(+) AND C.DPTOID='+QuotedStr(Trim(DM1.cdsSobrino.FieldByname('DPTOID').AsString))+' ) ) WHERE IDMON='+QuotedStr(Trim(DM1.cdsSolicitud.FieldByname('IDMON').AsString))+' GROUP BY USEID,USENOM ORDER BY USEID ';
            If fAnalisisdeCosechas.xBoton='C' Then  Exit;


          If fAnalisisdeCosechas.PageControlPrincipal.TabIndex=1 Then
            If fAnalisisdeCosechas.xBoton='A' Then Exit;

            If fAnalisisdeCosechas.xBoton='B' Then
             xSQL:='SELECT USEID,USENOM DESCRIPCION,SUM(NVL(NOR,0)) NOR,SUM(NVL(CPP,0)) CPP,SUM(NVL(DEF,0)) DEF,SUM(NVL(DUD,0)) DUD,SUM(NVL(PER,0)) PER, '+
                   'SUM(TOTAL) TOTAL FROM (SELECT USEID,USENOM,CREMTOOTOR,CASE WHEN CREMTOOTOR BETWEEN 0 AND 3000 THEN ''DE 0 A 3,000''  '+
                   'WHEN CREMTOOTOR BETWEEN 3001 AND 5000 THEN ''DE 3,001 A 5,000''  WHEN CREMTOOTOR BETWEEN 5001 AND 7000 THEN ''DE 5,001 A 7,000''  '+
                   'WHEN CREMTOOTOR BETWEEN 7001 AND 9000 THEN ''DE 7,001 A 9,000''  WHEN CREMTOOTOR BETWEEN 9001 AND 11000 THEN ''DE 9,001 A 11,000'' '+
                   'WHEN CREMTOOTOR BETWEEN 11001 AND 13000 THEN ''DE 11,001 A 13,000''  WHEN CREMTOOTOR BETWEEN 13001 AND 15000 THEN ''DE 13,001 A 15,000'' '+
                   'WHEN CREMTOOTOR BETWEEN 15001 AND 17000 THEN ''DE 15,001 A 17,000''  WHEN CREMTOOTOR > 17000 THEN ''MAYOR 17,000'' END MONTOS,  '+
                   'CASE WHEN CREMTOOTOR BETWEEN 0 AND 3000 THEN ''01''  WHEN CREMTOOTOR BETWEEN 3001 AND 5000 THEN ''02'' WHEN CREMTOOTOR BETWEEN 5001 AND 7000 THEN ''03'' '+
                   'WHEN CREMTOOTOR BETWEEN 7001 AND 9000 THEN ''04'' WHEN CREMTOOTOR BETWEEN 9001 AND 11000 THEN ''05'' WHEN CREMTOOTOR BETWEEN 11001 AND 13000 THEN ''06'' '+
                   'WHEN CREMTOOTOR BETWEEN 13001 AND 15000 THEN ''07''  WHEN CREMTOOTOR BETWEEN 15001 AND 17000 THEN ''08''  WHEN CREMTOOTOR > 17000 THEN ''09''  END IDMON, '+
                   '1 ASOCIADOS,1 TOTAL,CFC_F, NOR,CPP,DEF,DUD,PER FROM ( SELECT C.USEID,C.USENOM,A.ASOID,TRUNC(B.CREMTOOTOR) CREMTOOTOR,SALDOS_FT,CFC_F, '+
                   'CASE WHEN CFC_F=''0'' THEN 1 ELSE 0 END NOR, CASE WHEN CFC_F=''A'' THEN 1 ELSE 0 END CPP, CASE WHEN CFC_F=''B'' THEN 1 ELSE 0 END DEF, '+
                   'CASE WHEN CFC_F=''C'' THEN 1 ELSE 0 END DUD, CASE WHEN CFC_F=''D'' THEN 1 ELSE 0 END PER FROM CFC000 A, (SELECT ASOID,MAX(CREMTOOTOR) CREMTOOTOR FROM SAL000 WHERE PERIODO='+QuotedStr(Trim(fAnalisisdeCosechas.dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(fAnalisisdeCosechas.dbsMesIni.Text))])))+' GROUP BY ASOID) B,APO101 C '+
                   'WHERE PERIODO='+QuotedStr(Trim(fAnalisisdeCosechas.dbsAnoIni.Text+Format('%.2d',[StrToInt(Trim(fAnalisisdeCosechas.dbsMesIni.Text))])))+' AND A.ASOID=B.ASOID AND A.UPROID=C.UPROID(+) AND  A.UPAGOID=C.UPAGOID(+)  AND A.USEID=C.USEID(+) AND C.DPTOID='+QuotedStr(Trim(DM1.cdsSobrino.FieldByname('DPTOID').AsString))+' ) ) WHERE IDMON='+QuotedStr(Trim(DM1.cdsSolicitudA.FieldByname('IDMON').AsString))+' GROUP BY USEID,USENOM ORDER BY USEID ';
            If fAnalisisdeCosechas.xBoton='C' Then Exit;

          fEstMesUgel.dtgMesUgel.Selected.Add('DESCRIPCION'#9'23'#9'Ugeles / Uses '#9#9);
          End;
   End;
   DM1.cdsUSES.Close;
   DM1.cdsUSES.DataRequest(xSQL); publicSQL:=xSQL; Screen.Cursor := crHourGlass;
   DM1.cdsUSES.Open; Screen.Cursor := crDefault;
   TNumericField(DM1.cdsUSES.FieldByName('NOR')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUSES.FieldByName('CPP')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUSES.FieldByName('DEF')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUSES.FieldByName('DUD')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUSES.FieldByName('PER')).DisplayFormat := '###,##0';
   TNumericField(DM1.cdsUSES.FieldByName('TOTAL')).DisplayFormat := '###,##0';
   fEstMesUgel.dtgMesUgel.Selected.Add('NOR'#9'14'#9'Normal'#9#9);
   fEstMesUgel.dtgMesUgel.Selected.Add('CPP'#9'14'#9'Problemas~Potenciales'#9#9);
   fEstMesUgel.dtgMesUgel.Selected.Add('DEF'#9'14'#9'Deficiente'#9#9);
   fEstMesUgel.dtgMesUgel.Selected.Add('DUD'#9'14'#9'Dudoso'#9#9);
   fEstMesUgel.dtgMesUgel.Selected.Add('PER'#9'14'#9'Perdida'#9#9);
   fEstMesUgel.dtgMesUgel.Selected.Add('TOTAL'#9'14'#9'Total'#9#9);
   fEstMesUgel.dtgMesUgel.ApplySelected;
   fEstMesUgel.lblTitulo01.Caption:=lblTitulo01.Caption;
   fEstMesUgel.lblTitulo02.Caption:=lblTitulo02.Caption;
   fEstMesUgel.lblTitulo03.Caption:='Departamento : '+DM1.cdsSobrino.FieldByName('DESCRIPCION').AsString;;
   fEstMesUgel.ShowModal;
   fEstMesUgel.Free;
end;

procedure TfEstDepMeses.dtgCosDptoDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   If (Field.FieldName = 'DESCRIPCION') Then
   Begin
      dtgCosDpto.Canvas.Font.Color := clNavy;
      dtgCosDpto.DefaultDrawDataCell(rect, Field, State);
   End;
   If (Field.FieldName = 'TOTAL') Then
   Begin
      dtgCosDpto.Canvas.Font.Color := clNavy;
      dtgCosDpto.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'NOR') Then
   Begin
      dtgCosDpto.Canvas.Font.Color := clGreen;
      dtgCosDpto.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'CPP') Then
   Begin
      dtgCosDpto.Canvas.Font.Color := clTeal;
      dtgCosDpto.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'DEF') Then
   Begin
      dtgCosDpto.Canvas.Font.Color := clOlive;
      dtgCosDpto.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'DUD') Then
   Begin
      dtgCosDpto.Canvas.Font.Color := clPurple;
      dtgCosDpto.DefaultDrawDataCell(rect, Field, State);
   End;

   If (Field.FieldName = 'PER') Then
   Begin
      dtgCosDpto.Canvas.Font.Color := clRed;
      dtgCosDpto.DefaultDrawDataCell(rect, Field, State);
   End;

end;

procedure TfEstDepMeses.BitSalirClick(Sender: TObject);
begin
Close;
end;

procedure TfEstDepMeses.BitExportaClick(Sender: TObject);
begin
DM1.ExportaGridExcel(dtgCosDpto,'ExpDatos15');
end;

procedure TfEstDepMeses.BitGraficoClick(Sender: TObject);
var xSQL:string;
   xTit: TStrings;
begin
    fGrafDepMeses:= TfGrafDepMeses.create(self);
    Try
       xSQL:='SELECT DESCRIPCION,NOR NORMAL,CPP PROPOT,DEF DEFICIENTE,DUD DUDOSO,PER PERDIDA,TOTAL FROM ('+fAnalisisdeCosechas.publicSQL+')';
       xTit := TStringList.Create;
       xTit.Add(lblTitulo01.Caption+' - '+lblTitulo02.Caption );
       fGrafDepMeses.crearGrafico(DM1.wModulo,xTit,xSQL);
       fGrafDepMeses.showmodal
    Finally
       fGrafDepMeses.free;
    End;

end;

end.
