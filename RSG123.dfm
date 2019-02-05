object fGrafDepMeses: TfGrafDepMeses
  Left = 265
  Top = 53
  Width = 870
  Height = 600
  Caption = 'Departamentos / Meses'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inline FraChartP1: TFraChartP
    Left = 0
    Top = 0
    Width = 854
    Height = 562
    Align = alClient
    TabOrder = 0
    inherited Splitter1: TSplitter
      Height = 562
    end
    inherited dbChartPrincipal: TDBChart
      Width = 584
      Height = 562
    end
    inherited pControlSeries: TPanel
      Height = 562
      inherited Panel2: TPanel
        Top = 167
      end
      inherited dbgSeries: TwwDBGrid
        Height = 139
      end
      inherited pGeneral: TPanel
        inherited btnImprimir: TBitBtn
          OnClick = FraChartP1btnImprimirClick
        end
      end
    end
  end
end
