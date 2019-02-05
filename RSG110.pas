// Inicio Uso Estándares: 01/08/2011
// Unidad : Riesgos
// Formulario : FraChartP
// Fecha de Creación :
// Autor : Equipo de Sistemas
// Objetivo : Plantilla para los graficos estadisticos
// HPC_201401_RSG : ACCESO AL MODULO RIESGO CREDITO DESDE AMBIENTE DE PRODUCCION
// SPP_201401_RSG : Se realiza el pase a producción a partir del HPC_201401_RSG

UNIT RSG110;

INTERFACE

USES
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, ToolWin, ExtCtrls, TeeProcs, TeEngine, Chart, DbChart,
   Series, DB, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, fcButton,
   fcImgBtn, fcShapeBtn, Menus, DBClient, DBGrids,
   StrUtils, Spin;

TYPE
   TFraChartP = CLASS(TFrame)
      dbChartPrincipal: TDBChart;
      Series1: TFastLineSeries;
      cdlgSerie: TColorDialog;
      pControlSeries: TPanel;
      Panel2: TPanel;
      dbgSeries: TwwDBGrid;
      dsSeries: TDataSource;
      gbColor: TGroupBox;
      rgTipoSerie: TRadioGroup;
      btnColorSerie: TButton;
      shColorSerie: TShape;
      pGeneral: TPanel;
      btnImprimir: TBitBtn;
      Series2: TBarSeries;
      Splitter1: TSplitter;
      GroupBox1: TGroupBox;
      dbgComentarios: TwwDBGrid;
      dbgbAgregarComentario: TwwIButton;
      pmComentario: TPopupMenu;
      miModificarComentario: TMenuItem;
      N1: TMenuItem;
      miEliminarComentario: TMenuItem;
      cdsComentarios: TClientDataSet;
      cdsComentariosORDEN: TIntegerField;
      cdsComentariosCOMENTARIO: TStringField;
      cdsComentariosLEFT: TIntegerField;
      cdsComentariosTOP: TIntegerField;
      cdsComentariosACTIVO: TStringField;
      dsComentarios: TDataSource;
      cdsSeries: TClientDataSet;
      cdsSeriesCOLOR: TStringField;
      cdsSeriesNOMBRE: TStringField;
      cdsSeriesACTIVO: TStringField;
      cdsSeriesVALORES: TStringField;
      cdsSeriesORDEN: TIntegerField;
      cdsSeriesTIPOGRAFICO: TStringField;
      btnGrabar: TBitBtn;
      dsCoordenadas: TDataSource;
      DBGrid1: TDBGrid;
      cdsCoordenadas: TClientDataSet;
      cdsCoordenadasORDEN_SERIE: TIntegerField;
      cdsCoordenadasORDEN_COORDENADA: TIntegerField;
      cdsCoordenadasEJEX: TStringField;
      cdsCoordenadasEJEY: TStringField;
      btnActualizar: TBitBtn;
      btnCambiarTitulo: TBitBtn;
      chbx3D: TCheckBox;
      Series3: TPieSeries;
      gb3D: TGroupBox;
      seRadioY: TSpinEdit;
      Label1: TLabel;
      seRotar: TSpinEdit;
      Label2: TLabel;
      PROCEDURE btnColorSerieClick(Sender: TObject);
      PROCEDURE cdsSeriesACTIVOChange(Sender: TField);
      PROCEDURE cdsSeriesVALORESChange(Sender: TField);
      PROCEDURE dbgSeriesRowChanged(Sender: TObject);
      PROCEDURE rgTipoSerieClick(Sender: TObject);
      PROCEDURE dbgSeriesCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      PROCEDURE btnImprimirClick(Sender: TObject);
      PROCEDURE dbChartPrincipalClick(Sender: TObject);
      PROCEDURE miModificarComentarioClick(Sender: TObject);
      PROCEDURE miEliminarComentarioClick(Sender: TObject);
      PROCEDURE dbChartPrincipalMouseMove(Sender: TObject;
         Shift: TShiftState; X, Y: Integer);
      PROCEDURE dbChartPrincipalResize(Sender: TObject);
      PROCEDURE dbgbAgregarComentarioClick(Sender: TObject);
      PROCEDURE cdsSeriesCOLORGetText(Sender: TField; VAR Text: STRING;
         DisplayText: Boolean);
      PROCEDURE btnGrabarClick(Sender: TObject);
      PROCEDURE btnActualizarClick(Sender: TObject);
      PROCEDURE btnCambiarTituloClick(Sender: TObject);
      PROCEDURE chbx3DClick(Sender: TObject);
      PROCEDURE seRadioYChange(Sender: TObject);
      PROCEDURE seRotarChange(Sender: TObject);
   Private
      xWidthChartAnt: integer;
      xHeightChartAnt: integer;
      xMove: boolean;
      xImgActiva: TImage;
      xIndex: STRING;
      xStrCambioLinea: STRING;
      xCodigoChart: STRING;
      xNombreChart: STRING;
      PROCEDURE xImgActiva_MouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      PROCEDURE xImgActiva_DblClick(Sender: TObject);
      PROCEDURE pintarChart;
      FUNCTION crearComentarioChart: TImage;
      PROCEDURE Grabar(IIsNuevo: boolean);
      PROCEDURE cambiarGradiente3D;
   Public
      xSQL: STRING;
      xTitulo: TStrings;
      xModulo: STRING;
      PROCEDURE LimpiarDatos();
      PROCEDURE crearGrafico(); Overload;
      PROCEDURE crearGrafico(ICodigo: STRING); Overload;
   END;

