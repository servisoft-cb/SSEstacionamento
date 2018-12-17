object dmMarca: TdmMarca
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 62
  Top = 310
  Height = 340
  Width = 424
  object sdsMarca: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM MARCA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 32
    object sdsMarcaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsMarcaNOME: TStringField
      FieldName = 'NOME'
    end
  end
  object dspMarca: TDataSetProvider
    DataSet = sdsMarca
    OnUpdateError = dspMarcaUpdateError
    Left = 128
    Top = 32
  end
  object cdsMarca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMarca'
    Left = 192
    Top = 32
    object cdsMarcaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsMarcaNOME: TStringField
      FieldName = 'NOME'
    end
  end
  object dsMarca: TDataSource
    DataSet = cdsMarca
    Left = 264
    Top = 32
  end
end
