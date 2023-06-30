program Project1;

uses
  Vcl.Forms,
  U_Login in 'U_Login.pas' {FormLogin},
  ClassLogin in 'ClassLogin.pas',
  U_Index in 'U_Index.pas' {FormPrincipal},
  U_Con in 'U_Con.pas' {DmConn: TDataModule},
  U_NewPersonagem in 'U_NewPersonagem.pas' {FormNewPersonagem},
  ClassPersonagem in 'ClassPersonagem.pas',
  U_VisuPersonagens in 'U_VisuPersonagens.pas' {FormVisuPerso},
  U_PersonagemView in 'U_PersonagemView.pas' {FormViewP};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDmConn, DmConn);
  Application.CreateForm(TFormNewPersonagem, FormNewPersonagem);
  Application.CreateForm(TFormVisuPerso, FormVisuPerso);
  Application.CreateForm(TFormViewP, FormViewP);
  Application.Run;
end.