IMPLEMENTATION

USES RSGDM1, RSG111, RSG112, RSG113;

{$R *.dfm}

{ TFraChartP }
(******************************************************************************)

PROCEDURE TFraChartP.LimpiarDatos;
VAR
   i: integer;
BEGIN
   self.xSQL := '';
   self.xTitulo.Free;
   self.xTitulo := TStringList.Create;
   self.xIndex := '';
   self.xMove := False;
   self.xModulo := '';
   self.xStrCambioLinea := '<:>';
   self.xCodigoChart := '';
   self.xNombreChart := '';

   self.xWidthChartAnt := dbChartPrincipal.Width;
   self.xHeightChartAnt := dbChartPrincipal.Height;
   dbgSeries.KeyOptions := []; // para evitar la eliminacion y adicion de registros(solo por el grid)

   FOR i := 0 TO dbChartPrincipal.SeriesCount - 1 DO
      dbChartPrincipal.Series[0].Free; // limpia las series

   dbChartPrincipal.Title.Text.Clear;
   dbChartPrincipal.View3D := false;

   // elimina todos los comentarios
   FOR i := self.ComponentCount - 1 DOWNTO 0 DO // se hace en este orden p evitar error al ir retirando la cantidad de controles
      IF (self.Components[i].ClassName = 'TImage') THEN
         TControl(self.Components[i]).Destroy;

   chbx3D.Checked := false;
   chbx3DClick(chbx3D);

   cdsSeries.EmptyDataSet; //borra la data
   cdsCoordenadas.EmptyDataSet;
   cdsComentarios.EmptyDataSet;

   pControlSeries.Enabled := False;
END;
(******************************************************************************)

PROCEDURE TFraChartP.crearGrafico;
BEGIN
   Screen.Cursor := crHourGlass;
   DM1.cdsQry1.Close;
   DM1.cdsQry1.DataRequest(self.xSQL);
   DM1.cdsQry1.Open;
   pintarChart;
   pControlSeries.Enabled := True;
   Screen.Cursor := crDefault;

   rgTipoSerieClick(rgTipoSerie); // P MUESTRE O BLOQUEE LOS CONTROLES
   chbx3D.Checked := TRUE;
   chbx3DClick(chbx3D);
END;
(******************************************************************************)

PROCEDURE TFraChartP.crearGrafico(ICodigo: STRING);
VAR
   vSQL: STRING;
   vSQLSelect1, vSQLSelect2, vSQLSelectCase: STRING;
   vImgComp: TImage;

   FUNCTION obtenerTStrings(ICad: STRING; ISep: STRING): TStrings;
   VAR
      vTString: TStrings;
      vCadRestante: STRING;
      vCadObtenida: STRING;
      vPos: integer;
   BEGIN
      vTString := TStringList.Create;
      vCadRestante := ICad;
      REPEAT
         vPos := pos(ISep, vCadRestante);
         vCadObtenida := leftStr(vCadRestante, vPos - 1);
         vCadRestante := rightStr(vCadRestante, length(vCadRestante) - (vPos - 1) - length(ISep));
         vTString.Add(vCadObtenida);
      UNTIL (vCadRestante = '');
      result := vTString;
   END;

