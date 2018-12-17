unit uLavagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Grids, RXDBCtrl, DBGrids, db, SMDBGrid, Buttons,
  ExtCtrls, StdCtrls, DBCtrls, RzTabs, uDmLavagem, Mask, RxLookup, ToolEdit;

type
  TfLavagem = class(TForm)
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
    BtnPagar: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label5: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label9: TLabel;
    ComboBox1: TComboBox;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    Label11: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label12: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
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
    procedure RxDBLookupCombo4Change(Sender: TObject);
    procedure BtnPagarClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
  private
    { Private declarations }
    fDmLavagem: TDmLavagem;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar;
    procedure prc_Calcular;
  public
    { Public declarations }
  end;

var
  fLavagem: TfLavagem;

implementation

uses UMenu, uDmDatabase, rsDBUtils, uLavagemR1;

{$R *.dfm}

procedure TfLavagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfLavagem.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fdmLavagem);
end;

procedure TfLavagem.FormShow(Sender: TObject);
begin
  fdmLavagem := TdmLavagem.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fdmLavagem);
  fDmLavagem.cdsProduto.Open;
  fDmLavagem.cdsPessoa.Open;
  fDmLavagem.cdsMarca.Open;
  Edit4.SetFocus;
  DateEdit1.Date := Date;
  DateEdit2.Date := Date;
  btnConsultar.Click;
end;

procedure TfLavagem.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfLavagem.btnExcluirClick(Sender: TObject);
begin
  if fdmLavagem.cdsLavagem.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;
end;

procedure TfLavagem.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
  prc_Calcular;
end;

procedure TfLavagem.btnAlterarClick(Sender: TObject);
begin
  if (fdmLavagem.cdsLavagem.IsEmpty) or not(fdmLavagem.cdsLavagem.Active) or
     (fdmLavagem.cdsLavagemID.AsInteger < 1) then
    exit;

  if fDmLavagem.cdsLavagemPAGO.AsString = 'S' then
  begin
    ShowMessage('Lavagem paga não pode ser alterada!');
    Exit;
  end;

  fdmLavagem.cdsLavagem.Edit;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
  BtnPagar.Enabled       := True;
end;

procedure TfLavagem.btnConfirmarClick(Sender: TObject);
begin
  fDmLavagem.cdsLavagemPRODUTONOME.AsString := RxDBLookupCombo4.Text;
  fDmLavagem.cdsLavagemCLIENTENOME.AsString := RxDBLookupCombo1.Text;
  prc_Gravar_Registro;
end;

procedure TfLavagem.btnCancelarClick(Sender: TObject);
begin
  if (fdmLavagem.cdsLavagem.State in [dsBrowse]) or not(fdmLavagem.cdsLavagem.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fdmLavagem.cdsLavagem.CancelUpdates;
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
  btnConfirmar.Enabled      := False;
  btnAlterar.Enabled        := True;
  pnlCadastro.Enabled       := False;
end;

procedure TfLavagem.prc_Consultar;
begin
  fdmLavagem.cdsLavagem.Close;
  fdmLavagem.sdsLavagem.CommandText := fdmLavagem.ctCommand;
  fdmLavagem.sdsLavagem.CommandText := fdmLavagem.sdsLavagem.CommandText + ' WHERE 1 = 1';

  if Trim(Edit4.Text) <> '' then
    fdmLavagem.sdsLavagem.CommandText := fdmLavagem.sdsLavagem.CommandText +
                                         ' AND (PLACA LIKE ' + QuotedStr('%'+Edit4.Text+'%') + ')';
  if Trim(DateEdit1.Text) <> '  /  /    ' then
    fdmLavagem.sdsLavagem.CommandText := fdmLavagem.sdsLavagem.CommandText +
                                         ' AND DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.Date));
  if Trim(DateEdit2.Text) <> '  /  /    ' then
    fdmLavagem.sdsLavagem.CommandText := fdmLavagem.sdsLavagem.CommandText +
                                         ' AND DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.Date));
  if RxDBLookupCombo2.KeyValue > 0 then
    fdmLavagem.sdsLavagem.CommandText := fdmLavagem.sdsLavagem.CommandText +
                                         ' AND ID_PESSOA = ' + QuotedStr(RxDBLookupCombo2.Value);
  case ComboBox1.ItemIndex of
    0: fdmLavagem.sdsLavagem.CommandText := fdmLavagem.sdsLavagem.CommandText + ' AND (PAGO IS NULL OR PAGO = ''N'')';
    1: fdmLavagem.sdsLavagem.CommandText := fdmLavagem.sdsLavagem.CommandText + ' AND PAGO = ''S''';
    2: ;
  end;
  fdmLavagem.cdsLavagem.Open;
end;

procedure TfLavagem.prc_Excluir_Registro;
var
  vCodAux: Integer;
begin
  try
    vCodAux := fdmLavagem.cdsLavagemID.AsInteger;
    fdmLavagem.prc_Excluir;
  except
    on e: Exception do
    begin
      prc_Consultar;
      if vCodAux > 0 then
         fdmLavagem.cdsLavagem.Locate('ID',vCodAux,([Locaseinsensitive]));
      raise;
    end
  end;
end;

procedure TfLavagem.prc_Gravar_Registro;
begin
  fdmLavagem.prc_Gravar;
  if fdmLavagem.cdsLavagem.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fdmLavagem.vMsgLavagem, mtError, [mbno], 0);
    exit;
  end;
  TS_Consulta.TabEnabled    := not(TS_Consulta.TabEnabled);
  RzPageControl1.ActivePage := TS_Consulta;
  btnConfirmar.Enabled      := False;
  btnAlterar.Enabled        := True;
