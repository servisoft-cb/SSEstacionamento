object dmEstacionamentoMes: TdmEstacionamentoMes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 293
  Top = 147
  Height = 477
  Width = 424
  object sdsEstacMes: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT EM.*, P.NOME PESSOA_NOME'#13#10'FROM ESTACIONAMENTO_MENSAL EM'#13#10 +
      'INNER JOIN PESSOA P ON (EM.ID_PESSOA = P.ID)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 32
    object sdsEstacMesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsEstacMesID_VEICULO: TIntegerField
      FieldName = 'ID_VEICULO'
    end
    object sdsEstacMesDT_INICIO_CONTRATO: TDateField
      FieldName = 'DT_INICIO_CONTRATO'
    end
    object sdsEstacMesDT_FINAL_CONTRATO: TDateField
      FieldName = 'DT_FINAL_CONTRATO'
    end
    object sdsEstacMesHR_INICIO_ESTACIONAMENTO: TTimeField
      FieldName = 'HR_INICIO_ESTACIONAMENTO'
    end
    object sdsEstacMesHR_SAIDA_ESTACIONAMENTO: TFloatField
      FieldName = 'HR_SAIDA_ESTACIONAMENTO'
    end
    object sdsEstacMesID_BOX: TIntegerField
      FieldName = 'ID_BOX'
    end
    object sdsEstacMesVLR_ESTACIONAMENTO: TFloatField
      FieldName = 'VLR_ESTACIONAMENTO'
    end
    object sdsEstacMesDIA_COBRANCA: TIntegerField
      FieldName = 'DIA_COBRANCA'
    end
    object sdsEstacMesID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object sdsEstacMesPESSOA_NOME: TStringField
      FieldName = 'PESSOA_NOME'
      ProviderFlags = []
      Size = 60
    end
    object sdsEstacMesPLACA: TStringField
      FieldName = 'PLACA'
      Size = 7
    end
  end
  object dspEstacMes: TDataSetProvider
    DataSet = sdsEstacMes
    OnUpdateError = dspEstacMesUpdateError
    Left = 128
    Top = 32
  end
  object cdsEstacMes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstacMes'
    Left = 192
    Top = 32
    object cdsEstacMesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsEstacMesID_VEICULO: TIntegerField
      FieldName = 'ID_VEICULO'
    end
    object cdsEstacMesDT_INICIO_CONTRATO: TDateField
      FieldName = 'DT_INICIO_CONTRATO'
    end
    object cdsEstacMesDT_FINAL_CONTRATO: TDateField
      FieldName = 'DT_FINAL_CONTRATO'
    end
    object cdsEstacMesHR_INICIO_ESTACIONAMENTO: TTimeField
      FieldName = 'HR_INICIO_ESTACIONAMENTO'
    end
    object cdsEstacMesHR_SAIDA_ESTACIONAMENTO: TFloatField
      FieldName = 'HR_SAIDA_ESTACIONAMENTO'
    end
    object cdsEstacMesID_BOX: TIntegerField
      FieldName = 'ID_BOX'
    end
    object cdsEstacMesVLR_ESTACIONAMENTO: TFloatField
      FieldName = 'VLR_ESTACIONAMENTO'
      DisplayFormat = '0.00'
    end
    object cdsEstacMesDIA_COBRANCA: TIntegerField
      FieldName = 'DIA_COBRANCA'
    end
    object cdsEstacMesID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsEstacMesPESSOA_NOME: TStringField
      FieldName = 'PESSOA_NOME'
      ProviderFlags = []
      Size = 60
    end
    object cdsEstacMesPLACA: TStringField
      FieldName = 'PLACA'
      Size = 7
    end
  end
  object dsEstacMes: TDataSource
    DataSet = cdsEstacMes
    Left = 264
    Top = 32
  end
  object sdsPessoa: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PESSOA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.sqlConexao
    Left = 56
    Top = 88
    object sdsPessoaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object sdsPessoaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object sdsPessoaCOMPLEMENTO_END: TStringField
      FieldName = 'COMPLEMENTO_END'
      Size = 60
    end
    object sdsPessoaNUM_END: TStringField
      FieldName = 'NUM_END'
    end
    object sdsPessoaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object sdsPessoaID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
    end
    object sdsPessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object sdsPessoaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sdsPessoaCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object sdsPessoaDDDFONE1: TIntegerField
      FieldName = 'DDDFONE1'
    end
    object sdsPessoaTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Size = 15
    end
    object sdsPessoaDDDFONE2: TIntegerField
      FieldName = 'DDDFONE2'
    end
    object sdsPessoaTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      Size = 15
    end
    object sdsPessoaPESSOA: TStringField
      FieldName = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object sdsPessoaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object sdsPessoaINSCR_EST: TStringField
      FieldName = 'INSCR_EST'
      Size = 18
    end
    object sdsPessoaRG: TStringField
      FieldName = 'RG'
      Size = 10
    end
    object sdsPessoaINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object sdsPessoaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 250
    end
    object sdsPessoaCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object sdsPessoaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 40
    end
  end
  object dspPessoa: TDataSetProvider
    DataSet = sdsPessoa
    OnUpdateError = dspEstacMesUpdateError
    Left = 128
    Top = 88
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoa'
    Left = 192
    Top = 88
    object cdsPessoaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsPessoaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cdsPessoaCOMPLEMENTO_END: TStringField
      FieldName = 'COMPLEMENTO_END'
      Size = 60
    end
    object cdsPessoaNUM_END: TStringField
      FieldName = 'NUM_END'
    end
    object cdsPessoaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsPessoaID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
    end
    object cdsPessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object cdsPessoaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object cdsPessoaCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsPessoaDDDFONE1: TIntegerField
      FieldName = 'DDDFONE1'
    end
    object cdsPessoaTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Size = 15
    end
    object cdsPessoaDDDFONE2: TIntegerField
      FieldName = 'DDDFONE2'
    end
    object cdsPessoaTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      Size = 15
    end
    object cdsPessoaPESSOA: TStringField
      FieldName = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object cdsPessoaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object cdsPessoaINSCR_EST: TStringField
      FieldName = 'INSCR_EST'
      Size = 18
    end
    object cdsPessoaRG: TStringField
      FieldName = 'RG'
      Size = 10
    end
    object cdsPessoaINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsPessoaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 250
    end
    object cdsPessoaCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object cdsPessoaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 40
    end
  end
  object dsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 264
    Top = 88
  end
end