BEGIN
   // RESPETAR EL ORDEN EN QUE SE LLENAN LOS DATOS
   Screen.Cursor := crHourGlass;
   vSQL := 'SELECT CODIGO, NOMBRE, WIDTH, HEIGHT, '
      + '       FREG, UREG, ACTIVO, TITULO, '
      + '       MODULO, GRABO_COMPLETO, IS3D '
      + '  FROM REP_EST_GRAFICO WHERE CODIGO =' + QuotedStr(ICodigo);
   DM1.cdsqry.Close;
   DM1.cdsqry.DataRequest(vSQL);
   DM1.cdsqry.Open;
   IF DM1.cdsqry.RecordCount > 0 THEN
   BEGIN
      // DATOS DEL CHART
      chbx3D.Checked := (DM1.cdsqry.fieldbyname('IS3D').AsString = 'S');
      chbx3DClick(chbx3D);
      self.xCodigoChart := DM1.cdsqry.fieldbyname('CODIGO').AsString;
      self.xNombreChart := DM1.cdsqry.fieldbyname('NOMBRE').AsString;
      self.xWidthChartAnt := DM1.cdsqry.fieldbyname('WIDTH').AsInteger;
      self.xHeightChartAnt := DM1.cdsqry.fieldbyname('HEIGHT').AsInteger;
      self.xTitulo := obtenerTStrings(DM1.cdsqry.fieldbyname('TITULO').AsString, self.xStrCambioLinea);
      self.xModulo := DM1.cdsqry.fieldbyname('MODULO').AsString;

      // CREAR EL SQL PARA OBTENER LOS PUNTOS DEL CHART
      vSql := 'SELECT ORDEN,COLOR,NOMBRE,TIPOGRAFICO,ACTIVO,VALORES '
         + '  FROM REP_EST_SERIE '
         + ' WHERE CODIGO_GRAF = ' + QuotedStr(ICodigo)
         + ' ORDER BY ORDEN';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(vSql);
      DM1.cdsQry.Open;
      vSQLSelect1 := '';
      vSQLSelect2 := '';
      vSQLSelectCase := '';
      DM1.cdsQry.First;
      WHILE NOT DM1.cdsQry.Eof DO
      BEGIN
         vSQLSelect1 := vSQLSelect1 + ' ,MAX(' + DM1.cdsQry.fieldbyname('NOMBRE').AsString + ') ' + DM1.cdsQry.fieldbyname('NOMBRE').AsString + ' ';
         vSQLSelect2 := vSQLSelect2 + ' ,' + DM1.cdsQry.fieldbyname('NOMBRE').AsString + ' ';
         vSQLSelectCase := vSQLSelectCase + ' ,CASE WHEN ORDEN_SERIE = ' + DM1.cdsQry.fieldbyname('ORDEN').AsString + ' THEN EJEY ELSE NULL END ' + DM1.cdsQry.fieldbyname('NOMBRE').AsString + ' ';
         DM1.cdsQry.Next;
      END;

      self.xSQL := 'SELECT EJEX ';
      self.xSQL := self.xSQL + vSQLSelect2;
      self.xSQL := self.xSQL + '  FROM (SELECT EJEX ';
      self.xSQL := self.xSQL + vSQLSelect1;
      self.xSQL := self.xSQL + ' ,MAX(ORDEN_COORDENADA) ORDEN_COORDENADA ';
      self.xSQL := self.xSQL + ' FROM (SELECT ORDEN_COORDENADA, EJEX ';
      self.xSQL := self.xSQL + vSQLSelectCase;
      self.xSQL := self.xSQL + 'FROM REP_EST_COORDENADA '
         + '                 WHERE CODIGO_GRAF = ' + QuotedStr(ICodigo) + ') '
         + '          GROUP BY EJEX) ';
      self.xSQL := self.xSQL + ' ORDER BY ORDEN_COORDENADA ';

      self.crearGrafico();

      // ACTUALIZA GRAFICOS-SERIES

      DM1.cdsQry.First;
      cdsSeries.First;
      WHILE NOT DM1.cdsQry.Eof DO
      BEGIN
         cdsSeries.edit;
         cdsSeries.FieldByName('COLOR').Value := DM1.cdsQry.fieldbyname('COLOR').Value;
         cdsSeries.FieldByName('TIPOGRAFICO').Value := DM1.cdsQry.fieldbyname('TIPOGRAFICO').Value;
         cdsSeries.FieldByName('ACTIVO').Value := DM1.cdsQry.fieldbyname('ACTIVO').Value;
         cdsSeries.FieldByName('VALORES').Value := DM1.cdsQry.fieldbyname('VALORES').Value;
         cdsSeries.Post;
         cdsSeries.Next;
         DM1.cdsQry.Next;
      END;

      cdsSeries.First;
      WHILE NOT cdsSeries.Eof DO
      BEGIN
//         TAreaSeries
         IF cdsSeries.FieldByName('TIPOGRAFICO').AsString = 'TLineSeries' THEN
            rgTipoSerie.ItemIndex := 0
         ELSE
            IF cdsSeries.FieldByName('TIPOGRAFICO').AsString = 'TBarSeries' THEN
               rgTipoSerie.ItemIndex := 1
            ELSE
               IF cdsSeries.FieldByName('TIPOGRAFICO').AsString = 'TPieSeries' THEN
                  rgTipoSerie.ItemIndex := 2;

         rgTipoSerieClick(rgTipoSerie); // P Q SIEMPRE SE DISPARE
         dbChartPrincipal.Series[cdsSeries.FieldByName('ORDEN').AsInteger].SeriesColor := cdsSeries.FieldByName('COLOR').AsInteger;
         cdsSeries.Next;
      END;

      //COMENTARIOS..
      vSql := 'SELECT ORDEN, COMENTARIO, TOP_Y, LEFT_X,  ACTIVO '
         + '  FROM REP_EST_COMENTARIO '
         + ' WHERE CODIGO_GRAF = ' + QuotedStr(ICodigo)
         + ' ORDER BY ORDEN';

      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(vSql);
      DM1.cdsQry.Open;
      DM1.cdsQry.First;
      WHILE NOT DM1.cdsQry.Eof DO
      BEGIN
         vImgComp := crearComentarioChart();
         vImgComp.tag := DM1.cdsQry.fieldbyname('ORDEN').Value;
         vImgComp.canvas.TextOut(25, 10, inttostr(vImgComp.tag));
         vImgComp.Hint := DM1.cdsQry.fieldbyname('COMENTARIO').Value;

         cdsComentarios.Append;
         cdsComentarios.FieldByName('ORDEN').Value := DM1.cdsQry.fieldbyname('ORDEN').Value;
         cdsComentarios.FieldByName('COMENTARIO').Value := DM1.cdsQry.fieldbyname('COMENTARIO').Value;
         cdsComentarios.FieldByName('TOP').Value := DM1.cdsQry.fieldbyname('TOP_Y').Value;
         cdsComentarios.FieldByName('LEFT').Value := DM1.cdsQry.fieldbyname('LEFT_X').Value;
         cdsComentarios.FieldByName('ACTIVO').Value := DM1.cdsQry.fieldbyname('ACTIVO').Value;
         cdsComentarios.Post;
         DM1.cdsQry.Next;
      END;
      dbChartPrincipalResize(dbChartPrincipal);
   END
   ELSE
      showmessage('No se encontro el Reporte');
   Screen.Cursor := crDefault;
END;

(******************************************************************************)

