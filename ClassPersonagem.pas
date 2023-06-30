unit ClassPersonagem;

interface

uses U_Con,FireDAC.Comp.Client, FireDAC.DApt;

type

  TPersonagem = class
  private
    FNome:string;
    FRaca:string;
    FDataNasc:TDate;
    FOcupacao:string;
    FRespiracao:string;
    FHabilidades:string;
    FPoderes:string;
  public
    constructor Create(const ANome, ARaca, AOcupacao, ARespiracao, AHabilidades, APoderes:string; ADataNasc:TDate);
    function CadNovoPersonagem:TPersonagem;
    function SelectPersonagens:TFdQuery;
  end;

implementation

{ TPersonagem }

function TPersonagem.CadNovoPersonagem: TPersonagem;
var
  Query:TFdQuery;
begin
  Query:=TFdQuery.Create(nil);
  Query.Connection:=DmConn.Conn;
  try
    Query.SQL.Clear;
    Query.SQL.Text:='INSERT INTO personagens (nome, raca, data_nasc, ocupacao, respiracoes, habilidades, poderes)'+
    ' VALUES(:nome, :raca, :data_nasc, :ocupacao, :respiracoes, :habilidades, :poderes)';
    Query.ParamByName('nome').AsString:=FNome;
    Query.ParamByName('raca').AsString:=FRaca;
    Query.ParamByName('data_nasc').AsDatetime:=FDataNasc;
    Query.ParamByName('ocupacao').AsString:=FOcupacao;
    Query.ParamByName('respiracoes').AsString:=FRespiracao;
    Query.ParamByName('habilidades').AsString:=FHabilidades;
    Query.ParamByName('poderes').AsString:=FPoderes;
    Query.ExecSQL;
    result:=Self;
  finally
    Query.Free;
  end;
end;

constructor TPersonagem.Create(const ANome, ARaca, AOcupacao, ARespiracao,
  AHabilidades, APoderes: string; ADataNasc: TDate);
begin
  FNome:=ANome;
  FRaca:=ARaca;
  FDataNasc:=ADataNasc;
  FOcupacao:=AOcupacao;
  FRespiracao:=ARespiracao;
  FHabilidades:=AHabilidades;
  FPoderes:=APoderes;
end;

function TPersonagem.SelectPersonagens: TFDQuery;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := DmConn.Conn;
  Query.SQL.Clear;
  Query.SQL.Text := 'SELECT * FROM personagens WHERE nome LIKE :filtro';
  Query.ParamByName('filtro').AsString := '%' + FNome + '%';
  try
    Query.Open;
    Result := Query;
  except
    Query.Free;
    raise;
  end;
end;

end.
