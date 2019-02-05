object FChartT: TFChartT
  Left = 523
  Top = 336
  BorderStyle = bsDialog
  Caption = 'Cambiar Titulo'
  ClientHeight = 92
  ClientWidth = 395
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 99
    Height = 13
    Caption = 'Titulo del Grafico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 224
    Top = 57
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
  end
  object btnAceptar: TButton
    Left = 104
    Top = 57
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object edNombre: TEdit
    Left = 8
    Top = 24
    Width = 377
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 250
    TabOrder = 0
  end
end
