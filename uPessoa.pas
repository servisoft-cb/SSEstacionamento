unit uPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RzTabs, StdCtrls, DBCtrls, Mask,
  RxDBComb, RxLookup, db, Grids, DateUtils, DBGrids, SMDBGrid, Buttons, ExtCtrls, UCBase, uDmPessoa, ToolEdit, RXDBCtrl;

type
  TfPessoa = class(TForm)
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
    UCControls1: TUCControls;
    CheckBox1: TCheckBox;
    RZPageControlDados: TRzPageControl;
    TS_Pessoa_Dados: TRzTabSheet;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    lblInscEstadual: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lblRG: TLabel;
    SpeedButton4: TSpeedButton;
    StaticText2: TStaticText;
    DBEdit7: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DBEdit8: TDBEdit;
    dbeInscEstadual: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    dbeRG: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label12: TLabel;
    DBDateEdit1: TDBDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit6Enter(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBComboBox1Exit(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    fDmPessoa: TdmPessoa;

    procedure prc_Inserir_Registro(Tipo: String);
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar;
  public
    { Public declarations }
  end;

var
  fPessoa: TfPessoa;

implementation

uses UMenu, uDmDatabase, rsDBUtils, uUtilPadrao, uDmUserControl;

{$R *.dfm}

procedure TfPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfPessoa.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDmPessoa);
end;

procedure TfPessoa.FormShow(Sender: TObject);
begin
  fDmPessoa := TdmPessoa.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDmPessoa);
  Edit4.SetFocus;
end;

procedure TfPessoa.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro('');
end;

procedure TfPessoa.btnExcluirClick(Sender: TObject);
begin
  if fDmPessoa.cdsPessoa.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;
end;

procedure TfPessoa.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfPessoa.btnAlterarClick(Sender: TObject);
begin
  if (fDmPessoa.cdsPessoa.IsEmpty) or not(fDmPessoa.cdsPessoa.Active) or (fDmPessoa.cdsPessoaID.AsInteger < 1) then
    exit;

  fDmPessoa.cdsPessoa.Edit;

  TS_Consulta.TabEnabled  := False;
  btnAlterar.Enabled      := False;
  btnConfirmar.Enabled    := True;
  TS_Pessoa_Dados.Enabled := True;
end;

procedure TfPessoa.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfPessoa.btnCancelarClick(Sender: TObject);
begin
  if (fDmPessoa.cdsPessoa.State in [dsBrowse]) or not(fDmPessoa.cdsPessoa.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDmPessoa.cdsPessoa.CancelUpdates;
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
  btnConfirmar.Enabled      := False;
  btnAlterar.Enabled        := True;
  TS_Pessoa_Dados.Enabled   := False;
end;

procedure TfPessoa.prc_Consultar;
begin
  fDmPessoa.cdsPessoa.Close;
  fDmPessoa.sdsPessoa.CommandText := fDmPessoa.ctCommand;
  fDmPessoa.sdsPessoa.CommandText := fDmPessoa.sdsPessoa.CommandText + ' WHERE 1 = 1';

  if Trim(Edit4.Text) <> '' then
    fDmPessoa.sdsPessoa.CommandText := fDmPessoa.sdsPessoa.CommandText +
                                          ' AND ((NOME LIKE ' + QuotedStr('%'+Edit4.Text+'%') + ')' +
                                          ' OR (FANTASIA LIKE ' + QuotedStr('%'+Edit4.Text+'%') + '))';
  fDmPessoa.cdsPessoa.Open;
end;

procedure TfPessoa.prc_Excluir_Registro;
var
  vCodAux: Integer;
begin
  try
    vCodAux := fDmPessoa.cdsPessoaID.AsInteger;
    fDmPessoa.prc_Excluir;
  except
    on e: Exception do
    begin
      prc_Consultar;
      if vCodAux > 0 then
         fDmPessoa.cdsPessoa.Locate('ID',vCodAux,([Locaseinsensitive]));
      raise;
    end
  end;
end;

procedure TfPessoa.prc_Gravar_Registro;
begin
  fDmPessoa.cdsPessoaCIDADE.AsString := RxDBLookupCombo2.Text;
  fDmPessoa.prc_Gravar;
  if fDmPessoa.cdsPessoa.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDmPessoa.vMsgPessoa, mtError, [mbno], 0);
    exit;
  end;
  TS_Consulta.TabEnabled    := not(TS_Consulta.TabEnabled);
  RzPageControl1.ActivePage := TS_Consulta;
  btnConfirmar.Enabled      := False;
  btnAlterar.Enabled        := True;