PROCEDURE TFraChartP.pintarChart;
VAR
   xFieldDefList: TFieldDefList;
   i: integer;
   i2: integer;
   vContPuntos: integer;
   MySerie: TChartSeries;
BEGIN
   dbChartPrincipal.Title.Text := self.xTitulo;

   xFieldDefList := DM1.cdsqry1.FieldDefList;
   xIndex := xFieldDefList.FieldDefs[0].Name; // toma el primer dato para el EjeX
   i2 := 0;
   FOR i := 0 TO xFieldDefList.Count - 1 DO
   BEGIN
      IF xFieldDefList.FieldDefs[i].Name <> self.xIndex THEN
      BEGIN
         //SALVAR COORDENADAS
         vContPuntos := 0;
         DM1.cdsqry1.First;
         WHILE NOT DM1.cdsqry1.Eof DO
         BEGIN
            cdsCoordenadas.Append;
            cdsCoordenadas.FieldByName('ORDEN_COORDENADA').Value := vContPuntos;
            cdsCoordenadas.FieldByName('ORDEN_SERIE').Value := i2;
            cdsCoordenadas.FieldByName('EJEX').AsString := DM1.cdsqry1.fieldbyname(self.xIndex).AsString;
            cdsCoordenadas.FieldByName('EJEY').AsString := DM1.cdsqry1.fieldbyname(xFieldDefList.FieldDefs[i].Name).AsString;
            cdsCoordenadas.Post;
            DM1.cdsqry1.Next;
            vContPuntos := vContPuntos + 1;
         END;

         //CREAR SERIES EN EL CHART

         dbChartPrincipal.AddSeries(TBarSeries.Create(self));
         TBarSeries(dbChartPrincipal.Series[i2]).BarPen.Visible := false;
         TBarSeries(dbChartPrincipal.Series[i2]).BarWidthPercent := 40;
         dbChartPrincipal.Series[i2].DataSource := DM1.cdsqry1;
         dbChartPrincipal.Series[i2].XLabelsSource := self.xIndex;
         dbChartPrincipal.Series[i2].YValueS.ValueSource := xFieldDefList.FieldDefs[i].Name;
         dbChartPrincipal.Series[i2].valueFormat := '##,###,###';
         dbChartPrincipal.Series[i2].Marks.Style := smsValue;
         dbChartPrincipal.Series[i2].Marks.ArrowLength := 30;
         dbChartPrincipal.Series[i2].Name := xFieldDefList.FieldDefs[i].Name;
         TBarSeries(dbChartPrincipal.Series[i2]).UseYOrigin := True;
         TBarSeries(dbChartPrincipal.Series[i2]).BarStyle := bsRectGradient;

         //SALVAR SERIES
         cdsSeries.Append;
         cdsSeries.FieldByName('ORDEN').Value := i2;
         cdsSeries.FieldByName('COLOR').AsString := inttostr(dbChartPrincipal.Series[i2].SeriesColor);
         cdsSeries.FieldByName('NOMBRE').Value := xFieldDefList.FieldDefs[i].Name;
         cdsSeries.FieldByName('TIPOGRAFICO').Value := 'TBarSeries';
         cdsSeries.FieldByName('ACTIVO').Value := 'S';
         cdsSeries.FieldByName('VALORES').Value := 'N';
         cdsSeries.Post;
         i2 := i2 + 1;
      END;
   END;
   dbChartPrincipal.Legend.Visible := cdsSeries.RecordCount <= 1; // solo si se muestra una serie, se muestra la layenda
   dbChartPrincipal.RefreshData;
   cdsSeries.First;

   dbgSeries.SetControlType('ACTIVO', fctCheckBox, 'S;N');
   dbgSeries.SetControlType('VALORES', fctCheckBox, 'S;N');
   dbgSeries.ApplySelected;
END;
(******************************************************************************)

PROCEDURE TFraChartP.cdsSeriesACTIVOChange(Sender: TField);
BEGIN
   dbChartPrincipal.Series[cdsSeries.FieldByName('ORDEN').AsInteger].Active := cdsSeries.FieldByName('ACTIVO').AsString = 'S';
END;
(******************************************************************************)

PROCEDURE TFraChartP.cdsSeriesVALORESChange(Sender: TField);
BEGIN
   dbChartPrincipal.Series[cdsSeries.FieldByName('ORDEN').AsInteger].Marks.Visible := cdsSeries.FieldByName('VALORES').AsString = 'S';
END;
(******************************************************************************)

PROCEDURE TFraChartP.dbgSeriesRowChanged(Sender: TObject);
VAR
   MySerie: TChartSeries;
BEGIN
   IF NOT (trim(cdsSeries.FieldByName('ORDEN').AsString) = '') THEN
   BEGIN
      shColorSerie.Brush.Color := cdsSeries.FieldByName('COLOR').AsInteger;
      IF cdsSeries.FieldByName('TIPOGRAFICO').Value = 'TLineSeries' THEN
         rgTipoSerie.ItemIndex := 0
      ELSE
         IF cdsSeries.FieldByName('TIPOGRAFICO').Value = 'TBarSeries' THEN
            rgTipoSerie.ItemIndex := 1
         ELSE
            IF cdsSeries.FieldByName('TIPOGRAFICO').Value = 'TPieSeries' THEN
               rgTipoSerie.ItemIndex := 2;
   END;

END;
(******************************************************************************)

