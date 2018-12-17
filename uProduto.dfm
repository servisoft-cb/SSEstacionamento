object fProduto: TfProduto
  Left = 494
  Top = 177
  Width = 731
  Height = 483
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'fProduto'
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
        Height = 57
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label6: TLabel
          Left = 12
          Top = 16
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Placa:'
        end
        object Label4: TLabel
          Left = 19
          Top = 38
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo:'
        end
        object btnConsultar: TBitBtn
          Left = 390
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
          TabOrder = 2
          OnClick = btnConsultarClick
        end
        object Edit4: TEdit
          Left = 51
          Top = 8
          Width = 335
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnKeyDown = Edit4KeyDown
        end
        object ComboBox1: TComboBox
          Left = 51
          Top = 30
          Width = 222
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = 'PRODUTO / SERVI'#199'O'
          Items.Strings = (
            'PRODUTO / SERVI'#199'O'
            'MATERIAL'
            'AMBOS')
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 57
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
        Top = 89
        Width = 711
        Height = 316
        Align = alClient
        Ctl3D = True
        DataSource = dmProduto.dsProduto
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
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 4
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 398
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Width = 32
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
      object pnlCadastro: TPanel
        Left = 0
        Top = 35
        Width = 711
        Height = 94
        Align = alTop
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label1: TLabel
          Left = 40
          Top = 20
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nome:'
        end
        object Label8: TLabel
          Left = 585
          Top = 20
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = 'ID:'
        end
        object Label2: TLabel
          Left = 40
          Top = 44
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Pre'#231'o:'
        end
        object Label3: TLabel
          Left = 47
          Top = 68
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo:'
        end
        object DBEdit1: TDBEdit
          Left = 77
          Top = 12
          Width = 484
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = True
          DataField = 'NOME'
          DataSource = dmProduto.dsProduto
          ParentCtl3D = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 600
          Top = 12
          Width = 73
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          DataField = 'ID'
          DataSource = dmProduto.dsProduto
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 77
          Top = 36
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = True
          DataField = 'VALOR'
          DataSource = dmProduto.dsProduto
          ParentCtl3D = False
          TabOrder = 1
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 77
          Top = 60
          Width = 204
          Height = 21
          DataField = 'TIPO'
          DataSource = dmProduto.dsProduto
          DropDownCount = 4
          EnableValues = False
          ItemHeight = 13
          Items.Strings = (
            'PRODUTO / SERVI'#199'O'
            'MATERIAL'
            'AMBOS')
          TabOrder = 2
          Values.Strings = (
            'P'
            'M'
            'A')
        end
      end
      object pnlItem: TPanel
        Left = 0
        Top = 129
        Width = 711
        Height = 32
        Align = alTop
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label5: TLabel
          Left = 160
          Top = 8
          Width = 368
          Height = 18
          Caption = 'MATERIAIS UTILIZADOS NO PRODUTO / SERVI'#199'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object btnInserirItem: TBitBtn
          Left = 4
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Inserir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnInserirItemClick
        end
        object btnExcluirItem: TBitBtn
          Left = 79
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Excluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TabStop = False
          OnClick = btnExcluirItemClick
        end
      end
      object SMDBGrid2: TSMDBGrid
        Left = 0
        Top = 161
        Width = 711
        Height = 261
        Align = alClient
        Ctl3D = True
        DataSource = dmProduto.dsProdutoItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
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
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 4
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'PRODUTONOME'
            Title.Caption = 'MATERIAL'
            Width = 305
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADENOME'
            Title.Caption = 'UNIDADE'
            Width = 125
            Visible = True
          end>
      end
    end
  end
end
