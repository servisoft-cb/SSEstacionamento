object dmLavagem: TdmLavagem
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 404
  Top = 140
  Height = 574
  Width = 424
  object sdsLavagem: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.*, P.NOME PRODUTONOME, PES.NOME CLIENTENOME, M.NOME MAR' +
      'CANOME'#13#10'FROM LAVAGEM_MOV L'#13#10'INNER JOIN PRODUTO P ON (L.ID_PRODUT' +
      'O=P.ID)'#13#10'LEFT JOIN PESSOA PES ON (L.ID_PESSOA = PES.ID)'#13#10'LEFT JO' +
      'IN MARCA M ON (L.ID_MARCA = M.ID)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 32
    object sdsLavagemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsLavagemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsLavagemPLACA: TStringField
      FieldName = 'PLACA'
      Size = 7
    end
    object sdsLavagemDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsLavagemVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object sdsLavagemID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object sdsLavagemPAGO: TStringField
      FieldName = 'PAGO'
      FixedChar = True
      Size = 1
    end
    object sdsLavagemDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object sdsLavagemID_CONDUTOR: TIntegerField
      FieldName = 'ID_CONDUTOR'
    end
    object sdsLavagemDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object sdsLavagemPRODUTONOME: TStringField
      FieldName = 'PRODUTONOME'
      ProviderFlags = []
      Size = 60
    end
    object sdsLavagemCLIENTENOME: TStringField
      FieldName = 'CLIENTENOME'
      ProviderFlags = []
      Size = 60
    end
    object sdsLavagemID_MARCA: TIntegerField
      FieldName = 'ID_MARCA'
    end
    object sdsLavagemMARCANOME: TStringField
      FieldName = 'MARCANOME'
      ProviderFlags = []
    end
  end
  object dspLavagem: TDataSetProvider
    DataSet = sdsLavagem
    OnUpdateError = dspLavagemUpdateError
    Left = 128
    Top = 32
  end
  object cdsLavagem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLavagem'
    OnNewRecord = cdsLavagemNewRecord
    Left = 192
    Top = 32
    object cdsLavagemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLavagemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsLavagemPLACA: TStringField
      FieldName = 'PLACA'
      Size = 7
    end
    object cdsLavagemDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsLavagemVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
    object cdsLavagemID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsLavagemPAGO: TStringField
      FieldName = 'PAGO'
      FixedChar = True
      Size = 1
    end
    object cdsLavagemDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object cdsLavagemID_CONDUTOR: TIntegerField
      FieldName = 'ID_CONDUTOR'
    end
    object cdsLavagemDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object cdsLavagemPRODUTONOME: TStringField
      FieldName = 'PRODUTONOME'
      ProviderFlags = []
      Size = 60
    end
    object cdsLavagemCLIENTENOME: TStringField
      FieldName = 'CLIENTENOME'
      ProviderFlags = []
      Size = 60
    end
    object cdsLavagemID_MARCA: TIntegerField
      FieldName = 'ID_MARCA'
    end
    object cdsLavagemMARCANOME: TStringField
      FieldName = 'MARCANOME'
      ProviderFlags = []
    end
  end
  object dsLavagem: TDataSource
    DataSet = cdsLavagem
    Left = 264
    Top = 32
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PRODUTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 88
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
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    OnUpdateError = dspLavagemUpdateError
    Left = 128
    Top = 88
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    OnNewRecord = cdsLavagemNewRecord
    Left = 192
    Top = 88
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
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 264
    Top = 88
  end
  object qValor: TSQLQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'P1'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT VALOR'
      'FROM PRODUTO'
      'WHERE ID = :P1')
    Left = 56
    Top = 152
  end
  object sdsParametro: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT * FROM PARAMETRO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 216
    object sdsParametroID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsParametroID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
    end
    object sdsParametroID_CONVENIO_PADRAO: TIntegerField
      FieldName = 'ID_CONVENIO_PADRAO'
    end
    object sdsParametroUSA_CONVENIO: TStringField
      FieldName = 'USA_CONVENIO'
      FixedChar = True
      Size = 1
    end
    object sdsParametroUSA_AGENDA_POR_FUNC: TStringField
      FieldName = 'USA_AGENDA_POR_FUNC'
      FixedChar = True
      Size = 1
    end
  end
  object dspParametro: TDataSetProvider
    DataSet = sdsParametro
    Left = 128
    Top = 216
  end
  object cdsParametro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParametro'
    Left = 192
    Top = 216
    object cdsParametroID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsParametroID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
    end
    object cdsParametroID_CONVENIO_PADRAO: TIntegerField
      FieldName = 'ID_CONVENIO_PADRAO'
    end
    object cdsParametroUSA_CONVENIO: TStringField
      FieldName = 'USA_CONVENIO'
      FixedChar = True
      Size = 1
    end
    object cdsParametroUSA_AGENDA_POR_FUNC: TStringField
      FieldName = 'USA_AGENDA_POR_FUNC'
      FixedChar = True
      Size = 1
    end
  end
  object dsParametro: TDataSource
    DataSet = cdsParametro
    Left = 256
    Top = 216
  end
  object sdsFinanceiro: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT * FROM FINANCEIRO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 280
    object sdsFinanceiroID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsFinanceiroID_LAVAGEM: TIntegerField
      FieldName = 'ID_LAVAGEM'
    end
    object sdsFinanceiroID_ESTACIONAMENTO_DIA: TIntegerField
      FieldName = 'ID_ESTACIONAMENTO_DIA'
    end
    object sdsFinanceiroID_ESTACIONAMENTO_MENSAL: TIntegerField
      FieldName = 'ID_ESTACIONAMENTO_MENSAL'
    end
    object sdsFinanceiroID_DUPLICATA: TIntegerField
      FieldName = 'ID_DUPLICATA'
    end
    object sdsFinanceiroHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 200
    end
    object sdsFinanceiroDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsFinanceiroVLR_MOVIMENTO: TFloatField
      FieldName = 'VLR_MOVIMENTO'
    end
    object sdsFinanceiroID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object sdsFinanceiroID_CONVENIO: TIntegerField
      FieldName = 'ID_CONVENIO'
    end
    object sdsFinanceiroTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      FixedChar = True
      Size = 1
    end
    object sdsFinanceiroVLR_ENTRADA: TFloatField
      FieldName = 'VLR_ENTRADA'
    end
    object sdsFinanceiroVLR_SAIDA: TFloatField
      FieldName = 'VLR_SAIDA'
    end
  end
  object dspFinanceiro: TDataSetProvider
    DataSet = sdsFinanceiro
    Left = 128
    Top = 280
  end
  object cdsFinanceiro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFinanceiro'
    Left = 192
    Top = 280
    object cdsFinanceiroID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFinanceiroID_LAVAGEM: TIntegerField
      FieldName = 'ID_LAVAGEM'
    end
    object cdsFinanceiroID_ESTACIONAMENTO_DIA: TIntegerField
      FieldName = 'ID_ESTACIONAMENTO_DIA'
    end
    object cdsFinanceiroID_ESTACIONAMENTO_MENSAL: TIntegerField
      FieldName = 'ID_ESTACIONAMENTO_MENSAL'
    end
    object cdsFinanceiroID_DUPLICATA: TIntegerField
      FieldName = 'ID_DUPLICATA'
    end
    object cdsFinanceiroHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 200
    end
    object cdsFinanceiroDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsFinanceiroVLR_MOVIMENTO: TFloatField
      FieldName = 'VLR_MOVIMENTO'
    end
    object cdsFinanceiroID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
    end
    object cdsFinanceiroID_CONVENIO: TIntegerField
      FieldName = 'ID_CONVENIO'
    end
    object cdsFinanceiroTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      FixedChar = True
      Size = 1
    end
    object cdsFinanceiroVLR_ENTRADA: TFloatField
      FieldName = 'VLR_ENTRADA'
    end
    object cdsFinanceiroVLR_SAIDA: TFloatField
      FieldName = 'VLR_SAIDA'
    end
  end
  object dsFinanceiro: TDataSource
    DataSet = cdsFinanceiro
    Left = 256
    Top = 280
  end
  object sdsPessoa: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID, NOME FROM PESSOA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 344
    object sdsPessoaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dspPessoa: TDataSetProvider
    DataSet = sdsPessoa
    Left = 128
    Top = 344
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoa'
    Left = 192
    Top = 344
    object cdsPessoaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 256
    Top = 344
  end
  object qSoma: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT SUM(VALOR) SOMA'
      'FROM LAVAGEM_MOV'
      'WHERE 1 = 1 ')
    SQLConnection = dmDatabase.sqlConexao
    Left = 128
    Top = 152
    object qSomaSOMA: TFloatField
      FieldName = 'SOMA'
    end
  end
  object sdsMarca: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID, NOME FROM MARCA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 400
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
    Left = 128
    Top = 400
  end
  object cdsMarca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMarca'
    Left = 192
    Top = 400
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
    Left = 256
    Top = 400
  end
end
