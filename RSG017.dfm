object fCalfCtaxCob: TfCalfCtaxCob
  Left = 222
  Top = 245
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Calificaci'#243'n de Deudores y Exigencia de Provisiones'
  ClientHeight = 434
  ClientWidth = 986
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object dtgTmp02: TwwDBGrid
    Left = 680
    Top = 113
    Width = 143
    Height = 9
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsQry
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    Visible = False
  end
  object dtgTmp01: TwwDBGrid
    Left = 688
    Top = 136
    Width = 121
    Height = 11
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsqry5
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    Visible = False
  end
  object grpCalCar: TGroupBox
    Left = 0
    Top = 78
    Width = 986
    Height = 258
    Align = alClient
    Caption = 'Calificaci'#243'n De Cartera '
    TabOrder = 0
    object dtgData: TDBGrid
      Left = 23
      Top = 47
      Width = 26
      Height = 10
      DataSource = DM1.dsConsulta
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
    end
    object dtgClfCar: TwwDBGrid
      Left = 2
      Top = 15
      Width = 982
      Height = 241
      Cursor = crHandPoint
      DisableThemesInTitle = False
      Selected.Strings = (
        'RESUMEDES'#9'32'#9'Categoria~De Riesgo'
        'MOVIM'#9'8'#9'Cant.de~Asociados'
        'SALDOS'#9'15'#9'Saldo Total'
        'SALDOS_FP'#9'15'#9'Saldo~No Vencido'
        'SALDOS_FV'#9'15'#9'Saldo~Vencido'
        'SALDO_CB'#9'14'#9'Saldo Cubie.~(Garantia)'
        'SALDO_NC'#9'14'#9'Saldo No~Cubie.(Garantia)'
        'P_NC'#9'10'#9'(%)No Cubie.~(Garantia)'
        'PORNC'#9'15'#9'Saldo No Cubie.~(Garantia)'
        'P_CB'#9'10'#9'(%)Cubie.~(Garantia)'
        'PORCB'#9'13'#9'Saldo Cubie.~(Garantia)'
        'TOTPROV'#9'13'#9'Total~Provisi'#243'n'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = False
      ShowVertScrollBar = False
      Align = alClient
      DataSource = DM1.dsModelo
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Times New Roman'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 986
    Height = 78
    Align = alTop
    TabOrder = 3
    object grbParametros: TGroupBox
      Left = 5
      Top = 7
      Width = 220
      Height = 66
      Caption = 'Periodo De Proceso'
      TabOrder = 0
      object lblNomMes: TLabel
        Left = 122
        Top = 19
        Width = 87
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
      object dbsAnoIni: TwwDBSpinEdit
        Left = 14
        Top = 15
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
      end
      object dbsMesIni: TwwDBSpinEdit
        Left = 78
        Top = 15
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
        OnChange = dbsMesIniChange
      end
      object chkNoOficial: TCheckBox
        Left = 14
        Top = 44
        Width = 67
        Height = 17
        Caption = 'No Oficial'
        Enabled = False
        TabOrder = 2
      end
    end
    object BitProcesar: TBitBtn
      Left = 614
      Top = 11
      Width = 79
      Height = 62
      Cursor = crHandPoint
      Caption = 'Mostrar'
      TabOrder = 1
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
    object rdbTipCar: TRadioGroup
      Left = 230
      Top = 7
      Width = 197
      Height = 66
      Caption = 'Tipo de Cartera'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'General'
        'Normal'
        'Refinanciados'
        'Ampliados')
      TabOrder = 2
      OnClick = rdbTipCarClick
    end
    object rdbTipAso: TRadioGroup
      Left = 427
      Top = 7
      Width = 180
      Height = 66
      Caption = 'Tipo Asociado'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'General'
        'Activos'
        'Cesantes'
        'Contratados')
      TabOrder = 3
      OnClick = rdbTipAsoClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 336
    Width = 986
    Height = 98
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      986
      98)
    object Bevel3: TBevel
      Left = 234
      Top = 1
      Width = 2
      Height = 96
    end
    object Bevel4: TBevel
      Left = 360
      Top = 1
      Width = 2
      Height = 97
    end
    object Bevel5: TBevel
      Left = 601
      Top = 1
      Width = 2
      Height = 97
    end
    object ChkOfDes: TCheckBox
      Left = 6
      Top = 4
      Width = 75
      Height = 15
      Cursor = crHandPoint
      Caption = 'Por Oficina'
      TabOrder = 0
      OnClick = ChkOfDesClick
    end
    object pnlOficinas: TPanel
      Left = 6
      Top = 18
      Width = 219
      Height = 34
      Enabled = False
      Locked = True
      TabOrder = 1
      object Panel1: TPanel
        Left = 46
        Top = 2
        Width = 171
        Height = 30
        BevelOuter = bvNone
        Caption = 'Panel1'
        Enabled = False
        TabOrder = 0
        object EdtOfiDes: TEdit
          Left = 0
          Top = 3
          Width = 169
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object DBLkOfiDes: TwwDBLookupCombo
        Left = 2
        Top = 5
        Width = 44
        Height = 24
        Cursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'OFDESID'#9'2'#9'Codigo'#9'F'
          'OFDESNOM'#9'25'#9'Descripci'#243'n'#9'F')
        LookupTable = DM1.cdsOfDes
        LookupField = 'OFDESID'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnChange = DBLkOfiDesChange
      end
    end
    object BitResClfCar: TBitBtn
      Left = 6
      Top = 58
      Width = 109
      Height = 28
      Cursor = crHandPoint
      Hint = 'Imprimir'
      Caption = 'Resumen'
      TabOrder = 2
      OnClick = BitResClfCarClick
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
    object BitConOfi: TBitBtn
      Left = 118
      Top = 58
      Width = 109
      Height = 28
      Cursor = crHandPoint
      Hint = 'Consolidado Por Oficina Desconcentrada'
      Caption = 'Consolidado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitConOfiClick
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
    object BitSalir: TBitBtn
      Left = 875
      Top = 64
      Width = 105
      Height = 28
      Cursor = crHandPoint
      Hint = 'Salir'
      Caption = '&Salir'
      TabOrder = 4
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
    object chk01: TCheckBox
      Left = 247
      Top = 6
      Width = 97
      Height = 17
      Cursor = crHandPoint
      Caption = 'Resumen'
      TabOrder = 5
    end
    object chk02: TCheckBox
      Left = 247
      Top = 22
      Width = 97
      Height = 17
      Cursor = crHandPoint
      Caption = 'Consolidado'
      TabOrder = 6
    end
    object chk03: TCheckBox
      Left = 247
      Top = 39
      Width = 97
      Height = 17
      Cursor = crHandPoint
      Caption = 'Int. Devengados'
      TabOrder = 7
    end
    object BitExporta: TBitBtn
      Left = 246
      Top = 58
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
      TabOrder = 8
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
    object BitIntDev: TBitBtn
      Left = 369
      Top = 8
      Width = 109
      Height = 28
      Cursor = crHandPoint
      Hint = 'Consolidado Por Oficina Desconcentrada'
      Caption = 'Int. Devengados'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = BitIntDevClick
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
    object BitIngresos: TBitBtn
      Left = 369
      Top = 40
      Width = 109
      Height = 28
      Cursor = crHandPoint
      Hint = 'Consolidado Por Oficina Desconcentrada'
      Caption = 'Cancelaciones'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = BitIngresosClick
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
    object BitInventarios: TBitBtn
      Left = 485
      Top = 8
      Width = 109
      Height = 28
      Cursor = crHandPoint
      Hint = 'Consolidado Por Oficina Desconcentrada'
      Caption = 'Inv. Deudores'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = BitInventariosClick
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
    object BitGrafico: TBitBtn
      Left = 485
      Top = 40
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
      TabOrder = 12
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
  end
  object ppRepClfcar: TppReport
    AutoStop = False
    DataPipeline = ppDBResClfCar
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 178
    Top = 165
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBResClfCar'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42069
      mmPrintPosition = 0
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 12965
        mmLeft = 242623
        mmTop = 28575
        mmWidth = 23283
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        mmHeight = 12965
        mmLeft = 211403
        mmTop = 28575
        mmWidth = 31485
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 12965
        mmLeft = 180182
        mmTop = 28575
        mmWidth = 31485
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 12965
        mmLeft = 129646
        mmTop = 28575
        mmWidth = 26194
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 12965
        mmLeft = 52388
        mmTop = 28575
        mmWidth = 30163
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 12965
        mmLeft = 30427
        mmTop = 28575
        mmWidth = 22225
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 12965
        mmLeft = 0
        mmTop = 28575
        mmWidth = 30692
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 0
        mmWidth = 34396
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Sistema de Riesgos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 0
        mmTop = 4498
        mmWidth = 25315
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Fecha  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 233892
        mmTop = 265
        mmWidth = 9349
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Hora   '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 233892
        mmTop = 4763
        mmWidth = 8114
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Pag      '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 234157
        mmTop = 9260
        mmWidth = 9172
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 247386
        mmTop = 265
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 247121
        mmTop = 5027
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 247915
        mmTop = 9260
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 245534
        mmTop = 8996
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 245534
        mmTop = 4498
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 245534
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object ppLbltit: TppLabel
        UserName = 'Lbltit'
        AutoSize = False
        Caption = 'LblTitulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 0
        mmTop = 13758
        mmWidth = 266171
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Categoria De Riesgo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 32279
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = '(seg'#250'n dias de atraso)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 36248
        mmWidth = 29104
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'De Deudores'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 33602
        mmTop = 33602
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Numero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 34660
        mmTop = 29633
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 46302
        mmTop = 37306
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label301'
        AutoSize = False
        Caption = 'Cantidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 33602
        mmTop = 37306
        mmWidth = 11377
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 12965
        mmLeft = 155575
        mmTop = 28575
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 246592
        mmTop = 29369
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'Provisiones '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 245269
        mmTop = 33338
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 'Sobre El Saldo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 213519
        mmTop = 29369
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        AutoSize = False
        Caption = 'Cubierto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 213519
        mmTop = 33338
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 215636
        mmTop = 37306
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label302'
        AutoSize = False
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 231246
        mmTop = 37306
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        AutoSize = False
        Caption = 'Sobre El Saldo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 29104
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        AutoSize = False
        Caption = 'No Cubierto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 33338
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        AutoSize = False
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 182563
        mmTop = 37306
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        AutoSize = False
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 199232
        mmTop = 37306
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        AutoSize = False
        Caption = 'Saldo Cubierto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 156898
        mmTop = 29104
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        AutoSize = False
        Caption = 'Por La Garantia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 33338
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        AutoSize = False
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 136261
        mmTop = 37306
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        AutoSize = False
        Caption = 'Saldo No Cubierto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 29104
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        AutoSize = False
        Caption = 'Por La Garantia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 156898
        mmTop = 33338
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        AutoSize = False
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 160602
        mmTop = 37306
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        AutoSize = False
        Caption = 'Saldo Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 56356
        mmTop = 32544
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label501'
        AutoSize = False
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 56092
        mmTop = 37306
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        AutoSize = False
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 70379
        mmTop = 37306
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label58'
        AutoSize = False
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 251355
        mmTop = 37306
        mmWidth = 9525
        BandType = 0
      end
      object lblOfiDes: TppLabel
        UserName = 'Lbltit1'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 24077
        mmWidth = 136525
        BandType = 0
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        mmHeight = 12965
        mmLeft = 82286
        mmTop = 28575
        mmWidth = 23548
        BandType = 0
      end
      object ppShape21: TppShape
        UserName = 'Shape21'
        mmHeight = 12965
        mmLeft = 105569
        mmTop = 28575
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel194: TppLabel
        UserName = 'Label194'
        AutoSize = False
        Caption = 'Saldo Vencido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 107421
        mmTop = 31485
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel200: TppLabel
        UserName = 'Label200'
        AutoSize = False
        Caption = 'Saldo Pendiente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 83608
        mmTop = 31485
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel201: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 89429
        mmTop = 37042
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel202: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 37042
        mmWidth = 8731
        BandType = 0
      end
      object lblmsg02: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = ' ***  INFORMACI'#210'N NO OFICIAL ***'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 7408
        mmLeft = 78052
        mmTop = 1058
        mmWidth = 108215
        BandType = 0
      end
      object lblTitulo: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 19579
        mmWidth = 136525
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'RESUMEDES'
        DataPipeline = ppDBResClfCar
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 2910
        mmLeft = 0
        mmTop = 0
        mmWidth = 29369
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'MOVIM'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3440
        mmLeft = 29898
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'MOVIM_POR'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 2879
        mmLeft = 43127
        mmTop = 265
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'SALDOS_FT'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3440
        mmLeft = 50536
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'SALDOTOTAL_POR'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3175
        mmLeft = 74613
        mmTop = 265
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText201'
        DataField = 'SALDO_NC'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3440
        mmLeft = 130440
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'SALDO_CB'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3440
        mmLeft = 156369
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'P_NC'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 2879
        mmLeft = 180182
        mmTop = 265
        mmWidth = 7938
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'PORNC'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3440
        mmLeft = 189442
        mmTop = 0
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'P_CB'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 2879
        mmLeft = 212725
        mmTop = 529
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'PORCB'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3440
        mmLeft = 221721
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'TOTPROV'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3440
        mmLeft = 244211
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'SALDOS_FP'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3440
        mmLeft = 82815
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'SALDOS_FV'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3440
        mmLeft = 107950
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 52917
      mmPrintPosition = 0
      object ppShape11: TppShape
        UserName = 'Shape11'
        mmHeight = 6350
        mmLeft = 0
        mmTop = 0
        mmWidth = 266171
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'MOVIM'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 4233
        mmLeft = 29898
        mmTop = 1058
        mmWidth = 12435
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'MOVIM_POR'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 2879
        mmLeft = 43392
        mmTop = 1588
        mmWidth = 5821
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'SALDOS_FT'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3704
        mmLeft = 50536
        mmTop = 1323
        mmWidth = 23284
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'SALDOTOTAL_POR'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 2879
        mmLeft = 74613
        mmTop = 1588
        mmWidth = 6879
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'SALDO_NC'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 1323
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'SALDO_CB'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 1323
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'PORNC'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3704
        mmLeft = 189441
        mmTop = 1058
        mmWidth = 21961
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc16'
        DataField = 'PORCB'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3704
        mmLeft = 221721
        mmTop = 1323
        mmWidth = 21167
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc17'
        DataField = 'TOTPROV'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3704
        mmLeft = 244211
        mmTop = 1323
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'TOTALES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 2646
        mmTop = 1058
        mmWidth = 25400
        BandType = 7
      end
      object lblIndice: TppLabel
        UserName = 'lblIndice'
        AutoSize = False
        Caption = '0.00007'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 147638
        mmTop = 25135
        mmWidth = 13758
        BandType = 7
      end
      object ppLabel70: TppLabel
        UserName = 'lblIndice1'
        AutoSize = False
        Caption = 'SALDO VENCIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 114829
        mmTop = 22490
        mmWidth = 28310
        BandType = 7
      end
      object ppLabel71: TppLabel
        UserName = 'Label71'
        AutoSize = False
        Caption = 'SALDO TOTAL '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 114829
        mmTop = 27781
        mmWidth = 28310
        BandType = 7
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Visible = False
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 114036
        mmTop = 26723
        mmWidth = 26458
        BandType = 7
      end
      object ppLabel72: TppLabel
        UserName = 'lblIndice2'
        AutoSize = False
        Caption = 'INDICE DE MOROSIDAD  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 69321
        mmTop = 25135
        mmWidth = 39423
        BandType = 7
      end
      object ppLabel75: TppLabel
        UserName = 'lblIndice3'
        AutoSize = False
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 143934
        mmTop = 25135
        mmWidth = 3175
        BandType = 7
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        AutoSize = False
        Caption = 'INDICE DE PROVISIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 69586
        mmTop = 14552
        mmWidth = 39423
        BandType = 7
      end
      object ppLabel77: TppLabel
        UserName = 'Label77'
        AutoSize = False
        Caption = 'TOTAL PROVISION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 115359
        mmTop = 11906
        mmWidth = 28046
        BandType = 7
      end
      object ppLabel78: TppLabel
        UserName = 'Label78'
        AutoSize = False
        Caption = 'SALDO VENCIDO '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 115094
        mmTop = 17198
        mmWidth = 28310
        BandType = 7
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 114565
        mmTop = 16140
        mmWidth = 26458
        BandType = 7
      end
      object ppLabel79: TppLabel
        UserName = 'Label79'
        AutoSize = False
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 144198
        mmTop = 14288
        mmWidth = 3175
        BandType = 7
      end
      object lblProv: TppLabel
        UserName = 'lblIndice4'
        AutoSize = False
        Caption = '0.00007'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 147902
        mmTop = 14288
        mmWidth = 13758
        BandType = 7
      end
      object ppLabel80: TppLabel
        UserName = 'Label80'
        AutoSize = False
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 110067
        mmTop = 25135
        mmWidth = 3175
        BandType = 7
      end
      object ppLabel81: TppLabel
        UserName = 'Label801'
        AutoSize = False
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 110596
        mmTop = 14552
        mmWidth = 3175
        BandType = 7
      end
      object lblPorMor: TppLabel
        UserName = 'lblIndice5'
        AutoSize = False
        Caption = '8.64'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 164042
        mmTop = 25135
        mmWidth = 13229
        BandType = 7
      end
      object lblPorPro: TppLabel
        UserName = 'lblPorPro'
        AutoSize = False
        Caption = '51.55'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 164571
        mmTop = 14288
        mmWidth = 13229
        BandType = 7
      end
      object ppDBCalc34: TppDBCalc
        UserName = 'DBCalc34'
        DataField = 'SALDOS_FP'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3704
        mmLeft = 82814
        mmTop = 1058
        mmWidth = 23284
        BandType = 7
      end
      object ppDBCalc35: TppDBCalc
        UserName = 'DBCalc35'
        DataField = 'SALDOS_FV'
        DataPipeline = ppDBResClfCar
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBResClfCar'
        mmHeight = 3704
        mmLeft = 107950
        mmTop = 1058
        mmWidth = 21166
        BandType = 7
      end
    end
    object daDataModule1: TdaDataModule
    end
  end
  object ppDBResClfCar: TppDBPipeline
    DataSource = DM1.dsDetalle
    UserName = 'ppDBResClfCar'
    Left = 176
    Top = 128
  end
  object DataCons: TppDBPipeline
    DataSource = DM1.dsQry6
    UserName = 'DataCons'
    Left = 216
    Top = 128
  end
  object RepCons: TppReport
    AutoStop = False
    DataPipeline = DataCons
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'F:\SOLREPO\COB\cxcres.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 216
    Top = 168
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'DataCons'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38629
      mmPrintPosition = 0
      object LblTitulo01: TppLabel
        UserName = 'LblTitulo1'
        AutoSize = False
        Caption = 'LblTitulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 2117
        mmTop = 14023
        mmWidth = 198702
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'Label141'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 0
        mmWidth = 34396
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label142'
        Caption = 'Sistema de Riesgos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 0
        mmTop = 4498
        mmWidth = 25315
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'Label143'
        Caption = 'Fecha  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163513
        mmTop = 0
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'Label144'
        Caption = 'Hora    '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163513
        mmTop = 4498
        mmWidth = 10160
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label145'
        Caption = 'Pag     '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163777
        mmTop = 8996
        mmWidth = 10160
        BandType = 0
      end
      object ppSystemVariable13: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 177007
        mmTop = 265
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable14: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 176742
        mmTop = 5027
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable15: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 177536
        mmTop = 9260
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label146'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175155
        mmTop = 8996
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label147'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175155
        mmTop = 4498
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label102'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175155
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line1'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 11113
        mmTop = 37041
        mmWidth = 180447
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line2'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 11113
        mmTop = 28840
        mmWidth = 180446
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Oficina Desconcentrada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 12700
        mmTop = 32279
        mmWidth = 45244
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Morosidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 80433
        mmTop = 33338
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Provision'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 137584
        mmTop = 33338
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label82'
        AutoSize = False
        Caption = '(%)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 110596
        mmTop = 32279
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'Label95'
        AutoSize = False
        Caption = '(%)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 166952
        mmTop = 32808
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label96'
        AutoSize = False
        Caption = 'Indice De'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 80433
        mmTop = 29633
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'Label97'
        AutoSize = False
        Caption = 'Indice De'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 137584
        mmTop = 29633
        mmWidth = 14817
        BandType = 0
      end
      object lblmsg03: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = ' ***  INFORMACI'#210'N NO OFICIAL ***'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 7408
        mmLeft = 50271
        mmTop = 2910
        mmWidth = 108215
        BandType = 0
      end
      object Titulo: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 20108
        mmWidth = 116681
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'DBText79'
        DataField = 'OFDESNOM'
        DataPipeline = DataCons
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DataCons'
        mmHeight = 3598
        mmLeft = 12965
        mmTop = 0
        mmWidth = 50800
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText80'
        DataField = 'INDMOR'
        DataPipeline = DataCons
        DisplayFormat = '##0.####0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DataCons'
        mmHeight = 3598
        mmLeft = 65088
        mmTop = 0
        mmWidth = 30956
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText802'
        DataField = 'PORMOR'
        DataPipeline = DataCons
        DisplayFormat = '###.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DataCons'
        mmHeight = 3598
        mmLeft = 98690
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText803'
        DataField = 'INDPRO'
        DataPipeline = DataCons
        DisplayFormat = '##0.####0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DataCons'
        mmHeight = 3598
        mmLeft = 120650
        mmTop = 0
        mmWidth = 30956
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'PORPRO'
        DataPipeline = DataCons
        DisplayFormat = '###.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DataCons'
        mmHeight = 3598
        mmLeft = 155311
        mmTop = 0
        mmWidth = 19314
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppLabel94: TppLabel
        UserName = 'Label149'
        AutoSize = False
        Caption = 'TOTAL GENERAL  :  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 19315
        mmTop = 2117
        mmWidth = 38100
        BandType = 7
      end
      object ppLine15: TppLine
        UserName = 'Line31'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 11113
        mmTop = 1058
        mmWidth = 180447
        BandType = 7
      end
      object ppLine16: TppLine
        UserName = 'Line32'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 11113
        mmTop = 7408
        mmWidth = 180447
        BandType = 7
      end
      object lblIndMor: TppLabel
        UserName = 'lblIndMor'
        AutoSize = False
        Caption = 'lblIndMor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 65088
        mmTop = 2117
        mmWidth = 30956
        BandType = 7
      end
      object lblrPorMor: TppLabel
        UserName = 'lblrPorMor'
        AutoSize = False
        Caption = 'lblrPorMor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 98689
        mmTop = 2117
        mmWidth = 19315
        BandType = 7
      end
      object lblIndPro: TppLabel
        UserName = 'lblIndPro'
        AutoSize = False
        Caption = 'lblIndPro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 2117
        mmWidth = 30956
        BandType = 7
      end
      object lblrPorPro: TppLabel
        UserName = 'lblrPorPro'
        AutoSize = False
        Caption = 'lblrPorPro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 155311
        mmTop = 2117
        mmWidth = 19315
        BandType = 7
      end
    end
  end
  object RepIntDev: TppReport
    AutoStop = False
    DataPipeline = DbIntDev
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 138
    Top = 165
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'DbIntDev'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42069
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape9'
        mmHeight = 12965
        mmLeft = 211403
        mmTop = 28575
        mmWidth = 23283
        BandType = 0
      end
      object ppShape14: TppShape
        UserName = 'Shape7'
        mmHeight = 12965
        mmLeft = 180182
        mmTop = 28575
        mmWidth = 31485
        BandType = 0
      end
      object ppShape15: TppShape
        UserName = 'Shape5'
        mmHeight = 12965
        mmLeft = 126736
        mmTop = 28575
        mmWidth = 27517
        BandType = 0
      end
      object ppShape16: TppShape
        UserName = 'Shape3'
        mmHeight = 12965
        mmLeft = 95250
        mmTop = 28575
        mmWidth = 31750
        BandType = 0
      end
      object ppShape17: TppShape
        UserName = 'Shape2'
        mmHeight = 12965
        mmLeft = 70379
        mmTop = 28575
        mmWidth = 25135
        BandType = 0
      end
      object ppShape18: TppShape
        UserName = 'Shape1'
        mmHeight = 12965
        mmLeft = 0
        mmTop = 28575
        mmWidth = 70644
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label5'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 0
        mmWidth = 34396
        BandType = 0
      end
      object ppLabel119: TppLabel
        UserName = 'Label6'
        Caption = 'Sistema de Riesgos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 0
        mmTop = 4498
        mmWidth = 25315
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'Label7'
        Caption = 'Fecha  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205317
        mmTop = 265
        mmWidth = 9349
        BandType = 0
      end
      object ppLabel123: TppLabel
        UserName = 'Label8'
        Caption = 'Hora   '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205317
        mmTop = 4763
        mmWidth = 8114
        BandType = 0
      end
      object ppLabel124: TppLabel
        UserName = 'Label9'
        Caption = 'Pag      '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 205582
        mmTop = 9260
        mmWidth = 9172
        BandType = 0
      end
      object ppSystemVariable19: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 218811
        mmTop = 265
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable20: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 218546
        mmTop = 5027
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable21: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 219340
        mmTop = 9260
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel125: TppLabel
        UserName = 'Label10'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 216959
        mmTop = 8996
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel126: TppLabel
        UserName = 'Label11'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 216959
        mmTop = 4498
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel127: TppLabel
        UserName = 'Label12'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 216959
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object ppLbltit01: TppLabel
        UserName = 'Lbltit'
        AutoSize = False
        Caption = 'LblTitulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 11642
        mmWidth = 235215
        BandType = 0
      end
      object ppLabel129: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Categoria De Riesgo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 32279
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel130: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = '(seg'#250'n dias de atraso)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 36248
        mmWidth = 29104
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'De Deudores'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 73554
        mmTop = 33602
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel132: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Numero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 29633
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel134: TppLabel
        UserName = 'Label301'
        AutoSize = False
        Caption = 'Cantidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76729
        mmTop = 37306
        mmWidth = 11377
        BandType = 0
      end
      object ppShape19: TppShape
        UserName = 'Shape6'
        mmHeight = 12965
        mmLeft = 153988
        mmTop = 28575
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel135: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'Intereses'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 215371
        mmTop = 29369
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel136: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'Devengados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 214048
        mmTop = 33338
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel145: TppLabel
        UserName = 'Label41'
        AutoSize = False
        Caption = 'Intereses'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 29104
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel150: TppLabel
        UserName = 'Label42'
        AutoSize = False
        Caption = 'Devengados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 33338
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel152: TppLabel
        UserName = 'Label44'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 191030
        mmTop = 37306
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel153: TppLabel
        UserName = 'Label45'
        AutoSize = False
        Caption = 'Intereses'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 154517
        mmTop = 29104
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel154: TppLabel
        UserName = 'Label46'
        AutoSize = False
        Caption = 'Devengados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 127794
        mmTop = 33338
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel155: TppLabel
        UserName = 'Label47'
        AutoSize = False
        Caption = 'Vencidos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 37306
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel156: TppLabel
        UserName = 'Label48'
        AutoSize = False
        Caption = 'Intereses'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 127794
        mmTop = 29104
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel157: TppLabel
        UserName = 'Label49'
        AutoSize = False
        Caption = 'Devengados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 155046
        mmTop = 33338
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel158: TppLabel
        UserName = 'Label50'
        AutoSize = False
        Caption = 'Pendientes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 37306
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel159: TppLabel
        UserName = 'Label51'
        AutoSize = False
        Caption = 'Saldo Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 101071
        mmTop = 32544
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel160: TppLabel
        UserName = 'Label501'
        AutoSize = False
        Caption = 'De Cartera'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 100806
        mmTop = 37306
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel162: TppLabel
        UserName = 'Label58'
        AutoSize = False
        Caption = 'Del Mes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 215371
        mmTop = 37306
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel163: TppLabel
        UserName = 'Lbltit1'
        AutoSize = False
        Caption = 'INTERESES DEVENGADOS A NIVEL NACIONAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 23283
        mmWidth = 136525
        BandType = 0
      end
      object lblmsg01: TppLabel
        UserName = 'lblmsg01'
        AutoSize = False
        Caption = ' ***  INFORMACI'#210'N NO OFICIAL ***'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 7408
        mmLeft = 71967
        mmTop = 2646
        mmWidth = 108215
        BandType = 0
      end
      object Rotulo: TppLabel
        UserName = 'Rotulo'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 18256
        mmWidth = 136525
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText32: TppDBText
        UserName = 'DBText14'
        DataField = 'RESUMEDES'
        DataPipeline = DbIntDev
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 2910
        mmLeft = 0
        mmTop = 0
        mmWidth = 66675
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText15'
        DataField = 'MOVIM'
        DataPipeline = DbIntDev
        DisplayFormat = '###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 3440
        mmLeft = 74613
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText17'
        DataField = 'SALDOS_FT'
        DataPipeline = DbIntDev
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 3440
        mmLeft = 97102
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText201'
        DataField = 'INTERES_FV'
        DataPipeline = DbIntDev
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 3440
        mmLeft = 128059
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText22'
        DataField = 'INTERES_FP'
        DataPipeline = DbIntDev
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 3440
        mmLeft = 155575
        mmTop = 0
        mmWidth = 24341
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText24'
        DataField = 'INTERES_FT'
        DataPipeline = DbIntDev
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 3440
        mmLeft = 184680
        mmTop = 0
        mmWidth = 21961
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText27'
        DataField = 'INTERES_PM'
        DataPipeline = DbIntDev
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 3440
        mmLeft = 212461
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand7: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 52917
      mmPrintPosition = 0
      object ppShape20: TppShape
        UserName = 'Shape11'
        mmHeight = 6350
        mmLeft = 0
        mmTop = 0
        mmWidth = 234686
        BandType = 7
      end
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'MOVIM'
        DataPipeline = DbIntDev
        DisplayFormat = '###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 4233
        mmLeft = 74613
        mmTop = 1058
        mmWidth = 15347
        BandType = 7
      end
      object ppDBCalc22: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'SALDOS_FT'
        DataPipeline = DbIntDev
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 3704
        mmLeft = 97102
        mmTop = 1323
        mmWidth = 26988
        BandType = 7
      end
      object ppDBCalc24: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'INTERES_FV'
        DataPipeline = DbIntDev
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 1323
        mmWidth = 24342
        BandType = 7
      end
      object ppDBCalc25: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'INTERES_FP'
        DataPipeline = DbIntDev
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 3704
        mmLeft = 155575
        mmTop = 1323
        mmWidth = 24342
        BandType = 7
      end
      object ppDBCalc26: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'INTERES_FT'
        DataPipeline = DbIntDev
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 3704
        mmLeft = 184681
        mmTop = 1058
        mmWidth = 21961
        BandType = 7
      end
      object ppDBCalc28: TppDBCalc
        UserName = 'DBCalc17'
        DataField = 'INTERES_PM'
        DataPipeline = DbIntDev
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DbIntDev'
        mmHeight = 3704
        mmLeft = 212461
        mmTop = 1323
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel164: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'TOTALES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 2646
        mmTop = 1058
        mmWidth = 25400
        BandType = 7
      end
    end
  end
  object DbIntDev: TppDBPipeline
    DataSource = DM1.dsQry
    UserName = 'ppDBResClfCar1'
    Left = 136
    Top = 128
  end
  object PPDBPInventarios_Inicial: TppDBPipeline
    DataSource = DM1.dsQry22
    UserName = 'PPDBPInventarios_Inicial'
    Left = 264
    Top = 128
    object PPDBPInventariosppField1: TppField
      FieldAlias = 'PERIODO'
      FieldName = 'PERIODO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object PPDBPInventariosppField2: TppField
      FieldAlias = 'ORDEN'
      FieldName = 'ORDEN'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object PPDBPInventariosppField3: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object PPDBPInventariosppField4: TppField
      FieldAlias = 'DETALLE'
      FieldName = 'DETALLE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object PPDBPInventariosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANTIDAD'
      FieldName = 'CANTIDAD'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 33
      Position = 4
    end
  end
  object PPRInventarios: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 
      'D:\Modulos\Dise'#241'ador de Reportes\Riesgos\Inventarios de Cartera.' +
      'rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 264
    Top = 158
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 178859
      mmPrintPosition = 0
      object ppShape12: TppShape
        UserName = 'Shape3'
        mmHeight = 59796
        mmLeft = 34925
        mmTop = 43392
        mmWidth = 133350
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 0
        mmWidth = 34396
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Sistema de Riesgos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 1852
        mmTop = 4498
        mmWidth = 25315
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Fecha  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 169863
        mmTop = 0
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Hora    '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 169863
        mmTop = 4498
        mmWidth = 10160
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Pag     '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 170127
        mmTop = 8996
        mmWidth = 10160
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 183357
        mmTop = 265
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 183092
        mmTop = 5027
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 183886
        mmTop = 9260
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 181505
        mmTop = 8996
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 181505
        mmTop = 4498
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 181505
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object PPLTitulo01: TppLabel
        UserName = 'PPLTitulo01'
        AutoSize = False
        Caption = 'INVENTARIO N'#218'MERO DEUDORES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 529
        mmTop = 20902
        mmWidth = 202671
        BandType = 0
      end
      object ppsrInicial: TppSubReport
        UserName = 'srInicial'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'PPDBPInventarios_Inicial'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 44979
        mmWidth = 203200
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = PPDBPInventarios_Inicial
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'PPDBPInventarios_Inicial'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'TIPO'
              DataPipeline = PPDBPInventarios_Inicial
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              SuppressRepeatedValues = True
              Transparent = True
              DataPipelineName = 'PPDBPInventarios_Inicial'
              mmHeight = 4191
              mmLeft = 38100
              mmTop = 0
              mmWidth = 38629
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              DataField = 'DETALLE'
              DataPipeline = PPDBPInventarios_Inicial
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'PPDBPInventarios_Inicial'
              mmHeight = 3969
              mmLeft = 78317
              mmTop = 0
              mmWidth = 55827
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'CANTIDAD'
              DataPipeline = PPDBPInventarios_Inicial
              DisplayFormat = '#,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'PPDBPInventarios_Inicial'
              mmHeight = 4191
              mmLeft = 147902
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
            object ppLine1: TppLine
              UserName = 'Line1'
              Weight = 0.750000000000000000
              mmHeight = 529
              mmLeft = 34925
              mmTop = 1058
              mmWidth = 133350
              BandType = 7
            end
          end
        end
      end
      object ppsrEntraron: TppSubReport
        UserName = 'srEntraron'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppsrInicial
        TraverseAllData = False
        DataPipelineName = 'PPDBPInventarios_Entraron'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 49742
        mmWidth = 203200
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = PPDBPInventarios_Entraron
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'PPDBPInventarios_Entraron'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 1058
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText4: TppDBText
              UserName = 'DBText1'
              DataField = 'TIPO'
              DataPipeline = PPDBPInventarios_Entraron
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              SuppressRepeatedValues = True
              Transparent = True
              DataPipelineName = 'PPDBPInventarios_Entraron'
              mmHeight = 4191
              mmLeft = 38100
              mmTop = 0
              mmWidth = 38629
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText2'
              DataField = 'DETALLE'
              DataPipeline = PPDBPInventarios_Entraron
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'PPDBPInventarios_Entraron'
              mmHeight = 3969
              mmLeft = 78317
              mmTop = 0
              mmWidth = 55827
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText3'
              DataField = 'CANTIDAD'
              DataPipeline = PPDBPInventarios_Entraron
              DisplayFormat = '#,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'PPDBPInventarios_Entraron'
              mmHeight = 4191
              mmLeft = 147902
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
            object ppLine2: TppLine
              UserName = 'Line2'
              Weight = 0.750000000000000000
              mmHeight = 794
              mmLeft = 34925
              mmTop = 794
              mmWidth = 133350
              BandType = 7
            end
          end
        end
      end
      object ppsrSalieron: TppSubReport
        UserName = 'srSalieron'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppsrEntraron
        TraverseAllData = False
        DataPipelineName = 'PPDBPInventarios_Salieron'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 54504
        mmWidth = 203200
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = PPDBPInventarios_Salieron
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'PPDBPInventarios_Salieron'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 1058
            mmPrintPosition = 0
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText7: TppDBText
              UserName = 'DBText1'
              DataField = 'TIPO'
              DataPipeline = PPDBPInventarios_Salieron
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              SuppressRepeatedValues = True
              Transparent = True
              DataPipelineName = 'PPDBPInventarios_Salieron'
              mmHeight = 4191
              mmLeft = 38100
              mmTop = 0
              mmWidth = 38629
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText2'
              DataField = 'DETALLE'
              DataPipeline = PPDBPInventarios_Salieron
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'PPDBPInventarios_Salieron'
              mmHeight = 3969
              mmLeft = 78317
              mmTop = 0
              mmWidth = 55827
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText3'
              DataField = 'CANTIDAD'
              DataPipeline = PPDBPInventarios_Salieron
              DisplayFormat = '#,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'PPDBPInventarios_Salieron'
              mmHeight = 3969
              mmLeft = 147902
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand5: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1323
            mmPrintPosition = 0
            object ppLine3: TppLine
              UserName = 'Line3'
              Weight = 0.750000000000000000
              mmHeight = 529
              mmLeft = 34925
              mmTop = 794
              mmWidth = 133350
              BandType = 7
            end
          end
          object ppGroup1: TppGroup
            BreakName = 'TIPO'
            DataPipeline = PPDBPInventarios_Salieron
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'PPDBPInventarios_Salieron'
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 5556
              mmPrintPosition = 0
              object ppDBCalc3: TppDBCalc
                UserName = 'DBCalc1'
                DataField = 'CANTIDAD'
                DataPipeline = PPDBPInventarios_Salieron
                DisplayFormat = '#,0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                ResetGroup = ppGroup1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'PPDBPInventarios_Salieron'
                mmHeight = 4191
                mmLeft = 147902
                mmTop = 1588
                mmWidth = 17198
                BandType = 5
                GroupNo = 0
              end
              object ppLine6: TppLine
                UserName = 'Line6'
                Weight = 0.750000000000000000
                mmHeight = 2910
                mmLeft = 147638
                mmTop = 529
                mmWidth = 17463
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
      object ppsrFinal: TppSubReport
        UserName = 'srFinal'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppsrSalieron
        TraverseAllData = False
        DataPipelineName = 'PPDBPInventarios_Final'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 59267
        mmWidth = 203200
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = PPDBPInventarios_Final
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'PPDBPInventarios_Final'
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 1058
            mmPrintPosition = 0
          end
          object ppDetailBand6: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText19: TppDBText
              UserName = 'DBText1'
              DataField = 'TIPO'
              DataPipeline = PPDBPInventarios_Final
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              SuppressRepeatedValues = True
              Transparent = True
              DataPipelineName = 'PPDBPInventarios_Final'
              mmHeight = 4191
              mmLeft = 38100
              mmTop = 0
              mmWidth = 38629
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText2'
              DataField = 'DETALLE'
              DataPipeline = PPDBPInventarios_Final
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'PPDBPInventarios_Final'
              mmHeight = 4191
              mmLeft = 78317
              mmTop = 0
              mmWidth = 55827
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText3'
              DataField = 'CANTIDAD'
              DataPipeline = PPDBPInventarios_Final
              DisplayFormat = '#,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'PPDBPInventarios_Final'
              mmHeight = 4191
              mmLeft = 147902
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand6: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = '(a) + (b) - (c)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              WordWrap = True
              mmHeight = 5027
              mmLeft = 41804
              mmTop = 0
              mmWidth = 31750
              BandType = 7
            end
          end
        end
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 59267
        mmLeft = 74348
        mmTop = 43656
        mmWidth = 3704
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 59267
        mmLeft = 141817
        mmTop = 43656
        mmWidth = 3704
        BandType = 0
      end
      object ppRichText1: TppRichText
        UserName = 'RichText1'
        Caption = 'RichText1'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang10250{\fonttbl{\f0\fnil @Ar' +
          'ial Unicode MS;}{\f1\fnil\fcharset0 @Arial Unicode MS;}{\f2\fnil' +
          ' MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\b\f0\fs24 ENTRARON\par'#13#10'\' +
          'fs20 * \f1 NUEVOS\f0  : \b0 Que no estuvieron en la cartera ante' +
          'rior\b\fs24\par'#13#10'\tab\tab\tab\tab\par'#13#10'SALIERON\par'#13#10'\fs20 * \b0' +
          ' Determinado por la ultima forma de registro que genera la salid' +
          'a de la cartera de credito\b\par'#13#10'* FSC :\f1  \b0\f0 Fondo solid' +
          'ario por contingencia\par'#13#10'\b * E\f1 XT\f0  : \b0 Extornados\par' +
          #13#10'\b * P\f1 LANILLA\f0\par'#13#10'* E\f1 FECTIVO\f0\par'#13#10'* B\f1 ANCO\f' +
          '0\par'#13#10'* B\f1 ENEFICIOS\f0\par'#13#10'* O\f1 TROS\f0\fs24\par'#13#10'\b0\f2\' +
          'fs16\par'#13#10'}'#13#10
        mmHeight = 62177
        mmLeft = 34925
        mmTop = 108744
        mmWidth = 142082
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object PPLTitulo21: TppLabel
        UserName = 'PPLTitulo1'
        AutoSize = False
        Caption = 'INVENTARIO NUMERO DEUDORES: CARTERA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 529
        mmTop = 26723
        mmWidth = 202671
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object PPDBPInventarios_Entraron: TppDBPipeline
    DataSource = DM1.dsQry23
    UserName = 'PPDBPInventarios_Entraron'
    Left = 296
    Top = 128
    object PPDBPInventarios_EntraronppField1: TppField
      FieldAlias = 'PERIODO'
      FieldName = 'PERIODO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 0
    end
    object PPDBPInventarios_EntraronppField2: TppField
      FieldAlias = 'ORDEN'
      FieldName = 'ORDEN'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object PPDBPInventarios_EntraronppField3: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object PPDBPInventarios_EntraronppField4: TppField
      FieldAlias = 'DETALLE'
      FieldName = 'DETALLE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object PPDBPInventarios_EntraronppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANTIDAD'
      FieldName = 'CANTIDAD'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 33
      Position = 4
    end
  end
  object PPDBPInventarios_Salieron: TppDBPipeline
    DataSource = DM1.dsQry24
    UserName = 'PPDBPInventarios_Salieron'
    Left = 328
    Top = 128
    object PPDBPInventarios_SalieronppField1: TppField
      FieldAlias = 'PERIODO'
      FieldName = 'PERIODO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 0
    end
    object PPDBPInventarios_SalieronppField2: TppField
      FieldAlias = 'ORDEN'
      FieldName = 'ORDEN'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object PPDBPInventarios_SalieronppField3: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object PPDBPInventarios_SalieronppField4: TppField
      FieldAlias = 'DETALLE'
      FieldName = 'DETALLE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object PPDBPInventarios_SalieronppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CANTIDAD'
      FieldName = 'CANTIDAD'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 33
      Position = 4
    end
  end
  object PPDBPInventarios_Final: TppDBPipeline
    DataSource = DM1.dsQry25
    UserName = 'PPDBPInventarios_Final'
    Left = 360
    Top = 128
  end
  object ppdbpIngresos: TppDBPipeline
    UserName = 'ppdbpIngresos'
    Left = 416
    Top = 128
    object ppdbpIngresosppField1: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 0
    end
    object ppdbpIngresosppField2: TppField
      FieldAlias = 'FORPAGODES'
      FieldName = 'FORPAGODES'
      FieldLength = 45
      DisplayWidth = 45
      Position = 1
    end
    object ppdbpIngresosppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 33
      Position = 2
    end
    object ppdbpIngresosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'AMORTIZACION'
      FieldName = 'AMORTIZACION'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 33
      Position = 3
    end
  end
  object pprIngresos: TppReport
    AutoStop = False
    DataPipeline = ppdbpIngresos
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'D:\Modulos\Dise'#241'ador de Reportes\Riesgos\Ingresos Mensuales.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 416
    Top = 158
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbpIngresos'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'Label1'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 0
        mmWidth = 34396
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label22'
        Caption = 'Sistema de Riesgos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 1852
        mmTop = 4498
        mmWidth = 25315
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label23'
        Caption = 'Fecha  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 169863
        mmTop = 0
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label24'
        Caption = 'Hora    '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 169863
        mmTop = 4498
        mmWidth = 10160
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label25'
        Caption = 'Pag     '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 170127
        mmTop = 8996
        mmWidth = 10160
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable7'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 183357
        mmTop = 265
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 183092
        mmTop = 5027
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable9'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 183886
        mmTop = 9260
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label26'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 181505
        mmTop = 8996
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label27'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 181505
        mmTop = 4498
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label28'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 181505
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'PPLTitulo01'
        AutoSize = False
        Caption = 'CANCELACI'#211'N DE CUOTAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 529
        mmTop = 20902
        mmWidth = 202671
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'PPLTitulo1'
        AutoSize = False
        Caption = 'DEL 01/MM/YYYY AL 31/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 529
        mmTop = 26723
        mmWidth = 202671
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText30: TppDBText
        UserName = 'DBText9'
        DataField = 'FORPAGODES'
        DataPipeline = ppdbpIngresos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbpIngresos'
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 0
        mmWidth = 77788
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText10'
        DataField = 'TOTAL'
        DataPipeline = ppdbpIngresos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpIngresos'
        mmHeight = 3969
        mmLeft = 108215
        mmTop = 0
        mmWidth = 31485
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText11'
        DataField = 'AMORTIZACION'
        DataPipeline = ppdbpIngresos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbpIngresos'
        mmHeight = 3969
        mmLeft = 150813
        mmTop = 0
        mmWidth = 27517
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 22225
        mmTop = 0
        mmWidth = 7673
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 106627
        mmTop = 0
        mmWidth = 7673
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 141817
        mmTop = 0
        mmWidth = 7673
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 173302
        mmTop = 0
        mmWidth = 7673
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line11'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 22225
        mmTop = 2646
        mmWidth = 158750
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'TIPO'
      DataPipeline = ppdbpIngresos
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbpIngresos'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 28575
        mmPrintPosition = 0
        object ppShape13: TppShape
          UserName = 'Shape3'
          mmHeight = 7938
          mmLeft = 106627
          mmTop = 10848
          mmWidth = 74348
          BandType = 3
          GroupNo = 0
        end
        object ppShape22: TppShape
          UserName = 'Shape2'
          mmHeight = 10054
          mmLeft = 22225
          mmTop = 18521
          mmWidth = 158750
          BandType = 3
          GroupNo = 0
        end
        object ppLine18: TppLine
          UserName = 'Line14'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9790
          mmLeft = 106627
          mmTop = 18521
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppLine19: TppLine
          UserName = 'Line15'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 9525
          mmLeft = 141817
          mmTop = 18785
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppLabel35: TppLabel
          UserName = 'Label5'
          Caption = 'FORMA DE PAGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 25400
          mmTop = 19579
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppLabel55: TppLabel
          UserName = 'Label6'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 119856
          mmTop = 19579
          mmWidth = 11430
          BandType = 3
          GroupNo = 0
        end
        object ppLabel56: TppLabel
          UserName = 'Label7'
          Caption = 'AMORTIZACI'#211'N'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 148696
          mmTop = 19579
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object ppLabel57: TppLabel
          UserName = 'Label8'
          Caption = '(AMO+INT+GAS+DSG)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3260
          mmLeft = 109273
          mmTop = 24077
          mmWidth = 29972
          BandType = 3
          GroupNo = 0
        end
        object ppLabel59: TppLabel
          UserName = 'Label9'
          Caption = 'IMPORTE PAGADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 128852
          mmTop = 12700
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object ppLine20: TppLine
          UserName = 'Line16'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 22225
          mmTop = 24342
          mmWidth = 158486
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppShape23: TppShape
          UserName = 'Shape1'
          mmHeight = 6350
          mmLeft = 22225
          mmTop = 0
          mmWidth = 158750
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'AMORTIZACION'
          DataPipeline = ppdbpIngresos
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbpIngresos'
          mmHeight = 4191
          mmLeft = 141606
          mmTop = 1058
          mmWidth = 37253
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'TOTAL'
          DataPipeline = ppdbpIngresos
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbpIngresos'
          mmHeight = 4191
          mmLeft = 107950
          mmTop = 1058
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object ppLabel60: TppLabel
          UserName = 'Label4'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 25400
          mmTop = 1323
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppLine21: TppLine
          UserName = 'Line12'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6085
          mmLeft = 106627
          mmTop = 0
          mmWidth = 7673
          BandType = 5
          GroupNo = 0
        end
        object ppLine22: TppLine
          UserName = 'Line13'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6085
          mmLeft = 142082
          mmTop = 0
          mmWidth = 7673
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
end