PROCEDURE TFraChartP.rgTipoSerieClick(Sender: TObject);
VAR
   MySerie: TChartSeries;
   vTipoGrafico: STRING;

   PROCEDURE cambiarFondo(IOpcion: integer);
   BEGIN
      IF (IOpcion <= 1) THEN
      BEGIN
         dbChartPrincipal.BackWall.Brush.Style := bsClear;
         dbChartPrincipal.BottomWall.Brush.Style := bsClear;
         dbChartPrincipal.LeftWall.Brush.Style := bsClear;
         IF cdsSeries.RecordCount <= 1 THEN
            TBarSeries(MySerie).Marks.Style := smsPercentTotal
         ELSE
            TBarSeries(MySerie).Marks.Style := smsValue;

         dbChartPrincipal.View3DOptions.Orthogonal := TRUE;
         TLineSeries(MySerie).ColorEachPoint := (cdsSeries.RecordCount <= 1);

      END
      ELSE
         TPieSeries(MySerie).Marks.Style := smsPercentTotal;

      gbColor.visible := (IOpcion <= 1) AND (cdsSeries.RecordCount > 1);
      gb3D.visible := (IOpcion > 1) AND (cdsSeries.RecordCount < 4 );

   END;
BEGIN
   MySerie := dbChartPrincipal.Series[cdsSeries.FieldByName('ORDEN').AsInteger];
   CASE rgTipoSerie.ItemIndex OF
      0:
         BEGIN
            ChangeSeriesType(MySerie, TLineSeries);
            TLineSeries(MySerie).LinePen.Width := 3;
            vTipoGrafico := 'TLineSeries';
         END;
      1:
         BEGIN
            ChangeSeriesType(MySerie, TBarSeries);
            TBarSeries(MySerie).BarPen.Visible := false;
            TBarSeries(MySerie).BarWidthPercent := 40;
            vTipoGrafico := 'TBarSeries';
         END;
      2:
         BEGIN
            IF cdsSeries.RecordCount = 1 THEN
            BEGIN
               ChangeSeriesType(MySerie, TPieSeries);
               TPieSeries(MySerie).PiePen.Visible := False;
               dbChartPrincipal.View3DOptions.Orthogonal := FALSE;
               TPieSeries(MySerie).Circled := True;
               vTipoGrafico := 'TPieSeries';
            END
            ELSE
            BEGIN
               showmessage('El Grafico no puede mostrarse en Forma de Pastel');
               IF cdsSeries.FieldByName('TIPOGRAFICO').AsString = 'TLineSeries' THEN
                  rgTipoSerie.ItemIndex := 0
               ELSE
                  IF cdsSeries.FieldByName('TIPOGRAFICO').AsString = 'TBarSeries' THEN
                     rgTipoSerie.ItemIndex := 1;
               dbgSeries.SetFocus; // p prevenir bucles infinitos
               exit;
            END;
         END;
      3:
        Begin
            ChangeSeriesType(MySerie, TAreaSeries);
            TAreaSeries(MySerie).LinePen.Width := 3;
            vTipoGrafico := 'TAreaSeries';
        End;

   END;
   cambiarFondo(rgTipoSerie.ItemIndex);
   cdsSeries.Edit;
   cdsSeries.FieldByName('TIPOGRAFICO').Value := vTipoGrafico;
   cdsSeries.Post;
   cambiarGradiente3D();
END;
(******************************************************************************)

PROCEDURE TFraChartP.btnColorSerieClick(Sender: TObject);
BEGIN
   IF cdlgSerie.Execute THEN
   BEGIN
      shColorSerie.Brush.Color := cdlgSerie.Color;
      dbChartPrincipal.Series[cdsSeries.FieldByName('ORDEN').AsInteger].SeriesColor := cdlgSerie.Color;
      cdsSeries.Edit;
      cdsSeries.FieldByName('COLOR').Value := inttostr(cdlgSerie.Color);
      cdsSeries.Post;
   END;
END;

(******************************************************************************)

PROCEDURE TFraChartP.cdsSeriesCOLORGetText(Sender: TField;
   VAR Text: STRING; DisplayText: Boolean);
BEGIN
   // P Q NO MUESTRE NINGUN TEXTO
   Text := '';
   DisplayText := FALSE;
END;

(******************************************************************************)

PROCEDURE TFraChartP.dbgSeriesCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
BEGIN
   IF NOT cdsSeries.FieldByName('ORDEN').IsNull THEN
      IF (Field.FieldName = 'COLOR') THEN
         ABrush.Color := cdsSeries.FieldByName('COLOR').AsInteger;
END;
(******************************************************************************)

PROCEDURE TFraChartP.btnImprimirClick(Sender: TObject);
BEGIN
   // dejar este evento en blaco porque es solo para la herencia de clases
   // SOLO PARA LA HERENCIA
END;
(******************************************************************************)

PROCEDURE TFraChartP.Grabar(IIsNuevo: boolean);
VAR
   vCodigo: STRING;
   vNombre: STRING;
   vTitulo: STRING;
   i: integer;
   vSql: STRING;
   v3D: STRING;
