unit uDmLavagem;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmLavagem = class(TDataModule)
    sdsLavagem: TSQLDataSet;
    dspLavagem: TDataSetProvider;
    cdsLavagem: TClientDataSet;
    dsLavagem: TDataSource;
    sdsLavagemID: TIntegerField;
    sdsLavagemID_PRODUTO: TIntegerField;
    sdsLavagemPLACA: TStringField;
    sdsLavagemDATA: TDateField;
    sdsLavagemVALOR: TFloatField;
    sdsLavagemID_PESSOA: TIntegerField;
    sdsLavagemPAGO: TStringField;
    sdsLavagemDT_PAGAMENTO: TDateField;
    sdsLavagemID_CONDUTOR: TIntegerField;
    sdsLavagemDT_VENCIMENTO: TDateField;
    cdsLavagemID: TIntegerField;
    cdsLavagemID_PRODUTO: TIntegerField;
    cdsLavagemPLACA: TStringField;
    cdsLavagemDATA: TDateField;
    cdsLavagemVALOR: TFloatField;
    cdsLavagemID_PESSOA: TIntegerField;
    cdsLavagemPAGO: TStringField;
    cdsLavagemDT_PAGAMENTO: TDateField;
    cdsLavagemID_CONDUTOR: TIntegerField;
    cdsLavagemDT_VENCIMENTO: TDateField;
    sdsProduto: TSQLDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    cdsProdutoID: TIntegerField;
    cdsProdutoNOME: TStringField;
    cdsProdutoVALOR: TFloatField;
    sdsProdutoID: TIntegerField;
    sdsProdutoNOME: TStringField;
    sdsProdutoVALOR: TFloatField;
    qValor: TSQLQuery;
    sdsParametro: TSQLDataSet;
    sdsParametroID: TIntegerField;
    sdsParametroID_CONTA_CAIXA: TIntegerField;
    sdsParametroID_CONVENIO_PADRAO: TIntegerField;
    sdsParametroUSA_CONVENIO: TStringField;
    sdsParametroUSA_AGENDA_POR_FUNC: TStringField;
    dspParametro: TDataSetProvider;
    cdsParametro: TClientDataSet;
    cdsParametroID: TIntegerField;
    cdsParametroID_CONTA_CAIXA: TIntegerField;
    cdsParametroID_CONVENIO_PADRAO: TIntegerField;
    cdsParametroUSA_CONVENIO: TStringField;
    cdsParametroUSA_AGENDA_POR_FUNC: TStringField;
    dsParametro: TDataSource;
    sdsFinanceiro: TSQLDataSet;
    sdsFinanceiroID: TIntegerField;
    sdsFinanceiroID_LAVAGEM: TIntegerField;
    sdsFinanceiroID_ESTACIONAMENTO_DIA: TIntegerField;
    sdsFinanceiroID_ESTACIONAMENTO_MENSAL: TIntegerField;
    sdsFinanceiroID_DUPLICATA: TIntegerField;
    sdsFinanceiroHISTORICO: TStringField;
    sdsFinanceiroDATA: TDateField;
    sdsFinanceiroVLR_MOVIMENTO: TFloatField;
    sdsFinanceiroID_CONTA: TIntegerField;
    sdsFinanceiroID_CONVENIO: TIntegerField;
    sdsFinanceiroTIPO_ES: TStringField;
    sdsFinanceiroVLR_ENTRADA: TFloatField;
    sdsFinanceiroVLR_SAIDA: TFloatField;
    dspFinanceiro: TDataSetProvider;
    cdsFinanceiro: TClientDataSet;
    cdsFinanceiroID: TIntegerField;
    cdsFinanceiroID_LAVAGEM: TIntegerField;
    cdsFinanceiroID_ESTACIONAMENTO_DIA: TIntegerField;
    cdsFinanceiroID_ESTACIONAMENTO_MENSAL: TIntegerField;
    cdsFinanceiroID_DUPLICATA: TIntegerField;
    cdsFinanceiroHISTORICO: TStringField;
    cdsFinanceiroDATA: TDateField;
    cdsFinanceiroVLR_MOVIMENTO: TFloatField;
    cdsFinanceiroID_CONTA: TIntegerField;
    cdsFinanceiroID_CONVENIO: TIntegerField;
    cdsFinanceiroTIPO_ES: TStringField;
    cdsFinanceiroVLR_ENTRADA: TFloatField;
    cdsFinanceiroVLR_SAIDA: TFloatField;
    dsFinanceiro: TDataSource;
    sdsLavagemPRODUTONOME: TStringField;
    cdsLavagemPRODUTONOME: TStringField;
    sdsPessoa: TSQLDataSet;
    dspPessoa: TDataSetProvider;
    cdsPessoa: TClientDataSet;
    dsPessoa: TDataSource;
    sdsPessoaID: TIntegerField;
    sdsPessoaNOME: TStringField;
    cdsPessoaID: TIntegerField;
    cdsPessoaNOME: TStringField;
    sdsLavagemCLIENTENOME: TStringField;
    cdsLavagemCLIENTENOME: TStringField;
    qSoma: TSQLQuery;
    qSomaSOMA: TFloatField;
    sdsLavagemID_MARCA: TIntegerField;
    cdsLavagemID_MARCA: TIntegerField;
    sdsMarca: TSQLDataSet;
    dspMarca: TDataSetProvider;
    cdsMarca: TClientDataSet;
    dsMarca: TDataSource;
    sdsMarcaID: TIntegerField;
    sdsMarcaNOME: TStringField;
    cdsMarcaID: TIntegerField;
    cdsMarcaNOME: TStringField;
    sdsLavagemMARCANOME: TStringField;
    cdsLavagemMARCANOME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsLavagemNewRecord(DataSet: TDataSet);
    procedure dspLavagemUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }

  public
    { Public declarations }
    vMsgLavagem: String;
    ctCommand: String;
    ctSoma: String;
    
    procedure prc_Localizar(ID: Integer); //-1 = Inclusão
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
    procedure prc_GravarFin;
  end;

