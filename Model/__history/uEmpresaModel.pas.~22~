unit uEmpresaModel;

interface

uses System.SysUtils;

type
   TEmpresaModel = Class
  private
    FCodigo: Integer;
    FRazaoSocial: String;

    procedure setCodigo(const Value: Integer);
    procedure setrazaoSocial(const Value: String);
  public
    constructor create(codigo:Integer);
    procedure carregar(codigo:Integer);

    property codigo: Integer read FCodigo write setCodigo;
    property razaoSocial: String read FRazaoSocial write setRazaoSocial;
  end;
implementation

{ TEmpresa }

uses uEmpresaDao;

procedure TEmpresaModel.carregar(codigo:Integer);
var
  empresaDao: TEmpresaDao;
begin
  empresaDao := TEmpresaDao.Create;
  try
     empresaDao.carregar(self,codigo);
  finally
     FreeAndNil(empresaDao);
  end;               
end;

constructor TEmpresaModel.create(codigo: Integer);
begin
   FCodigo := codigo;
end;

procedure TEmpresaModel.setCodigo(const Value: Integer);
begin
   FCodigo := Value;
end;

procedure TEmpresaModel.setrazaoSocial(const Value: String);
begin
   FRazaoSocial := Value;
end;

end.
