unit U_VisuPersonagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, rd.OpenAI.ChatGpt.ViewModel, Data.DB, Vcl.Grids, Vcl.DBGrids,
  U_Con, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Mask, ClassPersonagem;

type
  TCustom = class(TCustomDBGrid);
  TFormVisuPerso = class(TForm)
    img_Fundo: TImage;
    lb_Tittle: TLabel;
    db_Personagens: TDBGrid;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    edt_Pesq: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure db_PersonagensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edt_PesqChange(Sender: TObject);
    procedure db_PersonagensDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVisuPerso: TFormVisuPerso;
  NomeP:string;

implementation

{$R *.dfm}

procedure TFormVisuPerso.db_PersonagensDblClick(Sender: TObject);
var
  Nome:string;
begin
  Nome:=db_Personagens.DataSource.DataSet.FieldByName('nome').AsString;
  showmessage(Nome);
end;

procedure TFormVisuPerso.db_PersonagensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Odd(db_Personagens.DataSource.DataSet.RecNo) then
    db_Personagens.canvas.Brush.Color:=$0075B1C4
  else
    db_Personagens.canvas.Brush.Color:=clwhite;

  if (gdSelected in state) then begin
    db_Personagens.canvas.Brush.Color:=RGB(92,92,92);
    db_Personagens.Canvas.Font.Color:=clwhite;
    db_Personagens.canvas.font.Style:=[fsbold];
  end;

  db_Personagens.Canvas.FillRect(rect);
  db_Personagens.DefaultDrawColumnCell(rect, DataCol, Column, State);

  db_Personagens.canvas.TextRect(rect, rect.Left +1, Rect.Top +8, Column.Field.DisplayText);
end;

procedure TFormVisuPerso.edt_PesqChange(Sender: TObject);
var
  Personagem:TPersonagem;
  DataSource:TDataSource;
begin
  Personagem:=TPersonagem.Create(edt_Pesq.Text, '', '', '', '', '', 0);
  try
    DataSource:=TDataSource.Create(nil);
    DataSource.DataSet:=Personagem.SelectPersonagens;
    db_Personagens.DataSource:=DataSource;
    TCustom(db_Personagens).DefaultRowHeight:=30;
      TCustom(db_Personagens).ClientHeight:=(30 * TCustom(db_Personagens).RowCount) +30;
  finally
    Personagem.Free;
  end;
end;

procedure TFormVisuPerso.FormShow(Sender: TObject);
begin

  TCustom(db_Personagens).ScrollBars:=ssvertical;
  TCustom(db_Personagens).DefaultRowHeight:=30;
  TCustom(db_Personagens).ClientHeight:=(30 * TCustom(db_Personagens).RowCount) +30;
end;

end.
