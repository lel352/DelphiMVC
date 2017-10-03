unit uSistemaControl;

interface

uses uConexao, System.SysUtils, uEmpresaModel;

type
  TSistemaControl = Class

  private
    FConexao: TConexao;
    FEmpresaModel: TEmpresaModel;

    class var FInstance: TSistemaControl;
  public
    constructor create;
    destructor destroy; override;

    procedure carregarEmpresa(codigoEmpresa: Integer);

    class function getIntance: TSistemaControl;

    property conexao: TConexao read FConexao write FConexao;
    property empresaModel: TEmpresaModel read FEmpresaModel write FEmpresaModel;
  end;

implementation

{ TSistemaControl }

procedure TSistemaControl.carregarEmpresa(codigoEmpresa: Integer);
begin
  FEmpresaModel.carregar(codigoEmpresa);
end;

constructor TSistemaControl.create;
begin
  FConexao := TConexao.create;
  FEmpresaModel := TEmpresaModel.create(1);
end;

destructor TSistemaControl.destroy;
begin
  FreeAndNil(FEmpresaModel);
  FreeAndNil(FConexao);

  inherited;
end;

class function TSistemaControl.getIntance: TSistemaControl;
begin
   if not Assigned(Self.FInstance) then begin
      Self.FInstance := TSistemaControl.Create;
   end;

   result := Self.FInstance;
end;

end.
