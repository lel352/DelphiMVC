unit uClienteModel;

interface

uses uEnumerado, FireDAC.Comp.Client;

type
   TClienteModel = class
  private
    FCodigo: Integer;
    FNome: String;
    FAcao: TAcao;

    procedure setAcao(const Value: TAcao);
    procedure setCodigo(const Value: Integer);
    procedure setNome(const Value: String);
  public
    function obter: TFDQuery;
    function salvar: boolean;
    function getId(autoIncrementar: Integer): Integer;

    property codigo: Integer read Fcodigo write setCodigo;
    property nome: String read Fnome write setNome;
    property acao: TAcao read Facao write setAcao;
  end;

implementation

{ TClienteModel }

uses uClienteDao;

function TClienteModel.getId(autoIncrementar: Integer): Integer;
var
  vClienteDao: TClienteDao;
begin
  vClienteDao := TClienteDao.Create;
  try
    Result := vClienteDao.GetId(autoIncrementar);
  finally
    vClienteDao.Free;
  end;
end;

function TClienteModel.obter: TFDQuery;
var
   vClienteDao: TClienteDao;
begin
  vClienteDao := TClienteDao.create;
  try
    Result := vClienteDao.obter;
  finally
    vClienteDao.Free;
  end;

end;

function TClienteModel.salvar: boolean;
var
   clienteDao : TClienteDao;
begin
   result := False;
   clienteDao := TClienteDao.Create;
   try
      case FAcao of
         uEnumerado.tacIncluir: Result := clienteDao.incluir(Self);
         uEnumerado.tacAlterar: Result := clienteDao.alterar(Self);         
         uEnumerado.tacExcluir: Result := clienteDao.deletar(Self);
      end;   
   finally
      clienteDao.Free;
   end;
end;

procedure TClienteModel.setAcao(const Value: TAcao);
begin
  Facao := Value;
end;

procedure TClienteModel.setCodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TClienteModel.setNome(const Value: String);
begin
  Fnome := Value;
end;

end.
