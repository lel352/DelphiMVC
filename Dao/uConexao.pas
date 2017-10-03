unit uConexao;

interface

uses FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
     FireDAC.Phys.Intf, FireDAC.Stan.Def,FireDAC.Stan.Pool, FireDAC.Stan.Async,
     FireDAC.Phys, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef, FireDAC.Phys.FB,
     System.SysUtils, FireDAC.DApt, FireDAC.VCLUI.Wait;


type
  TConexao = Class
  private
    Fconn :  TFDConnection;

    procedure configurarConexao;

  public
    constructor create;
    destructor destroy; override;

    function criarQuery: TFDQuery;
    function getConn : TFDConnection;
  end;

  Const PATH_BANCO : String = 'C:\Users\Delphi\Desktop\POO Delphi inicante\MVC\DB_MVC.FDB';

implementation

{ TConexao }

procedure TConexao.configurarConexao;
begin
  Fconn.Params.DriverID := 'FB';
  Fconn.Params.Database := PATH_BANCO;
  Fconn.Params.UserName := 'SYSDBA';
  Fconn.Params.Password := 'masterkey';
  Fconn.LoginPrompt := False;
end;

constructor TConexao.create;
begin
  Fconn := TFDConnection.Create(nil);

  Self.configurarConexao;
end;

function TConexao.criarQuery: TFDQuery;
var
  vQuery : TFDQuery;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection := Fconn;

  Result := vQuery;
end;

destructor TConexao.destroy;
begin
  FreeAndNil(Fconn);
  inherited;
end;

function TConexao.getConn: TFDConnection;
begin
  result := Fconn;
end;

end.