end;

procedure TfPessoa.prc_Inserir_Registro(Tipo: String);
begin
  fDmPessoa.prc_Inserir(Tipo);

  if fDmPessoa.cdsPessoa.State in [dsBrowse] then
    Exit;

  RzPageControl1.ActivePage := TS_Cadastro;

  TS_Consulta.TabEnabled  := False;
  btnAlterar.Enabled      := False;
  btnConfirmar.Enabled    := True;
  TS_Pessoa_Dados.Enabled := True;
  RxDBComboBox1.SetFocus;
end;

procedure TfPessoa.RzPageControl1Change(Sender: TObject);
begin
  if RzPageControl1.ActivePage = TS_Cadastro then
  begin
    lblInscEstadual.Visible := (RxDBComboBox1.ItemIndex = 0);
    dbeInscEstadual.Visible := (RxDBComboBox1.ItemIndex = 0);
    lblRG.Visible           := (RxDBComboBox1.ItemIndex = 1);
    dbeRG.Visible           := (RxDBComboBox1.ItemIndex = 1);
  end;
end;

procedure TfPessoa.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfPessoa.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if RxDBLookupCombo2.Text <> '' then
    fDmPessoa.cdsPessoaUF.AsString := fDmPessoa.cdsCidadeUF.AsString;
end;

procedure TfPessoa.SpeedButton4Click(Sender: TObject);
begin
  fDmPessoa.cdsCidade.Close;
  fDmPessoa.cdsCidade.Open;
end;

procedure TfPessoa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if fDmPessoa.cdsPessoa.State in [dsEdit,dsInsert] then
  begin
    if MessageDlg('Fechar esta tela sem confirmar?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      CanClose := False
    else
      CanClose := True;
  end;
end;

procedure TfPessoa.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfPessoa.DBEdit6Enter(Sender: TObject);
begin
  fDmPessoa.cdsPESSOACNPJ_CPF.EditMask := '00.000.000/0000-00';
  if fDmPessoa.cdsPESSOAPessoa.AsString = 'F' then
    fDmPessoa.cdsPESSOACNPJ_CPF.EditMask := '000.000.000-00';
end;

procedure TfPessoa.DBEdit6Exit(Sender: TObject);
var
  vNomeAux: String;
  vAux: String;
begin
  vAux := Monta_Numero(DBEdit6.Text,0);
  if (trim(vAux) = '') or (copy(vAux,1,9) = '000000000') then
    exit;
  if fDmPessoa.cdsPessoaPESSOA.AsString = 'J' then
  begin
    if not ValidaCNPJ(DBEdit6.Text) then
    begin
      ShowMessage('CNPJ incorreto!');
      fDmPessoa.cdsPessoaCNPJ_CPF.Clear;
      DBEdit6.SetFocus;
    end;
  end
  else
  if not ValidaCPF(DBEdit6.Text) then
  begin
    ShowMessage('CPF incorreto!');
    fDmPessoa.cdsPessoaCNPJ_CPF.Clear;
    DBEdit6.SetFocus;
  end;

  if not(fDmPessoa.cdsPessoaCNPJ_CPF.IsNull) then
  begin
    vNomeAux := VerificaDuplicidade(DBEdit6.Text,'P',fDmPessoa.cdsPessoaID.AsInteger);
    if trim(vNomeAux) <> '' then
    begin
      ShowMessage('CNPJ ou CPF já utilizado para ' + vNomeAux + '!');
      fDmPessoa.cdsPessoaCNPJ_CPF.Clear;
      DBEdit6.SetFocus;
    end;
  end;
end;

procedure TfPessoa.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDmPessoa.cdsPessoaINATIVO.AsString = 'S' then
    AFont.Color := clRed;
end;

procedure TfPessoa.RxDBComboBox1Exit(Sender: TObject);
begin
  fDmPessoa.cdsPESSOACNPJ_CPF.EditMask := '00.000.000/0000-00';
  if RxDBComboBox1.ItemIndex = 1 then
    fDmPessoa.cdsPESSOACNPJ_CPF.EditMask := '000.000.000-00';
  lblInscEstadual.Visible := (RxDBComboBox1.ItemIndex = 0);
  dbeInscEstadual.Visible := (RxDBComboBox1.ItemIndex = 0);
  lblRG.Visible           := (RxDBComboBox1.ItemIndex = 1);
  dbeRG.Visible           := (RxDBComboBox1.ItemIndex = 1);
end;

procedure TfPessoa.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDmPessoa.cdsPessoa.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

end.
