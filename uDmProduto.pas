unit uDmProduto;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmProduto = class(TDataModule)
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
    sdsProdutoTIPO: TStringField;
    cdsProdutoTIPO: TStringField;
    sdsUnidade: TSQLDataSet;
    dspUnidade: TDataSetProvider;
    cdsUnidade: TClientDataSet;
    dsUnidade: TDataSource;
    sdsUnidadeID: TIntegerField;
    sdsUnidadeNOME: TStringField;
    cdsUnidadeID: TIntegerField;
    cdsUnidadeNOME: TStringField;
    sdsProdutoItem: TSQLDataSet;
    dsmProduto: TDataSource;
    cdsProdutoItem: TClientDataSet;
    cdsProdutosdsProdutoItem: TDataSetField;
    dsProdutoItem: TDataSource;
    sdsProdutoItemID: TIntegerField;
    sdsProdutoItemPRODUTO_ID: TIntegerField;
    sdsProdutoItemQTD: TFloatField;
    sdsProdutoItemUNIDADE_ID: TIntegerField;
    sdsProdutoItemUNIDADENOME: TStringField;
    sdsProdutoItemPRODUTONOME: TStringField;
    cdsProdutoItemID: TIntegerField;
    cdsProdutoItemPRODUTO_ID: TIntegerField;
    cdsProdutoItemQTD: TFloatField;
    cdsProdutoItemUNIDADE_ID: TIntegerField;
    cdsProdutoItemUNIDADENOME: TStringField;
    cdsProdutoItemPRODUTONOME: TStringField;
    sdsMaterial: TSQLDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    dspMaterial: TDataSetProvider;
    cdsMaterial: TClientDataSet;
    IntegerField2: TIntegerField;
    StringField3: TStringField;
    dsMaterial: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspProdutoUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }

  public
    { Public declarations }
    vMsgProduto: String;
    ctCommand: String;

    procedure prc_Localizar(ID : Integer); //-1 = Inclusão
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
  end;

var
  dmProduto: TdmProduto;

implementation

uses uDmDatabase;

{$R *.dfm}

{ TDMCadPais }

procedure TdmProduto.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsProduto.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('PRODUTO',0);

  cdsProduto.Insert;
  cdsProdutoID.AsInteger := vAux;
end;

procedure TdmProduto.prc_Excluir;
begin
  if not(cdsProduto.Active) or (cdsProduto.IsEmpty) then
    exit;
  cdsProduto.Delete;
  cdsProduto.ApplyUpdates(0);
end;

procedure TdmProduto.prc_Gravar;
begin
  vMsgProduto := '';
  if trim(cdsProdutoNOME.AsString) = '' then
    vMsgProduto := vMsgProduto + #13 + '*** Nome não informado!';
  if trim(cdsProdutoVALOR.AsString) = '' then
    vMsgProduto := vMsgProduto + #13 + '*** Valor não informado!';
  if vMsgProduto <> '' then
    exit;
  cdsProduto.Post;
  cdsProduto.ApplyUpdates(0);
end;

procedure TdmProduto.prc_Localizar(ID : Integer);
begin
  cdsProduto.Close;
  sdsProduto.CommandText := ctCommand;
  if ID <> 0 then
    sdsProduto.CommandText := sdsProduto.CommandText + ' WHERE ID = ' + IntToStr(ID);
  cdsProduto.Open;
end;

procedure TdmProduto.DataModuleCreate(Sender: TObject);
begin
  ctCommand := sdsProduto.CommandText;
end;

procedure TdmProduto.dspProdutoUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

end.
