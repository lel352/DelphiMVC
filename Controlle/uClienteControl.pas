unit uClienteControl;

interface

uses uClienteModel, System.SysUtils, FireDAC.Comp.Client;

type
   TClienteControl = Class

   private
      FClienteModel: TClienteModel;

   public
      constructor create;
      destructor Destroy; override;

      Function obter: TFDQuery;
      function salvar: Boolean;

      property clienteModel: TClienteModel read FClienteModel write FClienteModel;
   end;

implementation

{ TClienteControl }

constructor TClienteControl.create;
begin
   FClienteModel := TClienteModel.Create;
end;

destructor TClienteControl.Destroy;
begin
  FreeAndNil(FClienteModel);
  inherited;
end;

function TClienteControl.obter: TFDQuery;
begin
   Result := FClienteModel.obter;
end;

function TClienteControl.salvar: Boolean;
begin
   result := FClienteModel.salvar;
end;

end.
