unit uFrmPrincipalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.ActnMenus, uFrmClienteView, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    ActionManager1: TActionManager;
    Action1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uSistemaControl;

procedure TfrmPrincipal.Action1Execute(Sender: TObject);
begin
   Application.CreateForm(TFrmCadastroCliente, frmCadastroCliente);
   try
      FrmCadastroCliente.ShowModal
   finally
      FrmCadastroCliente.Release;
   end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  TSistemaControl.getIntance();
  TSistemaControl.getIntance().carregarEmpresa(1);

  StatusBar1.Panels[0].Text := 'Vers�o: 1.0';

  StatusBar1.Panels[1].Text := 'Empresa: ' + FormatFloat('00', TSistemaControl.getIntance().empresaModel.codigo) + ' - ' +
  TSistemaControl.getIntance().empresaModel.razaoSocial;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  TSistemaControl.getIntance().Destroy;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
