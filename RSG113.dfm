object FComentarioImg: TFComentarioImg
  Left = 466
  Top = 205
  BorderStyle = bsDialog
  Caption = 'Comentario'
  ClientHeight = 126
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 192
    Top = 96
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
  object Button2: TButton
    Left = 72
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
  end
  object mComentario: TMemo
    Left = 0
    Top = 0
    Width = 339
    Height = 89
    Align = alTop
    MaxLength = 100
    TabOrder = 0
  end
end
