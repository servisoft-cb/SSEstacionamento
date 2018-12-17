unit uProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Grids, RXDBCtrl, DBGrids, db, SMDBGrid, Buttons,
  ExtCtrls, StdCtrls, DBCtrls, RzTabs, uDmProduto, Mask, RxLookup, ToolEdit,
  RxDBComb;

type
  TfProduto = class(TForm)
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
    pnlCadastro: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    ComboBox1: TComboBox;
    Label4: TLabel;
    pnlItem: TPanel;
    btnInserirItem: TBitBtn;
    btnExcluirItem: TBitBtn;
    SMDBGrid2: TSMDBGrid;
    Label5: TLabel;
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
    procedure btnInserirItemClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
  private
    { Private declarations }
    fDmProduto: TDmProduto;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar;
  public
    { Public declarations }

  end;

var
  fProduto: TfProduto;

implementation

uses UMenu, uDmDatabase, rsDBUtils, uProdutoItem;

{$R *.dfm}

procedure TfProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfProduto.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fdmProduto);
end;

procedure TfProduto.FormShow(Sender: TObject);
begin
  fdmProduto := TdmProduto.Create(Self);
  oDBUtils.SetDataSourceProperties(Self,fDmProduto);
  Edit4.SetFocus;
end;

procedure TfProduto.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfProduto.btnExcluirClick(Sender: TObject);
begin
  if fdmProduto.cdsProduto.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;
end;

procedure TfProduto.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfProduto.btnAlterarClick(Sender: TObject);
begin
  if (fdmProduto.cdsProduto.IsEmpty) or not(fdmProduto.cdsProduto.Active) or
     (fdmProduto.cdsProdutoID.AsInteger < 1) then
    exit;

  fdmProduto.cdsProduto.Edit;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
  pnlItem.Enabled        := True;
end;

procedure TfProduto.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfProduto.btnCancelarClick(Sender: TObject);
begin
  if (fdmProduto.cdsProduto.State in [dsBrowse]) or not(fdmProduto.cdsProduto.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fdmProduto.cdsProduto.CancelUpdates;
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
  btnConfirmar.Enabled      := False;
  btnAlterar.Enabled        := True;
  pnlCadastro.Enabled       := False;
  pnlItem.Enabled           := False;
end;

procedure TfProduto.prc_Consultar;
begin
  fdmProduto.cdsProduto.Close;
  fdmProduto.sdsProduto.CommandText := fdmProduto.ctCommand;
  fdmProduto.sdsProduto.CommandText := fdmProduto.sdsProduto.CommandText + ' WHERE 1 = 1';

  if Trim(Edit4.Text) <> '' then
    fdmProduto.sdsProduto.CommandText := fdmProduto.sdsProduto.CommandText +
                                         ' AND (NOME LIKE ' + QuotedStr('%'+Edit4.Text+'%') + ')';
  case ComboBox1.ItemIndex of
    0: fdmProduto.sdsProduto.CommandText := fdmProduto.sdsProduto.CommandText + ' AND TIPO = ''P''';
    1: fdmProduto.sdsProduto.CommandText := fdmProduto.sdsProduto.CommandText + ' AND TIPO = ''M''';
  end;
  fdmProduto.cdsProduto.Open;
end;

procedure TfProduto.prc_Excluir_Registro;
var
  vCodAux: Integer;
begin
  try
    vCodAux := fdmProduto.cdsProdutoID.AsInteger;
    fdmProduto.prc_Excluir;
  except
    on e: Exception do
    begin
      prc_Consultar;
      if vCodAux > 0 then
         fdmProduto.cdsProduto.Locate('ID',vCodAux,([Locaseinsensitive]));
      raise;
    end
  end;
end;

procedure TfProduto.prc_Gravar_Registro;
begin
  fdmProduto.prc_Gravar;
  if fdmProduto.cdsProduto.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fdmProduto.vMsgProduto, mtError, [mbno], 0);
    exit;
  end;
  TS_Consulta.TabEnabled    := not(TS_Consulta.TabEnabled);
  RzPageControl1.ActivePage := TS_Consulta;
  btnConfirmar.Enabled      := False;
  btnAlterar.Enabled        := True;
  pnlItem.Enabled           := False;
end;

procedure TfProduto.prc_Inserir_Registro;
begin
  fdmProduto.prc_Inserir;

  if fdmProduto.cdsProduto.State in [dsBrowse] then
    Exit;

  RzPageControl1.ActivePage := TS_Cadastro;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;

  DBEdit1.SetFocus;
end;

procedure TfProduto.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfProduto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if fdmProduto.cdsProduto.State in [dsEdit,dsInsert] then
  begin
    if MessageDlg('Fechar esta tela sem confirmar?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      CanClose := False
    else
      CanClose := True;
  end;
end;

procedure TfProduto.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfProduto.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fdmProduto.cdsProduto.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfProduto.btnInserirItemClick(Sender: TObject);
begin
  fProdutoItem := TfProdutoItem.Create(Self);
  fProdutoItem.fdmProduto := fDmProduto;
  fDmProduto.cdsProdutoItem.Insert;
  fProdutoItem.ShowModal;
end;

procedure TfProduto.btnExcluirItemClick(Sender: TObject);
begin
  if fdmProduto.cdsProdutoItem.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDmProduto.cdsProdutoItem.Delete;  
end;

end.
