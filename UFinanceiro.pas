unit uFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, uDmFinanceiro,
  DBGrids, ExtCtrls, StdCtrls, DB, RzTabs, DBCtrls, ToolEdit, UCBase, RxLookup, Mask, CurrEdit, RxDBComb, RXDBCtrl,
  Variants, RzPanel;

type
  TfFinanceiro = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Panel1: TPanel;
    pnlCadastro: TPanel;
    Label1: TLabel;
    DBEdit7: TDBEdit;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAlterar: TBitBtn;
    StaticText1: TStaticText;
    Panel3: TPanel;
    btnConsultar: TBitBtn;
    btnInserir: TBitBtn;
    btnExcluir: TBitBtn;
    pnlNota: TPanel;
    Label23: TLabel;
    DBEdit8: TDBEdit;
    Label18: TLabel;
    DateEdit1: TDateEdit;
    Label26: TLabel;
    DateEdit2: TDateEdit;
    RxDBComboBox11: TRxDBComboBox;
    Label2: TLabel;
    Label17: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    UCControls1: TUCControls;
    Label3: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RzGroupBox1: TRzGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lblEntrada: TLabel;
    lblSaida: TLabel;
    lblSaldo: TLabel;
    btnRecalcular: TBitBtn;
    btnImprimir: TBitBtn;
    ComboBox1: TComboBox;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure edtDuplicataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure btnRecalcularClick(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
  private
    { Private declarations }
    fDmFinanceiro: TDmFinanceiro;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar(ID: Integer = 0);
    procedure prc_Le_cdsFinanceiro;
    procedure prc_Posiciona_Financeiro;
    procedure prc_Abrir_qSaldoMov;
  public
    { Public declarations }       
  end;

var
  fFinanceiro: TfFinanceiro;

implementation

uses uDmDatabase, rsDBUtils, UMenu, uUtilPadrao, uDmUserControl;

{$R *.dfm}

procedure TfFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfFinanceiro.btnExcluirClick(Sender: TObject);
begin
  prc_Posiciona_Financeiro;

  if fdmFinanceiro.cdsFinanceiro.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;
  btnConsultarClick(Sender);
end;

procedure TfFinanceiro.prc_Excluir_Registro;
begin
  fdmFinanceiro.prc_Excluir;
end;

procedure TfFinanceiro.prc_Gravar_Registro;
var
  vIDAux: Integer;
begin
  vIDAux := fdmFinanceiro.cdsFinanceiroID.AsInteger;
  fdmFinanceiro.prc_Gravar;
  if fdmFinanceiro.cdsFinanceiro.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fdmFinanceiro.vMsgErro, mtError, [mbno], 0);
    exit;
  end;
  TS_Consulta.TabEnabled    := not(TS_Consulta.TabEnabled);
  RzPageControl1.ActivePage := TS_Consulta;
  pnlCadastro.Enabled       := not(pnlCadastro.Enabled);
  btnConfirmar.Enabled      := not(btnConfirmar.Enabled);
  btnAlterar.Enabled        := not(btnAlterar.Enabled);

  prc_Consultar(vIDAux);
end;

procedure TfFinanceiro.prc_Inserir_Registro;
begin
  fdmFinanceiro.prc_Inserir;

  if fdmFinanceiro.cdsFinanceiro.State in [dsBrowse] then
    exit;

  RzPageControl1.ActivePage := TS_Cadastro;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
  RxDBComboBox11.SetFocus;
end;

procedure TfFinanceiro.FormShow(Sender: TObject);
var
  i: Integer;
begin
  fdmFinanceiro := TdmFinanceiro.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fdmFinanceiro);
end;

procedure TfFinanceiro.prc_Consultar(ID: Integer = 0);
begin
  fdmFinanceiro.cdsFinanceiro_Consulta.Close;
  fdmFinanceiro.sdsFinanceiro_Consulta.CommandText := fdmFinanceiro.ctFinanceiro_Consulta  + ' WHERE 0 = 0';
  if RxDBLookupCombo2.Text <> '' then
    fdmFinanceiro.sdsFinanceiro_Consulta.CommandText := fdmFinanceiro.sdsFinanceiro_Consulta.CommandText +
                                                        ' AND F.ID_CONTA = ' + IntToStr(RxDBLookupCombo2.KeyValue);
  if DateEdit1.Date > 10 then
    fdmFinanceiro.sdsFinanceiro_Consulta.CommandText := fdmFinanceiro.sdsFinanceiro_Consulta.CommandText +
                                                        ' AND F.DATA >= ' +
                                                        QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    fdmFinanceiro.sdsFinanceiro_Consulta.CommandText := fdmFinanceiro.sdsFinanceiro_Consulta.CommandText +
                                                        ' AND F.DATA <= ' +
                                                        QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  case ComboBox1.ItemIndex of
    0: fdmFinanceiro.sdsFinanceiro_Consulta.CommandText := fdmFinanceiro.sdsFinanceiro_Consulta.CommandText + ' AND F.TIPO_ES = ' + QuotedStr('E');
    1: fdmFinanceiro.sdsFinanceiro_Consulta.CommandText := fdmFinanceiro.sdsFinanceiro_Consulta.CommandText + ' AND F.TIPO_ES = ' + QuotedStr('S');
  end;
  fdmFinanceiro.cdsFinanceiro_Consulta.IndexFieldNames := 'DATA';
  fdmFinanceiro.cdsFinanceiro_Consulta.Open;
  if ID > 0 then
    fdmFinanceiro.cdsFinanceiro_Consulta.Locate('ID',ID,[loCaseInsensitive]);