var
  dmLavagem: TdmLavagem;

implementation

uses uDmDatabase;

{$R *.dfm}

{ TDMCadPais }

procedure TdmLavagem.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsLavagem.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('LAVAGEM',0);

  cdsLavagem.Insert;
  cdsLavagemID.AsInteger  := vAux;
  cdsLavagemPAGO.AsString := 'N';
end;

procedure TdmLavagem.prc_Excluir;
begin
  if not(cdsLavagem.Active) or (cdsLavagem.IsEmpty) then
    exit;
  cdsLavagem.Delete;
  cdsLavagem.ApplyUpdates(0);
end;

procedure TdmLavagem.prc_Gravar;
begin
  vMsgLavagem := '';
  if trim(cdsLavagemPLACA.AsString) = '' then
    vMsgLavagem := vMsgLavagem + #13 + '*** Placa não informada!';
  if trim(cdsLavagemID_PRODUTO.AsString) = '' then
    vMsgLavagem := vMsgLavagem + #13 + '*** Produto não informado!';
  if trim(cdsLavagemVALOR.AsString) = '' then
    vMsgLavagem := vMsgLavagem + #13 + '*** Preço não informado!';
  if trim(cdsLavagemID_PESSOA.AsString) = '' then
    vMsgLavagem := vMsgLavagem + #13 + '*** Cliente não informado!';
  if vMsgLavagem <> '' then
    exit;
  cdsLavagem.Post;
  cdsLavagem.ApplyUpdates(0);
end;

procedure TdmLavagem.prc_Localizar(ID: Integer);
begin
  cdsLavagem.Close;
  sdsLavagem.CommandText := ctCommand;
  if ID <> 0 then
    sdsLavagem.CommandText := sdsLavagem.CommandText + ' WHERE L.ID = ' + IntToStr(ID);
  cdsLavagem.Open;
end;

procedure TdmLavagem.DataModuleCreate(Sender: TObject);
begin
  ctCommand := sdsLavagem.CommandText;
  ctSoma    := qSoma.Sql.Text;
end;

procedure TdmLavagem.cdsLavagemNewRecord(DataSet: TDataSet);
begin
  cdsLavagemDATA.AsDateTime := Date;
end;

procedure TdmLavagem.dspLavagemUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TdmLavagem.prc_GravarFin;
begin
  cdsParametro.Open;

  cdsFinanceiro.Insert;
  cdsFinanceiroID.AsInteger := dmDatabase.ProximaSequencia('FINANCEIRO',1);
  cdsFinanceiroID_LAVAGEM.AsInteger     := cdsLavagemID.AsInteger;
  cdsFinanceiroID_CONTA.AsInteger       := cdsParametroID_CONTA_CAIXA.AsInteger;
  cdsFinanceiroHISTORICO.AsString       := cdsLavagemPRODUTONOME.AsString + '(Placa: ' + cdsLavagemPLACA.AsString +')';
  cdsFinanceiroDATA.AsDateTime          := Date;
  cdsFinanceiroVLR_MOVIMENTO.AsCurrency := cdsLavagemVALOR.AsCurrency;
  cdsFinanceiroTIPO_ES.AsString         := 'E';
  cdsFinanceiro.Post;
  cdsFinanceiro.ApplyUpdates(0);

  cdsParametro.Close;
end;

end.