BEGIN
   //nombre de grafico
   IF IIsNuevo THEN // solo si es nuevo
   BEGIN
      FChartN := TFChartN.create(self);
      TRY
         IF FChartN.ShowModal <> mrOk THEN exit;
         vNombre := trim(FChartN.edNombre.Text);
      FINALLY
         FChartN.Free;
      END;
   END;

   IF chbx3D.Checked THEN
      v3D := 'S'
   ELSE
      v3D := 'N';
   //obtiene el titulo
   vTitulo := '';
   FOR i := 0 TO xTitulo.Count - 1 DO
      vTitulo := vTitulo + trim(xTitulo.Strings[i] + self.xStrCambioLinea);

   //separa un numero unico
   screen.Cursor := crHourGlass;

   IF IIsNuevo THEN // solo si es nuevo
   BEGIN
      vSql := 'SELECT  LPAD(MAX(NVL(CODIGO,0)+1),10,''0'') CODIGO FROM REP_EST_GRAFICO';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(vSql);
      DM1.cdsQry.Open;

      IF DM1.cdsQry.FieldByName('CODIGO').AsString = '' THEN
         vCodigo := '0000000001'
      ELSE
         vCodigo := DM1.cdsQry.FieldByName('CODIGO').AsString;

      DM1.DCOM1.AppServer.SOLStartTransaction;
      TRY
         vSql := 'INSERT INTO REP_EST_GRAFICO(CODIGO, NOMBRE, '
            + '                               TITULO,'
            + '                               WIDTH, HEIGHT, '
            + '                               FREG,  UREG, ACTIVO,'
            + '                               MODULO, GRABO_COMPLETO,IS3D)'
            + '                        VALUES(' + QuotedStr(vCodigo) + ',' + QuotedStr(vNombre) + ','
            + QuotedStr(vTitulo) + ','
            + inttostr(dbChartPrincipal.Width) + ',' + inttostr(dbChartPrincipal.Height) + ', '
            + '                                SYSDATE,' + QuotedStr(DM1.wUsuario) + ',''N'','
            + QuotedStr(xModulo) + ',''N'',' + QuotedStr(v3D) + ')';

         DM1.DCOM1.AppServer.EjecutaSQL(vSql);
         DM1.DCOM1.AppServer.SOLCommit;
      EXCEPT
         DM1.DCOM1.AppServer.SOLRollBack;
         showmessage('No se pudo grabar la cabecera, por favor intente nuevamente');
         screen.Cursor := crDefault;
         exit;
      END;
   END;

   // GRABAR EL DETALLE- Y LA CABECERA EN CASO DE ACTUALIZAR
   DM1.DCOM1.AppServer.SOLStartTransaction;
   TRY

      IF NOT IIsNuevo THEN // solo si SE ACTUALIZA
      BEGIN
         vCodigo := xCodigoChart;
         TRY
            vSql := 'UPDATE REP_EST_GRAFICO '
               + '      SET TITULO=' + QuotedStr(vTitulo) + ','
               + '          IS3D=' + QuotedStr(v3D) + ','
               + '          WIDTH=' + inttostr(dbChartPrincipal.Width) + ','
               + '          HEIGHT=' + inttostr(dbChartPrincipal.Height)
               + '    WHERE CODIGO = ' + QuotedStr(vCodigo);

            DM1.DCOM1.AppServer.EjecutaSQL(vSql);

            vSql := 'DELETE FROM REP_EST_SERIE WHERE CODIGO_GRAF = ' + QuotedStr(vCodigo);
            DM1.DCOM1.AppServer.EjecutaSQL(vSql);

            vSql := 'DELETE FROM REP_EST_COORDENADA WHERE CODIGO_GRAF = ' + QuotedStr(vCodigo);
            DM1.DCOM1.AppServer.EjecutaSQL(vSql);

            vSql := 'DELETE FROM REP_EST_COMENTARIO WHERE CODIGO_GRAF = ' + QuotedStr(vCodigo);
            DM1.DCOM1.AppServer.EjecutaSQL(vSql);

         EXCEPT
            DM1.DCOM1.AppServer.SOLRollBack;
            showmessage('No se pudo actualizar, por favor intente nuevamente');
            screen.Cursor := crDefault;
            exit;
         END;
      END;

      // SI OCURREL ALGUN ERROR, TAMBIEN BORRA LA CABECERA CREADA
      // GRABAR SERIES;
      cdsSeries.First;
      WHILE NOT cdsSeries.Eof DO
      BEGIN
         vSQL := 'INSERT INTO REP_EST_SERIE(CODIGO_GRAF,'
            + 'ORDEN,'
            + 'COLOR,'
            + 'NOMBRE,'
            + 'TIPOGRAFICO,'
            + 'ACTIVO,'
            + 'VALORES) '
            + ' VALUES(' + quotedstr(vCodigo) + ','
            + inttostr(cdsSeries.fieldByName('ORDEN').AsInteger) + ','
            + inttostr(cdsSeries.fieldByName('COLOR').AsInteger) + ','
            + quotedstr(cdsSeries.fieldByName('NOMBRE').AsString) + ','
            + quotedstr(cdsSeries.fieldByName('TIPOGRAFICO').AsString) + ','
            + quotedstr(cdsSeries.fieldByName('ACTIVO').AsString) + ','
            + quotedstr(cdsSeries.fieldByName('VALORES').AsString) + ')';
         DM1.DCOM1.AppServer.EjecutaSQL(vSql);

         // GRABAR COORDENADAS;
         cdsCoordenadas.Filtered := false;
         cdsCoordenadas.Filter := 'ORDEN_SERIE=' + inttostr(cdsSeries.fieldByName('ORDEN').AsInteger);
         cdsCoordenadas.Filtered := true;
         cdsCoordenadas.First;
         WHILE NOT cdsCoordenadas.Eof DO
         BEGIN
            vSQL := 'INSERT INTO REP_EST_COORDENADA(CODIGO_GRAF, ORDEN_SERIE,ORDEN_COORDENADA, EJEX, EJEY) '
               + ' VALUES(' + quotedstr(vCodigo) + ','
               + inttostr(cdsSeries.fieldByName('ORDEN').AsInteger) + ','
               + quotedstr(cdsCoordenadas.fieldByName('ORDEN_COORDENADA').AsString) + ','
               + quotedstr(cdsCoordenadas.fieldByName('EJEX').AsString) + ','
               + quotedstr(cdsCoordenadas.fieldByName('EJEY').AsString) + ')';
            DM1.DCOM1.AppServer.EjecutaSQL(vSql);
            cdsCoordenadas.Next;
         END;
         cdsSeries.Next;
      END;

      // GRABAR COMENTARIOS;
      cdsComentarios.First;
      WHILE NOT cdsComentarios.Eof DO
      BEGIN
         vSQL := 'INSERT INTO REP_EST_COMENTARIO(CODIGO_GRAF, ORDEN, COMENTARIO, LEFT_X, TOP_Y, ACTIVO) '
            + ' VALUES(' + quotedstr(vCodigo) + ','
            + inttostr(cdsComentarios.fieldByName('ORDEN').AsInteger) + ','
            + quotedstr(cdsComentarios.fieldByName('COMENTARIO').AsString) + ','
            + inttostr(cdsComentarios.fieldByName('LEFT').AsInteger) + ','
            + inttostr(cdsComentarios.fieldByName('TOP').AsInteger) + ','
            + quotedstr(cdsComentarios.fieldByName('ACTIVO').AsString) + ')';
         DM1.DCOM1.AppServer.EjecutaSQL(vSql);
         cdsComentarios.Next;
      END;

      IF IIsNuevo THEN // solo si es nuevo
      BEGIN
         vSQL := 'UPDATE REP_EST_GRAFICO SET ACTIVO = ''S'', GRABO_COMPLETO = ''S'' WHERE CODIGO=' + quotedstr(vCodigo);
         DM1.DCOM1.AppServer.EjecutaSQL(vSql);
      END;

      DM1.DCOM1.AppServer.SOLCommit;
      xCodigoChart := vCodigo;
      cdsCoordenadas.Filtered := false;
      screen.Cursor := crDefault;
      MessageDlg('Se grabo el Reporte', mtInformation, [mbOk], 0);
   EXCEPT
      cdsCoordenadas.Filtered := false;
      DM1.DCOM1.AppServer.SOLRollBack;
      screen.Cursor := crDefault;
      showmessage('Ocurrio algun error.. No se pudo grabar el detalle');
      exit;
   END;
