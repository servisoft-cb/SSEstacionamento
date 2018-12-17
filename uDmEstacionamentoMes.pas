unit uDmEstacionamentoMes;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmEstacionamentoMes = class(TDataModule)
    sdsEstacMes: TSQLDataSet;
    dspEstacMes: TDataSetProvider;
    cdsEstacMes: TClientDataSet;
    dsEstacMes: TDataSource;
    sdsPessoa: TSQLDataSet;
    dspPessoa: TDataSetProvider;
    cdsPessoa: TClientDataSet;
    dsPessoa: TDataSource;
    sdsPessoaID: TIntegerField;
    sdsPessoaNOME: TStringField;
    sdsPessoaENDERECO: TStringField;
    sdsPessoaCOMPLEMENTO_END: TStringField;
    sdsPessoaNUM_END: TStringField;
    sdsPessoaBAIRRO: TStringField;
    sdsPessoaID_CIDADE: TIntegerField;
    sdsPessoaCIDADE: TStringField;
    sdsPessoaUF: TStringField;
    sdsPessoaCEP: TStringField;
    sdsPessoaDDDFONE1: TIntegerField;
    sdsPessoaTELEFONE1: TStringField;
    sdsPessoaDDDFONE2: TIntegerField;
    sdsPessoaTELEFONE2: TStringField;
    sdsPessoaPESSOA: TStringField;
    sdsPessoaCNPJ_CPF: TStringField;
    sdsPessoaINSCR_EST: TStringField;
    sdsPessoaRG: TStringField;
    sdsPessoaINATIVO: TStringField;
    sdsPessoaEMAIL: TStringField;
    sdsPessoaCONTATO: TStringField;
    sdsPessoaFANTASIA: TStringField;
    cdsPessoaID: TIntegerField;
    cdsPessoaNOME: TStringField;
    cdsPessoaENDERECO: TStringField;
    cdsPessoaCOMPLEMENTO_END: TStringField;
    cdsPessoaNUM_END: TStringField;
    cdsPessoaBAIRRO: TStringField;
    cdsPessoaID_CIDADE: TIntegerField;
    cdsPessoaCIDADE: TStringField;
    cdsPessoaUF: TStringField;
    cdsPessoaCEP: TStringField;
    cdsPessoaDDDFONE1: TIntegerField;
    cdsPessoaTELEFONE1: TStringField;
    cdsPessoaDDDFONE2: TIntegerField;
    cdsPessoaTELEFONE2: TStringField;
    cdsPessoaPESSOA: TStringField;
    cdsPessoaCNPJ_CPF: TStringField;
    cdsPessoaINSCR_EST: TStringField;
    cdsPessoaRG: TStringField;
    cdsPessoaINATIVO: TStringField;
    cdsPessoaEMAIL: TStringField;
    cdsPessoaCONTATO: TStringField;
    cdsPessoaFANTASIA: TStringField;
    sdsEstacMesID: TIntegerField;
    sdsEstacMesID_VEICULO: TIntegerField;
    sdsEstacMesDT_INICIO_CONTRATO: TDateField;
    sdsEstacMesDT_FINAL_CONTRATO: TDateField;
    sdsEstacMesHR_INICIO_ESTACIONAMENTO: TTimeField;
    sdsEstacMesHR_SAIDA_ESTACIONAMENTO: TFloatField;
    sdsEstacMesID_BOX: TIntegerField;
    sdsEstacMesVLR_ESTACIONAMENTO: TFloatField;
    sdsEstacMesDIA_COBRANCA: TIntegerField;
    sdsEstacMesID_PESSOA: TIntegerField;
    cdsEstacMesID: TIntegerField;
    cdsEstacMesID_VEICULO: TIntegerField;
    cdsEstacMesDT_INICIO_CONTRATO: TDateField;
    cdsEstacMesDT_FINAL_CONTRATO: TDateField;
    cdsEstacMesHR_INICIO_ESTACIONAMENTO: TTimeField;
    cdsEstacMesHR_SAIDA_ESTACIONAMENTO: TFloatField;
    cdsEstacMesID_BOX: TIntegerField;
    cdsEstacMesVLR_ESTACIONAMENTO: TFloatField;
    cdsEstacMesDIA_COBRANCA: TIntegerField;
    cdsEstacMesID_PESSOA: TIntegerField;
    sdsEstacMesPESSOA_NOME: TStringField;
    cdsEstacMesPESSOA_NOME: TStringField;
    sdsEstacMesPLACA: TStringField;
    cdsEstacMesPLACA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspEstacMesUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }

  public
    { Public declarations }
    vMsgPessoa : String;
    ctCommand : String;

    procedure prc_Localizar(ID : Integer); //-1 = Inclusão
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
    procedure prc_GravarFin;
  end;

var
  dmEstacionamentoMes: TdmEstacionamentoMes;

implementation

uses uDmDatabase;

{$R *.dfm}

{ TDMCadPais }

procedure TdmEstacionamentoMes.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsEstacMes.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('ESTAC_MES',0);

  cdsEstacMes.Insert;
  cdsEstacMesID.AsInteger := vAux;
end;

procedure TdmEstacionamentoMes.prc_Excluir;
begin
  if not(cdsEstacMes.Active) or (cdsEstacMes.IsEmpty) then
    exit;
  cdsEstacMes.Delete;
  cdsEstacMes.ApplyUpdates(0);
end;

procedure TdmEstacionamentoMes.prc_Gravar;
begin
  vMsgPessoa := '';
  if trim(cdsEstacMesDT_INICIO_CONTRATO.AsString) = '' then
    vMsgPessoa := vMsgPessoa + #13 + '*** Data de início do contrato não informada!';
  if trim(cdsEstacMesID_PESSOA.AsString) = '' then
    vMsgPessoa := vMsgPessoa + #13 + '*** Pessoa não informada!';
  if trim(cdsEstacMesDIA_COBRANCA.AsString) = '' then
    vMsgPessoa := vMsgPessoa + #13 + '*** Dia de cobrança não informado!';
  if trim(cdsEstacMesVLR_ESTACIONAMENTO.AsString) = '' then
    vMsgPessoa := vMsgPessoa + #13 + '*** Valor do estacionamento não informado!';
  if vMsgPessoa <> '' then
    exit;
  cdsEstacMes.Post;
  cdsEstacMes.ApplyUpdates(0);
end;

procedure TdmEstacionamentoMes.prc_Localizar(ID : Integer);
begin
  cdsEstacMes.Close;
  sdsEstacMes.CommandText := ctCommand;
  if ID <> 0 then
    sdsEstacMes.CommandText := sdsEstacMes.CommandText + ' WHERE EM.ID = ' + IntToStr(ID);
  cdsEstacMes.Open;
end;

procedure TdmEstacionamentoMes.DataModuleCreate(Sender: TObject);
begin
  ctCommand := sdsEstacMes.CommandText;
end;

procedure TdmEstacionamentoMes.dspEstacMesUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TdmEstacionamentoMes.prc_GravarFin;
begin
end;

end.
