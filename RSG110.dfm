object FraChartP: TFraChartP
  Left = 0
  Top = 0
  Width = 952
  Height = 675
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 265
    Top = 0
    Width = 5
    Height = 675
    Beveled = True
  end
  object dbChartPrincipal: TDBChart
    Left = 270
    Top = 0
    Width = 682
    Height = 675
    AllowPanning = pmNone
    AllowZoom = False
    AnimatedZoom = True
    AnimatedZoomSteps = 2
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Color = clSilver
    BackWall.Pen.Visible = False
    BottomWall.Brush.Color = clWhite
    BottomWall.Brush.Style = bsClear
    Gradient.EndColor = 13684895
    Gradient.Visible = True
    LeftWall.Brush.Color = clWhite
    LeftWall.Brush.Style = bsClear
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -11
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'TDBChart')
    AxisVisible = False
    BackColor = clSilver
    BottomAxis.Axis.Width = 3
    BottomAxis.LabelsAngle = 90
    BottomAxis.LabelsFont.Charset = ANSI_CHARSET
    BottomAxis.LabelsFont.Color = clBlack
    BottomAxis.LabelsFont.Height = -11
    BottomAxis.LabelsFont.Name = 'Arial'
    BottomAxis.LabelsFont.Style = [fsBold]
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.Axis.Width = 3
    LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
    LeftAxis.LabelsFont.Color = clBlack
    LeftAxis.LabelsFont.Height = -11
    LeftAxis.LabelsFont.Name = 'Arial'
    LeftAxis.LabelsFont.Style = [fsBold]
    LeftAxis.LabelStyle = talValue
    Legend.ColorWidth = 25
    Legend.ShadowColor = clGray
    Legend.TextStyle = ltsPlain
    View3D = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DWalls = False
    Align = alClient
    Color = clWhite
    TabOrder = 0
    OnClick = dbChartPrincipalClick
    OnMouseMove = dbChartPrincipalMouseMove
    OnResize = dbChartPrincipalResize
    object Series1: TFastLineSeries
      Marks.ArrowLength = 20
      Marks.BackColor = 12058623
      Marks.Visible = True
      SeriesColor = clRed
      ValueFormat = '#,##0'
      LinePen.Color = clRed
      LinePen.Width = 2
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series2: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = True
      SeriesColor = clGreen
      BarBrush.Color = clWhite
      BarPen.Color = clGreen
      BarPen.Visible = False
      BarWidthPercent = 40
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series3: TPieSeries
      Marks.ArrowLength = 8
      Marks.Visible = True
      SeriesColor = clYellow
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1.000000000000000000
      PieValues.Order = loNone
    end
  end
  object pControlSeries: TPanel
    Left = 0
    Top = 0
    Width = 265
    Height = 675
    Align = alLeft
    Caption = 'pControlSeries'
    Enabled = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 280
      Width = 263
      Height = 394
      Align = alBottom
      Caption = 'Panel2'
      TabOrder = 0
      object gbColor: TGroupBox
        Left = 1
        Top = 90
        Width = 261
        Height = 51
        Align = alTop
        Caption = 'Color de la Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object shColorSerie: TShape
          Left = 85
          Top = 20
          Width = 30
          Height = 25
        end
        object btnColorSerie: TButton
          Left = 8
          Top = 20
          Width = 75
          Height = 25
          Caption = 'Color'
          TabOrder = 0
          OnClick = btnColorSerieClick
        end
      end
      object rgTipoSerie: TRadioGroup
        Left = 1
        Top = 1
        Width = 261
        Height = 38
        Align = alTop
        Caption = 'Tipo Grafico'
        Columns = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 1
        Items.Strings = (
          'Lineas'
          'Barras'
          'Pastel'
          'Area')
        ParentFont = False
        TabOrder = 1
        OnClick = rgTipoSerieClick
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 141
        Width = 261
        Height = 252
        Align = alClient
        Caption = 'Comentarios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object dbgComentarios: TwwDBGrid
          Left = 2
          Top = 15
          Width = 257
          Height = 235
          DisableThemesInTitle = False
          Selected.Strings = (
            'ORDEN'#9'2'#9'ID'
            'COMENTARIO'#9'27'#9'COMENTARIO')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsComentarios
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          object dbgbAgregarComentario: TwwIButton
            Left = 0
            Top = 0
            Width = 20
            Height = 22
            Hint = 'Agregar Comentario'
            AllowAllUp = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
              0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
              33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
            OnClick = dbgbAgregarComentarioClick
          end
        end
      end
      object gb3D: TGroupBox
        Left = 1
        Top = 39
        Width = 261
        Height = 51
        Align = alTop
        Caption = 'Girar 3D'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object Label1: TLabel
          Left = 10
          Top = 19
          Width = 46
          Height = 13
          Caption = 'Y Radio'
        end
        object Label2: TLabel
          Left = 140
          Top = 19
          Width = 32
          Height = 13
          Caption = 'Rotar'
        end
        object seRadioY: TSpinEdit
          Left = 60
          Top = 16
          Width = 55
          Height = 22
          Increment = 20
          MaxValue = 360
          MinValue = 0
          TabOrder = 0
          Value = 0
          OnChange = seRadioYChange
        end
        object seRotar: TSpinEdit
          Left = 177
          Top = 16
          Width = 55
          Height = 22
          Increment = 20
          MaxValue = 360
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = seRotarChange
        end
      end
    end
    object dbgSeries: TwwDBGrid
      Left = 1
      Top = 28
      Width = 263
      Height = 252
      DisableThemesInTitle = False
      Selected.Strings = (
        'COLOR'#9'1'#9'_'#9'T'#9
        'NOMBRE'#9'24'#9'Nombre'#9'T'#9
        'ACTIVO'#9'5'#9'Act'#9#9
        'VALORES'#9'3'#9'Val'#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      OnRowChanged = dbgSeriesRowChanged
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      DataSource = dsSeries
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgSeriesCalcCellColors
    end
    object pGeneral: TPanel
      Left = 1
      Top = 1
      Width = 263
      Height = 27
      Align = alTop
      TabOrder = 2
      DesignSize = (
        263
        27)
      object btnImprimir: TBitBtn
        Left = 213
        Top = 2
        Width = 23
        Height = 23
        Hint = 'Imprimir'
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object btnGrabar: TBitBtn
        Left = 160
        Top = 2
        Width = 23
        Height = 23
        Hint = 'Guardar como'
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnGrabarClick
        Glyph.Data = {
          66010000424D6601000000000000760000002800000013000000140000000100
          040000000000F0000000CE0E0000D80E00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333000003000077777777700033000000000078888888800003000000000
          0780888888000030000000000780888888000030000000000780888888000030
          0000000007888888880000300000000000000000000000300000000000000000
          0000003000000000FFFFFFFFFF00003000000000FFFFFFFFFF00003000000000
          FFFFFFFFFF00003000000000FFFFFFFFFF00003000000000FFFFFFFFFF000030
          00000000FFFFFFFFFF00003000000000FFFFFFFFFF00003000000000FFFFFFFF
          FF07703000000000999999999907703000000000999999999900003000003000
          99999999990003300000}
      end
      object btnActualizar: TBitBtn
        Left = 187
        Top = 2
        Width = 23
        Height = 23
        Hint = 'Guardar'
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnActualizarClick
        Glyph.Data = {
          66010000424D6601000000000000760000002800000013000000140000000100
          040000000000F0000000CE0E0000D80E00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333000003000077777777700033000000000078888888800003000000000
          0780888888000030000000000780888888000030000000000780888888000030
          0000000007888888880000300000000000000000000000300000000000000000
          0000003000000000BBBBBBBBBB00003000000000BBBBBBBBBB00003000000000
          BBBBBBBBBB00003000000000BBBBBBBBBB00003000000000BBBBBBBBBB000030
          00000000BBBBBBBBBB00003000000000BBBBBBBBBB00003000000000BBBBBBBB
          BB07703000000000999999999907703000000000999999999900003000003000
          99999999990003300000}
      end
      object btnCambiarTitulo: TBitBtn
        Left = 238
        Top = 2
        Width = 23
        Height = 23
        Hint = 'Cambiar Titulo'
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnCambiarTituloClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
          0EEE333377777777777733330FF00FBFB0EE33337F37733F377733330F0BFB0B
          FB0E33337F73FF73337733330FF000BFBFB033337F377733333733330FFF0BFB
          FBF033337FFF733F333733300000BF0FBFB03FF77777F3733F37000FBFB0F0FB
          0BF077733FF7F7FF7337E0FB00000000BF0077F377777777F377E0BFBFBFBFB0
          F0F077F3333FFFF7F737E0FBFB0000000FF077F3337777777337E0BFBFBFBFB0
          FFF077F3333FFFF73FF7E0FBFB00000F000077FF337777737777E00FBFBFB0FF
          0FF07773FFFFF7337F37003000000FFF0F037737777773337F7333330FFFFFFF
          003333337FFFFFFF773333330000000003333333777777777333}
        NumGlyphs = 2
      end
      object chbx3D: TCheckBox
        Left = 3
        Top = 4
        Width = 97
        Height = 17
        Caption = '3D'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = chbx3DClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 24
      Top = 147
      Width = 153
      Height = 78
      DataSource = dsCoordenadas
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      Columns = <
        item
          Expanded = False
          FieldName = 'ORDEN_SERIE'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EJEX'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EJEY'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORDEN_COORDENADA'
          Width = 50
          Visible = True
        end>
    end
  end
  object cdlgSerie: TColorDialog
    Options = [cdFullOpen]
    Left = 176
    Top = 424
  end
  object dsSeries: TDataSource
    DataSet = cdsSeries
    Left = 96
    Top = 80
  end
  object pmComentario: TPopupMenu
    Left = 169
    Top = 480
    object miModificarComentario: TMenuItem
      Caption = 'Modificar Comentario'
      OnClick = miModificarComentarioClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miEliminarComentario: TMenuItem
      Caption = 'Eliminar'
      OnClick = miEliminarComentarioClick
    end
  end
  object cdsComentarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 81
    Top = 481
    Data = {
      7B0000009619E0BD0100000018000000050000000000030000007B00054F5244
      454E04000100000000000A434F4D454E544152494F0100490000000100055749
      445448020002006400044C454654040001000000000003544F50040001000000
      00000641435449564F01004900000001000557494454480200020001000000}
    object cdsComentariosORDEN: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 2
      FieldName = 'ORDEN'
    end
    object cdsComentariosCOMENTARIO: TStringField
      DisplayWidth = 27
      FieldName = 'COMENTARIO'
      Size = 100
    end
    object cdsComentariosLEFT: TIntegerField
      FieldName = 'LEFT'
      Visible = False
    end
    object cdsComentariosTOP: TIntegerField
      FieldName = 'TOP'
      Visible = False
    end
    object cdsComentariosACTIVO: TStringField
      FieldName = 'ACTIVO'
      Visible = False
      Size = 1
    end
  end
  object dsComentarios: TDataSource
    DataSet = cdsComentarios
    Left = 112
    Top = 480
  end
  object cdsSeries: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 80
    Data = {
      B40000009619E0BD010000001800000006000000000003000000B40005434F4C
      4F520100490000000100055749445448020002003200064E4F4D425245010049
      00000001000557494454480200020032000641435449564F0100490000000100
      0557494454480200020001000756414C4F524553010049000000010005574944
      5448020002000100054F5244454E04000100000000000B5449504F4752414649
      434F01004900000001000557494454480200020032000000}
    object cdsSeriesCOLOR: TStringField
      DisplayLabel = '_'
      DisplayWidth = 1
      FieldName = 'COLOR'
      OnGetText = cdsSeriesCOLORGetText
      Size = 50
    end
    object cdsSeriesNOMBRE: TStringField
      DisplayLabel = 'Nombre'
      DisplayWidth = 24
      FieldName = 'NOMBRE'
      Size = 50
    end
    object cdsSeriesACTIVO: TStringField
      DisplayLabel = 'Act'
      DisplayWidth = 5
      FieldName = 'ACTIVO'
      OnChange = cdsSeriesACTIVOChange
      Size = 1
    end
    object cdsSeriesVALORES: TStringField
      DisplayLabel = 'Val'
      DisplayWidth = 3
      FieldName = 'VALORES'
      OnChange = cdsSeriesVALORESChange
      Size = 1
    end
    object cdsSeriesORDEN: TIntegerField
      FieldName = 'ORDEN'
      Visible = False
    end
    object cdsSeriesTIPOGRAFICO: TStringField
      FieldName = 'TIPOGRAFICO'
      Visible = False
      Size = 50
    end
  end
  object dsCoordenadas: TDataSource
    DataSet = cdsCoordenadas
    Left = 96
    Top = 112
  end
  object cdsCoordenadas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 112
    Data = {
      790000009619E0BD01000000180000000400000000000300000079000B4F5244
      454E5F5345524945040001000000000004454A45580100490000000100055749
      44544802000200320004454A4559010049000000010005574944544802000200
      3200104F5244454E5F434F4F5244454E41444104000100000000000000}
    object cdsCoordenadasORDEN_SERIE: TIntegerField
      DisplayWidth = 6
      FieldName = 'ORDEN_SERIE'
    end
    object cdsCoordenadasEJEX: TStringField
      DisplayWidth = 60
      FieldName = 'EJEX'
      Size = 50
    end
    object cdsCoordenadasEJEY: TStringField
      DisplayWidth = 60
      FieldName = 'EJEY'
      Size = 50
    end
    object cdsCoordenadasORDEN_COORDENADA: TIntegerField
      DisplayWidth = 24
      FieldName = 'ORDEN_COORDENADA'
    end
  end
end
