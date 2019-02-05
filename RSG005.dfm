object fDetDesplazUgel: TfDetDesplazUgel
  Left = 264
  Top = 137
  BorderStyle = bsDialog
  Caption = 'Detalle de Desplazamiento x Ugel / Uses'
  ClientHeight = 402
  ClientWidth = 667
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
  object lblDpto: TLabel
    Left = 8
    Top = 50
    Width = 473
    Height = 24
    AutoSize = False
    Caption = 'Departamento  :   '
    Font.Charset = ANSI_CHARSET
    Font.Color = clPurple
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDesplazados: TLabel
    Left = 8
    Top = 18
    Width = 473
    Height = 24
    AutoSize = False
    Caption = 'Departamento  :   '
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dtgDetDes: TwwDBGrid
    Left = 8
    Top = 85
    Width = 656
    Height = 273
    Cursor = crHandPoint
    DisableThemesInTitle = False
    LineStyle = gls3D
    Selected.Strings = (
      'USENOM'#9'40'#9'Ugel/Uses'
      'ASOCIADOS'#9'10'#9'N'#250'mero~Asociados'
      'SALDOS_FT'#9'12'#9'Total'#9'F'#9'Saldo de Cartera'
      'SALDOS_FP'#9'12'#9'No Vencido'#9'F'#9'Saldo de Cartera'
      'SALDOS_FV'#9'12'#9'Vencido'#9'F'#9'Saldo de Cartera'
      'SALDOS_PV'#9'12'#9'Provisi'#243'n'#9'F'#9'Saldo de Cartera')
    IniAttributes.Delimiter = ';;'
    ExportOptions.ExportType = wwgetSYLK
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsDetalle
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
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
    OnDrawDataCell = dtgDetDesDrawDataCell
    FooterColor = 10930928
    FooterCellColor = clBtnHighlight
    PaintOptions.AlternatingRowColor = 14938339
  end
  object BitSalir: TBitBtn
    Left = 553
    Top = 369
    Width = 105
    Height = 27
    Caption = '&Salir'
    TabOrder = 1
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
