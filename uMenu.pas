unit uMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Menus, Buttons, uDmParametros,
  RLConsts, ActnList, jpeg, ExtCtrls;

type
  TfMenu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Cidades1: TMenuItem;
    Usurios1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Parmetros1: TMenuItem;
    N1: TMenuItem;
    Cadastro1: TMenuItem;
    Perfil1: TMenuItem;
    LogdoSistema1: TMenuItem;
    Logoff1: TMenuItem;
    rocarSenha1: TMenuItem;
    N2: TMenuItem;
    Filiais1: TMenuItem;
    Pessoas1: TMenuItem;
    Operacional1: TMenuItem;
    EstacionamentoAvulso1: TMenuItem;
    UF1: TMenuItem;
    ActionList1: TActionList;
    EstacAvulso: TAction;
    Lavagem1: TMenuItem;
    EstacionamentoMensal1: TMenuItem;
    Agenda: TAction;
    Lavagem: TAction;
    EstacMensal: TAction;
    N3: TMenuItem;
    ConsultaEstacionamentos1: TMenuItem;
    Financeiro1: TMenuItem;
    Contas1: TMenuItem;
    Movimentao1: TMenuItem;
    Convnios1: TMenuItem;
    Produtos1: TMenuItem;
    Funcionrios1: TMenuItem;
    Duplicatas1: TMenuItem;
    SpeedButton5: TSpeedButton;
    MovFinanceira: TAction;
    Marcas1: TMenuItem;
    Image1: TImage;
    procedure Parmetros1Click(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
    procedure Filiais1Click(Sender: TObject);
    procedure Pessoas1Click(Sender: TObject);
    procedure EstacionamentoAvulso1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Movimentao1Click(Sender: TObject);
    procedure ConsultaEstacionamentos1Click(Sender: TObject);
    procedure Lavagem1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure EstacionamentoMensal1Click(Sender: TObject);
    procedure Marcas1Click(Sender: TObject);
  private
    { Private declarations }
    procedure OpenForm(FClass: TFormClass; vEstado: TWindowState; TipoPessoa: String = '');
  public
    { Public declarations }
    fDmParametros: TdmParametros;
  end;

var
  fMenu: TfMenu;

implementation

uses uParametros, uDmUserControl, uFilial, uPessoa, uEstacionamentoDia, uCidade, uUF, uContas, uFuncionario, uFinanceiro, uEstacDiaCons,
  uLavagem, uProduto, uEstacionamentoMes, uMarca;

{$R *.dfm}

procedure TfMenu.OpenForm(FClass: TFormClass; vEstado: TWindowState; TipoPessoa: String = '');
var
  existe: TForm;
  j: Byte;
begin
  existe := nil;
  for j := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[j] is FClass then
      existe := Screen.Forms[j];
  end;

  if not (existe = nil) then
  begin
    existe.BringToFront;
    existe.SetFocus;
  end
  else
  begin
    Application.CreateForm(FClass,existe);
    existe.FormStyle := fsMDIChild;
    existe.Show;
  end;
  existe.WindowState := vEstado;
end;

procedure TfMenu.Parmetros1Click(Sender: TObject);
begin
  OpenForm(TfParametros,wsMaximized);
end;

procedure TfMenu.Logoff1Click(Sender: TObject);
begin
  dmUserControl.UserControl1.Logoff;
end;

procedure TfMenu.Filiais1Click(Sender: TObject);
begin
  OpenForm(TfFilial,wsMaximized);
end;

procedure TfMenu.Pessoas1Click(Sender: TObject);
begin
  OpenForm(TfPessoa,wsMaximized);
end;

procedure TfMenu.EstacionamentoAvulso1Click(Sender: TObject);
begin
  OpenForm(TfEstacionamentoDia,wsMaximized);
end;

procedure TfMenu.Cidades1Click(Sender: TObject);
begin
  OpenForm(TfCidade,wsMaximized);
end;

procedure TfMenu.FormShow(Sender: TObject);
begin
  fDmParametros := tDmParametros.Create(Self);
  fDmParametros.cdsParametro.Open;
end;

procedure TfMenu.Contas1Click(Sender: TObject);
begin
  OpenForm(TfContas,wsMaximized);
end;

procedure TfMenu.Funcionrios1Click(Sender: TObject);
begin
  OpenForm(TfFuncionario,wsMaximized);
end;

procedure TfMenu.Movimentao1Click(Sender: TObject);
begin
  OpenForm(TfFinanceiro,wsMaximized);
end;

procedure TfMenu.ConsultaEstacionamentos1Click(Sender: TObject);
begin
  OpenForm(TfEstaciDiaCons,wsMaximized);
end;

procedure TfMenu.Lavagem1Click(Sender: TObject);
begin
  OpenForm(TfLavagem,wsMaximized);
end;

procedure TfMenu.Produtos1Click(Sender: TObject);
begin
  OpenForm(TfProduto,wsMaximized);
end;

procedure TfMenu.EstacionamentoMensal1Click(Sender: TObject);
begin
  OpenForm(TfEstacionamentoMes,wsMaximized);
end;

procedure TfMenu.Marcas1Click(Sender: TObject);
begin
  OpenForm(TfMarca,wsMaximized);
end;

initialization
  RLConsts.SetVersion(3,72,'B');

end.