end;

procedure TfLavagem.prc_Inserir_Registro;
begin
  fdmLavagem.prc_Inserir;

  if fdmLavagem.cdsLavagem.State in [dsBrowse] then
    Exit;

  RzPageControl1.ActivePage := TS_Cadastro;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
  BtnPagar.Enabled       := False;

  DBEdit1.SetFocus;
end;

procedure TfLavagem.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfLavagem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if fdmLavagem.cdsLavagem.State in [dsEdit,dsInsert] then
  begin
    if MessageDlg('Fechar esta tela sem confirmar?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      CanClose := False
    else
      CanClose := True;
  end;
end;

procedure TfLavagem.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfLavagem.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fdmLavagem.cdsLavagem.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfLavagem.RxDBLookupCombo4Change(Sender: TObject);
begin
  fDmLavagem.cdsLavagemVALOR.AsCurrency := fDmLavagem.cdsProdutoVALOR.AsCurrency;
end;

procedure TfLavagem.BtnPagarClick(Sender: TObject);
begin
  fDmLavagem.cdsFinanceiro.Open;
  fDmLavagem.prc_GravarFin;
  fDmLavagem.cdsFinanceiro.Open;
  fDmLavagem.cdsLavagemPAGO.AsString := 'S';
  fDmLavagem.cdsLavagemDT_PAGAMENTO.AsDateTime := Date;
  btnConfirmar.Click;
end;

procedure TfLavagem.SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (fdmLavagem.cdsLavagemPAGO.AsString = 'N') or (fdmLavagem.cdsLavagemPAGO.IsNull) then
    AFont.Color := clRed;
end;

procedure TfLavagem.RxDBLookupCombo1Enter(Sender: TObject);
begin
  fDmLavagem.cdsPessoa.IndexFieldNames := 'NOME';
end;

procedure TfLavagem.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Deseja pagar todas as lavagens selecionadas?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    Exit;
  if fDmLavagem.cdsLavagem.IsEmpty then
    Exit;
  fDmLavagem.cdsLavagem.First;
  while not fDmLavagem.cdsLavagem.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
    begin
      fDmLavagem.cdsLavagem.Edit;
      BtnPagar.Click;
    end;

    fDmLavagem.cdsLavagem.Next;
  end;
end;

procedure TfLavagem.RxDBLookupCombo2Enter(Sender: TObject);
begin
  fDmLavagem.cdsPessoa.IndexFieldNames := 'NOME';
end;

procedure TfLavagem.prc_Calcular;
begin
  fDmLavagem.qSoma.Close;
  fDmLavagem.qSoma.SQL.Text := fDmLavagem.ctSoma;
  if DateEdit1.Date > 10 then
    fDmLavagem.qSoma.SQL.Text := fDmLavagem.qSoma.SQL.Text + ' AND DATA >= ' +
                                 QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.Date));
  if DateEdit2.Date > 10 then
    fDmLavagem.qSoma.SQL.Text := fDmLavagem.qSoma.SQL.Text + ' AND DATA <= ' +
                                 QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.Date));
  if RxDBLookupCombo2.KeyValue > 0 then
    fDmLavagem.qSoma.SQL.Text := fDmLavagem.qSoma.SQL.Text + ' AND ID_PESSOA = ' +
                                 RxDBLookupCombo2.Value;
  if Edit4.Text <> '' then
    fDmLavagem.qSoma.SQL.Text := fDmLavagem.qSoma.SQL.Text + ' AND PLACA = ' +
                                 QuotedStr(Edit4.Text);
  case ComboBox1.ItemIndex of
    0: fDmLavagem.qSoma.SQL.Text := fDmLavagem.qSoma.SQL.Text + ' AND (PAGO IS NULL OR PAGO = ''N'')';
    1: fDmLavagem.qSoma.SQL.Text := fDmLavagem.qSoma.SQL.Text + ' AND PAGO = ''S''';
  end;
  fDmLavagem.qSoma.Open;
  Edit1.Text := FormatFloat('0.00',fDmLavagem.qSomaSOMA.AsCurrency);
end;

procedure TfLavagem.BitBtn2Click(Sender: TObject);
begin
  fLavagemR1 := TfLavagemR1.Create(Self);
  fLavagemR1.fDmLavagem := fDmLavagem;

  fLavagemR1.vCliente := RXDbLookupCombo2.Text;
  fLavagemR1.vDataI   := DateEdit1.Text + ' a ' + DateEdit2.Text;
  fLavagemR1.vTotal   := 'R$ ' + Edit1.Text;

  fLavagemR1.RlReport1.Preview;
end;

procedure TfLavagem.RxDBLookupCombo3Enter(Sender: TObject);
begin
  fdmLavagem.cdsMarca.IndexFieldNames := 'NOME';
end;

end.
