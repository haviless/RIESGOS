object FChart: TFChart
  Left = 233
  Top = 36
  Width = 960
  Height = 665
  Caption = 'Grafico'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inline FraChartP1: TFraChartP
    Left = 0
    Top = 0
    Width = 944
    Height = 627
    Align = alClient
    TabOrder = 0
    inherited Splitter1: TSplitter
      Height = 627
    end
    inherited dbChartPrincipal: TDBChart
      Width = 674
      Height = 627
    end
    inherited pControlSeries: TPanel
      Height = 627
      inherited Panel2: TPanel
        Top = 232
        inherited gbColor: TGroupBox
          inherited btnColorSerie: TButton
            OnClick = FraChartP1btnColorSerieClick
          end
        end
      end
      inherited dbgSeries: TwwDBGrid
        Height = 204
      end
      inherited pGeneral: TPanel
        inherited btnImprimir: TBitBtn
          OnClick = FraChartP1btnImprimirClick
        end
        inherited btnGrabar: TBitBtn
          OnClick = FraChartP1btnGrabarClick
        end
        inherited btnActualizar: TBitBtn
          OnClick = FraChartP1btnActualizarClick
        end
        inherited btnCambiarTitulo: TBitBtn
          OnClick = FraChartP1btnCambiarTituloClick
        end
      end
    end
  end
end
