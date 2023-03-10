program highcheckmc;

uses
  Forms,
  highcheck in 'highcheck.pas' {main_form},
  comstore in 'comstore.pas' {DataModule1: TDataModule},
  global_param in 'global_param.pas',
  useDLL in 'useDLL.pas',
  GpcMtn in 'GpcMtn.pas',
  Gb_Func in 'Gb_Func.pas',
  ComPort in 'ComPort.pas' {frmComPort},
  History in 'History.pas' {frmHistory};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tmain_form, main_form);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmComPort, frmComPort);
  Application.CreateForm(TfrmHistory, frmHistory);
  Application.Run;
end.
