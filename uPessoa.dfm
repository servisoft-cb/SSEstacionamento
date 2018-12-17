object fPessoa: TfPessoa
  Left = 118
  Top = 78
  Width = 877
  Height = 594
  Caption = 'fPessoa'
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
    Width = 861
    Height = 556
    ActivePage = TS_Cadastro
    ActivePageDefault = TS_Consulta
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabIndex = 1
    TabOrder = 0
    OnChange = RzPageControl1Change
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
        Width = 857
        Height = 38
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label6: TLabel
          Left = 6
          Top = 16
          Width = 37
          Height = 13
          Caption = 'Nome:'
        end
        object btnConsultar: TBitBtn
          Left = 381
          Top = 7
          Width = 75
          Height = 25
          Caption = 'Consultar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnConsultarClick
        end
        object Edit4: TEdit
          Left = 42
          Top = 8
          Width = 335
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnKeyDown = Edit4KeyDown
        end
        object CheckBox1: TCheckBox
          Left = 464
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Exibir inativos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 38
        Width = 857
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
      end
      object StaticText1: TStaticText
        Left = 0
        Top = 516
        Width = 857
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
        Top = 70
        Width = 857
        Height = 446
        Align = alClient
        Ctl3D = True
        DataSource = dmPessoa.dsPessoa
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        OnGetCellParams = SMDBGrid1GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 14
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 207
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FANTASIA'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DDDFONE1'
            Title.Caption = 'DDD'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE1'
            Title.Caption = 'FONE'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE2'
            Title.Caption = 'FONE 2'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_NASCIMENTO'
            Title.Caption = 'NASCIMENTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Title.Caption = 'ENDERE'#199'O'
            Width = 197
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_END'
            Title.Caption = 'N'#218'MERO'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPLEMENTO_END'
            Title.Caption = 'COMPLEMENTO'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Width = 139
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ_CPF'
            Width = 120
            Visible = True
          end>
      end
    end
    object TS_Cadastro: TRzTabSheet
      Caption = 'Cadastro'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 857
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
        Width = 857
        Height = 498
        ActivePage = TS_Pessoa_Dados
        ActivePageDefault = TS_Pessoa_Dados
        Align = alClient
        BackgroundColor = clSilver
        BoldCurrentTab = True
        FlatColor = clGray
        ParentBackgroundColor = False
        TabColors.Shadow = clSilver
        TabIndex = 0
        TabOrder = 1
        FixedDimension = 19
        object TS_Pessoa_Dados: TRzTabSheet
          Caption = 'Dados'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          object Label1: TLabel
            Left = 64
            Top = 65
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
          end
          object Label4: TLabel
            Left = 498
            Top = 17
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'UF:'
          end
          object Label2: TLabel
            Left = 46
            Top = 113
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Endere'#231'o:'
          end
          object Label8: TLabel
            Left = 713
            Top = 13
            Width = 14
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID:'
          end
          object Label3: TLabel
            Left = 532
            Top = 161
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cep:'
          end
          object Label5: TLabel
            Left = 28
            Top = 137
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Complemento:'
          end
          object Label7: TLabel
            Left = 65
            Top = 161
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bairro:'
          end
          object Label9: TLabel
            Left = 268
            Top = 17
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'CNPJ/CPF:'
          end
          object Label10: TLabel
            Left = 57
            Top = 17
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pessoa:'
          end
          object Label11: TLabel
            Left = 59
            Top = 185
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cidade:'
          end
          object Label13: TLabel
            Left = 67
            Top = 233
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Email:'
          end
          object lblInscEstadual: TLabel
            Left = 28
            Top = 41
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Insc.Estadual:'
          end
          object Label16: TLabel
            Left = 18
            Top = 209
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fone (DDD/N'#186'):'
          end
          object Label17: TLabel
            Left = 250
            Top = 209
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fone (DDD/N'#186'):'
          end
          object Label19: TLabel
            Left = 539
            Top = 113
            Width = 15
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186':'
          end
          object Label20: TLabel
            Left = 52
            Top = 89
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fantasia:'
          end
          object lblRG: TLabel
            Left = 304
            Top = 41
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'RG:'
          end
          object SpeedButton4: TSpeedButton
            Left = 362
            Top = 175
            Width = 23
            Height = 22
            Hint = 'Atualiza tabela Cidade'
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
            OnClick = SpeedButton4Click
          end
          object Label12: TLabel
            Left = 19
            Top = 257
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dt. Nascimento:'
          end
          object StaticText2: TStaticText
            Left = 0
            Top = 458
            Width = 853
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
            TabOrder = 19
          end
          object DBEdit7: TDBEdit
            Left = 98
            Top = 57
            Width = 380
            Height = 21
            CharCase = ecUpperCase
            Ctl3D = True
            DataField = 'NOME'
            DataSource = dmPessoa.dsPessoa
            ParentCtl3D = False
            TabOrder = 5
          end
          object RxDBLookupCombo1: TRxDBLookupCombo
            Left = 516
            Top = 9
            Width = 52
            Height = 21
            DropDownCount = 8
            DataField = 'UF'
            DataSource = dmPessoa.dsPessoa
            LookupField = 'UF'
            LookupDisplay = 'UF'
            LookupSource = dmPessoa.dsUF
            TabOrder = 2
          end
          object DBEdit1: TDBEdit
            Left = 98
            Top = 105
            Width = 380
            Height = 21
            CharCase = ecUpperCase
            Ctl3D = True
            DataField = 'ENDERECO'
            DataSource = dmPessoa.dsPessoa
            ParentCtl3D = False
            TabOrder = 7
          end
          object DBEdit4: TDBEdit
            Left = 728
            Top = 5
            Width = 73
            Height = 21
            TabStop = False
            CharCase = ecUpperCase
            Color = clSilver
            DataField = 'ID'
            DataSource = dmPessoa.dsPessoa
            ReadOnly = True
            TabOrder = 20
          end
          object DBEdit2: TDBEdit
            Left = 555
            Top = 105
            Width = 89
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NUM_END'
            DataSource = dmPessoa.dsPessoa
            TabOrder = 8
          end
          object DBEdit3: TDBEdit
            Left = 98
            Top = 129
            Width = 380
            Height = 21
            CharCase = ecUpperCase
            Ctl3D = True
            DataField = 'COMPLEMENTO_END'
            DataSource = dmPessoa.dsPessoa
            ParentCtl3D = False
            TabOrder = 9
          end
          object DBEdit5: TDBEdit
            Left = 98
            Top = 153
            Width = 380
            Height = 21
            CharCase = ecUpperCase
            Ctl3D = True
            DataField = 'BAIRRO'
            DataSource = dmPessoa.dsPessoa
            ParentCtl3D = False
            TabOrder = 10
          end
          object DBEdit6: TDBEdit
            Left = 325
            Top = 9
            Width = 154
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CNPJ_CPF'
            DataSource = dmPessoa.dsPessoa
            TabOrder = 1
            OnEnter = DBEdit6Enter
            OnExit = DBEdit6Exit
          end
          object RxDBComboBox1: TRxDBComboBox
            Left = 98
            Top = 9
            Width = 93
            Height = 21
            Style = csDropDownList
            DataField = 'PESSOA'
            DataSource = dmPessoa.dsPessoa
            DropDownCount = 2
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'Jur'#237'dica'
              'F'#237'sica')
            TabOrder = 0
            Values.Strings = (
              'J'
              'F')
            OnExit = RxDBComboBox1Exit
          end
          object RxDBLookupCombo2: TRxDBLookupCombo
            Left = 98
            Top = 177
            Width = 265
            Height = 21
            DropDownCount = 8
            DropDownWidth = 500
            DataField = 'ID_CIDADE'
            DataSource = dmPessoa.dsPessoa
            LookupField = 'ID'
            LookupDisplay = 'NOME;UF'
            LookupSource = dmPessoa.dsCidade
            TabOrder = 12
            OnExit = RxDBLookupCombo2Exit
          end
          object DBEdit8: TDBEdit
            Left = 98
            Top = 225
            Width = 460
            Height = 21
            DataField = 'EMAIL'
            DataSource = dmPessoa.dsPessoa
            TabOrder = 17
          end
          object dbeInscEstadual: TDBEdit
            Left = 98
            Top = 33
            Width = 124
            Height = 21
            CharCase = ecUpperCase
            DataField = 'INSCR_EST'
            DataSource = dmPessoa.dsPessoa
            TabOrder = 3
          end
          object DBEdit11: TDBEdit
            Left = 98
            Top = 201
            Width = 41
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DDDFONE1'
            DataSource = dmPessoa.dsPessoa
            TabOrder = 13
          end
          object DBEdit12: TDBEdit
            Left = 141
            Top = 201
            Width = 105
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TELEFONE1'
            DataSource = dmPessoa.dsPessoa
            TabOrder = 14
          end
          object DBEdit13: TDBEdit
            Left = 330
            Top = 201
            Width = 41
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DDDFONE2'
            DataSource = dmPessoa.dsPessoa
            TabOrder = 15
          end
          object DBEdit14: TDBEdit
            Left = 373
            Top = 201
            Width = 105
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TELEFONE2'
            DataSource = dmPessoa.dsPessoa
            TabOrder = 16
          end
          object DBEdit17: TDBEdit
            Left = 555
            Top = 153
            Width = 89
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CEP'
            DataSource = dmPessoa.dsPessoa
            TabOrder = 11
          end
          object DBEdit18: TDBEdit
            Left = 98
            Top = 81
            Width = 380
            Height = 21
            CharCase = ecUpperCase
            Ctl3D = True
            DataField = 'FANTASIA'
            DataSource = dmPessoa.dsPessoa
            ParentCtl3D = False
            TabOrder = 6
          end
          object dbeRG: TDBEdit
            Left = 325
            Top = 33
            Width = 108
            Height = 21
            CharCase = ecUpperCase
            DataField = 'RG'
            TabOrder = 4
          end
          object DBCheckBox1: TDBCheckBox
            Left = 697
            Top = 104
            Width = 97
            Height = 17
            Caption = 'Inativo'
            Color = clAqua
            DataField = 'INATIVO'
            DataSource = dmPessoa.dsPessoa
            ParentColor = False
            TabOrder = 21
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBDateEdit1: TDBDateEdit
            Left = 98
            Top = 249
            Width = 90
            Height = 21
            DataField = 'DT_NASCIMENTO'
            DataSource = dmPessoa.dsPessoa
            NumGlyphs = 2
            TabOrder = 18
          end
        end
      end
    end
  end
  object UCControls1: TUCControls
    GroupName = 'Pessoa'
    UserControl = dmUserControl.UserControl1
    NotAllowed = naDisabled
    Left = 569
    Top = 25
  end
end