END;
(******************************************************************************)

PROCEDURE TFraChartP.btnGrabarClick(Sender: TObject);
BEGIN
   grabar(True);
END;
(******************************************************************************)

PROCEDURE TFraChartP.btnActualizarClick(Sender: TObject);
BEGIN
   IF xCodigoChart = '' THEN // nuevo
      grabar(True)
   ELSE // actualizar
      grabar(False);
END;

(******************************************************************************)

PROCEDURE TFraChartP.dbChartPrincipalClick(Sender: TObject);
BEGIN
   xMove := false;
END;
(******************************************************************************)

FUNCTION TFraChartP.crearComentarioChart(): TImage;
VAR
   vImgComp: TImage;
BEGIN
   vImgComp := TImage.Create(Self);
   WITH vImgComp DO
   BEGIN
      Parent := dbChartPrincipal;
      SetBounds(0, 0, 200, 200);
      DragMode := dmManual;
      AutoSize := true;
      Transparent := true;
      Canvas.Font.Name := 'MS Sans Serif';
      Canvas.Font.Size := 8;
      OnMouseDown := xImgActiva_MouseDown;
      OnDblClick := xImgActiva_DblClick;
      Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'ImgComentario.bmp');
      PopupMenu := pmComentario;
      canvas.Font.Style := [fsbold];
      ShowHint := true;
   END;
   result := vImgComp;
END;
(******************************************************************************)

PROCEDURE TFraChartP.dbgbAgregarComentarioClick(Sender: TObject);
VAR
   vImgComp: TImage;
BEGIN
   vImgComp := crearComentarioChart();
   vImgComp.tag := cdsComentarios.RecordCount;
   vImgComp.canvas.TextOut(25, 10, inttostr(vImgComp.tag));
   vImgComp.Hint := '';

   cdsComentarios.Append;
   cdsComentarios.FieldByName('ORDEN').Value := vImgComp.tag;
   cdsComentarios.FieldByName('COMENTARIO').Value := '';
   cdsComentarios.FieldByName('TOP').Value := 0;
   cdsComentarios.FieldByName('LEFT').Value := 0;
   cdsComentarios.FieldByName('ACTIVO').Value := 'S';
   cdsComentarios.Post;
END;
(******************************************************************************)

PROCEDURE TFraChartP.xImgActiva_MouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
BEGIN
   IF Button = mbLeft THEN xMove := NOT xMove;
   xImgActiva := TImage(Sender);
   cdsComentarios.Locate('ORDEN', VarArrayOf([xImgActiva.Tag]), []);
END;

(******************************************************************************)

PROCEDURE TFraChartP.xImgActiva_DblClick(Sender: TObject);
VAR
   i: integer;
   cad: STRING;
