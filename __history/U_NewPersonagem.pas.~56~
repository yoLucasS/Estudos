unit U_NewPersonagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.Mask, Vcl.WinXCalendars,
  ClassPersonagem;

type
  TFormNewPersonagem = class(TForm)
    img_Fundo: TImage;
    edt_Nome: TLabeledEdit;
    edt_Raça: TLabeledEdit;
    lb_Tittle: TLabel;
    DataNasc: TCalendarPicker;
    lb_DateNasc: TLabel;
    edt_Resp: TLabeledEdit;
    edt_Ocupacao: TLabeledEdit;
    lbInf: TLabel;
    lbHabilidades: TLabel;
    memo_Poderes: TMemo;
    lb_Poderes: TLabel;
    memo_Estilo: TMemo;
    lb_Est: TLabel;
    pnl_Salvar: TPanel;
    lb_Personagem: TLabel;
    Timer: TTimer;
    procedure pnl_SalvarClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure LimparCampos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNewPersonagem: TFormNewPersonagem;

implementation

{$R *.dfm}

procedure TFormNewPersonagem.pnl_SalvarClick(Sender: TObject);
var
  Personagem:TPersonagem;
begin
  Personagem := TPersonagem.Create(
    edt_Nome.Text,
    edt_Raça.Text,
    edt_Ocupacao.Text,
    edt_Resp.Text,
    memo_Estilo.text,
    memo_Poderes.Text,
    DataNasc.Date,
    0
  );
  try
    Personagem.CadNovoPersonagem;
    lb_Personagem.Visible:=true;
  finally
    Personagem.Free;
    LimparCampos;
  end;
end;

procedure TFormNewPersonagem.TimerTimer(Sender: TObject);
begin
  lb_Personagem.Visible := false;
end;

procedure TFormNewPersonagem.LimparCampos;
var i:integer;
begin
  for I := 0 to Self.ControlCount -1 do begin
    if (self.Controls[i] is TLabeledEdit) then begin
      TLabeledEdit(self.Controls[i]).Clear;
    end else if (self.controls[i] is TMemo) then begin
       TMemo(self.controls[i]).Clear;
    end;
  end;
end;
end.
