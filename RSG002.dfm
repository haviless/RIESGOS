object fMatDesplaz: TfMatDesplaz
  Left = 253
  Top = 120
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Matriz de Desplazamiento'
  ClientHeight = 677
  ClientWidth = 821
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    821
    677)
  PixelsPerInch = 96
  TextHeight = 13
  object BitSalir: TBitBtn
    Left = 717
    Top = 643
    Width = 96
    Height = 27
    Cursor = crHandPoint
    Caption = '&Salir'
    TabOrder = 0
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
  object grbParametros: TGroupBox
    Left = 3
    Top = 592
    Width = 321
    Height = 81
    Caption = 'Periodo De Proceso'
    TabOrder = 1
    object lblNomMes: TLabel
      Left = 116
      Top = 48
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
    object Label11: TLabel
      Left = 165
      Top = 9
      Width = 58
      Height = 13
      AutoSize = False
      Caption = 'En Funci'#243'n '
    end
    object Label15: TLabel
      Left = 165
      Top = 22
      Width = 55
      Height = 13
      AutoSize = False
      Caption = 'del Ultimo : '
    end
    object BitProcesar: TBitBtn
      Left = 216
      Top = 49
      Width = 100
      Height = 26
      Cursor = crHandPoint
      Caption = 'Procesar'
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
    object dbsAnoIni: TwwDBSpinEdit
      Left = 10
      Top = 44
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
      Left = 74
      Top = 44
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
    object chkProceso: TCheckBox
      Left = 8
      Top = 16
      Width = 121
      Height = 17
      Cursor = crHandPoint
      Caption = 'Habilitar Proceso'
      TabOrder = 3
      OnClick = chkProcesoClick
    end
    object cmbConsulta: TComboBox
      Left = 232
      Top = 13
      Width = 85
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'Mes'
        'Trimestre'
        'Semestre'
        'A'#241'o')
    end
  end
  object BitImpOfi: TBitBtn
    Left = 610
    Top = 607
    Width = 96
    Height = 28
    Cursor = crHandPoint
    Caption = 'Imprimir'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnClick = BitImpOfiClick
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 818
    Height = 589
    ActivePage = TabSheet4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MultiLine = True
    ParentFont = False
    TabOrder = 3
    TabPosition = tpBottom
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'General'
      object PageControl2: TPageControl
        Left = 2
        Top = 3
        Width = 811
        Height = 554
        ActivePage = TabSheet6
        MultiLine = True
        TabOrder = 0
        TabPosition = tpRight
        OnChange = PageControl2Change
        object TabSheet5: TTabSheet
          Caption = 'Detalle General '
          object dtgCabRiesgos: TwwDBGrid
            Left = 1
            Top = 2
            Width = 781
            Height = 541
            Cursor = crHandPoint
            DisableThemesInTitle = False
            LineStyle = gls3D
            Selected.Strings = (
              'CFCDES_A'#9'30'#9'Categor'#237'a de~Riesgo Anterior'
              'SALDOS_AT'#9'18'#9'Saldo Anterior'
              'NUM_AT'#9'11'#9'N'#176'Asociados'
              'CFCDES_F'#9'32'#9'Categor'#237'a de~Riesgo Actual'
              'SALDOS_FT'#9'18'#9'Saldo Actual'
              'NUM_FT'#9'11'#9'N'#176'Asociados'#9'F')
            IniAttributes.Delimiter = ';;'
            ExportOptions.ExportType = wwgetSYLK
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DM1.dsConsulta
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
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
            OnDrawDataCell = dtgCabRiesgosDrawDataCell
            OnDblClick = dtgCabRiesgosDblClick
            OnDrawFooterCell = dtgCabRiesgosDrawFooterCell
            OnDrawTitleCell = dtgCabRiesgosDrawTitleCell
            PaintOptions.ActiveRecordColor = clInfoBk
            GroupFieldName = 'CFCDES_A'
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Por N'#250'mero   '
          ImageIndex = 1
          object dtgCons01a: TwwDBGrid
            Left = 1
            Top = 24
            Width = 777
            Height = 204
            Cursor = crHandPoint
            DisableThemesInTitle = False
            LineStyle = gls3D
            Selected.Strings = (
              'CFCDES_A'#9'32'#9'Categor'#237'a de~Riesgo Anterior'
              'CANCELADO'#9'12'#9'CANCELADO'
              'NORMAL'#9'12'#9'NORMAL'
              'PROPOT'#9'12'#9'PROBLEMAS~POTENCIALES'
              'DEFICIENTE'#9'12'#9'DEFICIENTE'
              'DUDOSO'#9'12'#9'DUDOSO'
              'PERDIDA'#9'12'#9'PERDIDA'
              'TOTAL'#9'12'#9'TOTAL'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DM1.dsPadre
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
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
            OnDrawDataCell = dtgCons01aDrawDataCell
            OnDblClick = dtgCons01aDblClick
            PaintOptions.ActiveRecordColor = clInfoBk
          end
          object dtgCons01b: TwwDBGrid
            Left = 1
            Top = 261
            Width = 776
            Height = 204
            Cursor = crHandPoint
            DisableThemesInTitle = False
            LineStyle = gls3D
            Selected.Strings = (
              'CFCDES_A'#9'32'#9'Categor'#237'a de~Riesgo Anterior'
              'CANCELADO'#9'12'#9'CANCELADO'
              'NORMAL'#9'12'#9'NORMAL'
              'PROPOT'#9'12'#9'PROBLEMAS~POTENCIALES'
              'DEFICIENTE'#9'12'#9'DEFICIENTE'
              'DUDOSO'#9'12'#9'DUDOSO'
              'PERDIDA'#9'12'#9'PERDIDA'
              'TOTAL'#9'12'#9'TOTAL'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DM1.dsPais
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 2
            TitleButtons = False
            OnDrawDataCell = dtgCons01bDrawDataCell
            PaintOptions.ActiveRecordColor = clInfoBk
          end
          object Panel5: TPanel
            Left = 8
            Top = 467
            Width = 766
            Height = 70
            Alignment = taLeftJustify
            Caption = '   Categor'#237'as'
            TabOrder = 2
            object Shape6: TShape
              Left = 277
              Top = 4
              Width = 144
              Height = 32
              Brush.Color = clYellow
            end
            object Shape2: TShape
              Left = 445
              Top = 4
              Width = 144
              Height = 32
              Brush.Color = 9699219
            end
            object Shape1: TShape
              Left = 602
              Top = 4
              Width = 144
              Height = 32
              Brush.Color = 12566527
            end
            object Label9: TLabel
              Left = 484
              Top = 13
              Width = 68
              Height = 16
              AutoSize = False
              Caption = 'MEJORA'
              Color = 9699219
              ParentColor = False
            end
            object Label10: TLabel
              Left = 631
              Top = 13
              Width = 92
              Height = 16
              AutoSize = False
              Caption = 'DETERIORO'
              Color = 12566527
              ParentColor = False
            end
            object lblTotal: TLabel
              Left = 122
              Top = 44
              Width = 129
              Height = 18
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Shape5: TShape
              Left = 114
              Top = 4
              Width = 144
              Height = 32
              Brush.Color = clGradientActiveCaption
            end
            object Label7: TLabel
              Left = 152
              Top = 12
              Width = 68
              Height = 16
              Alignment = taCenter
              AutoSize = False
              Caption = 'TOTAL'
              Color = clGradientActiveCaption
              ParentColor = False
            end
            object lblEmpeora: TLabel
              Left = 628
              Top = 44
              Width = 90
              Height = 18
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblMejora: TLabel
              Left = 472
              Top = 44
              Width = 90
              Height = 18
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 296
              Top = 13
              Width = 105
              Height = 16
              Alignment = taCenter
              AutoSize = False
              Caption = 'MANTIENEN'
              Color = clYellow
              ParentColor = False
            end
            object lblMantienen: TLabel
              Left = 297
              Top = 45
              Width = 110
              Height = 18
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'Por Monto'
          ImageIndex = 2
          object dtgCons02a: TwwDBGrid
            Left = 0
            Top = 40
            Width = 781
            Height = 204
            Cursor = crHandPoint
            DisableThemesInTitle = False
            LineStyle = gls3D
            Selected.Strings = (
              'CFCDES_A'#9'28'#9'Categor'#237'a de~Riesgo Anterior'
              'CANCELADO'#9'12'#9'CANCELADO'
              'NORMAL'#9'13'#9'NORMAL'
              'PROPOT'#9'13'#9'PROBLEMAS~POTENCIALES'
              'DEFICIENTE'#9'13'#9'DEFICIENTE'
              'DUDOSO'#9'13'#9'DUDOSO'
              'PERDIDA'#9'13'#9'PERDIDA'
              'TOTAL'#9'13'#9'TOTAL'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DM1.dsHijo
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
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
            OnDrawDataCell = dtgCons02aDrawDataCell
            PaintOptions.ActiveRecordColor = clInfoBk
          end
          object dtgCons02b: TwwDBGrid
            Left = 0
            Top = 263
            Width = 781
            Height = 204
            Cursor = crHandPoint
            DisableThemesInTitle = False
            LineStyle = gls3D
            Selected.Strings = (
              'CFCDES_A'#9'28'#9'Categor'#237'a de~Riesgo Anterior'
              'CANCELADO'#9'12'#9'CANCELADO'
              'NORMAL'#9'13'#9'NORMAL'
              'PROPOT'#9'13'#9'PROBLEMAS~POTENCIALES'
              'DEFICIENTE'#9'13'#9'DEFICIENTE'
              'DUDOSO'#9'13'#9'DUDOSO'
              'PERDIDA'#9'13'#9'PERDIDA'
              'TOTAL'#9'13'#9'TOTAL'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DM1.dsNieto
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 2
            TitleButtons = False
            OnDrawDataCell = dtgCons02bDrawDataCell
            PaintOptions.ActiveRecordColor = clInfoBk
          end
          object Panel2: TPanel
            Left = 8
            Top = 470
            Width = 766
            Height = 70
            Alignment = taLeftJustify
            Caption = '   Categor'#237'as'
            TabOrder = 2
            object Shape3: TShape
              Left = 277
              Top = 4
              Width = 144
              Height = 32
              Brush.Color = clYellow
            end
            object Shape4: TShape
              Left = 445
              Top = 4
              Width = 144
              Height = 32
              Brush.Color = 9699219
            end
            object Shape7: TShape
              Left = 602
              Top = 4
              Width = 144
              Height = 32
              Brush.Color = 12566527
            end
            object Label2: TLabel
              Left = 484
              Top = 13
              Width = 68
              Height = 16
              AutoSize = False
              Caption = 'MEJORA'
              Color = 9699219
              ParentColor = False
            end
            object Label3: TLabel
              Left = 631
              Top = 13
              Width = 92
              Height = 16
              AutoSize = False
              Caption = 'DETERIORO'
              Color = 12566527
              ParentColor = False
            end
            object lblTotNum: TLabel
              Left = 118
              Top = 44
              Width = 136
              Height = 18
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Shape8: TShape
              Left = 114
              Top = 4
              Width = 144
              Height = 32
              Brush.Color = clGradientActiveCaption
            end
            object Label14: TLabel
              Left = 152
              Top = 12
              Width = 68
              Height = 16
              Alignment = taCenter
              AutoSize = False
              Caption = 'TOTAL'
              Color = clGradientActiveCaption
              ParentColor = False
            end
            object lblDetNum: TLabel
              Left = 610
              Top = 44
              Width = 128
              Height = 18
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblMejNum: TLabel
              Left = 452
              Top = 44
              Width = 130
              Height = 18
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label17: TLabel
              Left = 296
              Top = 13
              Width = 105
              Height = 16
              Alignment = taCenter
              AutoSize = False
              Caption = 'MANTIENEN'
              Color = clYellow
              ParentColor = False
            end
            object lblManNum: TLabel
              Left = 285
              Top = 45
              Width = 130
              Height = 18
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object rdgSalCar: TRadioGroup
            Left = 2
            Top = -3
            Width = 199
            Height = 36
            Caption = 'Saldo de Cartera'
            Columns = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ItemIndex = 0
            Items.Strings = (
              'Anterior'
              'Actual')
            ParentFont = False
            TabOrder = 3
            OnClick = rdgSalCarClick
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Departamento / Ugel'
      ImageIndex = 1
      object dtgAuxiliar02: TwwDBGrid
        Left = 529
        Top = 488
        Width = 128
        Height = 41
        Cursor = crHandPoint
        DisableThemesInTitle = False
        LineStyle = gls3D
        Selected.Strings = (
          'DPTODES'#9'25'#9'Departamento'
          'USENOM'#9'35'#9'Uses/Ugeles'
          'NORMAL'#9'13'#9'NORMAL'
          'NUMNOR'#9'10'#9'N'#176' Asociados~Normal'
          'PROPOT'#9'13'#9'P.POTENCIALES'
          'NUMPOT'#9'10'#9'N'#176' Asociados~P.Potenciales'
          'DEFICIENTE'#9'13'#9'DEFICIENTE'
          'NUMDEF'#9'10'#9'N'#176' Asociados~Deficiente'
          'DUDOSO'#9'13'#9'DUDOSO'
          'NUMDUD'#9'10'#9'N'#176' Asociados~Dudoso'
          'PERDIDA'#9'13'#9'PERDIDA'
          'NUMPER'#9'10'#9'N'#176' Asociados~Perdida'
          'TOTAL'#9'13'#9'TOTAL'
          'NUMTOT'#9'10'#9'N'#176' Asociados~Total'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = False
        ShowVertScrollBar = False
        DataSource = DM1.dsqry5
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
        ParentFont = False
        TabOrder = 6
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        Visible = False
        PaintOptions.ActiveRecordColor = clInfoBk
      end
      object dtgAuxiliar: TwwDBGrid
        Left = 385
        Top = 488
        Width = 128
        Height = 41
        Cursor = crHandPoint
        DisableThemesInTitle = False
        LineStyle = gls3D
        Selected.Strings = (
          'DEPARTAMENTO'#9'25'#9'Departamento'
          'UGELES'#9'35'#9'Uses/Ugeles'
          'CATRIESGO'#9'25'#9'Categor'#237'a~de Riesgo'
          'RANGODIAS'#9'25'#9'Rango de~D'#237'as'
          'SALCAPITAL'#9'13'#9'Saldo~Capital'
          'NUMASOCIADOS'#9'10'#9'N'#176'de~Asociados'
          'SALVENCIDO'#9'13'#9'Saldo Vencido'
          'PROVISION'#9'13'#9'Provisi'#243'n'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = False
        ShowVertScrollBar = False
        DataSource = DM1.dsQry6
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
        ParentFont = False
        TabOrder = 5
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        Visible = False
        PaintOptions.ActiveRecordColor = clInfoBk
      end
      object dtgCabDept: TwwDBGrid
        Left = 9
        Top = 0
        Width = 356
        Height = 153
        Cursor = crHandPoint
        DisableThemesInTitle = False
        LineStyle = gls3D
        Selected.Strings = (
          'CFC_F'#9'3'#9'C'#243'digo'
          'CFCDES_F'#9'25'#9'Categor'#237'a de~Riesgo Actual'
          'SALDOS_FT'#9'13'#9'Saldo Actual'
          'NUM_FT'#9'8'#9'N'#176'Asociados'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnRowChanged = dtgCabDeptRowChanged
        FixedCols = 0
        ShowHorzScrollBar = False
        ShowVertScrollBar = False
        DataSource = DM1.dsSolicitud
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
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
        OnDrawDataCell = dtgCabDeptDrawDataCell
        PaintOptions.ActiveRecordColor = clInfoBk
      end
      object dtgCabDet: TwwDBGrid
        Left = 9
        Top = 178
        Width = 356
        Height = 377
        Cursor = crHandPoint
        DisableThemesInTitle = False
        LineStyle = gls3D
        Selected.Strings = (
          'DPTOID'#9'3'#9'C'#243'digo'
          'DPTODES'#9'25'#9'Departamento'
          'SALDOS_FT'#9'13'#9'Saldo Actual'
          'NUM_FT'#9'8'#9'N'#176'Asociados'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnRowChanged = dtgCabDetRowChanged
        FixedCols = 0
        ShowHorzScrollBar = False
        ShowVertScrollBar = False
        DataSource = DM1.dsReporte
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        OnDrawDataCell = dtgCabDetDrawDataCell
        PaintOptions.ActiveRecordColor = clInfoBk
      end
      object dtgUsesDet: TwwDBGrid
        Left = 386
        Top = 48
        Width = 425
        Height = 425
        Cursor = crHandPoint
        DisableThemesInTitle = False
        LineStyle = gls3D
        Selected.Strings = (
          'USEID'#9'3'#9'C'#243'digo'
          'USENOM'#9'36'#9'Uses / Ugel'
          'SALDOS_FT'#9'13'#9'Saldo Actual'
          'NUM_FT'#9'8'#9'N'#176'Asociados'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = False
        ShowVertScrollBar = False
        DataSource = DM1.dsEjecuta
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
        ParentFont = False
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        OnDrawDataCell = dtgUsesDetDrawDataCell
        PaintOptions.ActiveRecordColor = clInfoBk
      end
      object BitMst01: TBitBtn
        Left = 12
        Top = 155
        Width = 355
        Height = 22
        Cursor = crHandPoint
        Caption = 'Mostrar'
        TabOrder = 3
        OnClick = BitMst01Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
          33333333373F33333333333330B03333333333337F7F33333333333330F03333
          333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
          333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
          333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
          3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
          33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
          33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
          03333337777777F7F33333330000000003333337777777773333}
        NumGlyphs = 2
      end
      object BitMst02: TBitBtn
        Left = 379
        Top = 16
        Width = 421
        Height = 22
        Cursor = crHandPoint
        Caption = 'Mostrar'
        TabOrder = 4
        OnClick = BitMst02Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
          33333333373F33333333333330B03333333333337F7F33333333333330F03333
          333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
          333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
          333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
          3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
          33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
          33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
          03333337777777F7F33333330000000003333337777777773333}
        NumGlyphs = 2
      end
      object dtgAuxiliar03: TwwDBGrid
        Left = 672
        Top = 488
        Width = 121
        Height = 41
        Cursor = crHandPoint
        DisableThemesInTitle = False
        LineStyle = gls3D
        Selected.Strings = (
          'DPTODES'#9'25'#9'Departamento'
          'USENOM'#9'35'#9'Uses/Ugeles'
          'CFCDES_F'#9'15'#9'Calificaci'#243'n'
          'DIASDESC'#9'20'#9'Dias de~Atraso'
          'ASOCIADOS'#9'10'#9'N'#176' Asociados'
          'SALDOS_FT'#9'13'#9'Saldos~Totales'
          'SALDOS_FV'#9'13'#9'Saldos~Vencidos'
          'SALDOS_FP'#9'13'#9'Saldos No~Vencidos'
          'SALDOS_PV'#9'13'#9'Provisi'#243'n'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = False
        ShowVertScrollBar = False
        DataSource = DM1.dsQry4
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
        ParentFont = False
        TabOrder = 7
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        Visible = False
        PaintOptions.ActiveRecordColor = clInfoBk
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'D'#237'as de Atraso / Concentraci'#243'n'
      ImageIndex = 2
      object dtgDiasAtraso: TwwDBGrid
        Left = 14
        Top = 6
        Width = 783
        Height = 251
        Cursor = crHandPoint
        DisableThemesInTitle = False
        LineStyle = gls3D
        Selected.Strings = (
          'CFCDES_F'#9'25'#9'Categor'#237'a'
          'DIASDESC'#9'20'#9'N'#250'mero de D'#237'as'
          'ASOCIADOS'#9'8'#9'N'#176'de~Asociados'
          'SALDOS_FT'#9'15'#9'Saldo~Total'
          'SALDOS_FV'#9'15'#9'Saldo~Vencido'
          'SALDOS_FP'#9'15'#9'Saldo No~Vencido'
          'SALDOS_PV'#9'15'#9'Provisi'#243'n'
          'SALDOS_CB'#9'15'#9'Saldo~Cubierto'
          'SALDOS_NC'#9'15'#9'Saldo No~Cubierto'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        ShowVertScrollBar = False
        DataSource = DM1.dsDpto
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
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
        OnDrawDataCell = dtgDiasAtrasoDrawDataCell
        PaintOptions.ActiveRecordColor = clInfoBk
        GroupFieldName = 'CFCDES_F'
      end
      object dtgConcentracion: TwwDBGrid
        Left = 15
        Top = 279
        Width = 783
        Height = 276
        Cursor = crHandPoint
        DisableThemesInTitle = False
        LineStyle = gls3D
        Selected.Strings = (
          'DPTODES'#9'25'#9'Departamentos'
          'NUMNOR'#9'8'#9'N'#176'de~Asociados'
          'NORMAL'#9'15'#9'Normal'
          'NUMPOT'#9'8'#9'N'#176'de~Asociados'
          'PROPOT'#9'15'#9'Pro.Potenciales'
          'NUMDEF'#9'8'#9'N'#176'de~Asociados'
          'DEFICIENTE'#9'15'#9'Deficiente'
          'NUMDUD'#9'8'#9'N'#176'de~Asociados'
          'DUDOSO'#9'15'#9'Dudoso'
          'NUMPER'#9'8'#9'N'#176'de~Asociados'
          'PERDIDA'#9'15'#9'Perdida'
          'NUMTOT'#9'8'#9'N'#176'de~Asociados'
          'TOTAL'#9'15'#9'Total'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        ShowVertScrollBar = False
        DataSource = DM1.dsUPro
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        OnDrawDataCell = dtgConcentracionDrawDataCell
        PaintOptions.ActiveRecordColor = clInfoBk
      end
      object ChkTot: TRadioButton
        Left = 15
        Top = 263
        Width = 74
        Height = 17
        Caption = 'Total'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TabStop = True
        OnClick = ChkTotClick
      end
      object ChkVen: TRadioButton
        Left = 134
        Top = 263
        Width = 82
        Height = 17
        Caption = 'Vencido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = ChkVenClick
      end
      object ChkDias: TRadioButton
        Left = 257
        Top = 263
        Width = 90
        Height = 17
        Caption = 'D'#237'as'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object chkDepUgel: TRadioButton
        Left = 345
        Top = 262
        Width = 160
        Height = 17
        Caption = 'Departamento / Ugel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object chkDptoUgelDias: TRadioButton
        Left = 545
        Top = 262
        Width = 208
        Height = 17
        Caption = 'Departamento / Ugel / D'#237'as'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Detalles Por Asociados'
      ImageIndex = 3
      object grpDetalle: TGroupBox
        Left = 0
        Top = -4
        Width = 809
        Height = 149
        TabOrder = 0
        object lblOrigen: TLabel
          Left = 527
          Top = 44
          Width = 161
          Height = 14
          AutoSize = False
          Caption = 'Origen de Operaciones'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label6: TLabel
          Left = 9
          Top = 99
          Width = 74
          Height = 15
          AutoSize = False
          Caption = 'Uses/Ugel'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object lblDepto: TLabel
          Left = 527
          Top = 20
          Width = 120
          Height = 18
          AutoSize = False
          Caption = 'Departamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label8: TLabel
          Left = 8
          Top = 60
          Width = 145
          Height = 14
          AutoSize = False
          Caption = 'Categor'#237'a de Riesgo Actual'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object lblCount: TLabel
          Left = 688
          Top = 111
          Width = 105
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 190
          Top = 61
          Width = 156
          Height = 14
          AutoSize = False
          Caption = 'Categor'#237'a de Riesgo Anterior'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object BitMostrar: TBitBtn
          Left = 557
          Top = 85
          Width = 116
          Height = 43
          Cursor = crHandPoint
          Caption = 'Mostrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = BitMostrarClick
          Glyph.Data = {
            42080000424D4208000000000000420000002800000020000000200000000100
            1000030000000008000000000000000000000000000000000000007C0000E003
            00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000018631863
            1863186318631863186318631863186318631863186318631042104210420000
            000010421863FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F1863
            1863186318631863186300400040186318631863186310421042104200000000
            10421863FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F1863
            18631863186318631863007C0040186318631863104210421042000000001042
            1863FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F1863
            1863186318631863186318631863186318631042104210420000000010421863
            FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F1863
            18631863186318631863007C004018631042104210420000000010421863FF7F
            000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F1863
            18631863186318631863007C00401042104210420000000010421863FF7F0000
            000000001863FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000018631863
            18631863186318631863007C1042104210420000000010421863FF7F00000000
            000018631863FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000010421042
            104210421042104210421042104210420000000010421863FF7F000000000000
            186318631863FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10421042000010421042
            10421042104210421042104210420000000000000000FF7F0000000000001863
            186318631863FF7FFF7FFF7FFF7FFF7FFF7F1042104210421042000010421042
            1042104210421042104210420000000000001042000000000000000018631863
            186318631863FF7FFF7FFF7FFF7FFF7F10421042104200000000000010421863
            FF7F186310420000000000000000000010421863FF7F00000000186318631863
            186318631863FF7FFF7FFF7F1042104210420000000000000000000000000000
            104200000000000000000000000010421863FF7F000000000040186318631863
            186318631863FF7FFF7F10421042104200000000000000001863186318631863
            007C007C004000000000000000000000FF7F00000000007C0040186318631863
            186318631863FF7F104210420000000000000000186318631863186318631863
            007C007C004018631863000000000000000000000000007C0040186318631863
            186318631863FF7F104200000000000000001863186318631863186318631863
            007C007C007C0040186318630000000000000000007C007C0040186318631863
            1863186318631042104200000000000018631863186318631863186318631863
            1863007C007C007C004018631863000000000000007C007C1863186318631863
            18631863186310420000000000000000FF7F1863186318631863186318631863
            18631863007C007C007C00401863186300000000000018631863186318631863
            18631863186310420000000000000000FF7F1863186318631863186318631863
            186318631863007C007C007C0040186300001042000018631863186318631863
            186318631863000000000000FF7F0000FF7F1863186318631863004000400040
            1863186318631863007C007C0040186318630000000000001863186318631863
            186318631863000010420000FF7F0000186318631863186318631F7C007C0040
            1863186318631863007C007C0040186318630000104200001863FF7FFF7FFF7F
            FF7FFF7F1863000010420000FF7F0000104210421042186318631F7C007C007C
            004018631863007C007C007C0040186318630000104200000000000000000000
            000000000000000010420000FF7F00001042104210421042186318631F7C007C
            007C00400040007C007C007C004018631863000010420000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7F000010420000FF7F000000000000000000000000000018631F7C
            007C007C007C007C007C1F7C186318631863000010420000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7F000000000000FF7FFF7F0000104210421863FF7F000018631863
            1F7C1F7C1F7C1F7C1F7C1863186318631863000000000000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F000010420000FF7FFF7F0000104218631863000018631863
            18631863186318631863186318631863000010420000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7F000010421863000018631863
            18631863186318631863186318631863000000000000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7F00001863000018631863
            1863186318631863186318631863000000000000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7F000000001863FF7F
            FF7FFF7FFF7FFF7F18631863000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7F000000000000
            00000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000010421863FF7F
            186310420000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001042
            0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F}
        end
        object pnlOrigen: TPanel
          Left = 566
          Top = 35
          Width = 239
          Height = 24
          Caption = 'Panel1'
          Color = 13165023
          Enabled = False
          TabOrder = 3
          Visible = False
          object EdtOfDes: TEdit
            Left = 1
            Top = 0
            Width = 236
            Height = 23
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object dblOriOto: TwwDBLookupCombo
          Left = 527
          Top = 36
          Width = 39
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'OFDESID'#9'3'#9'Codigo'#9'F'
            'OFDESNOM'#9'35'#9'Descripci'#243'n'#9'F')
          LookupTable = DM1.cdsOfDes
          LookupField = 'OFDESID'
          Options = [loColLines, loRowLines]
          ParentFont = False
          TabOrder = 0
          Visible = False
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnChange = dblOriOtoChange
        end
        object dblUses: TwwDBLookupCombo
          Left = 8
          Top = 116
          Width = 41
          Height = 21
          Cursor = crHandPoint
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'USEID'#9'3'#9'Codigo'#9'F'
            'USENOM'#9'41'#9'Descripci'#243'n'#9'F')
          LookupTable = DM1.cdsUSES
          LookupField = 'USEID'
          Options = [loColLines, loRowLines]
          Enabled = False
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnChange = dblUsesChange
        end
        object Panel3: TPanel
          Left = 51
          Top = 116
          Width = 327
          Height = 24
          Caption = 'Panel1'
          Color = 13165023
          Enabled = False
          TabOrder = 4
          object EdtDesUse: TEdit
            Left = 2
            Top = 0
            Width = 323
            Height = 23
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object dblDpto: TwwDBLookupCombo
          Left = 527
          Top = 36
          Width = 39
          Height = 21
          Cursor = crHandPoint
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DPTOID'#9'3'#9'Codigo'#9'F'
            'DPTODES'#9'25'#9'Descripci'#243'n'#9'F')
          LookupTable = DM1.cdsMovCre
          LookupField = 'DPTOID'
          Options = [loColLines, loRowLines]
          ParentFont = False
          TabOrder = 2
          Visible = False
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnChange = dblDptoChange
        end
        object pnlDpto: TPanel
          Left = 566
          Top = 35
          Width = 188
          Height = 24
          Caption = 'Panel1'
          Color = 13165023
          Enabled = False
          TabOrder = 5
          Visible = False
          object EdtDepart: TEdit
            Left = 2
            Top = 0
            Width = 184
            Height = 23
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object pDias: TPanel
          Left = 390
          Top = 93
          Width = 157
          Height = 41
          TabOrder = 7
          object Label1: TLabel
            Left = 71
            Top = 18
            Width = 19
            Height = 15
            Alignment = taCenter
            AutoSize = False
            Caption = 'De'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label12: TLabel
            Left = 10
            Top = 1
            Width = 34
            Height = 13
            AutoSize = False
            Caption = 'Inicio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object Label13: TLabel
            Left = 102
            Top = 1
            Width = 34
            Height = 13
            AutoSize = False
            Caption = 'Fin'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'Comic Sans MS'
            Font.Style = []
            ParentFont = False
          end
          object SpInicio: TSpinEdit
            Left = 8
            Top = 13
            Width = 64
            Height = 26
            Cursor = crHandPoint
            MaxLength = 4
            MaxValue = 9999
            MinValue = 0
            TabOrder = 0
            Value = 0
          end
          object SpFin: TSpinEdit
            Left = 89
            Top = 13
            Width = 64
            Height = 26
            Cursor = crHandPoint
            MaxLength = 4
            MaxValue = 9999
            MinValue = 1
            TabOrder = 1
            Value = 31
          end
        end
        object ChkAntiguedad: TCheckBox
          Left = 389
          Top = 78
          Width = 158
          Height = 11
          Cursor = crHandPoint
          Caption = 'Antiguedad de la Deuda (Dias)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object dblCategoria: TwwDBLookupCombo
          Left = 7
          Top = 78
          Width = 39
          Height = 21
          Cursor = crHandPoint
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'RESUMEID'#9'3'#9'Codigo'#9'F'
            'RESUMEDES'#9'27'#9'Descripci'#243'n'#9'F')
          LookupTable = DM1.cdsDLabo
          LookupField = 'RESUMEID'
          Options = [loColLines, loRowLines]
          ParentFont = False
          TabOrder = 9
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnChange = dblCategoriaChange
        end
        object Panel1: TPanel
          Left = 47
          Top = 77
          Width = 138
          Height = 24
          Caption = 'Panel1'
          Color = 13165023
          Enabled = False
          TabOrder = 10
          object EdtCategoria: TEdit
            Left = 1
            Top = 0
            Width = 135
            Height = 23
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object rdbSeleccion: TRadioGroup
          Left = 368
          Top = 16
          Width = 156
          Height = 49
          Cursor = crHandPoint
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Items.Strings = (
            'Departamento'
            'Origen de Operaciones')
          ParentFont = False
          TabOrder = 11
          OnClick = rdbSeleccionClick
        end
        object dblCatAnt: TwwDBLookupCombo
          Left = 188
          Top = 78
          Width = 39
          Height = 21
          Cursor = crHandPoint
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'RESUMEID'#9'3'#9'Codigo'#9'F'
            'RESUMEDES'#9'27'#9'Descripci'#243'n'#9'F')
          LookupTable = DM1.cdsDSocioE
          LookupField = 'RESUMEID'
          Options = [loColLines, loRowLines]
          ParentFont = False
          TabOrder = 12
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnChange = dblCatAntChange
        end
        object Panel4: TPanel
          Left = 229
          Top = 77
          Width = 136
          Height = 24
          Caption = 'Panel1'
          Color = 13165023
          Enabled = False
          TabOrder = 13
          object EdtCatAnt: TEdit
            Left = 1
            Top = 0
            Width = 132
            Height = 23
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object rdbSelPer: TRadioGroup
          Left = 8
          Top = 17
          Width = 354
          Height = 32
          Columns = 4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Mes'
            'Trimestre'
            'Semestre'
            'A'#241'o')
          ParentFont = False
          TabOrder = 14
          OnClick = rdbSelPerClick
        end
      end
      object dtgDatos: TwwDBGrid
        Left = 1
        Top = 152
        Width = 808
        Height = 403
        Cursor = crHandPoint
        DisableThemesInTitle = False
        LineStyle = gls3D
        Selected.Strings = (
          'OFDESNOM'#9'25'#9'Origen~del Asociado'
          'DPTODES'#9'15'#9'Departamento'
          'USENOM'#9'25'#9'Ugeles/Uses'
          'CFCDES_F'#9'15'#9'Calficaci'#243'n~Actual'
          'CFCDES_A'#9'15'#9'Calficaci'#243'n~Anterior'
          'ASODNI'#9'8'#9'D.N.I.'
          'ASOAPENOM'#9'45'#9'Apellidos y Nombres'
          'DIASTRANS'#9'10'#9'D'#237'as~de Morosidad'
          'SALDOS_FV'#9'13'#9'Saldo~Vencido'
          'SALDOS_FP'#9'13'#9'Saldo~No Vencido'
          'SALDOS_FT'#9'13'#9'Saldo~Total'
          'SALDOS_PV'#9'13'#9'Provisi'#243'n'
          'ANOOTO'#9'6'#9'A'#241'o~Otorgado'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DM1.dsSobrino
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        OnDblClick = dtgDatosDblClick
      end
    end
  end
  object BitExporta: TBitBtn
    Left = 610
    Top = 643
    Width = 96
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
  object BitGrafico: TBitBtn
    Left = 717
    Top = 607
    Width = 96
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
    TabOrder = 5
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
  object rdbTipCar: TRadioGroup
    Left = 327
    Top = 591
    Width = 98
    Height = 82
    Caption = 'Tipo de Cartera'
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'General'
      'Normal'
      'Refinanciada')
    TabOrder = 6
  end
  object rdbTipAso: TRadioGroup
    Left = 427
    Top = 591
    Width = 168
    Height = 81
    Caption = 'Tipo Asociado'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'General'
      'Activos'
      'Cesantes'
      'Contratados')
    TabOrder = 7
  end
  object dbRepOfi: TppDBPipeline
    DataSource = DM1.dsConsulta
    UserName = 'dbRepOfi'
    Left = 664
    Top = 560
  end
  object RepOfides: TppReport
    AutoStop = False
    DataPipeline = dbRepOfi
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 670
    Top = 560
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'dbRepOfi'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41275
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = clGrayText
        mmHeight = 5292
        mmLeft = 125677
        mmTop = 34660
        mmWidth = 34925
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'Label37'
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
      object Titulos01: TppLabel
        UserName = 'Label54'
        AutoSize = False
        Caption = 'CREDITOS OTORGADOS POR ORIGEN DE OTORGAMIENTO - A NIVEL NACIONAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 4763
        mmTop = 17992
        mmWidth = 191030
        BandType = 0
      end
      object ppLabel159: TppLabel
        UserName = 'Label84'
        Caption = 'Fecha  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 0
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel160: TppLabel
        UserName = 'Label85'
        Caption = 'Hora     '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 4498
        mmWidth = 11430
        BandType = 0
      end
      object ppLabel161: TppLabel
        UserName = 'Label501'
        Caption = 'Pag     '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 167746
        mmTop = 8996
        mmWidth = 10160
        BandType = 0
      end
      object ppSystemVariable25: TppSystemVariable
        UserName = 'SystemVariable13'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 180975
        mmTop = 265
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable26: TppSystemVariable
        UserName = 'SystemVariable14'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 180711
        mmTop = 5027
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable27: TppSystemVariable
        UserName = 'SystemVariable15'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 181505
        mmTop = 9260
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel162: TppLabel
        UserName = 'Label87'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 179123
        mmTop = 8996
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel163: TppLabel
        UserName = 'Label88'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 179123
        mmTop = 4498
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel164: TppLabel
        UserName = 'Label89'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 179123
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object xTitulos01: TppLabel
        UserName = 'xTit01'
        AutoSize = False
        Caption = 'DEL  XX/XX/XXXXX   AL   XX/XX/XXXXX'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 32015
        mmTop = 25665
        mmWidth = 131234
        BandType = 0
      end
      object ppLabel170: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Monto Otorgado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 63236
        mmTop = 35719
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel171: TppLabel
        UserName = 'Label157'
        AutoSize = False
        Caption = 'Monto Descontado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 91281
        mmTop = 35719
        mmWidth = 30163
        BandType = 0
      end
      object ppLabel172: TppLabel
        UserName = 'Label158'
        AutoSize = False
        Caption = 'N'#250'mero de Cr'#233'ditos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 164307
        mmTop = 35983
        mmWidth = 20638
        BandType = 0
      end
      object ppLine48: TppLine
        UserName = 'Line46'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 9260
        mmTop = 34660
        mmWidth = 177536
        BandType = 0
      end
      object ppLine49: TppLine
        UserName = 'Line47'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 9525
        mmTop = 39688
        mmWidth = 176742
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Orig'#233'n de Otorgamiento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 13758
        mmTop = 35719
        mmWidth = 40481
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Monto Desembolsado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4106
        mmLeft = 127265
        mmTop = 35190
        mmWidth = 32015
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 4763
        mmLeft = 125677
        mmTop = 0
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText204'
        DataField = 'CREMTOOTOR'
        DataPipeline = dbRepOfi
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepOfi'
        mmHeight = 3704
        mmLeft = 59267
        mmTop = 529
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText36'
        DataField = 'CREMTONABO'
        DataPipeline = dbRepOfi
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepOfi'
        mmHeight = 3704
        mmLeft = 92075
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText37'
        DataField = 'NUMCRE'
        DataPipeline = dbRepOfi
        DisplayFormat = '###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepOfi'
        mmHeight = 3704
        mmLeft = 163248
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText40'
        DataField = 'OFDESNOM'
        DataPipeline = dbRepOfi
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbRepOfi'
        mmHeight = 3969
        mmLeft = 13758
        mmTop = 529
        mmWidth = 42598
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CREMTOGIR'
        DataPipeline = dbRepOfi
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepOfi'
        mmHeight = 3704
        mmLeft = 127000
        mmTop = 265
        mmWidth = 29898
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand9: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLine29: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 10054
        mmTop = 794
        mmWidth = 177536
        BandType = 7
      end
      object ppLine30: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 9790
        mmTop = 7673
        mmWidth = 177007
        BandType = 7
      end
      object ppLabel166: TppLabel
        UserName = 'Label96'
        AutoSize = False
        Caption = 'TOTAL GENERAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 15610
        mmTop = 2381
        mmWidth = 33602
        BandType = 7
      end
      object ppLabel167: TppLabel
        UserName = 'Label111'
        AutoSize = False
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 51065
        mmTop = 2381
        mmWidth = 4498
        BandType = 7
      end
      object ppDBCalc21: TppDBCalc
        UserName = 'DBCalc44'
        DataField = 'CREMTOOTOR'
        DataPipeline = dbRepOfi
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepOfi'
        mmHeight = 3704
        mmLeft = 59267
        mmTop = 2381
        mmWidth = 30163
        BandType = 7
      end
      object ppDBCalc51: TppDBCalc
        UserName = 'DBCalc46'
        DataField = 'CREMTONABO'
        DataPipeline = dbRepOfi
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepOfi'
        mmHeight = 3704
        mmLeft = 91281
        mmTop = 2381
        mmWidth = 30692
        BandType = 7
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = clGrayText
        mmHeight = 6879
        mmLeft = 125677
        mmTop = 794
        mmWidth = 34925
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'CREMTOGIR'
        DataPipeline = dbRepOfi
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepOfi'
        mmHeight = 4106
        mmLeft = 126207
        mmTop = 2381
        mmWidth = 30692
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'NUMCRE'
        DataPipeline = dbRepOfi
        DisplayFormat = '###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepOfi'
        mmHeight = 3704
        mmLeft = 163513
        mmTop = 2381
        mmWidth = 21167
        BandType = 7
      end
    end
  end
  object RepTipo: TppReport
    AutoStop = False
    DataPipeline = dbRepTip
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
    Left = 692
    Top = 560
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'dbRepTip'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41275
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape2'
        Brush.Color = clGrayText
        mmHeight = 5292
        mmLeft = 178594
        mmTop = 34660
        mmWidth = 34925
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label37'
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
      object ppLabel3: TppLabel
        UserName = 'Label54'
        AutoSize = False
        Caption = 'CREDITOS OTORGADOS POR TIPO - A NIVEL NACIONAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 17992
        mmWidth = 230717
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label84'
        Caption = 'Fecha  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 209550
        mmTop = 0
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label85'
        Caption = 'Hora     '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 209550
        mmTop = 4498
        mmWidth = 11430
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label501'
        Caption = 'Pag     '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 209815
        mmTop = 8996
        mmWidth = 10160
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable13'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 223044
        mmTop = 265
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable14'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 222780
        mmTop = 5027
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable15'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 223573
        mmTop = 9260
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label87'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 221192
        mmTop = 8996
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label88'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 221192
        mmTop = 4498
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label89'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 221192
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object xTitulos02: TppLabel
        UserName = 'xTit01'
        AutoSize = False
        Caption = 'DEL  XX/XX/XXXXX   AL   XX/XX/XXXXX'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 103981
        mmTop = 24342
        mmWidth = 131234
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Monto Otorgado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 116152
        mmTop = 35719
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label157'
        AutoSize = False
        Caption = 'Monto Descontado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 144198
        mmTop = 35719
        mmWidth = 30163
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label158'
        AutoSize = False
        Caption = 'N'#250'mero de Cr'#233'ditos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 217223
        mmTop = 35983
        mmWidth = 20638
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line46'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 9260
        mmTop = 34660
        mmWidth = 230453
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line47'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 9525
        mmTop = 39688
        mmWidth = 229659
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Tipo de Cr'#233'dito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 13758
        mmTop = 35719
        mmWidth = 40481
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Monto Desembolsado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4106
        mmLeft = 180182
        mmTop = 35190
        mmWidth = 32015
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'Shape1'
        mmHeight = 4763
        mmLeft = 178594
        mmTop = 0
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText204'
        DataField = 'CREMTOOTOR'
        DataPipeline = dbRepTip
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepTip'
        mmHeight = 3704
        mmLeft = 112184
        mmTop = 529
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText36'
        DataField = 'CREMTONABO'
        DataPipeline = dbRepTip
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepTip'
        mmHeight = 3704
        mmLeft = 144992
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText37'
        DataField = 'NUMCRE'
        DataPipeline = dbRepTip
        DisplayFormat = '###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepTip'
        mmHeight = 3704
        mmLeft = 216165
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText40'
        DataField = 'TIPCREDES'
        DataPipeline = dbRepTip
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbRepTip'
        mmHeight = 3969
        mmLeft = 13758
        mmTop = 529
        mmWidth = 95779
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText3'
        DataField = 'CREMTOGIR'
        DataPipeline = dbRepTip
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepTip'
        mmHeight = 3704
        mmLeft = 179917
        mmTop = 265
        mmWidth = 29898
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 10054
        mmTop = 794
        mmWidth = 230453
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 9790
        mmTop = 7673
        mmWidth = 230453
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label96'
        AutoSize = False
        Caption = 'TOTAL GENERAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 15610
        mmTop = 2381
        mmWidth = 33602
        BandType = 7
      end
      object ppLabel18: TppLabel
        UserName = 'Label111'
        AutoSize = False
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 51065
        mmTop = 2381
        mmWidth = 4498
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc44'
        DataField = 'CREMTOOTOR'
        DataPipeline = dbRepTip
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepTip'
        mmHeight = 3704
        mmLeft = 112184
        mmTop = 2381
        mmWidth = 30163
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc46'
        DataField = 'CREMTONABO'
        DataPipeline = dbRepTip
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepTip'
        mmHeight = 3704
        mmLeft = 144198
        mmTop = 2381
        mmWidth = 30692
        BandType = 7
      end
      object ppShape6: TppShape
        UserName = 'Shape3'
        Brush.Color = clGrayText
        mmHeight = 6879
        mmLeft = 178594
        mmTop = 794
        mmWidth = 34925
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'CREMTOGIR'
        DataPipeline = dbRepTip
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepTip'
        mmHeight = 4106
        mmLeft = 179123
        mmTop = 2381
        mmWidth = 30692
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'NUMCRE'
        DataPipeline = dbRepTip
        DisplayFormat = '###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepTip'
        mmHeight = 3704
        mmLeft = 216430
        mmTop = 2381
        mmWidth = 21167
        BandType = 7
      end
    end
  end
  object dbRepTip: TppDBPipeline
    DataSource = DM1.dsSolicitud
    UserName = 'dbRepOfi1'
    Left = 724
    Top = 560
  end
  object RepDes: TppReport
    AutoStop = False
    DataPipeline = dbRepDes
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
    Left = 752
    Top = 560
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'dbRepDes'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41275
      mmPrintPosition = 0
      object ppShape7: TppShape
        UserName = 'Shape2'
        Brush.Color = clGrayText
        mmHeight = 5292
        mmLeft = 178594
        mmTop = 34660
        mmWidth = 34925
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label37'
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
      object ppLabel19: TppLabel
        UserName = 'Label54'
        AutoSize = False
        Caption = 'CREDITOS OTORGADOS POR TIPO DE DESEMBOLSO - A NIVEL NACIONAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 17992
        mmWidth = 230717
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label84'
        Caption = 'Fecha  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 209550
        mmTop = 0
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label85'
        Caption = 'Hora     '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 209550
        mmTop = 4498
        mmWidth = 11430
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label501'
        Caption = 'Pag     '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 209815
        mmTop = 8996
        mmWidth = 10160
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable13'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 223044
        mmTop = 265
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable14'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 222780
        mmTop = 5027
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable15'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 223573
        mmTop = 9260
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label87'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 221192
        mmTop = 8996
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label88'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 221192
        mmTop = 4498
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label89'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 221192
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object xTitulos03: TppLabel
        UserName = 'xTit01'
        AutoSize = False
        Caption = 'DEL  XX/XX/XXXXX   AL   XX/XX/XXXXX'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 103981
        mmTop = 24342
        mmWidth = 131234
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Monto Otorgado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 116152
        mmTop = 35719
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label157'
        AutoSize = False
        Caption = 'Monto Descontado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 144198
        mmTop = 35719
        mmWidth = 30163
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label158'
        AutoSize = False
        Caption = 'N'#250'mero de Cr'#233'ditos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 217223
        mmTop = 35983
        mmWidth = 20638
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line46'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 9260
        mmTop = 34660
        mmWidth = 230453
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line47'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 9525
        mmTop = 39688
        mmWidth = 229659
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Tipo de Cr'#233'dito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 13758
        mmTop = 35719
        mmWidth = 40481
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Monto Desembolsado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4106
        mmLeft = 180182
        mmTop = 35190
        mmWidth = 32015
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape8: TppShape
        UserName = 'Shape1'
        mmHeight = 4763
        mmLeft = 178594
        mmTop = 0
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText204'
        DataField = 'CREMTOOTOR'
        DataPipeline = dbRepDes
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepDes'
        mmHeight = 3704
        mmLeft = 112184
        mmTop = 529
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText36'
        DataField = 'CREMTONABO'
        DataPipeline = dbRepDes
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepDes'
        mmHeight = 3704
        mmLeft = 144992
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText37'
        DataField = 'NUMCRE'
        DataPipeline = dbRepDes
        DisplayFormat = '###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepDes'
        mmHeight = 3704
        mmLeft = 216165
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText40'
        DataField = 'TIPDESEDES'
        DataPipeline = dbRepDes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbRepDes'
        mmHeight = 3969
        mmLeft = 13758
        mmTop = 529
        mmWidth = 95779
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText3'
        DataField = 'CREMTOGIR'
        DataPipeline = dbRepDes
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepDes'
        mmHeight = 3704
        mmLeft = 179917
        mmTop = 265
        mmWidth = 29898
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 10054
        mmTop = 794
        mmWidth = 230453
        BandType = 7
      end
      object ppLine8: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 9790
        mmTop = 7673
        mmWidth = 230453
        BandType = 7
      end
      object ppLabel32: TppLabel
        UserName = 'Label96'
        AutoSize = False
        Caption = 'TOTAL GENERAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 15610
        mmTop = 2381
        mmWidth = 33602
        BandType = 7
      end
      object ppLabel33: TppLabel
        UserName = 'Label111'
        AutoSize = False
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 51065
        mmTop = 2381
        mmWidth = 4498
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc44'
        DataField = 'CREMTOOTOR'
        DataPipeline = dbRepDes
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepDes'
        mmHeight = 3704
        mmLeft = 112184
        mmTop = 2381
        mmWidth = 30163
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc46'
        DataField = 'CREMTONABO'
        DataPipeline = dbRepDes
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepDes'
        mmHeight = 3704
        mmLeft = 144198
        mmTop = 2381
        mmWidth = 30692
        BandType = 7
      end
      object ppShape9: TppShape
        UserName = 'Shape3'
        Brush.Color = clGrayText
        mmHeight = 6879
        mmLeft = 178594
        mmTop = 794
        mmWidth = 34925
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'CREMTOGIR'
        DataPipeline = dbRepDes
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepDes'
        mmHeight = 4106
        mmLeft = 179123
        mmTop = 2381
        mmWidth = 30692
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'NUMCRE'
        DataPipeline = dbRepDes
        DisplayFormat = '###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRepDes'
        mmHeight = 3704
        mmLeft = 216430
        mmTop = 2381
        mmWidth = 21167
        BandType = 7
      end
    end
  end
  object dbRepDes: TppDBPipeline
    DataSource = DM1.dsReporte
    UserName = 'dbRepDes'
    Left = 784
    Top = 560
  end
end
