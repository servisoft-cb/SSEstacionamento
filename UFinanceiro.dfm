object fFinanceiro: TfFinanceiro
  Left = 385
  Top = 159
  Width = 800
  Height = 517
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'fFinanceiro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 784
    Height = 479
    ActivePage = TS_Consulta
    ActivePageDefault = TS_Consulta
    Align = alClient
    BackgroundColor = clSilver
    BoldCurrentTab = True
    FlatColor = clGray
    ParentBackgroundColor = False
    TabColors.Shadow = clSilver
    TabIndex = 0
    TabOrder = 0
    OnChange = RzPageControl1Change
    FixedDimension = 19
    object TS_Consulta: TRzTabSheet
      Caption = 'Consulta'
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 132
        Width = 780
        Height = 307
        Align = alClient
        Ctl3D = True
        DataSource = dmFinanceiro.dsFinanceiro_Consulta
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
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
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 27
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 7
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_ES'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CONTA'
            Width = 143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_MOVIMENTO'
            Title.Caption = 'VALOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HISTORICO'
            Title.Caption = 'HIST'#211'RICO'
            Width = 349
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 100
        Width = 780
        Height = 32
        Align = alTop
        Color = clSilver
        TabOrder = 1
        object btnInserir: TBitBtn
          Left = 4
          Top = 4
          Width = 73
          Height = 25
          Caption = '&Inserir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnInserirClick
        end
        object btnExcluir: TBitBtn
          Left = 77
          Top = 4
          Width = 75
          Height = 25
          Caption = 'E&xcluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TabStop = False
          OnClick = btnExcluirClick
        end
        object btnImprimir: TBitBtn
          Left = 568
          Top = 4
          Width = 117
          Height = 25
          Caption = 'Im&primir Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TabStop = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
            8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
            8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
            8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
        end
      end
      object StaticText1: TStaticText
        Left = 0
        Top = 439
        Width = 780
        Height = 17
        Align = alBottom
        BorderStyle = sbsSunken
        Caption = 'Duplo clique para consultar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16384
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 780
        Height = 100
        Align = alTop
        TabOrder = 0
        object Label18: TLabel
          Left = 13
          Top = 35
          Width = 120
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt.Mov.Financeiro Inicial:'
        end
        object Label26: TLabel
          Left = 241
          Top = 35
          Width = 25
          Height = 13
          Caption = 'Final:'
        end
        object Label3: TLabel
          Left = 102
          Top = 11
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Conta:'
        end
        object Label4: TLabel
          Left = 109
          Top = 57
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo:'
        end
        object btnConsultar: TBitBtn
          Left = 369
          Top = 23
          Width = 75
          Height = 25
          Caption = 'Consultar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnConsultarClick
        end
        object DateEdit1: TDateEdit
          Left = 135
          Top = 27
          Width = 100
          Height = 21
          NumGlyphs = 2
          StartOfWeek = Sun
          TabOrder = 1
        end
        object DateEdit2: TDateEdit
          Left = 269
          Top = 27
          Width = 100
          Height = 21
          NumGlyphs = 2
          StartOfWeek = Sun
          TabOrder = 2
        end
        object RxDBLookupCombo2: TRxDBLookupCombo
          Left = 135
          Top = 5
          Width = 234
          Height = 21
          DropDownCount = 8
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = dmFinanceiro.dsContas
          TabOrder = 0
        end
        object RzGroupBox1: TRzGroupBox
          Left = 600
          Top = 5
          Width = 169
          Height = 87
          BorderColor = clNavy
          BorderInner = fsButtonUp
          BorderOuter = fsBump
          Caption = ' Valores Totais  do Per'#237'odo '
          Color = clSilver
          Ctl3D = True
          FlatColor = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          VisualStyle = vsGradient
          object Label8: TLabel
            Left = 8
            Top = 16
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Entrada:'
          end
          object Label10: TLabel
            Left = 16
            Top = 33
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Sa'#237'da:'
          end
          object Label11: TLabel
            Left = 18
            Top = 51
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo:'
          end
          object lblEntrada: TLabel
            Left = 56
            Top = 16
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
          end
          object lblSaida: TLabel
            Left = 56
            Top = 32
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
          end
          object lblSaldo: TLabel
            Left = 56
            Top = 48
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
          end
          object btnRecalcular: TBitBtn
            Left = 97
            Top = 63
            Width = 69
            Height = 21
            Caption = 'Recalcular'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnRecalcularClick
          end
        end
        object ComboBox1: TComboBox
          Left = 135
          Top = 49
          Width = 234
          Height = 21
          ItemHeight = 13
          ItemIndex = 2
          TabOrder = 5
          Text = 'Ambos'
          Items.Strings = (
            'Entrada'
            'Sa'#237'da'
            'Ambos')
        end
      end
    end
    object TS_Cadastro: TRzTabSheet
      Caption = 'Cadastro'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 780
        Height = 35
        Align = alTop
        Color = 8404992
        TabOrder = 1
        object btnConfirmar: TBitBtn
          Left = 80
          Top = 5
          Width = 71
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
          Left = 155
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
          Left = 5
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Alterar'
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
      object pnlCadastro: TPanel
        Left = 0
        Top = 35
        Width = 780
        Height = 421
        Align = alClient
        Enabled = False
        TabOrder = 0
        object Label1: TLabel
          Left = 56
          Top = 48
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = 'Entrada/Sa'#237'da:'
        end
        object Label2: TLabel
          Left = 86
          Top = 144
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hist'#243'rico:'
        end
        object Label17: TLabel
          Left = 49
          Top = 96
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data Movimento:'
        end
        object Label5: TLabel
          Left = 103
          Top = 120
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor:'
        end
        object Label7: TLabel
          Left = 99
          Top = 72
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Conta:'
        end
        object SpeedButton2: TSpeedButton
          Left = 480
          Top = 62
          Width = 23
          Height = 22
          Hint = 'Atualiza tabela de Bancos'
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
          OnClick = SpeedButton2Click
        end
        object DBEdit7: TDBEdit
          Left = 132
          Top = 136
          Width = 642
          Height = 21
          CharCase = ecUpperCase
          DataField = 'HISTORICO'
          DataSource = dmFinanceiro.dsFinanceiro
          TabOrder = 4
        end
        object pnlNota: TPanel
          Left = 1
          Top = 1
          Width = 778
          Height = 31
          Align = alTop
          Color = clSilver
          Enabled = False
          TabOrder = 5
          object Label23: TLabel
            Left = 662
            Top = 14
            Width = 14
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID:'
          end
          object DBEdit8: TDBEdit
            Left = 677
            Top = 6
            Width = 97
            Height = 21
            TabStop = False
            CharCase = ecUpperCase
            Color = clSilver
            DataField = 'ID'
            DataSource = dmFinanceiro.dsFinanceiro
            ReadOnly = True
            TabOrder = 0
          end
        end
        object RxDBComboBox11: TRxDBComboBox
          Left = 132
          Top = 40
          Width = 121
          Height = 21
          Style = csDropDownList
          DataField = 'TIPO_ES'
          DataSource = dmFinanceiro.dsFinanceiro
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Entrada'
            'Sa'#237'da')
          TabOrder = 0
          Values.Strings = (
            'E'
            'S')
        end
        object DBDateEdit1: TDBDateEdit
          Left = 132
          Top = 88
          Width = 121
          Height = 21
          DataField = 'DATA'
          DataSource = dmFinanceiro.dsFinanceiro
          NumGlyphs = 2
          TabOrder = 2
          StartOfWeek = Sun
        end
        object DBEdit4: TDBEdit
          Left = 132
          Top = 112
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VLR_MOVIMENTO'
          DataSource = dmFinanceiro.dsFinanceiro
          TabOrder = 3
        end
        object RxDBLookupCombo4: TRxDBLookupCombo
          Left = 132
          Top = 64
          Width = 349
          Height = 21
          DropDownCount = 8
          DataField = 'ID_CONTA'
          DataSource = dmFinanceiro.dsFinanceiro
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = dmFinanceiro.dsContas
          TabOrder = 1
        end
      end
    end
  end
  object UCControls1: TUCControls
    GroupName = 'Mov. Financeiro'
    UserControl = dmUserControl.UserControl1
    NotAllowed = naDisabled
    Left = 529
    Top = 36
  end
end
