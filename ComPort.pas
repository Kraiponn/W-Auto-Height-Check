unit ComPort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmComPort = class(TForm)
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    rad9600: TRadioButton;
    rad19200: TRadioButton;
    rad38400: TRadioButton;
    rad57600: TRadioButton;
    rad115200: TRadioButton;
    btnConnect: TButton;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    radSr_On: TRadioButton;
    radSr_Off: TRadioButton;
    procedure rad9600Click(Sender: TObject);
    procedure rad19200Click(Sender: TObject);
    procedure rad38400Click(Sender: TObject);
    procedure rad57600Click(Sender: TObject);
    procedure rad115200Click(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure radSr_OnClick(Sender: TObject);
    procedure radSr_OffClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComPort: TfrmComPort;

implementation
uses global_param,Gb_Func,comstore,highcheck;
{$R *.dfm}

procedure TfrmComPort.btnConnectClick(Sender: TObject);
begin
      with DataModule1 do
      begin
              ComMc.Open := false;
              ComMc.Baud := Robot.BaudRateMc;
              ComMc.ComNumber := 0;
              ComMc.Open      := true;
              LoadFileInitial('W COM_MC');
              Self.Close;
      end;
end;

procedure TfrmComPort.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       main_form.AlphaBlend      := false;
       main_form.AlphaBlendValue := 255;
end;

procedure TfrmComPort.rad115200Click(Sender: TObject);
begin
       Robot.BaudRateMc := 115200;
end;

procedure TfrmComPort.rad19200Click(Sender: TObject);
begin
       Robot.BaudRateMc := 19200;
end;

procedure TfrmComPort.rad38400Click(Sender: TObject);
begin
       Robot.BaudRateMc := 38400;
end;

procedure TfrmComPort.rad57600Click(Sender: TObject);
begin
       Robot.BaudRateMc := 57600;
end;

procedure TfrmComPort.rad9600Click(Sender: TObject);
begin
       Robot.BaudRateMc := 9600;
end;

procedure TfrmComPort.radSr_OffClick(Sender: TObject);
begin
       LoadFileInitial('W AUTO ZERO');
end;

procedure TfrmComPort.radSr_OnClick(Sender: TObject);
begin
       LoadFileInitial('W AUTO ZERO');
end;

end.