end;

procedure TfFinanceiro.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar(0);
  prc_Le_cdsFinanceiro;
end;

procedure TfFinanceiro.btnCancelarClick(Sender: TObject);
begin
  if (fdmFinanceiro.cdsFinanceiro.State in [dsBrowse]) or not(fdmFinanceiro.cdsFinanceiro.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fdmFinanceiro.cdsFinanceiro.CancelUpdates;
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
  pnlCadastro.Enabled       := not(pnlCadastro.Enabled);
  btnConfirmar.Enabled      := not(btnConfirmar.Enabled);
  btnAlterar.Enabled        := not(btnAlterar.Enabled);
end;

procedure TfFinanceiro.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfFinanceiro.btnAlterarClick(Sender: TObject);
begin
  if (fdmFinanceiro.cdsFinanceiro.IsEmpty) or not(fdmFinanceiro.cdsFinanceiro.Active) or (fdmFinanceiro.cdsFinanceiroID.AsInteger < 1) then
    exit;
  fdmFinanceiro.cdsFinanceiro.Edit;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
end;

procedure TfFinanceiro.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfFinanceiro.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fdmFinanceiro);
end;

procedure TfFinanceiro.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfFinanceiro.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := ' ';
end;

procedure TfFinanceiro.edtDuplicataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfFinanceiro.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfFinanceiro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := fnc_Encerrar_Tela(fdmFinanceiro.cdsFinanceiro);
end;

procedure TfFinanceiro.SpeedButton2Click(Sender: TObject);
begin
  fdmFinanceiro.cdsContas.Close;
  fdmFinanceiro.cdsContas.Open;
end;

procedure TfFinanceiro.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fdmFinanceiro.cdsFinanceiro_Consulta.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfFinanceiro.prc_Le_cdsFinanceiro;
var
  vEntrada, vSaida, vSaldo: Real;
begin
  vEntrada := 0;
  vSaida   := 0;
  SMDBGrid1.DisableScroll;
  fdmFinanceiro.cdsFinanceiro_Consulta.First;
  while not fdmFinanceiro.cdsFinanceiro_Consulta.Eof do
  begin
    if fdmFinanceiro.cdsFinanceiro_ConsultaTIPO_ES.AsString = 'E' then
      vEntrada := vEntrada + fdmFinanceiro.cdsFinanceiro_ConsultaVLR_MOVIMENTO.AsFloat
    else
    if fdmFinanceiro.cdsFinanceiro_ConsultaTIPO_ES.AsString = 'S' then
      vSaida := vSaida + fdmFinanceiro.cdsFinanceiro_ConsultaVLR_MOVIMENTO.AsFloat;
    fdmFinanceiro.cdsFinanceiro_Consulta.Next;
  end;
  SMDBGrid1.EnableScroll;
  vSaldo := StrToFloat(FormatFloat('0.00',vEntrada - vSaida));
  lblEntrada.Caption := FormatFloat('###,###,##0.00',vEntrada);
  lblSaida.Caption   := FormatFloat('###,###,##0.00',vSaida);
  lblSaldo.Caption   := FormatFloat('###,###,##0.00',vSaldo);
end;

procedure TfFinanceiro.btnRecalcularClick(Sender: TObject);
begin
  btnConsultarClick(Sender);
  prc_Le_cdsFinanceiro;
end;

procedure TfFinanceiro.RzPageControl1Change(Sender: TObject);
begin
  if not(fdmFinanceiro.cdsFinanceiro.State in [dsEdit, dsInsert]) then
    if RzPageControl1.ActivePage = TS_Cadastro then
    begin
      if not(fdmFinanceiro.cdsFinanceiro_Consulta.Active) or (fdmFinanceiro.cdsFinanceiro_Consulta.IsEmpty) or (fdmFinanceiro.cdsFinanceiro_ConsultaID.AsInteger <= 0) then
        exit;
      prc_Posiciona_Financeiro;
    end;
end;

procedure TfFinanceiro.prc_Posiciona_Financeiro;
begin
  fdmFinanceiro.prc_Localizar(fdmFinanceiro.cdsFinanceiro_ConsultaID.AsInteger);
end;

procedure TfFinanceiro.prc_Abrir_qSaldoMov;
begin
end;

end.
