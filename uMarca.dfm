object fMarca: TfMarca
  Left = 184
  Top = 197
  Width = 731
  Height = 381
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'fMarca'
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
    Height = 343
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
      end
      object Panel2: TPanel
        Left = 0
        Top = 38
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
        Top = 303
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
        Top = 70
        Width = 711
        Height = 233
        Align = alClient
        Ctl3D = True
        DataSource = dmMarca.dsMarca
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
        ColCount = 3
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
        Height = 285
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
        Height = 285
        Align = alClient
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label1: TLabel
          Left = 64
          Top = 12
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nome:'
        end
        object Label8: TLabel
          Left = 617
          Top = 13
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = 'ID:'
        end
        object DBEdit1: TDBEdit
          Left = 101
          Top = 4
          Width = 380
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = True
          DataField = 'NOME'
          DataSource = dmMarca.dsMarca
          ParentCtl3D = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 632
          Top = 5
          Width = 73
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          DataField = 'ID'
          DataSource = dmMarca.dsMarca
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
end
