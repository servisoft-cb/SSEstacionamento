object fLavagem: TfLavagem
  Left = 298
  Top = 149
  Width = 731
  Height = 483
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'fLavagem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 715
    Height = 445
    ActivePage = TS_Consulta
    ActivePageDefault = TS_Consulta
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 19
    object TS_Consulta: TRzTabSheet
      Caption = 'Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 711
        Height = 77
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label6: TLabel
          Left = 36
          Top = 60
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Placa:'
        end
        object Label3: TLabel
          Left = 51
          Top = 38
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'De:'
        end
        object Label4: TLabel
          Left = 257
          Top = 38
          Width = 24
          Height = 13
          Caption = 'At'#233':'
        end
        object Label9: TLabel
          Left = 28
          Top = 16
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente:'
        end
        object Label10: TLabel
          Left = 226
          Top = 60
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Situa'#231#227'o:'
        end
        object btnConsultar: TBitBtn
          Left = 430
          Top = 48
          Width = 75
          Height = 25
          Caption = 'Consultar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = btnConsultarClick
        end
        object Edit4: TEdit
          Left = 75
          Top = 52
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
          OnKeyDown = Edit4KeyDown
        end
        object DateEdit1: TDateEdit
          Left = 75
          Top = 30
          Width = 90
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          StartOfWeek = Sun
          TabOrder = 1
        end
        object DateEdit2: TDateEdit
          Left = 283
          Top = 30
          Width = 90
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          StartOfWeek = Sun
          TabOrder = 2
        end
        object RxDBLookupCombo2: TRxDBLookupCombo
          Left = 75
          Top = 8
          Width = 351
          Height = 21
          DropDownCount = 8
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = dmLavagem.dsPessoa
          TabOrder = 0
          OnEnter = RxDBLookupCombo2Enter
        end
        object ComboBox1: TComboBox
          Left = 283
          Top = 52
          Width = 145
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 4
          Text = 'N'#227'o pagos'
          Items.Strings = (
            'N'#227'o pagos'
            'Pagos'
            'Todos')
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 77
        Width = 711
        Height = 32
        Align = alTop
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label11: TLabel
          Left = 587
          Top = 15
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total:'
        end
        object btnInserir: TBitBtn
          Left = 4
          Top = 5
          Width = 75
          Height = 25
          Caption = '&Inserir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnInserirClick
        end
        object btnExcluir: TBitBtn
          Left = 79
          Top = 5
          Width = 75
          Height = 25
          Caption = 'E&xcluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TabStop = False
          OnClick = btnExcluirClick
        end
        object BitBtn1: TBitBtn
          Left = 303
          Top = 5
          Width = 122
          Height = 25
          Caption = '&Pagar selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TabStop = False
          OnClick = BitBtn1Click
        end
        object Edit1: TEdit
          Left = 616
          Top = 7
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
          OnKeyDown = Edit4KeyDown
        end
        object BitBtn2: TBitBtn
          Left = 154
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Im&primir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          TabStop = False
          OnClick = BitBtn2Click
        end
      end
      object StaticText1: TStaticText
        Left = 0
        Top = 405
        Width = 711
        Height = 17
        Align = alBottom
        BorderStyle = sbsSunken
        Caption = 'Duplo clique para consultar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 109
        Width = 711
        Height = 296
        Align = alClient
        Ctl3D = True
        DataSource = dmLavagem.dsLavagem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = SMDBGrid1DblClick
        OnTitleClick = SMDBGrid1TitleClick
        Flat = False
        BandsFont.Charset = DEFAULT_CHARSET
        BandsFont.Color = clWindowText
        BandsFont.Height = -11
        BandsFont.Name = 'MS Sans Serif'
        BandsFont.Style = []
        Groupings = <>
        GridStyle.Style = gsCustom
        GridStyle.OddColor = clWindow
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        OnGetCellParams = SMDBGrid1GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 23
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 8
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PLACA'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARCANOME'
            Title.Caption = 'MARCA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTENOME'
            Title.Caption = 'CLIENTE'
            Width = 263
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUTONOME'
            Title.Caption = 'PRODUTO'
            Width = 268
            Visible = True
          end>
      end
    end
    object TS_Cadastro: TRzTabSheet
      Caption = 'Cadastro'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 711
        Height = 35
        Align = alTop
        Color = 8404992
        TabOrder = 0
        object btnConfirmar: TBitBtn
          Left = 79
          Top = 5
          Width = 75
          Height = 25
          Caption = '&Confirmar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnConfirmarClick
        end
        object btnCancelar: TBitBtn
          Left = 154
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Ca&ncelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnCancelarClick
        end
        object btnAlterar: TBitBtn
          Left = 4
          Top = 5
          Width = 75
          Height = 25
          Caption = '&Alterar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnAlterarClick
        end
      end
      object RZPageControlDados: TRzPageControl
        Left = 0
        Top = 35
        Width = 711
        Height = 387
        Align = alClient
        BackgroundColor = clSilver
        BoldCurrentTab = True
        FlatColor = clGray
        ParentBackgroundColor = False
        TabColors.Shadow = clSilver
        TabOrder = 1
        FixedDimension = 0
      end
      object pnlCadastro: TPanel
        Left = 0
        Top = 35
        Width = 711
        Height = 387
        Align = alClient
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        DesignSize = (
          711
          387)
        object Label1: TLabel
          Left = 73
          Top = 20
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Placa:'
        end
        object Label8: TLabel
          Left = 617
          Top = 20
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = 'ID:'
        end
        object Label17: TLabel
          Left = 77
          Top = 44
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data:'
        end
        object Label7: TLabel
          Left = 63
          Top = 100
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Produto:'
        end
        object SpeedButton2: TSpeedButton
          Left = 458
          Top = 90
          Width = 23
          Height = 22
          Hint = 'Atualiza pesquisa de produtos'
          Glyph.Data = {
            E6040000424DE604000000000000360000002800000014000000140000000100
            180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFDF9FAFBF2
            F1F1EEEEEEEBEBEBE9EAECE4E8E9E2E4E7E3E4E6E4E6E7E6E9EAEBECF0F2F4F7
            F2F6F5F7F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF1EBE9D0C5BADBDEE2C9CC
            CEC1C3C4B6B0AEB1A397AA876AA6764FA87044AC754BB39174C7BCB3D5D6DBE5
            E7E8EFEFEEFDFDFDFFFFFFFFFFFFFFFFFFEBE5DC9F6B46DBDBDEC9C8CAB9A796
            B68861C18451D29861CD9460CE945CCC9258C58346B26E36C09E83E3E1E3EFF1
            F2FBFBFBFFFFFFFFFFFFFFFFFFF5F0EEBC8A63C3A48CC3A58CC68F61CF9B68C8
            9565CA9361CD9364C18951BF864FC18853C6884FB8763BCEB3A1F7FCFFFEFEFE
            FFFFFFFFFFFFFFFFFFF7F3EFBD916CD5B493D6AD8BD8AA84CB9668CB9664BA85
            53BA8A61C6A281BF926DBB814EC08F67B47437BE8C5EEDE6DFFFFFFFFFFFFFFF
            FFFFFFFFFFF6F2EEB98F69E3C2A3DDB99AE0BF9CCA9C72BD9473E2CFC0E5D9D0
            F1EEECEFE7E3E1CAB1DCC3AACFB193A96B33E4D1BFFFFFFFFFFFFFFFFFFFFFFF
            FFF7F2EFBA9069DFBB9BDEBD9DC79F7BD8C4B1F1EDEAFFFFFFFFFFFFFFFFFFFF
            FFFFF7F3EEEAD6C4FEFEFEB58560D7BDA9FFFFFFFFFFFFFFFFFFFFFFFFF7F3EF
            BD946CDFBC9CD9B996D8B694C8AE97F6F6F6FFFFFFFEFFFFFFFEFFFFFFFFFBF9
            F7F4EBE5FFFFFFC1A287D9C5B5FFFFFFFFFFFFFFFFFFFFFFFFF5EEEAB07E53E0
            BD9FDCB793E2BE9FCE9E73D0B499FCFAF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFE2D6CBEBE3DCFFFFFFFFFFFFFFFFFFFFFFFFF9F9F5BEA994C2A797BFA1
            92BB9E8CB99C89B39983F7F5F2FFFFFFAB7957BB967BB79676B89778B89777B9
            997EECE3DCFFFFFFFFFFFFFFFFFFFFFFFFF5F0E8CAB09BFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFC9B7A7D3A679DBB088D9AA84DCAD87C7986EE9DB
            CDFFFFFFFFFFFFFFFFFFFFFFFFE6D8CEB67B50E8D0BCDFC7B7F3EFEBFFFFFFFE
            FFFEFEFFFEFFFFFFFFFFFFBA9F8CD6A57DCF9B6ECD9B6CBF9164E9DDD2FFFFFF
            FFFFFFFFFFFFFFFFFFEDE4DCA86B3BBF865CC29776EAE2DBFFFFFFFFFFFFFFFF
            FFFDFFFFDED0C4D4B8A3C79B71D1A478CD9E70BF9265E8DDD0FFFFFFFFFFFFFF
            FFFFFFFFFFF9F5F2BD8F6DBC8A639D5F2DB58968E0D2C8E7DCD3DAC8B8DECBBA
            C09A77D4A882D0A479D2A478D3A77CBF8E64E8DBCFFFFFFFFFFFFFFFFFFFFFFF
            FFF7F5F2CAAB93E5CCB7CCA788C29471CDAC8ED9BDA3CAA98AD7B094E8CEB2DB
            BEA1DDB995C99D76C0946FC39168EADACFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF
            E1D2C6C5A284F6E3D0F0DCC9E6CEB7E6CCB5E5CBB6E7CCB5E5CCB2E3C2A4C299
            78CFB9A6D2BEADB58257E7D5C6FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFDFEFEDA
            C9BBBA9675D4B193EDD1B8EED3BCECCEB6D1AF8EBE916DC2A386EEE6E2F9F8F6
            FFFFFFBD9A80DBC9BAFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFDFEFEF6F2
            EFD9C8BDBFA38CC3A388B99D83CFBEACFAF6F4F7F4F2FFFFFFFFFFFFFFFFFFF8
            F7F5F8F7F4FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFF
            FFFEFEFFFFFFFFFFFFFF}
          Margin = 0
        end
        object Label2: TLabel
          Left = 72
          Top = 148
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Pre'#231'o:'
        end
        object Label5: TLabel
          Left = 68
          Top = 76
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente:'
        end
        object SpeedButton1: TSpeedButton
          Left = 458
          Top = 66
          Width = 23
          Height = 22
          Hint = 'Atualiza pesquisa de produtos'
          Glyph.Data = {
            E6040000424DE604000000000000360000002800000014000000140000000100
            180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFDF9FAFBF2
            F1F1EEEEEEEBEBEBE9EAECE4E8E9E2E4E7E3E4E6E4E6E7E6E9EAEBECF0F2F4F7
            F2F6F5F7F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF1EBE9D0C5BADBDEE2C9CC
            CEC1C3C4B6B0AEB1A397AA876AA6764FA87044AC754BB39174C7BCB3D5D6DBE5
            E7E8EFEFEEFDFDFDFFFFFFFFFFFFFFFFFFEBE5DC9F6B46DBDBDEC9C8CAB9A796
            B68861C18451D29861CD9460CE945CCC9258C58346B26E36C09E83E3E1E3EFF1
            F2FBFBFBFFFFFFFFFFFFFFFFFFF5F0EEBC8A63C3A48CC3A58CC68F61CF9B68C8
            9565CA9361CD9364C18951BF864FC18853C6884FB8763BCEB3A1F7FCFFFEFEFE
            FFFFFFFFFFFFFFFFFFF7F3EFBD916CD5B493D6AD8BD8AA84CB9668CB9664BA85
            53BA8A61C6A281BF926DBB814EC08F67B47437BE8C5EEDE6DFFFFFFFFFFFFFFF
            FFFFFFFFFFF6F2EEB98F69E3C2A3DDB99AE0BF9CCA9C72BD9473E2CFC0E5D9D0
            F1EEECEFE7E3E1CAB1DCC3AACFB193A96B33E4D1BFFFFFFFFFFFFFFFFFFFFFFF
            FFF7F2EFBA9069DFBB9BDEBD9DC79F7BD8C4B1F1EDEAFFFFFFFFFFFFFFFFFFFF
            FFFFF7F3EEEAD6C4FEFEFEB58560D7BDA9FFFFFFFFFFFFFFFFFFFFFFFFF7F3EF
            BD946CDFBC9CD9B996D8B694C8AE97F6F6F6FFFFFFFEFFFFFFFEFFFFFFFFFBF9
            F7F4EBE5FFFFFFC1A287D9C5B5FFFFFFFFFFFFFFFFFFFFFFFFF5EEEAB07E53E0
            BD9FDCB793E2BE9FCE9E73D0B499FCFAF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFE2D6CBEBE3DCFFFFFFFFFFFFFFFFFFFFFFFFF9F9F5BEA994C2A797BFA1
            92BB9E8CB99C89B39983F7F5F2FFFFFFAB7957BB967BB79676B89778B89777B9
            997EECE3DCFFFFFFFFFFFFFFFFFFFFFFFFF5F0E8CAB09BFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFC9B7A7D3A679DBB088D9AA84DCAD87C7986EE9DB
            CDFFFFFFFFFFFFFFFFFFFFFFFFE6D8CEB67B50E8D0BCDFC7B7F3EFEBFFFFFFFE
            FFFEFEFFFEFFFFFFFFFFFFBA9F8CD6A57DCF9B6ECD9B6CBF9164E9DDD2FFFFFF
            FFFFFFFFFFFFFFFFFFEDE4DCA86B3BBF865CC29776EAE2DBFFFFFFFFFFFFFFFF
            FFFDFFFFDED0C4D4B8A3C79B71D1A478CD9E70BF9265E8DDD0FFFFFFFFFFFFFF
            FFFFFFFFFFF9F5F2BD8F6DBC8A639D5F2DB58968E0D2C8E7DCD3DAC8B8DECBBA
            C09A77D4A882D0A479D2A478D3A77CBF8E64E8DBCFFFFFFFFFFFFFFFFFFFFFFF
            FFF7F5F2CAAB93E5CCB7CCA788C29471CDAC8ED9BDA3CAA98AD7B094E8CEB2DB
            BEA1DDB995C99D76C0946FC39168EADACFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF
            E1D2C6C5A284F6E3D0F0DCC9E6CEB7E6CCB5E5CBB6E7CCB5E5CCB2E3C2A4C299
            78CFB9A6D2BEADB58257E7D5C6FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFDFEFEDA
            C9BBBA9675D4B193EDD1B8EED3BCECCEB6D1AF8EBE916DC2A386EEE6E2F9F8F6
            FFFFFFBD9A80DBC9BAFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFDFEFEF6F2
            EFD9C8BDBFA38CC3A388B99D83CFBEACFAF6F4F7F4F2FFFFFFFFFFFFFFFFFFF8
            F7F5F8F7F4FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFF
            FFFEFEFFFFFFFFFFFFFF}
          Margin = 0
        end
        object Label12: TLabel
          Left = 70
          Top = 124
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Marca:'
        end
        object DBEdit1: TDBEdit
          Left = 109
          Top = 12
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = True
          DataField = 'PLACA'
          DataSource = dmLavagem.dsLavagem
          ParentCtl3D = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 632
          Top = 12
          Width = 73
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          DataField = 'ID'
          DataSource = dmLavagem.dsLavagem
          ReadOnly = True
          TabOrder = 6
        end
        object DBDateEdit1: TDBDateEdit
          Left = 109
          Top = 36
          Width = 90
          Height = 21
          DataField = 'DATA'
          DataSource = dmLavagem.dsLavagem
          NumGlyphs = 2
          TabOrder = 1
          StartOfWeek = Sun
        end
        object RxDBLookupCombo4: TRxDBLookupCombo
          Left = 109
          Top = 92
          Width = 349
          Height = 21
          DropDownCount = 15
          DataField = 'ID_PRODUTO'
          DataSource = dmLavagem.dsLavagem
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = dmLavagem.dsProduto
          TabOrder = 3
          OnChange = RxDBLookupCombo4Change
        end
        object DBEdit3: TDBEdit
          Left = 109
          Top = 140
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = True
          DataField = 'VALOR'
          DataSource = dmLavagem.dsLavagem
          ParentCtl3D = False
          TabOrder = 5
        end
        object BtnPagar: TBitBtn
          Left = 423
          Top = 273
          Width = 280
          Height = 108
          Anchors = [akRight, akBottom]
          Caption = 'Pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = BtnPagarClick
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 109
          Top = 68
          Width = 349
          Height = 21
          DropDownCount = 15
          DataField = 'ID_PESSOA'
          DataSource = dmLavagem.dsLavagem
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = dmLavagem.dsPessoa
          TabOrder = 2
          OnEnter = RxDBLookupCombo1Enter
        end
        object RxDBLookupCombo3: TRxDBLookupCombo
          Left = 109
          Top = 116
          Width = 349
          Height = 21
          DropDownCount = 15
          DataField = 'ID_MARCA'
          DataSource = dmLavagem.dsLavagem
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = dmLavagem.dsMarca
          TabOrder = 4
          OnEnter = RxDBLookupCombo3Enter
        end
      end
    end
  end
end
