inherited FChart_MatrizDespGral: TFChart_MatrizDespGral
  Left = 44
  Top = 0
  Width = 1310
  Height = 780
  Caption = 'FChart_MatrizDespGral'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited FraChartP1: TFraChartP
    Top = 73
    Width = 1294
    Height = 669
    inherited Splitter1: TSplitter
      Height = 669
    end
    inherited dbChartPrincipal: TDBChart
      Width = 1024
      Height = 669
    end
    inherited pControlSeries: TPanel
      Height = 669
      inherited Panel2: TPanel
        Top = 274
      end
      inherited dbgSeries: TwwDBGrid
        Height = 246
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1294
    Height = 73
    Align = alTop
    TabOrder = 1
    object lblPeriodo: TLabel
      Left = 359
      Top = 23
      Width = 87
      Height = 24
      Caption = 'anhomes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rgReporte: TRadioGroup
      Left = 11
      Top = 6
      Width = 238
      Height = 56
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'CANTIDADES'
        'PORCENTAJES')
      ParentFont = False
      TabOrder = 0
    end
    object btnMostrarGrafico: TBitBtn
      Left = 263
      Top = 11
      Width = 89
      Height = 50
      Caption = 'Procesar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnMostrarGraficoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000333FFF3777777777F3000330FFFFFFF033777FF7F3FF3FF7F07B7030F00F0
        0F0377777F7F7737737F0BBB030FFFFFFF0377777F7F3FFFF37F07B7030F0000
        FF037777737F7777337F3000330FFFFFFF033777337F3FF3FF7F3333330F00F0
        00033333337F7737777F3333330FFFF0FF033FFFFF7F3FF7F3730000030F08F0
        F03377777F7F7737F7330999030FFFF0033377777F7FFFF77333099903000000
        333377777F7777773333099903333333333377777F33FFFFFFF3000003300000
        00337777733777777733333333330CCC033333333333777773333333333330C0
        3333333333333777333333333333330333333333333333733333}
      NumGlyphs = 2
    end
  end
end
