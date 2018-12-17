object fLavagemR1: TfLavagemR1
  Left = 397
  Top = 132
  Width = 427
  Height = 563
  Caption = 'fLavagemR1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 8
    Top = 16
    Width = 378
    Height = 378
    DataSource = dmLavagem.dsLavagem
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 3.000000000000000000
    Margins.TopMargin = 1.000000000000000000
    Margins.RightMargin = 2.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 100.000000000000000000
    PageSetup.PaperHeight = 100.000000000000000000
    object RLSubDetail1: TRLSubDetail
      Left = 11
      Top = 4
      Width = 359
      Height = 131
      DataSource = dmLavagem.dsLavagem
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 359
        Height = 57
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 20
          Top = 14
          Width = 35
          Height = 12
          Alignment = taRightJustify
          Caption = 'Cliente:'
        end
        object RLLabel2: TRLLabel
          Left = 0
          Top = 42
          Width = 50
          Height = 15
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdAll
          Caption = 'DATA'
        end
        object RLLabel3: TRLLabel
          Left = 49
          Top = 42
          Width = 50
          Height = 15
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdAll
          Caption = 'PLACA'
        end
        object RLLabel4: TRLLabel
          Left = 98
          Top = 42
          Width = 50
          Height = 15
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdAll
          Caption = 'VALOR'
        end
        object LCliente: TRLLabel
          Left = 55
          Top = 14
          Width = 265
          Height = 12
          AutoSize = False
        end
        object RLLabel7: TRLLabel
          Left = 4
          Top = 26
          Width = 51
          Height = 12
          Alignment = taRightJustify
          Caption = 'Per'#237'odo de:'
        end
        object LDataI: TRLLabel
          Left = 55
          Top = 26
          Width = 31
          Height = 12
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 2
          Top = 1
          Width = 29
          Height = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 147
          Top = 42
          Width = 214
          Height = 15
          AutoSize = False
          Borders.Sides = sdAll
          Caption = 'MARCA'
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 57
        Width = 359
        Height = 26
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.Style = bsVertical
        object RLDBText1: TRLDBText
          Left = 0
          Top = 1
          Width = 50
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DATA'
          DataSource = dmLavagem.dsLavagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 49
          Top = 1
          Width = 50
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'PLACA'
          DataSource = dmLavagem.dsLavagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 98
          Top = 1
          Width = 50
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = dmLavagem.dsLavagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 0
          Top = 12
          Width = 353
          Height = 12
          AutoSize = False
          DataField = 'PRODUTONOME'
          DataSource = dmLavagem.dsLavagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText5: TRLDBText
          Left = 147
          Top = 1
          Width = 206
          Height = 12
          AutoSize = False
          DataField = 'MARCANOME'
          DataSource = dmLavagem.dsLavagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 83
        Width = 359
        Height = 22
        BandType = btColumnFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object LTotal: TRLLabel
          Left = 90
          Top = 2
          Width = 58
          Height = 12
          Alignment = taRightJustify
          Caption = 'R$ 0,00'
        end
      end
    end
  end
end
