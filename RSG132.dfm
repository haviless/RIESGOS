object FDetalle: TFDetalle
  Left = 156
  Top = 108
  BorderStyle = bsSingle
  Caption = 'Detalle'
  ClientHeight = 515
  ClientWidth = 1370
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lbltitulo: TLabel
    Left = 183
    Top = 8
    Width = 531
    Height = 20
    Caption = 'CONCILIACI'#211'N MENSUAL BDC-SBS VS BALANCE CONTABLE - '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 152
    Top = 472
    Width = 234
    Height = 13
    Caption = '(*) Otorgados y Cancelados el mismo mes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StaticText1: TStaticText
    Left = 158
    Top = 33
    Width = 161
    Height = 64
    Alignment = taCenter
    AutoSize = False
    Caption = 'SALDO CAPITAL VIGENTE DE LA OPERACI'#211'N'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object PanelKVI: TPanel
    Left = 158
    Top = 121
    Width = 161
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object StaticText2: TStaticText
    Left = 320
    Top = 33
    Width = 161
    Height = 64
    Alignment = taCenter
    AutoSize = False
    Caption = 'SALDO CAPITAL VENCIDO DE LA OPERACI'#211'N'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
  end
  object StaticText3: TStaticText
    Left = 483
    Top = 33
    Width = 161
    Height = 64
    Alignment = taCenter
    AutoSize = False
    Caption = 'SALDO CAPITAL REFINANCIADO DE LA OPERACI'#211'N'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
  end
  object StaticText4: TStaticText
    Left = 6
    Top = 196
    Width = 150
    Height = 32
    AutoSize = False
    Caption = 'BALANCE CONTABLE'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 4
  end
  object StaticText5: TStaticText
    Left = 6
    Top = 229
    Width = 150
    Height = 32
    AutoSize = False
    Caption = 'CUENTA CONTABLE'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 5
  end
  object StaticText6: TStaticText
    Left = 6
    Top = 123
    Width = 150
    Height = 32
    AutoSize = False
    Caption = 'BDC01'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 6
  end
  object StaticText7: TStaticText
    Left = 6
    Top = 156
    Width = 150
    Height = 32
    AutoSize = False
    Caption = 'BDC02A'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 7
  end
  object StaticText8: TStaticText
    Left = 158
    Top = 98
    Width = 161
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'KVI'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 8
  end
  object StaticText9: TStaticText
    Left = 320
    Top = 98
    Width = 161
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'KVE'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 9
  end
  object StaticText10: TStaticText
    Left = 645
    Top = 33
    Width = 161
    Height = 64
    Alignment = taCenter
    AutoSize = False
    Caption = 'MONTO CAPITAL DE LA CUOTA'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 10
  end
  object StaticText11: TStaticText
    Left = 807
    Top = 33
    Width = 161
    Height = 64
    Alignment = taCenter
    AutoSize = False
    Caption = 'SALDO CAPITAL DE LA DEUDA'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 11
  end
  object StaticText12: TStaticText
    Left = 969
    Top = 33
    Width = 161
    Height = 64
    Alignment = taCenter
    AutoSize = False
    Caption = 'PROVISI'#211'N CONSTITUIDA'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 12
  end
  object StaticText13: TStaticText
    Left = 1131
    Top = 33
    Width = 236
    Height = 64
    Alignment = taCenter
    AutoSize = False
    Caption = 'CANTIDAD'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 13
  end
  object StaticText14: TStaticText
    Left = 483
    Top = 98
    Width = 161
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'KRF'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 14
  end
  object StaticText15: TStaticText
    Left = 645
    Top = 98
    Width = 161
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'MCUO'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 15
  end
  object StaticText16: TStaticText
    Left = 807
    Top = 98
    Width = 161
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'SKCR'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 16
  end
  object StaticText17: TStaticText
    Left = 969
    Top = 98
    Width = 161
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'PCI'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 17
  end
  object StaticText18: TStaticText
    Left = 1131
    Top = 98
    Width = 117
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'DEUDORES'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 18
  end
  object StaticText19: TStaticText
    Left = 1250
    Top = 98
    Width = 117
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'CR'#201'DITOS'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 19
  end
  object PanelKVE: TPanel
    Left = 320
    Top = 121
    Width = 161
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
  end
  object PanelKRF: TPanel
    Left = 482
    Top = 121
    Width = 162
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
  end
  object PanelSKCR: TPanel
    Left = 807
    Top = 121
    Width = 162
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 22
  end
  object PanelPCI: TPanel
    Left = 969
    Top = 121
    Width = 161
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 23
  end
  object PanelMCUO: TPanel
    Left = 645
    Top = 153
    Width = 161
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 24
  end
  object StaticText20: TStaticText
    Left = 6
    Top = 262
    Width = 150
    Height = 32
    AutoSize = False
    Caption = 'SALDOS'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 25
  end
  object Panel1710103: TPanel
    Left = 157
    Top = 261
    Width = 161
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 26
  end
  object Panel1710503: TPanel
    Left = 319
    Top = 261
    Width = 161
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 27
  end
  object Panel1710403: TPanel
    Left = 481
    Top = 261
    Width = 161
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 28
  end
  object Panel196: TPanel
    Left = 966
    Top = 262
    Width = 161
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 29
  end
  object PanelBDC01Deudores: TPanel
    Left = 1131
    Top = 121
    Width = 117
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 30
  end
  object PanelBDC01Creditos: TPanel
    Left = 1249
    Top = 121
    Width = 117
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 31
  end
  object Panel13: TPanel
    Left = 157
    Top = 228
    Width = 161
    Height = 33
    Caption = '1710103'
    Color = 14465938
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 32
  end
  object Panel50: TPanel
    Left = 319
    Top = 228
    Width = 161
    Height = 33
    Caption = '1710503'
    Color = 14465938
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 33
  end
  object Panel15: TPanel
    Left = 481
    Top = 228
    Width = 161
    Height = 33
    Caption = '1710403'
    Color = 14465938
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 34
  end
  object Panel16: TPanel
    Left = 966
    Top = 229
    Width = 161
    Height = 33
    Caption = '196'
    Color = 14465938
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 35
  end
  object StaticText21: TStaticText
    Left = 152
    Top = 325
    Width = 193
    Height = 44
    AutoSize = False
    Caption = 'INFORMACI'#211'N COMPLEMENTARIA'
    Color = 12748350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 36
  end
  object StaticText22: TStaticText
    Left = 346
    Top = 325
    Width = 193
    Height = 44
    Alignment = taCenter
    AutoSize = False
    Caption = 'CANTIDAD'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 37
  end
  object StaticText23: TStaticText
    Left = 540
    Top = 325
    Width = 193
    Height = 44
    Alignment = taCenter
    AutoSize = False
    Caption = 'MONTO'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 38
  end
  object StaticText25: TStaticText
    Left = 152
    Top = 403
    Width = 193
    Height = 32
    AutoSize = False
    Caption = 'CR'#201'DITOS EXTORNADOS'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 39
  end
  object StaticText26: TStaticText
    Left = 152
    Top = 436
    Width = 193
    Height = 32
    AutoSize = False
    Caption = 'CR'#201'DITOS CANCELADOS (*)'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 40
  end
  object StaticText24: TStaticText
    Left = 152
    Top = 370
    Width = 193
    Height = 32
    AutoSize = False
    Caption = 'CR'#201'DITOS NUEVOS'
    Color = 14465938
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 41
  end
  object PanelNUECANTIDAD: TPanel
    Left = 345
    Top = 369
    Width = 194
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 42
  end
  object PanelNUEMONTO: TPanel
    Left = 539
    Top = 369
    Width = 194
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 43
  end
  object PanelEXTCANTIDAD: TPanel
    Left = 345
    Top = 402
    Width = 194
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 44
  end
  object PanelEXTMONTO: TPanel
    Left = 539
    Top = 402
    Width = 194
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 45
  end
  object PanelCANCANTIDAD: TPanel
    Left = 345
    Top = 435
    Width = 194
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 46
  end
  object PanelCANMONTO: TPanel
    Left = 539
    Top = 435
    Width = 194
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 47
  end
  object GroupBox1: TGroupBox
    Left = 1208
    Top = 344
    Width = 153
    Height = 105
    Caption = 'Leyenda'
    TabOrder = 48
    object ShapeObservado: TShape
      Left = 16
      Top = 66
      Width = 121
      Height = 25
      Brush.Color = 11840763
    end
    object lblObservado: TLabel
      Left = 41
      Top = 71
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Observado'
      Color = 11840763
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object ShapeConforme: TShape
      Left = 16
      Top = 26
      Width = 121
      Height = 25
      Brush.Color = 11861686
    end
    object lblConforme: TLabel
      Left = 43
      Top = 32
      Width = 65
      Height = 13
      AutoSize = False
      Caption = 'Conforme'
      Color = 11861686
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object PanelBDC02ADeudores: TPanel
    Left = 1131
    Top = 154
    Width = 117
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 49
  end
  object PanelBDC02ACreditos: TPanel
    Left = 1249
    Top = 154
    Width = 117
    Height = 33
    Alignment = taRightJustify
    Caption = '99,999,999,999.99'
    Color = 11861686
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 50
  end
  object btnSalir: TBitBtn
    Left = 1264
    Top = 472
    Width = 91
    Height = 33
    Caption = 'Salir'
    TabOrder = 51
    OnClick = btnSalirClick
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
  object panelObs: TPanel
    Left = 395
    Top = 144
    Width = 702
    Height = 273
    BorderStyle = bsSingle
    Color = clWindow
    TabOrder = 52
    Visible = False
    object StaticText27: TStaticText
      Left = 0
      Top = 1
      Width = 697
      Height = 24
      AutoSize = False
      Caption = 'RESUMEN'
      Color = 8404992
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object BitOut: TfcShapeBtn
      Left = 618
      Top = 237
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Hint = 'Salir'
      Caption = 'Salir'
      Color = cl3DLight
      DitherColor = clWhite
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
      Options = [boFocusable]
      ParentClipping = True
      ParentShowHint = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      ShowHint = True
      TabOrder = 1
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = BitOutClick
    end
    object StaticText28: TStaticText
      Left = 123
      Top = 40
      Width = 140
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = 'BDC01'
      Color = 12748350
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object StaticText29: TStaticText
      Left = 265
      Top = 40
      Width = 140
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = 'BDC02A'
      Color = 12748350
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
    object StaticText30: TStaticText
      Left = 406
      Top = 40
      Width = 140
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = 'BALANCE'
      Color = 12748350
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 4
    end
    object StaticText31: TStaticText
      Left = 6
      Top = 63
      Width = 114
      Height = 22
      AutoSize = False
      Caption = 'KVI'
      Color = 12748350
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 5
    end
    object StaticText32: TStaticText
      Left = 6
      Top = 87
      Width = 114
      Height = 22
      AutoSize = False
      Caption = 'KVE'
      Color = 12748350
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 6
    end
    object StaticText33: TStaticText
      Left = 6
      Top = 111
      Width = 114
      Height = 22
      AutoSize = False
      Caption = 'KRF'
      Color = 12748350
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 7
    end
    object StaticText34: TStaticText
      Left = 6
      Top = 135
      Width = 114
      Height = 22
      AutoSize = False
      Caption = 'SKCR'
      Color = 12748350
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 8
    end
    object StaticText35: TStaticText
      Left = 6
      Top = 159
      Width = 114
      Height = 22
      AutoSize = False
      Caption = 'PCI'
      Color = 12748350
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 9
    end
    object StaticText36: TStaticText
      Left = 6
      Top = 183
      Width = 114
      Height = 22
      AutoSize = False
      Caption = '# DEUDORES'
      Color = 12748350
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 10
    end
    object StaticText37: TStaticText
      Left = 6
      Top = 207
      Width = 114
      Height = 22
      AutoSize = False
      Caption = '# CR'#201'DITOS'
      Color = 12748350
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 11
    end
    object StaticText38: TStaticText
      Left = 548
      Top = 40
      Width = 140
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = 'DIFERENCIA'
      Color = 12748350
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 12
    end
    object BDC01_KVI: TStaticText
      Left = 123
      Top = 64
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 13
    end
    object StaticText40: TStaticText
      Left = 265
      Top = 64
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 14
    end
    object BALANCE_KVI: TStaticText
      Left = 406
      Top = 64
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 15
    end
    object DIFERENCIA_KVI: TStaticText
      Left = 548
      Top = 64
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 13816575
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 16
    end
    object BDC01_KVE: TStaticText
      Left = 123
      Top = 88
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 17
    end
    object StaticText44: TStaticText
      Left = 265
      Top = 88
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 18
    end
    object BALANCE_KVE: TStaticText
      Left = 406
      Top = 88
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 19
    end
    object DIFERENCIA_KVE: TStaticText
      Left = 548
      Top = 88
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 13816575
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 20
    end
    object BDC01_KRF: TStaticText
      Left = 123
      Top = 112
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 21
    end
    object StaticText48: TStaticText
      Left = 265
      Top = 112
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 22
    end
    object BALANCE_KRF: TStaticText
      Left = 406
      Top = 112
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 23
    end
    object DIFERENCIA_KRF: TStaticText
      Left = 548
      Top = 112
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 13816575
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 24
    end
    object BDC01_SKCR: TStaticText
      Left = 123
      Top = 136
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 25
    end
    object BDC02A_SKCR: TStaticText
      Left = 265
      Top = 136
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 26
    end
    object StaticText53: TStaticText
      Left = 406
      Top = 136
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 27
    end
    object DIFERENCIA_SKCR: TStaticText
      Left = 548
      Top = 136
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 13816575
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 28
    end
    object BDC01_PCI: TStaticText
      Left = 123
      Top = 160
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 29
    end
    object StaticText56: TStaticText
      Left = 265
      Top = 160
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 30
    end
    object BALANCE_PCI: TStaticText
      Left = 406
      Top = 160
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 31
    end
    object DIFERENCIA_PCI: TStaticText
      Left = 548
      Top = 160
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 13816575
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 32
    end
    object BDC01_DEUDORES: TStaticText
      Left = 123
      Top = 184
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 33
    end
    object BDC02A_DEUDORES: TStaticText
      Left = 265
      Top = 184
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 34
    end
    object StaticText61: TStaticText
      Left = 406
      Top = 184
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 35
    end
    object DIFERENCIA_DEUDORES: TStaticText
      Left = 548
      Top = 184
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 13816575
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 36
    end
    object BDC01_CREDITOS: TStaticText
      Left = 123
      Top = 208
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 37
    end
    object BDC02A_CREDITOS: TStaticText
      Left = 265
      Top = 208
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 38
    end
    object StaticText65: TStaticText
      Left = 406
      Top = 208
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Color = 15588293
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 39
    end
    object DIFERENCIA_CREDITOS: TStaticText
      Left = 548
      Top = 208
      Width = 140
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '9,999.99'
      Color = 13816575
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 40
    end
  end
  object btnDiferencia: TBitBtn
    Left = 1166
    Top = 472
    Width = 91
    Height = 33
    Caption = 'Diferencia'
    TabOrder = 53
    OnClick = btnDiferenciaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
      73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
      0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
      0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
      0333337F777777737F333308888888880333337F333333337F33330888888888
      03333373FFFFFFFF733333700000000073333337777777773333}
    NumGlyphs = 2
  end
end
