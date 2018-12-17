unit uDmMarca;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmMarca = class(TDataModule)
    sdsMarca: TSQLDataSet;
    dspMarca: TDataSetProvider;
    cdsMarca: TClientDataSet;
    dsMarca: TDataSource;
    sdsMarcaID: TIntegerField;
    sdsMarcaNOME: TStringField;
    cdsMarcaID: TIntegerField;
    cdsMarcaNOME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspMarcaUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }

  public
    { Public declarations }
    vMsgMarca: String;
    ctCommand: String;

    procedure prc_Localizar(ID : Integer); //-1 = Inclusão
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
  end;

var
  dmMarca: TdmMarca;

implementation

uses uDmDatabase;

{$R *.dfm}

{ TDMCadPais }

procedure TdmMarca.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsMarca.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('MARCA',0);

  cdsMarca.Insert;
  cdsMarcaID.AsInteger := vAux;
end;

procedure TdmMarca.prc_Excluir;
begin
  if not(cdsMarca.Active) or (cdsMarca.IsEmpty) then
    exit;
  cdsMarca.Delete;
  cdsMarca.ApplyUpdates(0);
end;

procedure TdmMarca.prc_Gravar;
begin
  vMsgMarca := '';
  if trim(cdsMarcaNOME.AsString) = '' then
    vMsgMarca := vMsgMarca + #13 + '*** Nome não informado!';
  if vMsgMarca <> '' then
    exit;
  cdsMarca.Post;
  cdsMarca.ApplyUpdates(0);
end;

procedure TdmMarca.prc_Localizar(ID: Integer);
begin
  cdsMarca.Close;
  sdsMarca.CommandText := ctCommand;
  if ID <> 0 then
    sdsMarca.CommandText := sdsMarca.CommandText + ' WHERE ID = ' + IntToStr(ID);
  cdsMarca.Open;
end;

procedure TdmMarca.DataModuleCreate(Sender: TObject);
begin
  ctCommand := sdsMarca.CommandText;
end;

procedure TdmMarca.dspMarcaUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

end.
