unit uClienteDao;

interface

uses uClienteModel, FireDac.Comp.Client, uConexao, System.SysUtils;

type
   TClienteDao = class
   private
     FConexao: TConexao;
   public
      constructor create;

      function incluir(clienteModel: TClienteModel): boolean;
      function alterar(clienteModel: TClienteModel): boolean;
      function deletar(clienteModel: TClienteModel): boolean;
      function getId(autoIncrementar: Integer): Integer;
      function obter: TFDQuery;
   end;

implementation

{ TClienteDao }

uses uSistemaControl;

function TClienteDao.alterar(clienteModel: TClienteModel): boolean;
var
  vQuery : TFDQuery;
begin
  vQuery := FConexao.criarQuery;
  try
     try
       vQuery.ExecSQL('update cliente set nome = :nome where (codigo = :codigo)',[clienteModel.nome,clienteModel.codigo]);
       result := True;
     except
       result := False;
     end;
  finally
     vQuery.Free;
  end;
end;

constructor TClienteDao.create;
begin
   FConexao := TSistemaControl.getIntance.conexao;
end;

function TClienteDao.deletar(clienteModel: TClienteModel): boolean;
var
  vQuery : TFDQuery;
begin
  vQuery := FConexao.criarQuery;
  try
     try
       vQuery.ExecSQL('delete from cliente where codigo = :codigo',[clienteModel.codigo]);
       result := True;
     except
       result := False;
     end;
  finally
     vQuery.Free;
  end;
end;

function TClienteDao.getId(autoIncrementar: Integer): Integer;
var
  vQuery: TFDQuery;
begin
  vQuery := FConexao.CriarQuery();
  try
    vQuery.Open('select gen_id(gen_cliente_id, ' + IntToStr(autoIncrementar) + ' ) from rdb$database');
    try
      Result := vQuery.Fields[0].AsInteger;
    finally
      vQuery.Close;
    end;
  finally
    vQuery.Free;
  end;
end;

function TClienteDao.incluir(clienteModel: TClienteModel): boolean;
var
  vQuery : TFDQuery;
begin
  vQuery := FConexao.criarQuery;
  try
     try
       vQuery.ExecSQL('Insert into cliente (codigo,nome) values (:codigo, :nome)',[clienteModel.codigo,clienteModel.nome]);
       result := True;
     except
       result := False;
     end;

  finally
     vQuery.Free;
  end;
end;

function TClienteDao.obter: TFDQuery;
var
  vQuery : TFDQuery;
begin
  vQuery := FConexao.criarQuery;
  vQuery.Open('Select codigo, nome From Cliente');
  result := vQuery;
end;

end.
