object dmProduto: TdmProduto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 412
  Top = 148
  Height = 340
  Width = 424
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PRODUTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 32
    object sdsProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object sdsProdutoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object sdsProdutoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    OnUpdateError = dspProdutoUpdateError
    Left = 128
    Top = 32
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 192
    Top = 32
    object cdsProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsProdutoVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
    object cdsProdutoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosdsProdutoItem: TDataSetField
      FieldName = 'sdsProdutoItem'
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 264
    Top = 32
  end
  object sdsUnidade: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM UNIDADE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 80
    object sdsUnidadeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsUnidadeNOME: TStringField
      FieldName = 'NOME'
      Size = 10
    end
  end
  object dspUnidade: TDataSetProvider
    DataSet = sdsUnidade
    OnUpdateError = dspProdutoUpdateError
    Left = 128
    Top = 80
  end
  object cdsUnidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidade'
    Left = 192
    Top = 80
    object cdsUnidadeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsUnidadeNOME: TStringField
      FieldName = 'NOME'
      Size = 10
    end
  end
  object dsUnidade: TDataSource
    DataSet = cdsUnidade
    Left = 264
    Top = 80
  end
  object sdsProdutoItem: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PI.*, U.NOME UNIDADENOME, P.NOME PRODUTONOME'#13#10'FROM PRODUT' +
      'O_ITEM PI'#13#10'INNER JOIN UNIDADE U ON (PI.UNIDADE_ID = U.ID)'#13#10'INNER' +
      ' JOIN PRODUTO P ON (PI.PRODUTO_ID = P.ID)'#13#10'WHERE PI.ID = :ID'
    DataSource = dsmProduto
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 136
    object sdsProdutoItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsProdutoItemPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      Required = True
    end
    object sdsProdutoItemQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsProdutoItemUNIDADE_ID: TIntegerField
      FieldName = 'UNIDADE_ID'
    end
    object sdsProdutoItemUNIDADENOME: TStringField
      FieldName = 'UNIDADENOME'
      ProviderFlags = [pfInWhere]
      Size = 10
    end
    object sdsProdutoItemPRODUTONOME: TStringField
      FieldName = 'PRODUTONOME'
      ProviderFlags = [pfInWhere]
      Size = 60
    end
  end
  object dsmProduto: TDataSource
    DataSet = sdsProduto
    Left = 328
    Top = 32
  end
  object cdsProdutoItem: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProdutosdsProdutoItem
    Params = <>
    Left = 192
    Top = 136
    object cdsProdutoItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProdutoItemPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      Required = True
    end
    object cdsProdutoItemQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsProdutoItemUNIDADE_ID: TIntegerField
      FieldName = 'UNIDADE_ID'
    end
    object cdsProdutoItemUNIDADENOME: TStringField
      FieldName = 'UNIDADENOME'
      ProviderFlags = []
      Size = 10
    end
    object cdsProdutoItemPRODUTONOME: TStringField
      FieldName = 'PRODUTONOME'
      ProviderFlags = []
      Size = 60
    end
  end
  object dsProdutoItem: TDataSource
    DataSet = cdsProdutoItem
    Left = 264
    Top = 136
  end
  object sdsMaterial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PRODUTO'#13#10'WHERE TIPO IN ('#39'M'#39','#39'A'#39')'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 192
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dspMaterial: TDataSetProvider
    DataSet = sdsMaterial
    OnUpdateError = dspProdutoUpdateError
    Left = 128
    Top = 192
  end
  object cdsMaterial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaterial'
    Left = 192
    Top = 192
    object IntegerField2: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsMaterial: TDataSource
    DataSet = cdsMaterial
    Left = 264
    Top = 192
  end
end
