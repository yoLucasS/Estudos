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
    FId:integer;
  public
    constructor Create(const ANome, ARaca, AOcupacao, ARespiracao, AHabilidades, APoderes:string; ADataNasc:TDate; AId:integer);
    procedure refresh;
    function CadNovoPersonagem:string;
    function SelectPersonagens:TFdQuery;
    function UpdatePersonagem:TFdQuery;
  end;

implementation

{ TPersonagem }
uses U_VisuPersonagens;

function TPersonagem.CadNovoPersonagem: string;
var
  Query:TFdQuery;
begin
  Query:=TFdQuery.Create(nil);
  Query.Connection:=DmConn.Conn;
  try
    Query.SQL.Clear;
    Query.SQL.Text:='INSERT INTO personagens (nome, raca, data_nasc, ocupacao, respiracoes, habilidades, poderes)'+
    ' VALUES(:nome, :raca, :data_nasc, :ocupacao, :respiracoes, :habilidades, :poderes) RETURNING nome';
    Query.ParamByName('nome').AsString:=FNome;
    Query.ParamByName('raca').AsString:=FRaca;
    Query.ParamByName('data_nasc').AsDatetime:=FDataNasc;
    Query.ParamByName('ocupacao').AsString:=FOcupacao;
    Query.ParamByName('respiracoes').AsString:=FRespiracao;
    Query.ParamByName('habilidades').AsString:=FHabilidades;
    Query.ParamByName('poderes').AsString:=FPoderes;
    Query.Open;
    result:=Query.FieldByName('nome').Value;
  finally
    refresh;
    Query.Free;
  end;
end;

constructor TPersonagem.Create(const ANome, ARaca, AOcupacao, ARespiracao,
  AHabilidades, APoderes: string; ADataNasc: TDate; AId:integer);
begin
  FNome:=ANome;
  FRaca:=ARaca;
  FDataNasc:=ADataNasc;
  FOcupacao:=AOcupacao;
  FRespiracao:=ARespiracao;
  FHabilidades:=AHabilidades;
  FPoderes:=APoderes;
  FId:=AId;
end;

procedure TPersonagem.refresh;
begin
  FormVisuPerso.db_Personagens.DataSource.DataSet.Refresh;
end;

function TPersonagem.SelectPersonagens:TFDQuery;
var
  Query: TFDQuery;
begin
  Query:=TFDQuery.Create(nil);
  Query.Connection:=DmConn.Conn;
  Query.SQL.Clear;
  Query.SQL.Text:='SELECT * FROM personagens WHERE nome LIKE :filtro or respiracoes LIKE :filtro';
  Query.ParamByName('filtro').AsString:='%' + FNome + '%';
  try
    Query.Open;
    Result:=Query;
  except
    Query.Free;
    refresh;
    raise;
  end;
end;

function TPersonagem.UpdatePersonagem:TfDQuery;
var
  Query:TfDQuery;
begin
  Query:=TfDQuery.Create(nil);
  Query.Connection:=DmConn.Conn;
  try
    Query.SQL.Clear;
    Query.SQL.Text:='UPDATE personagens SET nome = :nome, data_nasc = :nasc, ocupacao = :ocupacao, respiracoes = :resp, habilidades = :habilidades, poderes = :poderes, raca = :raca'+
      ' WHERE id_personagem = :idP';
    Query.ParamByName('nome').AsString:=FNome;
    Query.ParamByName('nasc').AsDate:=FDataNasc;
    Query.ParamByName('ocupacao').AsString:=FOcupacao;
    Query.ParamByName('resp').AsString:=FRespiracao;
    Query.ParamByName('habilidades').AsString:=FHabilidades;
    Query.ParamByName('poderes').AsString:=FPoderes;
    Query.ParamByName('raca').AsString:=FRaca;
    Query.ParamByName('idP').AsInteger:=FId;
    Query.ExecSQL;
    result:=Query;
  finally
    Query.Free;
     refresh;
  end;

end;

end.
