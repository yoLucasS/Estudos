unit U_Index;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage, U_NewPersonagem, Vcl.StdCtrls, U_VisuPersonagens,
  Vcl.Imaging.GIFImg;

type
  TFormPrincipal = class(TForm)
    pnl_Side: TPanel;
    pnl_NovoPersonagem: TPanel;
    pnl_Container: TPanel;
    img_Fundo: TImage;
    img_Close: TImage;
    img_add: TImage;
    pnl_Home: TPanel;
    img_Home: TImage;
    pnl_F2: TPanel;
    pnl_F1: TPanel;
    img_Logo: TImage;
    pnl_Sobre: TPanel;
    lb_Sobre: TLabel;
    pnl_VisPersonagens: TPanel;
    img_Ver: TImage;
    pnl_Logout: TPanel;
    img_Logout: TImage;
    Panel2: TPanel;
    gif: TImage;
    procedure img_CloseClick(Sender: TObject);
    procedure pnl_NovoPersonagemClick(Sender: TObject);
    procedure CloseForms;
    procedure pnl_HomeClick(Sender: TObject);
    procedure pnl_VisPersonagensClick(Sender: TObject);
    procedure pnl_LogoutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses U_Login;

procedure TFormPrincipal.CloseForms;
  var i:integer;
begin
  for i := 0 to pnl_Container.ControlCount -1 do begin
    if pnl_Container.controls[i] is TForm then begin
      TForm(pnl_Container.Controls[i]).Close;
    end;
  end;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  (gif.Picture.Graphic as TGIFImage).Animate:=true;
end;

procedure TFormPrincipal.img_CloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormPrincipal.pnl_HomeClick(Sender: TObject);
begin
  CloseForms;
end;

procedure TFormPrincipal.pnl_LogoutClick(Sender: TObject);
begin
  close;
  FormLogin.ClientHeight := 408;
  FormLogin.ClientWidth := 726;
  FormLogin.edt_User.Clear;
  FormLogin.edt_Senha.Clear;
end;

procedure TFormPrincipal.pnl_NovoPersonagemClick(Sender: TObject);
begin
  CloseForms;
  FormNewPersonagem.parent := pnl_Container;
  FormNewPersonagem.Show;
end;

procedure TFormPrincipal.pnl_VisPersonagensClick(Sender: TObject);
begin
  CloseForms;
  FormVisuPerso.Parent := pnl_Container;
  FormVisuPerso.Show;
end;

end.
