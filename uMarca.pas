unit uMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, uDmMarca, Mask, DBCtrls, Grids, DBGrids, SMDBGrid,
  db, Forms, StdCtrls, Buttons, ExtCtrls, Dialogs, RzTabs;

type
  TfMarca = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    Panel3: TPanel;
    Label6: TLabel;
    btnConsultar: TBitBtn;
    Edit4: TEdit;
    Panel2: TPanel;
    btnInserir: TBitBtn;
    btnExcluir: TBitBtn;
    StaticText1: TStaticText;
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAlterar: TBitBtn;
    RZPageControlDados: TRzPageControl;
    pnlCadastro: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    fDmMarca: TDmMarca;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar;
  public
    { Public declarations }

  end;

var
  fMarca: TfMarca;

implementation

uses UMenu, uDmDatabase, rsDBUtils;

{$R *.dfm}

procedure TfMarca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfMarca.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fdmMarca);
end;

procedure TfMarca.FormShow(Sender: TObject);
begin
  fdmMarca := TdmMarca.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fdmMarca);
  Edit4.SetFocus;
end;

procedure TfMarca.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfMarca.btnExcluirClick(Sender: TObject);
begin
  if fdmMarca.cdsMarca.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;
end;

procedure TfMarca.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfMarca.btnAlterarClick(Sender: TObject);
begin
  if (fdmMarca.cdsMarca.IsEmpty) or not(fdmMarca.cdsMarca.Active) or
     (fdmMarca.cdsMarcaID.AsInteger < 1) then
    exit;

  fdmMarca.cdsMarca.Edit;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
end;

procedure TfMarca.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfMarca.btnCancelarClick(Sender: TObject);
begin
  if (fdmMarca.cdsMarca.State in [dsBrowse]) or not(fdmMarca.cdsMarca.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fdmMarca.cdsMarca.CancelUpdates;
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
  btnConfirmar.Enabled      := False;
  btnAlterar.Enabled        := True;
  pnlCadastro.Enabled       := False;
end;

procedure TfMarca.prc_Consultar;
begin
  fdmMarca.cdsMarca.Close;
  fdmMarca.sdsMarca.CommandText := fdmMarca.ctCommand;
  fdmMarca.sdsMarca.CommandText := fdmMarca.sdsMarca.CommandText + ' WHERE 1 = 1';

  if Trim(Edit4.Text) <> '' then
    fdmMarca.sdsMarca.CommandText := fdmMarca.sdsMarca.CommandText + ' AND (NOME LIKE ' +
                                                 QuotedStr('%'+Edit4.Text+'%') + ')';
  fdmMarca.cdsMarca.Open;
end;

procedure TfMarca.prc_Excluir_Registro;
var
  vCodAux: Integer;
begin
  try
    vCodAux := fdmMarca.cdsMarcaID.AsInteger;
    fdmMarca.prc_Excluir;
  except
    on e: Exception do
    begin
      prc_Consultar;
      if vCodAux > 0 then
         fdmMarca.cdsMarca.Locate('ID',vCodAux,([Locaseinsensitive]));
      raise;
    end
  end;
end;

procedure TfMarca.prc_Gravar_Registro;
begin
  fdmMarca.prc_Gravar;
  if fdmMarca.cdsMarca.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fdmMarca.vMsgMarca, mtError, [mbno], 0);
    exit;
  end;
  TS_Consulta.TabEnabled    := not(TS_Consulta.TabEnabled);
  RzPageControl1.ActivePage := TS_Consulta;
  btnConfirmar.Enabled      := False;
  btnAlterar.Enabled        := True;
end;

procedure TfMarca.prc_Inserir_Registro;
begin
  fdmMarca.prc_Inserir;

  if fdmMarca.cdsMarca.State in [dsBrowse] then
    Exit;

  RzPageControl1.ActivePage := TS_Cadastro;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;

  DBEdit1.SetFocus;
end;

procedure TfMarca.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfMarca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if fdmMarca.cdsMarca.State in [dsEdit,dsInsert] then
  begin
    if MessageDlg('Fechar esta tela sem confirmar?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      CanClose := False
    else
      CanClose := True;
  end;
end;

procedure TfMarca.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfMarca.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fdmMarca.cdsMarca.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

end.
