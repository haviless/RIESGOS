object fVisorComp: TfVisorComp
  Left = 331
  Top = 116
  BorderStyle = bsDialog
  Caption = 'Visor de Comparaci'#243'n Periodos  Actual vs. Anterior'
  ClientHeight = 559
  ClientWidth = 647
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
  PixelsPerInch = 96
  TextHeight = 13
  object BitSalir: TBitBtn
    Left = 543
    Top = 525
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
  object pnlVisor: TPanel
    Left = 5
    Top = 3
    Width = 634
    Height = 86
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 7
      Width = 106
      Height = 14
      AutoSize = False
      Caption = 'C'#243'digo de Asociado'
    end
    object Label4: TLabel
      Left = 8
      Top = 26
      Width = 106
      Height = 14
      AutoSize = False
      Caption = 'Apellidos y Nombres'
    end
    object Label5: TLabel
      Left = 249
      Top = 45
      Width = 91
      Height = 14
      AutoSize = False
      Caption = 'Tipo de Asociado'
    end
    object Label6: TLabel
      Left = 9
      Top = 45
      Width = 40
      Height = 14
      AutoSize = False
      Caption = 'D.N.I.'
    end
    object Label7: TLabel
      Left = 8
      Top = 64
      Width = 74
      Height = 14
      AutoSize = False
      Caption = 'Departamento'
    end
    object Label8: TLabel
      Left = 248
      Top = 64
      Width = 43
      Height = 14
      AutoSize = False
      Caption = 'Ugel'
    end
    object lblCodAso: TLabel
      Left = 123
      Top = 8
      Width = 98
      Height = 13
      AutoSize = False
      Caption = 'XXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblApeNom: TLabel
      Left = 123
      Top = 28
      Width = 412
      Height = 13
      AutoSize = False
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDNI: TLabel
      Left = 123
      Top = 45
      Width = 98
      Height = 13
      AutoSize = False
      Caption = 'XXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTipAso: TLabel
      Left = 351
      Top = 45
      Width = 134
      Height = 13
      AutoSize = False
      Caption = 'XXXXXXXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDpto: TLabel
      Left = 124
      Top = 65
      Width = 112
      Height = 13
      AutoSize = False
      Caption = 'XXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblUgel: TLabel
      Left = 296
      Top = 65
      Width = 325
      Height = 13
      AutoSize = False
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnl01: TPanel
    Left = 7
    Top = 128
    Width = 312
    Height = 389
    TabOrder = 2
    object grpSal01: TGroupBox
      Left = 8
      Top = 57
      Width = 294
      Height = 103
      Caption = 'Saldos'
      TabOrder = 0
      object Label1: TLabel
        Left = 25
        Top = 21
        Width = 57
        Height = 13
        AutoSize = False
        Caption = 'Total'
      end
      object Label2: TLabel
        Left = 114
        Top = 21
        Width = 57
        Height = 13
        AutoSize = False
        Caption = 'Vencido'
      end
      object Label9: TLabel
        Left = 204
        Top = 21
        Width = 59
        Height = 13
        AutoSize = False
        Caption = 'No Vencido'
      end
      object Label12: TLabel
        Left = 14
        Top = 62
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'Cta.Individual'
      end
      object Label13: TLabel
        Left = 103
        Top = 62
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'Saldo Cubierto'
      end
      object Label14: TLabel
        Left = 193
        Top = 62
        Width = 95
        Height = 13
        AutoSize = False
        Caption = 'Saldo No Cubierto'
      end
      object lblTot01: TLabel
        Left = 6
        Top = 40
        Width = 71
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblVen01: TLabel
        Left = 96
        Top = 40
        Width = 71
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPen01: TLabel
        Left = 190
        Top = 40
        Width = 71
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCtaInd01: TLabel
        Left = 5
        Top = 80
        Width = 71
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCub01: TLabel
        Left = 95
        Top = 80
        Width = 71
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNoCub01: TLabel
        Left = 189
        Top = 80
        Width = 71
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 7
      Width = 294
      Height = 50
      Caption = 'Clasificaci'#243'n de Riesgo, Provisi'#243'n y Tipo de Asociado'
      TabOrder = 1
      object lblClas01: TLabel
        Left = 10
        Top = 15
        Width = 248
        Height = 13
        AutoSize = False
        Caption = 'NORMAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblProv01: TLabel
        Left = 143
        Top = 30
        Width = 57
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTipAso01: TLabel
        Left = 236
        Top = 30
        Width = 26
        Height = 13
        AutoSize = False
        Caption = 'DO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 168
      Width = 294
      Height = 215
      Caption = 'Detalle de Pagos'
      TabOrder = 2
      object Shape4: TShape
        Left = 8
        Top = 32
        Width = 85
        Height = 25
      end
      object lblCuoPac01: TLabel
        Left = 16
        Top = 39
        Width = 63
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '178.45'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Shape5: TShape
        Left = 104
        Top = 32
        Width = 85
        Height = 25
      end
      object lblCuoPag01: TLabel
        Left = 119
        Top = 39
        Width = 63
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '178.45'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label21: TLabel
        Left = 10
        Top = 17
        Width = 64
        Height = 13
        AutoSize = False
        Caption = 'Pactado'
      end
      object Label22: TLabel
        Left = 105
        Top = 18
        Width = 54
        Height = 13
        AutoSize = False
        Caption = 'Pagado'
      end
      object Shape6: TShape
        Left = 208
        Top = 32
        Width = 65
        Height = 25
      end
      object Label23: TLabel
        Left = 213
        Top = 18
        Width = 59
        Height = 13
        AutoSize = False
        Caption = 'Efectividad'
      end
      object lblCuoEfe01: TLabel
        Left = 213
        Top = 39
        Width = 55
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '100.00 %'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dtgPag01: TwwDBGrid
        Left = 6
        Top = 63
        Width = 281
        Height = 144
        Cursor = crHandPoint
        DisableThemesInTitle = False
        Selected.Strings = (
          'FORPAG'#9'3'#9'Forma~de Pago'
          'MONPAG'#9'8'#9'Pagado'
          'AMOPAG'#9'8'#9'Amort.'
          'INTPAG'#9'8'#9'Interes'
          'GASPAG'#9'8'#9'Gasto'
          'DESPAG'#9'8'#9'Fon.Des.'
          'EXCPAG'#9'8'#9'Exceso'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DM1.dsQry23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
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
  end
  object pnl03: TPanel
    Left = 327
    Top = 129
    Width = 312
    Height = 388
    TabOrder = 3
    object GroupBox3: TGroupBox
      Left = 8
      Top = 7
      Width = 294
      Height = 50
      Caption = 'Clasificaci'#243'n de Riesgo, Provisi'#243'n y Tipo de Asociado'
      TabOrder = 0
      object lblClas02: TLabel
        Left = 10
        Top = 14
        Width = 251
        Height = 13
        AutoSize = False
        Caption = 'NORMAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblProv02: TLabel
        Left = 138
        Top = 30
        Width = 57
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTipAso02: TLabel
        Left = 236
        Top = 30
        Width = 26
        Height = 13
        AutoSize = False
        Caption = 'DO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 57
      Width = 294
      Height = 103
      Caption = 'Saldos'
      TabOrder = 1
      object Label10: TLabel
        Left = 23
        Top = 21
        Width = 57
        Height = 13
        AutoSize = False
        Caption = 'Total'
      end
      object Label11: TLabel
        Left = 112
        Top = 21
        Width = 57
        Height = 13
        AutoSize = False
        Caption = 'Vencido'
      end
      object Label15: TLabel
        Left = 202
        Top = 21
        Width = 59
        Height = 13
        AutoSize = False
        Caption = 'No Vencido'
      end
      object Label16: TLabel
        Left = 14
        Top = 63
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'Cta.Individual'
      end
      object Label17: TLabel
        Left = 103
        Top = 63
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'Saldo Cubierto'
      end
      object Label18: TLabel
        Left = 193
        Top = 63
        Width = 95
        Height = 13
        AutoSize = False
        Caption = 'Saldo No Cubierto'
      end
      object lblTot02: TLabel
        Left = 16
        Top = 40
        Width = 65
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblVen02: TLabel
        Left = 106
        Top = 40
        Width = 65
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPen02: TLabel
        Left = 200
        Top = 40
        Width = 65
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCtaInd02: TLabel
        Left = 15
        Top = 81
        Width = 66
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCub02: TLabel
        Left = 105
        Top = 81
        Width = 66
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNoCub02: TLabel
        Left = 199
        Top = 81
        Width = 66
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1,256.23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 168
      Width = 294
      Height = 213
      Caption = 'Detalle de Pagos'
      TabOrder = 2
      object Label24: TLabel
        Left = 10
        Top = 17
        Width = 64
        Height = 13
        AutoSize = False
        Caption = 'Pactado'
      end
      object Label25: TLabel
        Left = 105
        Top = 18
        Width = 54
        Height = 13
        AutoSize = False
        Caption = 'Pagado'
      end
      object Label26: TLabel
        Left = 213
        Top = 18
        Width = 59
        Height = 13
        AutoSize = False
        Caption = 'Efectividad'
      end
      object Shape7: TShape
        Left = 9
        Top = 32
        Width = 85
        Height = 25
      end
      object lblCuoPac02: TLabel
        Left = 16
        Top = 39
        Width = 63
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '178.45'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Shape8: TShape
        Left = 106
        Top = 32
        Width = 85
        Height = 25
      end
      object lblCuoPag02: TLabel
        Left = 119
        Top = 39
        Width = 63
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '178.45'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Shape9: TShape
        Left = 209
        Top = 32
        Width = 65
        Height = 25
      end
      object lblCuoEfe02: TLabel
        Left = 213
        Top = 39
        Width = 55
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '100.00 %'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dtgPag02: TwwDBGrid
        Left = 6
        Top = 61
        Width = 281
        Height = 142
        Cursor = crHandPoint
        DisableThemesInTitle = False
        Selected.Strings = (
          'FORPAG'#9'3'#9'Forma~de Pago'
          'MONPAG'#9'8'#9'Pagado'
          'AMOPAG'#9'8'#9'Amort.'
          'INTPAG'#9'8'#9'Interes'
          'GASPAG'#9'8'#9'Gasto'
          'DESPAG'#9'8'#9'Fon.Des.'
          'EXCPAG'#9'8'#9'Exceso'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = DM1.dsQry22
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
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
  end
  object pnlPeriodo01: TPanel
    Left = 6
    Top = 94
    Width = 312
    Height = 30
    TabOrder = 4
    object lblPer01: TLabel
      Left = 13
      Top = 6
      Width = 194
      Height = 13
      AutoSize = False
      Caption = 'Anterior : Diciembre 2014'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlPeriodo02: TPanel
    Left = 326
    Top = 94
    Width = 313
    Height = 30
    TabOrder = 5
    object Shape2: TShape
      Left = 171
      Top = 3
      Width = 135
      Height = 23
    end
    object lblPer02: TLabel
      Left = 4
      Top = 6
      Width = 160
      Height = 13
      AutoSize = False
      Caption = 'Actual : Enero 2015'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 237
      Top = 6
      Width = 17
      Height = 17
      Brush.Color = clRed
    end
    object Label19: TLabel
      Left = 258
      Top = 8
      Width = 43
      Height = 14
      AutoSize = False
      Caption = 'Deterioro'
      Color = clWindow
      ParentColor = False
    end
    object Shape3: TShape
      Left = 174
      Top = 6
      Width = 17
      Height = 17
      Brush.Color = clGreen
    end
    object Label20: TLabel
      Left = 195
      Top = 8
      Width = 38
      Height = 14
      AutoSize = False
      Caption = 'Mejora'
      Color = clWindow
      ParentColor = False
    end
  end
end
