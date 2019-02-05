inherited FChart_MatrizDespDAtraConc: TFChart_MatrizDespDAtraConc
  Left = 176
  Top = 7
  Width = 1006
  Height = 712
  Caption = 'FChart_MatrizDespDAtraConc'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited FraChartP1: TFraChartP
    Top = 73
    Width = 990
    Height = 601
    inherited Splitter1: TSplitter
      Height = 601
    end
    inherited dbChartPrincipal: TDBChart
      Width = 718
      Height = 502
      Align = alCustom
    end
    inherited pControlSeries: TPanel
      Height = 601
      inherited Panel2: TPanel
        Top = 206
      end
      inherited dbgSeries: TwwDBGrid
        Height = 178
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 990
    Height = 73
    Align = alTop
    TabOrder = 1
    object lblPeriodo: TLabel
      Left = 864
      Top = 21
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
    object rgTotalVencidos: TRadioGroup
      Left = 411
      Top = -1
      Width = 346
      Height = 72
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'ASOCIADOS'
        'CATEGORIAS')
      ParentFont = False
      TabOrder = 2
    end
    object gbDptoUgel: TGroupBox
      Left = 411
      Top = -1
      Width = 346
      Height = 72
      TabOrder = 4
      object Label3: TLabel
        Left = 4
        Top = 14
        Width = 55
        Height = 13
        Caption = 'Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pDepartamento: TPanel
        Left = 4
        Top = 32
        Width = 238
        Height = 34
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 27
          Top = 9
          Width = 28
          Height = 13
          Caption = 'Dpto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dblcdDptoId: TwwDBLookupComboDlg
          Left = 58
          Top = 6
          Width = 48
          Height = 21
          CharCase = ecUpperCase
          GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
          GridColor = clWhite
          GridTitleAlignment = taLeftJustify
          Caption = 'Lookup'
          MaxWidth = 0
          MaxHeight = 209
          LookupField = 'CFC_F'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnChange = dblcdDptoIdChange
          OnExit = dblcdDptoIdExit
        end
        object meDptoDes: TMaskEdit
          Left = 106
          Top = 5
          Width = 128
          Height = 21
          Enabled = False
          TabOrder = 1
        end
      end
      object dblcCategoriaIdDpto: TwwDBLookupComboDlg
        Left = 62
        Top = 11
        Width = 48
        Height = 21
        CharCase = ecUpperCase
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        LookupField = 'CFC_F'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcCategoriaIdDptoChange
        OnExit = dblcCategoriaIdDptoExit
      end
      object meCategoriaDpto: TMaskEdit
        Left = 110
        Top = 11
        Width = 129
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object rgDptoUgel: TRadioGroup
        Left = 242
        Top = 6
        Width = 101
        Height = 62
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'SALDOS'
          'ASOCIADOS')
        ParentFont = False
        TabOrder = 3
      end
    end
    object gbDias: TGroupBox
      Left = 411
      Top = -1
      Width = 346
      Height = 72
      TabOrder = 3
      object Label2: TLabel
        Left = 4
        Top = 12
        Width = 55
        Height = 13
        Caption = 'Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblcdCategoriaId: TwwDBLookupComboDlg
        Left = 62
        Top = 11
        Width = 49
        Height = 21
        CharCase = ecUpperCase
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        LookupField = 'CFC_F'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcdCategoriaIdChange
        OnExit = dblcdCategoriaIdExit
      end
      object meCategoriaDes: TMaskEdit
        Left = 111
        Top = 11
        Width = 202
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object rgDias_SalAso: TRadioGroup
        Left = 63
        Top = 33
        Width = 251
        Height = 37
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'SALDOS'
          'ASOCIADOS')
        ParentFont = False
        TabOrder = 2
      end
    end
    object rgReporte: TRadioGroup
      Left = 11
      Top = -1
      Width = 398
      Height = 72
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'TOTAL'
        'VENCIDOS'
        'DIAS'
        'DPTO/UGEL'
        'DPTO/UGEL/DIAS')
      ParentFont = False
      TabOrder = 0
      OnClick = rgReporteClick
    end
    object btnMostrarGrafico: TBitBtn
      Left = 765
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
  object rdbTipCar: TRadioGroup
    Left = 279
    Top = 581
    Width = 457
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = 'Tipo de Cartera'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'General'
      'Normal'
      'Refinanciada')
    TabOrder = 2
  end
  object rdbTipAso: TRadioGroup
    Left = 279
    Top = 626
    Width = 456
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = 'Tipo Asociado'
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'General'
      'Activos'
      'Cesantes'
      'Contratados')
    TabOrder = 3
  end
end