BEGIN
   FComentarioImg := TFComentarioImg.create(self);
   TRY
      FComentarioImg.mComentario.Lines.Clear;
      FComentarioImg.mComentario.Lines.Add(TRIM(cdsComentarios.FieldByName('COMENTARIO').AsString));
      IF FComentarioImg.ShowModal = mrOk THEN
      BEGIN
         cad := '';
         FOR i := 0 TO FComentarioImg.mComentario.Lines.Count - 1 DO
            cad := cad + ' ' + trim(FComentarioImg.mComentario.Lines[i]);

         cdsComentarios.Edit;
         cdsComentarios.FieldByName('COMENTARIO').Value := trim(cad);
         cdsComentarios.Post;
         xImgActiva.Hint := trim(cad);
      END;
   FINALLY
      FComentarioImg.Free;
   END;
END;
(******************************************************************************)

PROCEDURE TFraChartP.miModificarComentarioClick(Sender: TObject);
BEGIN
   xImgActiva_DblClick(xImgActiva);
END;
(******************************************************************************)

PROCEDURE TFraChartP.miEliminarComentarioClick(Sender: TObject);
BEGIN
   xImgActiva.Destroy;
   cdsComentarios.Delete;
END;
(******************************************************************************)

PROCEDURE TFraChartP.dbChartPrincipalMouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
BEGIN
   IF xMove THEN
   BEGIN
      xImgActiva.Top := Y;
      xImgActiva.Left := X;
      cdsComentarios.Edit;
      cdsComentarios.FieldByName('TOP').Value := Y;
      cdsComentarios.FieldByName('LEFT').Value := x;
      cdsComentarios.Post;
   END;
END;
(******************************************************************************)

PROCEDURE TFraChartP.dbChartPrincipalResize(Sender: TObject);
VAR
   i: integer;
BEGIN
   FOR i := 0 TO self.ComponentCount - 1 DO
      IF (self.Components[i].ClassName = 'TImage') THEN
      BEGIN
         //SE UTILIZA LOS CDS, XQ CUANDO SE CARGA UN REPORTE GUARDADO, ESTE EMPIEZA EN CERO
         cdsComentarios.Locate('ORDEN', VarArrayOf([TControl(self.Components[i]).Tag]), []);
         TControl(self.Components[i]).Top := trunc(cdsComentarios.FieldByName('TOP').Value * dbChartPrincipal.Height / xHeightChartAnt);
         TControl(self.Components[i]).Left := trunc(cdsComentarios.FieldByName('LEFT').Value * dbChartPrincipal.Width / xWidthChartAnt);
         cdsComentarios.Edit;
         cdsComentarios.FieldByName('TOP').Value := TControl(self.Components[i]).Top;
         cdsComentarios.FieldByName('LEFT').Value := TControl(self.Components[i]).Left;
         cdsComentarios.Post;
      END;

   xWidthChartAnt := dbChartPrincipal.Width;
   xHeightChartAnt := dbChartPrincipal.Height;

END;
(******************************************************************************)

PROCEDURE TFraChartP.btnCambiarTituloClick(Sender: TObject);
BEGIN
   // por ahora solo se utiliza una sola linea, xq decuadra los comentarios
   FChartT := TFChartT.create(self);
   TRY
      FChartT.edNombre.Text := dbChartPrincipal.Title.Text.Strings[0];
      IF FChartT.ShowModal <> mrOk THEN exit;
      self.xTitulo.Clear;
      self.xTitulo.Add(trim(FChartT.edNombre.Text));
      dbChartPrincipal.Title.Text.Clear;
      dbChartPrincipal.Title.Text := self.xTitulo;
   FINALLY
      FChartT.Free;
   END;
END;

(******************************************************************************)

PROCEDURE TFraChartP.cambiarGradiente3D();
BEGIN
   IF ((cdsSeries.RecordCount > 0) AND (cdsSeries.FieldByName('TIPOGRAFICO').AsString = 'TBarSeries') AND (dbChartPrincipal.SeriesCount > 0)) THEN
      IF chbx3D.Checked THEN
         TBarSeries(dbChartPrincipal.Series[cdsSeries.FieldByName('ORDEN').AsInteger]).BarStyle := bsRectGradient
      ELSE
         TBarSeries(dbChartPrincipal.Series[cdsSeries.FieldByName('ORDEN').AsInteger]).BarStyle := bsRectangle;

END;
(******************************************************************************)

PROCEDURE TFraChartP.chbx3DClick(Sender: TObject);
BEGIN
   dbChartPrincipal.View3D := chbx3D.Checked;
   IF chbx3D.Checked THEN
   BEGIN
      dbChartPrincipal.Chart3DPercent := 40;
      dbChartPrincipal.View3DOptions.Elevation := 315;
   END;
   cdsSeries.First;
   WHILE NOT cdsSeries.Eof DO
   BEGIN
      cambiarGradiente3D();
      cdsSeries.Next;
   END;
   cdsSeries.First;
END;
(******************************************************************************)

PROCEDURE TFraChartP.seRadioYChange(Sender: TObject);
BEGIN
   TPieSeries(dbChartPrincipal.Series[cdsSeries.FieldByName('ORDEN').AsInteger]).CustomYRadius := seRadioY.value;
END;
(******************************************************************************)

PROCEDURE TFraChartP.seRotarChange(Sender: TObject);
BEGIN
   TPieSeries(dbChartPrincipal.Series[cdsSeries.FieldByName('ORDEN').AsInteger]).RotationAngle := seRotar.Value;
END;
(******************************************************************************)
END.
