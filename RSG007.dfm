object fEstDepMeses: TfEstDepMeses
  Left = 259
  Top = 100
  BorderStyle = bsDialog
  Caption = 'Departamento / Meses'
  ClientHeight = 510
  ClientWidth = 827
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
  DesignSize = (
    827
    510)
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo01: TLabel
    Left = 14
    Top = 9
    Width = 457
    Height = 20
    AutoSize = False
    Caption = 'xxxxxxxx'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTitulo02: TLabel
    Left = 14
    Top = 34
    Width = 457
    Height = 20
    AutoSize = False
    Caption = 'xxxxxxxx'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dtgCosDpto: TwwDBGrid
    Left = 0
    Top = 63
    Width = 827
    Height = 409
    Cursor = crHandPoint
    DisableThemesInTitle = False
    LineStyle = gls3D
    Selected.Strings = (
      'DPTODES'#9'16'#9'Departamento'
      'NOR'#9'11'#9'Normal'
      'CPP'#9'11'#9'Problemas~Potenciales'
      'DEF'#9'11'#9'Deficiente'
      'DUD'#9'11'#9'Dudoso'
      'PER'#9'11'#9'Perdida'
      'TOTAL'#9'11'#9'Total'#9'F')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = False
    DataSource = DM1.dsSobrino
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial'
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
    OnDrawDataCell = dtgCosDptoDrawDataCell
    OnDblClick = dtgCosDptoDblClick
    PaintOptions.ActiveRecordColor = clInfoBk
  end
  object rdbSelxMonDep: TRadioGroup
    Left = 546
    Top = 12
    Width = 251
    Height = 33
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Meses'
      'Ugeles / Uses')
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
  object BitExporta: TBitBtn
    Left = 445
    Top = 478
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
    TabOrder = 2
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
    Left = 566
    Top = 478
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
  object BitSalir: TBitBtn
    Left = 683
    Top = 479
    Width = 105
    Height = 27
    Cursor = crHandPoint
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
end
