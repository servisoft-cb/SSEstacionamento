unit uEstacionamentoMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Grids, RXDBCtrl, DBGrids, db,
  SMDBGrid, Buttons, ExtCtrls, StdCtrls, DBCtrls, RzTabs, udmEstacionamentoMes, Mask, RxLookup, ToolEdit;

type
  TfEstacionamentoMes = class(TForm)
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
    Label17: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label7: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    Edit1: TEdit;
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
    fdmEstacionamentoMes: TdmEstacionamentoMes;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar;
  public
    { Public declarations }

  end;

var
  fEstacionamentoMes: TfEstacionamentoMes;

implementation

uses UMenu, uDmDatabase, rsDBUtils;

{$R *.dfm}

procedure TfEstacionamentoMes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfEstacionamentoMes.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fdmEstacionamentoMes);
end;

procedure TfEstacionamentoMes.FormShow(Sender: TObject);
begin
  fdmEstacionamentoMes := TdmEstacionamentoMes.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fdmEstacionamentoMes);
  oDBUtils.OpenTables(True,Self);
  btnConsultar.Click;
  Edit4.SetFocus;
end;

procedure TfEstacionamentoMes.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfEstacionamentoMes.btnExcluirClick(Sender: TObject);
begin
  if fdmEstacionamentoMes.cdsEstacMes.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;
end;

procedure TfEstacionamentoMes.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfEstacionamentoMes.btnAlterarClick(Sender: TObject);
begin
  if (fdmEstacionamentoMes.cdsEstacMes.IsEmpty) or not(fdmEstacionamentoMes.cdsEstacMes.Active) or
     (fdmEstacionamentoMes.cdsEstacMesID.AsInteger < 1) then
    exit;

  fdmEstacionamentoMes.cdsEstacMes.Edit;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
end;

procedure TfEstacionamentoMes.btnConfirmarClick(Sender: TObject);
begin
  fdmEstacionamentoMes.cdsEstacMesPESSOA_NOME.AsString := RxDBLookupCombo4.Text;
  prc_Gravar_Registro;
end;

procedure TfEstacionamentoMes.btnCancelarClick(Sender: TObject);
begin
  if (fdmEstacionamentoMes.cdsEstacMes.State in [dsBrowse]) or not(fdmEstacionamentoMes.cdsEstacMes.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fdmEstacionamentoMes.cdsEstacMes.CancelUpdates;
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
  btnConfirmar.Enabled      := False;
  btnAlterar.Enabled        := True;
  pnlCadastro.Enabled       := False;
end;

procedure TfEstacionamentoMes.prc_Consultar;
begin
  fdmEstacionamentoMes.cdsEstacMes.Close;
  fdmEstacionamentoMes.sdsEstacMes.CommandText := fdmEstacionamentoMes.ctCommand;
  fdmEstacionamentoMes.sdsEstacMes.CommandText := fdmEstacionamentoMes.sdsEstacMes.CommandText + ' WHERE 1 = 1';

  if Trim(Edit4.Text) <> '' then
    fdmEstacionamentoMes.sdsEstacMes.CommandText := fdmEstacionamentoMes.sdsEstacMes.CommandText +
                                                    ' AND (PLACA = ' + QuotedStr(Edit4.Text) + ')';
  if Trim(Edit1.Text) <> '' then
    fdmEstacionamentoMes.sdsEstacMes.CommandText := fdmEstacionamentoMes.sdsEstacMes.CommandText +
                                                    ' AND (DIA_COBRANCA = ' + QuotedStr(Edit1.Text) + ')';
  fdmEstacionamentoMes.cdsEstacMes.Open;
end;

procedure TfEstacionamentoMes.prc_Excluir_Registro;
var
  vCodAux: Integer;
begin
  try
    vCodAux := fdmEstacionamentoMes.cdsEstacMesID.AsInteger;
    fdmEstacionamentoMes.prc_Excluir;
  except
    on e: Exception do
    begin
      prc_Consultar;
      if vCodAux > 0 then
         fdmEstacionamentoMes.cdsEstacMes.Locate('ID',vCodAux,([Locaseinsensitive]));
      raise;
    end
  end;
end;

procedure TfEstacionamentoMes.prc_Gravar_Registro;
begin
  fdmEstacionamentoMes.prc_Gravar;
  if fdmEstacionamentoMes.cdsEstacMes.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fdmEstacionamentoMes.vMsgPessoa, mtError, [mbno], 0);
    exit;
  end;
  TS_Consulta.TabEnabled    := not(TS_Consulta.TabEnabled);
  RzPageControl1.ActivePage := TS_Consulta;
  btnConfirmar.Enabled      := False;
  btnAlterar.Enabled        := True;
end;

procedure TfEstacionamentoMes.prc_Inserir_Registro;
begin
  fdmEstacionamentoMes.prc_Inserir;

  if fdmEstacionamentoMes.cdsEstacMes.State in [dsBrowse] then
    Exit;

  RzPageControl1.ActivePage := TS_Cadastro;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;

  DBDateEdit1.SetFocus;
end;

procedure TfEstacionamentoMes.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfEstacionamentoMes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if fdmEstacionamentoMes.cdsEstacMes.State in [dsEdit,dsInsert] then
  begin
    if MessageDlg('Fechar esta tela sem confirmar?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      CanClose := False
    else
      CanClose := True;
  end;
end;

procedure TfEstacionamentoMes.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfEstacionamentoMes.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fdmEstacionamentoMes.cdsEstacMes.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

end.
