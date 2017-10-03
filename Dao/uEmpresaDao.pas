unit uEmpresaDao;

interface

uses uEmpresaModel, FireDAC.Comp.Client, uSistemaControl, System.SysUtils;

Type
   TEmpresaDao = Class
      procedure carregar(empresaModel: TEmpresaModel; codigo: Integer);
   end;

implementation

{ TEmpresaDao }

procedure TEmpresaDao.carregar(empresaModel: TEmpresaModel; codigo: Integer);
var
  vQuery : TFDQuery;
begin
  vQuery := TSistemaControl.getIntance().conexao.criarQuery;
  try
    vQuery.Open('Select codigo, RAZAO_SOCIAL from empresa where codigo = :codigo',[codigo]);
    try
       empresaModel.codigo := vQuery.Fields[0].AsInteger;
       empresaModel.razaoSocial := vQuery.Fields[1].AsString;
    finally
       vQuery.Close;
    end;
  finally
     FreeAndNil(vQuery);
  end;
end;

end.
