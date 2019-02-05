object FValidarBDC: TFValidarBDC
  Left = 446
  Top = 197
  BorderStyle = bsSingle
  Caption = 'Validar BDC'
  ClientHeight = 519
  ClientWidth = 888
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbDriver: TGroupBox
    Left = 6
    Top = 5
    Width = 867
    Height = 169
    TabOrder = 0
    object Label2: TLabel
      Left = 7
      Top = 127
      Width = 95
      Height = 13
      Caption = 'Archivo a  Importar  '
    end
    object DriveComboBox1: TDriveComboBox
      Left = 6
      Top = 11
      Width = 182
      Height = 19
      DirList = DirectoryListBox1
      TabOrder = 0
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 5
      Top = 35
      Width = 183
      Height = 90
      FileList = FileListBox1
      ItemHeight = 16
      TabOrder = 1
    end
    object FileListBox1: TFileListBox
      Left = 194
      Top = 9
      Width = 663
      Height = 116
      ItemHeight = 13
      TabOrder = 2
      OnClick = FileListBox1Click
    end
    object dbeNomArc: TwwDBEdit
      Left = 6
      Top = 142
      Width = 851
      Height = 21
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object btnSalir: TBitBtn
    Left = 784
    Top = 480
    Width = 91
    Height = 33
    Caption = 'Salir'
    TabOrder = 1
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 177
    Width = 865
    Height = 296
    Caption = 'Validar en bloques'
    TabOrder = 2
    object Label3: TLabel
      Left = 208
      Top = 28
      Width = 25
      Height = 13
      Caption = 'BDC:'
    end
    object Label1: TLabel
      Left = 16
      Top = 244
      Width = 44
      Height = 13
      Caption = 'Leyendo:'
    end
    object lbltotal: TLabel
      Left = 88
      Top = 244
      Width = 6
      Height = 13
      Caption = '0'
    end
    object grbParametros: TGroupBox
      Left = 13
      Top = 21
      Width = 185
      Height = 44
      Caption = ' Periodo de proceso '
      TabOrder = 0
      object lblNomMes: TLabel
        Left = 103
        Top = 18
        Width = 80
        Height = 18
        AutoSize = False
        Caption = 'DICIEMBRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dbsAnoIni: TwwDBSpinEdit
        Left = 4
        Top = 14
        Width = 56
        Height = 25
        Increment = 1.000000000000000000
        MaxValue = 2020.000000000000000000
        MinValue = 2013.000000000000000000
        Value = 2013.000000000000000000
        AutoFillDate = False
        AutoSelect = False
        AutoSize = False
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 62
        Top = 14
        Width = 38
        Height = 26
        Increment = 1.000000000000000000
        MaxValue = 12.000000000000000000
        MinValue = 1.000000000000000000
        Value = 12.000000000000000000
        AutoFillDate = False
        AutoSelect = False
        AutoSize = False
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
    end
    object cbBDC: TwwDBLookupCombo
      Left = 240
      Top = 28
      Width = 161
      Height = 21
      DropDownAlignment = taLeftJustify
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object btnAgregar: TBitBtn
      Left = 424
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 2
      OnClick = btnAgregarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337F33333333333333033333333333333373F333333333333090333
        33333333337F7F33333333333309033333333333337373F33333333330999033
        3333333337F337F33333333330999033333333333733373F3333333309999903
        333333337F33337F33333333099999033333333373333373F333333099999990
        33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333300033333333333337773333333}
      NumGlyphs = 2
    end
    object griddet: TwwDBGrid
      Left = 16
      Top = 72
      Width = 833
      Height = 161
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 3
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
    object EditArchivo: TEdit
      Left = 816
      Top = 12
      Width = 33
      Height = 21
      TabOrder = 4
      Visible = False
    end
    object btnValidar: TBitBtn
      Left = 752
      Top = 240
      Width = 97
      Height = 33
      Caption = 'Validar'
      TabOrder = 5
      OnClick = btnValidarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300130000031
        00333773F77777FF7733331000909000133333377737F777FF33330098F0F890
        0333337733F733F77F33370980FFF08907333373373F373373F33099FFFFFFF9
        903337F3F373F33FF7F33090F000FF00903337F73337F37737F3B099FFF0FFF9
        90B3373F33F7F3F33733070980F0F0890703337FF737F7337F33BB0098F0F890
        0BB33F77FF3733377FFF000009999900000377777FFFFF77777F088700000008
        77037F3377777773337F088887707888870373F3337773F33373B078800B0088
        70B3373FF733373FF73303700BBBBB007303337773F3F3777F33330BB0B0B0BB
        033333733737F73F73F330BB03B0B30BB0333733733733733733}
      NumGlyphs = 2
    end
    object btnEliminar: TBitBtn
      Left = 512
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Eliminar'
      TabOrder = 6
      OnClick = btnEliminarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
end
