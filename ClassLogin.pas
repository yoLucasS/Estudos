unit ClassLogin;

interface

uses
  U_Con, Vcl.Dialogs, FireDAC.Comp.Client, System.SysUtils, FireDAC.DApt;

type
  TPessoa = class
  private
    FUser: string;
    FSenha: string;
  public
    constructor Create(const AUser, ASenha: string);
    function SelectUser: Boolean;
  end;

implementation

{ TPessoa }

constructor TPessoa.Create(const AUser, ASenha: string);
begin
  FUser:=AUser;
  FSenha:=ASenha;
end;

function TPessoa.SelectUser: Boolean;
var
  Query:TFDQuery;
begin
  Query:=TFDQuery.Create(nil);
  Query.Connection:=DmConn.Conn;
  try
    Query.SQL.Clear;
    Query.SQL.Text:='SELECT * FROM usuarios' +
      ' WHERE username = :username and senha = :senha';
    Query.ParamByName('username').AsString:=FUser;
    Query.ParamByName('senha').AsString:=FSenha;
    Query.Open;
    Result:=not Query.IsEmpty;
  finally
    Query.Free;
  end;
end;

end.
