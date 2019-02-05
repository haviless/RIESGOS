object fSaldosVen: TfSaldosVen
  Left = 268
  Top = 32
  Cursor = crHandPoint
  BorderStyle = bsDialog
  Caption = 'Saldos Vencidos'
  ClientHeight = 634
  ClientWidth = 821
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    821
    634)
  PixelsPerInch = 96
  TextHeight = 13
  object grbParametros: TGroupBox
    Left = 6
    Top = 4
    Width = 557
    Height = 69
    Caption = 'Periodo De Proceso'
    TabOrder = 0
    object lblNomMes01: TLabel
      Left = 117
      Top = 40
      Width = 90
      Height = 18
      AutoSize = False
      Caption = 'DICIEMBRE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblNomMes02: TLabel
      Left = 328
      Top = 41
      Width = 90
      Height = 18
      AutoSize = False
      Caption = 'DICIEMBRE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 17
      Top = 21
      Width = 73
      Height = 13
      AutoSize = False
      Caption = 'Inicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 228
      Top = 21
      Width = 73
      Height = 13
      AutoSize = False
      Caption = 'Fin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BitProcesar: TBitBtn
      Left = 430
      Top = 33
      Width = 109
      Height = 26
      Cursor = crHandPoint
      Caption = 'Mostrar'
      TabOrder = 2
      OnClick = BitProcesarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333700000733333333F777773FF3333333007F0F70
        0333333773373377FF3333300FFF7FFF003333773F3333377FF33300F0FFFFF0
        F00337737333F37377F33707FFFF0FFFF70737F33337F33337FF300FFFFF0FFF
        FF00773F3337F333377F30707FFF0FFF70707F733337F333737F300FFFF09FFF
        FF0077F33377F33337733707FF0F9FFFF70737FF3737F33F37F33300F0FF9FF0
        F003377F7337F373773333300FFF9FFF00333377FF37F3377FF33300007F9F70
        000337777FF7FF77773333703070007030733373777777737333333333330333
        333333333337FF33333333333330003333333333337773333333}
      NumGlyphs = 2
    end
    object dbsAnoIni01: TwwDBSpinEdit
      Left = 14
      Top = 36
      Width = 59
      Height = 26
      Cursor = crHandPoint
      Increment = 1.000000000000000000
      MaxValue = 2050.000000000000000000
      MinValue = 2004.000000000000000000
      Value = 2004.000000000000000000
      AutoFillDate = False
      AutoSelect = False
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      LimitEditRect = True
      MaxLength = 4
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      OnChange = dbsAnoIni01Change
    end
    object dbsMesIni01: TwwDBSpinEdit
      Left = 78
      Top = 36
      Width = 35
      Height = 26
      Cursor = crHandPoint
      Increment = 1.000000000000000000
      MaxValue = 12.000000000000000000
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
      AutoFillDate = False
      AutoSelect = False
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      LimitEditRect = True
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      UsePictureMask = False
      OnChange = dbsMesIni01Change
    end
    object dbsAnoIni02: TwwDBSpinEdit
      Left = 225
      Top = 37
      Width = 59
      Height = 26
      Cursor = crHandPoint
      Increment = 1.000000000000000000
      MaxValue = 2050.000000000000000000
      MinValue = 2004.000000000000000000
      Value = 2004.000000000000000000
      AutoFillDate = False
      AutoSelect = False
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      LimitEditRect = True
      MaxLength = 4
      ParentFont = False
      TabOrder = 3
      UnboundDataType = wwDefault
      OnChange = dbsAnoIni02Change
    end
    object dbsMesIni02: TwwDBSpinEdit
      Left = 289
      Top = 37
      Width = 35
      Height = 26
      Cursor = crHandPoint
      Increment = 1.000000000000000000
      MaxValue = 12.000000000000000000
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
      AutoFillDate = False
      AutoSelect = False
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      LimitEditRect = True
      MaxLength = 2
      ParentFont = False
      TabOrder = 4
      UnboundDataType = wwDefault
      UsePictureMask = False
      OnChange = dbsMesIni02Change
    end
  end
  object PageControl1: TPageControl
    Left = 4
    Top = 81
    Width = 814
    Height = 512
    Cursor = crHandPoint
    ActivePage = TabSheet1
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Departamentos '
      object dtgCabVencidos: TwwDBGrid
        Left = 0
        Top = 0
        Width = 806
        Height = 484
        Cursor = crHandPoint
        DisableThemesInTitle = False
        LineStyle = gls3D
        Selected.Strings = (
          'DPTODES'#9'20'#9'Departamento'
          'MESANNO'#9'10'#9'Mes y A'#241'o'
          'NUMTOT'#9'10'#9'Asociados'#9'F'#9'Total General'
          'TOTAL'#9'15'#9'Monto'#9'F'#9'Total General'
          'NUMPOT'#9'10'#9'Asociados'#9'F'#9'Problemas~Potenciales'
          'PROPOT'#9'12'#9'Monto'#9'F'#9'Problemas~Potenciales'
          'NUMDEF'#9'10'#9'Asociados'#9'F'#9'Deficiente'
          'DEFICIENTE'#9'12'#9'Monto'#9'F'#9'Deficiente'
          'NUMDUD'#9'10'#9'Asociados'#9'F'#9'Dudoso'
          'DUDOSO'#9'12'#9'Monto'#9'F'#9'Dudoso'
          'NUMPER'#9'10'#9'Asociados'#9'F'#9'Perdida'
          'PERDIDA'#9'12'#9'Monto'#9'F'#9'Perdida')
        IniAttributes.Delimiter = ';;'
        ExportOptions.ExportType = wwgetSYLK
        TitleColor = clBtnFace
        FixedCols = 2
        ShowHorzScrollBar = True
        DataSource = DM1.dsConsulta
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 4
        TitleButtons = False
        OnDrawDataCell = dtgCabVencidosDrawDataCell
        OnDrawTitleCell = dtgCabVencidosDrawTitleCell
        FooterColor = 10930928
        FooterCellColor = clCaptionText
        PaintOptions.AlternatingRowColor = 14938339
        PaintOptions.ActiveRecordColor = clInfoBk
        GroupFieldName = 'DPTODES'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ugeles / Uses  '
      ImageIndex = 1
      object dtgDetVencidos: TwwDBGrid
        Left = 0
        Top = 0
        Width = 806
        Height = 484
        Cursor = crHandPoint
        DisableThemesInTitle = False
        LineStyle = gls3D
        Selected.Strings = (
          'USENOM'#9'35'#9'Ugeles/Uses'
          'MESANNO'#9'10'#9'Mes y A'#241'o'
          'NUMTOT'#9'10'#9'Asociados'#9'F'#9'Total General'
          'TOTAL'#9'15'#9'Monto'#9'F'#9'Total General'
          'NUMPOT'#9'10'#9'Asociados'#9'F'#9'Problemas~Potenciales'
          'PROPOT'#9'12'#9'Monto'#9'F'#9'Problemas~Potenciales'
          'NUMDEF'#9'10'#9'Asociados'#9'F'#9'Deficiente'
          'DEFICIENTE'#9'12'#9'Monto'#9'F'#9'Deficiente'
          'NUMDUD'#9'10'#9'Asociados'#9'F'#9'Dudoso'
          'DUDOSO'#9'12'#9'Monto'#9'F'#9'Dudoso'
          'NUMPER'#9'10'#9'Asociados'#9'F'#9'Perdida'
          'PERDIDA'#9'12'#9'Monto'#9'F'#9'Perdida')
        IniAttributes.Delimiter = ';;'
        ExportOptions.ExportType = wwgetSYLK
        TitleColor = clBtnFace
        FixedCols = 2
        ShowHorzScrollBar = True
        DataSource = DM1.dsCredito
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 4
        TitleButtons = False
        OnDrawDataCell = dtgDetVencidosDrawDataCell
        OnDrawTitleCell = dtgDetVencidosDrawTitleCell
        FooterColor = 10930928
        FooterCellColor = clCaptionText
        PaintOptions.AlternatingRowColor = 14938339
        PaintOptions.ActiveRecordColor = clInfoBk
        GroupFieldName = 'USENOM'
      end
    end
  end
  object BitSalir: TBitBtn
    Left = 707
    Top = 600
    Width = 105
    Height = 27
    Cursor = crHandPoint
    Caption = '&Salir'
    TabOrder = 2
    OnClick = BitSalirClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object BitGrafico: TBitBtn
    Left = 590
    Top = 599
    Width = 109
    Height = 28
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    Caption = 'Grafico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitGraficoClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300030003
      0003333377737773777333333333333333333FFFFFFFFFFFFFFF770000000000
      0000777777777777777733039993BBB3CCC3337F737F737F737F37039993BBB3
      CCC3377F737F737F737F33039993BBB3CCC33F7F737F737F737F77079997BBB7
      CCC77777737773777377330399930003CCC3337F737F7773737F370399933333
      CCC3377F737F3333737F330399933333CCC33F7F737FFFFF737F770700077777
      CCC77777777777777377330333333333CCC3337F33333333737F370333333333
      0003377F33333333777333033333333333333F7FFFFFFFFFFFFF770777777777
      7777777777777777777733333333333333333333333333333333}
    NumGlyphs = 2
    Spacing = 10
  end
  object BitExporta: TBitBtn
    Left = 362
    Top = 599
    Width = 109
    Height = 28
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    Caption = 'Exportar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitExportaClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
      000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
      0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
      080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
    Spacing = 10
  end
  object BitImpOfi: TBitBtn
    Left = 477
    Top = 599
    Width = 109
    Height = 28
    Cursor = crHandPoint
    Caption = 'General'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BitImpOfiClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333700073333333FFF3777773F3FFF00030990BB03
      000077737337F373777733309990BBB0333333373337F3373F3333099990BBBB
      033333733337F33373F337999990BBBBB73337F33337F33337F330999990BBBB
      B03337F33337FFFFF7F3309999900000003337F33337777777F33099990A0CCC
      C03337F3337373F337F3379990AAA0CCC733373F3733373F373333090AAAAA0C
      033333737333337373333330AAAAAAA033333FF73F33333733FF00330AAAAA03
      3000773373FFFF73377733333700073333333333377777333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
end
