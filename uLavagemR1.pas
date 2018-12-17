unit uLavagemR1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RLReport, uDmLavagem;

type
  TfLavagemR1 = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    LCliente: TRLLabel;
    LDataI: TRLLabel;
    RLLabel7: TRLLabel;
    RLBand3: TRLBand;
    LTotal: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel5: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText5: TRLDBText;
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    fDmLavagem: TDmLavagem;
    vCliente, vDataI, vDataF, vTotal: String;
  end;

var
  fLavagemR1: TfLavagemR1;

implementation

uses uLavagem;

{$R *.dfm}

procedure TfLavagemR1.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  LCliente.Caption := vCliente;
  LDataI.Caption   := vDataI;
  LTotal.Caption   := vTotal;
end;

end.
