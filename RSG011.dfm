object FReportesContables: TFReportesContables
  Left = 299
  Top = 153
  BorderStyle = bsDialog
  Caption = 'Reportes de Sustentos Contables'
  ClientHeight = 484
  ClientWidth = 640
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 265
    Top = 163
    Width = 240
    Height = 150
    Caption = 'Devoluci'#243'n al Fondo Solidario de Contingencia'
    TabOrder = 16
    object BitBtn1: TBitBtn
      Left = 25
      Top = 18
      Width = 189
      Height = 39
      Caption = 'Bancos'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
        F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
        FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
        6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
        889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
        9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
        630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
        718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
        AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
        8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
        6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
        B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
        5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
        56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
        BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
        8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
        6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
        72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
        610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
        778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
        4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
        5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
        FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
        F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
        FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
    end
    object BitBtn2: TBitBtn
      Left = 25
      Top = 61
      Width = 189
      Height = 39
      Caption = 'Planillas'
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
        F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
        FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
        6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
        889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
        9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
        630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
        718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
        AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
        8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
        6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
        B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
        5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
        56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
        BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
        8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
        6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
        72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
        610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
        778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
        4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
        5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
        FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
        F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
        FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
    end
    object BitBtn3: TBitBtn
      Left = 25
      Top = 104
      Width = 189
      Height = 39
      Caption = 'Efectivo'
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
        F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
        FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
        6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
        889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
        9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
        630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
        718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
        AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
        8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
        6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
        B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
        5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
        56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
        BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
        8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
        6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
        72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
        610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
        778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
        4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
        5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
        FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
        F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
        FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
    end
  end
  object gbperiodo: TGroupBox
    Left = 9
    Top = 10
    Width = 130
    Height = 68
    Caption = ' Periodo '
    TabOrder = 0
    object TLabel
      Left = 75
      Top = 15
      Width = 21
      Height = 15
      Caption = 'Mes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object TLabel
      Left = 11
      Top = 15
      Width = 20
      Height = 15
      Caption = 'A'#241'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object dbseMes: TwwDBSpinEdit
      Left = 74
      Top = 32
      Width = 34
      Height = 21
      Increment = 1.000000000000000000
      MaxValue = 12.000000000000000000
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
      AutoFillDate = False
      AutoSelect = False
      AutoSize = False
      BorderStyle = bsNone
      Color = 10207162
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      LimitEditRect = True
      MaxLength = 2
      TabOrder = 1
      UnboundDataType = wwDefault
      OnExit = dbseMesExit
    end
    object dbseAno: TwwDBSpinEdit
      Left = 12
      Top = 32
      Width = 51
      Height = 21
      Increment = 1.000000000000000000
      MaxValue = 2060.000000000000000000
      MinValue = 2003.000000000000000000
      Value = 2018.000000000000000000
      AutoFillDate = False
      AutoSelect = False
      AutoSize = False
      BorderStyle = bsNone
      Color = 10207162
      Frame.Enabled = True
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      LimitEditRect = True
      MaxLength = 4
      TabOrder = 0
      UnboundDataType = wwDefault
    end
  end
  object dtpFecIni: TwwDBDateTimePicker
    Left = 499
    Top = 17
    Width = 100
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Date = 39173.000000000000000000
    Epoch = 1950
    ShowButton = True
    TabOrder = 3
    Visible = False
  end
  object dtpFecFin: TwwDBDateTimePicker
    Left = 499
    Top = 17
    Width = 100
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Date = 39191.000000000000000000
    Epoch = 1950
    ShowButton = True
    TabOrder = 4
    Visible = False
  end
  object edtFecha: TEdit
    Left = 504
    Top = 15
    Width = 100
    Height = 21
    Enabled = False
    TabOrder = 5
    Visible = False
  end
  object BitBtn4: TBitBtn
    Left = 9
    Top = 169
    Width = 248
    Height = 39
    Caption = '                      Sustento de Planillas               '
    TabOrder = 6
    OnClick = BitBtn4Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
      F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
      FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
      6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
      889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
      9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
      630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
      718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
      AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
      8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
      6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
      B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
      5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
      56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
      BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
      8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
      6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
      72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
      610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
      778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
      4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
      5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
      FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
      F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
      FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
  end
  object BitBtn5: TBitBtn
    Left = 9
    Top = 213
    Width = 248
    Height = 39
    Caption = '        Sustento de Boletas de Deposito           '
    TabOrder = 7
    OnClick = BitBtn5Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
      F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
      FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
      6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
      889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
      9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
      630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
      718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
      AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
      8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
      6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
      B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
      5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
      56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
      BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
      8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
      6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
      72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
      610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
      778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
      4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
      5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
      FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
      F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
      FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
  end
  object BitBtn6: TBitBtn
    Left = 9
    Top = 257
    Width = 248
    Height = 39
    Caption = '        Sustento de Cobranzas en Efectivo       '
    TabOrder = 8
    OnClick = BitBtn6Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
      F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
      FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
      6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
      889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
      9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
      630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
      718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
      AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
      8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
      6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
      B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
      5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
      56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
      BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
      8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
      6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
      72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
      610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
      778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
      4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
      5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
      FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
      F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
      FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
  end
  object BitBtn7: TBitBtn
    Left = 9
    Top = 301
    Width = 248
    Height = 39
    Caption = '   Fondo Solidario para Contingencias (FSC)  '
    TabOrder = 9
    OnClick = BitBtn7Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
      F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
      FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
      6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
      889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
      9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
      630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
      718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
      AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
      8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
      6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
      B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
      5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
      56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
      BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
      8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
      6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
      72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
      610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
      778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
      4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
      5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
      FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
      F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
      FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
  end
  object BitBtn8: TBitBtn
    Left = 9
    Top = 345
    Width = 248
    Height = 39
    Caption = 'Fondo de Protecci'#243'n de Desgravamen (FPD)'
    TabOrder = 10
    OnClick = BitBtn8Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
      F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
      FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
      6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
      889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
      9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
      630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
      718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
      AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
      8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
      6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
      B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
      5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
      56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
      BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
      8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
      6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
      72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
      610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
      778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
      4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
      5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
      FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
      F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
      FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
  end
  object BitBtn9: TBitBtn
    Left = 9
    Top = 388
    Width = 248
    Height = 39
    Caption = '            Sustento CCI                                     '
    TabOrder = 11
    OnClick = BitBtn9Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
      F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
      FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
      6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
      889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
      9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
      630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
      718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
      AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
      8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
      6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
      B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
      5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
      56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
      BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
      8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
      6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
      72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
      610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
      778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
      4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
      5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
      FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
      F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
      FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
  end
  object BitBtn10: TBitBtn
    Left = 9
    Top = 433
    Width = 248
    Height = 39
    Caption = '      Pagos Cuentas x Pagar (CXC) con FSC  '
    TabOrder = 12
    OnClick = BitBtn10Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
      F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
      FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
      6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
      889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
      9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
      630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
      718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
      AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
      8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
      6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
      B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
      5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
      56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
      BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
      8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
      6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
      72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
      610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
      778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
      4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
      5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
      FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
      F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
      FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
  end
  object GroupBox3: TGroupBox
    Left = 267
    Top = 322
    Width = 240
    Height = 150
    Caption = ' Extorno '
    TabOrder = 13
    object BitBtn11: TBitBtn
      Left = 25
      Top = 104
      Width = 189
      Height = 39
      Caption = '        Pagos Por Planillas        '
      TabOrder = 0
      OnClick = BitBtn11Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
        F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
        FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
        6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
        889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
        9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
        630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
        718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
        AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
        8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
        6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
        B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
        5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
        56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
        BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
        8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
        6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
        72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
        610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
        778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
        4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
        5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
        FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
        F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
        FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
    end
    object BitBtn12: TBitBtn
      Left = 25
      Top = 61
      Width = 189
      Height = 39
      Caption = '          Aplicaciones CCI          '
      TabOrder = 1
      OnClick = BitBtn12Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
        F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
        FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
        6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
        889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
        9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
        630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
        718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
        AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
        8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
        6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
        B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
        5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
        56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
        BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
        8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
        6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
        72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
        610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
        778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
        4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
        5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
        FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
        F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
        FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
    end
    object BitBtn13: TBitBtn
      Left = 25
      Top = 18
      Width = 189
      Height = 39
      Caption = 'Boleta de Deposito (BANCOS)'
      TabOrder = 2
      OnClick = BitBtn13Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300009C0E00009C0E00000000000000000000FFF3FFFCF7FF
        F2FCE5FBFFE4FAFFECF9FFECF8FFE7E7FED2CAE3B1B9CEA7F4FEF2F6FCFBFCFF
        FDEDF1EBFFFFF9F8FCF1F0E7FFFDFDFFFDFFEAF9FFDDCADCB797AC865C73464D
        6731264207637B4BFAFFF2F0F9EFF7FFF4FDFFF5F4FCEBFFFFF2FDFCFFFBFFF6
        889D6C425E1C41592328420C42601F456720466A1E759554B8CDA79BAA8FAAB9
        9D99A888A0AE8CE0EECAF9FCFAFBFFF16D88493254074564214667244165193A
        630E274F006B8F42CAE5B3596E47697D538BA073546839C1D6A5F8FFF6FAFFEB
        718F482E5300395A0F3B5E14264E00416D123B67087EA752E2FFC588A274C7DF
        AFF3FFD6748C56C2DBA3F9FFF8F5FFE875954E345B0592B66A3C611789B3605E
        8A2F2D5B00749E49A4C48B5A7446748E5E7F99644E6630CAE3ABF8FFFEF8FFF1
        6A874835590CA3C6837FA460BDE498416D1A1F4C00749C4EF3FFDF9CB58FC0D8
        B0F6FFE3708858C3DCAAF8FFFFF5FFF1617E4632570D335515F2FFD57FA75F31
        5B0D3864116F984DA5C294597250677D5A859D75536A3EC1D8ABF8FFFFF8FFF4
        56733B2E530B7B9C5FB2D497A6CE87426C1E2C580578A058EAFFDA849D7BC8DE
        BBF4FFE56C8258C3DAAEEEF6F6E5F4DF718D523B5E1490B272597C3C83A96162
        8D3C214E006F964BCAE7B9728A678097719FB78F70875BB9D0A3FAFFFCF8FFF0
        6683442C5101496B252C500A40681A426C173E6A1167903FD9F7C2738B63849C
        72BAD1A46F8554CDE4B0EBF0EEFAFFF15E793A3D5F1232510E5778353B611537
        610E2D5700699042E8FFD18BA37BC0D5AEE2F6CB607646C9DFAEFDFDFFF5FEF1
        778F5935540F2F4B1029470C335411456A204065157C9E58A4BC924E60415E6E
        4F6C7D5B63754ED0E2B9F8F4FFF7F9F9D1E3BCA6BE889DB285677E51516B353C
        5B1E25450464814AF3FFE8FAFFF5F4FFEEF4FFEAE5F0D6FDFFEDFCEFFFFDFAFF
        FDFFF1FBFFE7F5FFE9F8FFEEE6FAD7CAE1B5AEC6969FB48EFAFFF9FAFFFFF3F8
        F7FDFFFEFBFFF9FFFFF9FFEFFFF3EAFFFDFFF7FAFFECF9FFF3F4FFEFF8FFEEF5
        FFE7F8FFE6F8FFEDF8FDFEF8FAFFFDFCFFF0F0F6FFFEFFF7F7F7}
    end
  end
  object rgExportarA: TRadioGroup
    Left = 9
    Top = 86
    Width = 130
    Height = 68
    Caption = ' Exportar a '
    ItemIndex = 0
    Items.Strings = (
      'Excel'
      'CSV')
    TabOrder = 1
    OnClick = rgExportarAClick
  end
  object BitSalir: TBitBtn
    Left = 513
    Top = 434
    Width = 112
    Height = 39
    Hint = 'Salir'
    Caption = '&Salir'
    TabOrder = 14
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
  object dbgAExcel: TDBGrid
    Left = 495
    Top = 15
    Width = 97
    Height = 33
    DataSource = DM1.dsReporte1
    TabOrder = 15
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object gbruta: TGroupBox
    Left = 147
    Top = 10
    Width = 241
    Height = 144
    Caption = ' Seleccione la ruta '
    TabOrder = 2
    object stvarc: TShellTreeView
      Left = 5
      Top = 14
      Width = 229
      Height = 122
      ObjectTypes = [otFolders]
      Root = 'rfDesktop'
      UseShellImages = True
      AutoRefresh = False
      Indent = 19
      ParentColor = False
      RightClickSelect = True
      ShowRoot = False
      TabOrder = 0
    end
  end
end