unit comstore;

interface

uses
  SysUtils, Classes, Menus, ExtCtrls, OoMisc, AdPort, Graphics;

type
  TDataModule1 = class(TDataModule)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    E1: TMenuItem;
    About1: TMenuItem;
    systemtimer: TTimer;
    ApdComPort1: TApdComPort;
    ApdComPort2: TApdComPort;
    ComMc: TApdComPort;
    Tim_clr: TTimer;
    procedure systemtimerTimer(Sender: TObject);
    procedure ComMcTriggerAvail(CP: TObject; Count: Word);
    procedure E1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Tim_clrTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation
uses highcheck,History,Gb_Func,global_param;
{$R *.dfm}

procedure TDataModule1.About1Click(Sender: TObject);
begin
       frmHistory.ShowModal;
end;

procedure TDataModule1.ComMcTriggerAvail(CP: TObject; Count: Word);
var
   I : word;
begin
       for I := 1 to Count do
          begin
                  //main_form.edt_height.Text := main_form.edt_height.Text + ComMc.GetChar;
                  //main_form.mm.Text := main_form.mm.Text+ComMc.GetChar;
                  main_form.Memo1.Text := main_form.Memo1.Text+ComMc.GetChar;
          end;
end;

procedure TDataModule1.E1Click(Sender: TObject);
begin
       main_form.Close;
end;

procedure TDataModule1.systemtimerTimer(Sender: TObject);
begin
       main_form.StatusBar1.Panels.Items[0].Text := formatdatetime('YYYY-MM-DD HH:NN:SS',now);
end;

procedure TDataModule1.Tim_clrTimer(Sender: TObject);
begin
       Tim_clr.Enabled := false;
       with main_form do
       begin
             btn_Moving.Caption := 'COMPLETE';
             edt_p1.Text := '';
             edt_p2.Text := '';
             edt_p3.Text := '';
             edt_p4.Text := '';
             edt_p5.Text := '';
             edt_p6.Text := '';
             edt_p7.Text := '';
             edt_p8.Text := '';
             edt_p9.Text := '';
             edt_p10.Text := '';
             edt_p11.Text := '';
             edt_p12.Text := '';
             edt_p13.Text := '';
             edt_p14.Text := '';
             edt_p15.Text := '';

             edt_p1.Color := clwindow;
             edt_p2.Color := clwindow;
             edt_p3.Color:= clwindow;
             edt_p4.Color := clwindow;
             edt_p5.Color := clwindow;
             edt_p6.Color := clwindow;
             edt_p7.Color := clwindow;
             edt_p8.Color := clwindow;
             edt_p9.Color := clwindow;
             edt_p10.Color := clwindow;
             edt_p11.Color := clwindow;
             edt_p12.Color := clwindow;
             edt_p13.Color := clwindow;
             edt_p14.Color := clwindow;
             edt_p15.Color := clwindow;

             edt_slant1.Text := '';
             edt_slant2.Text := '';
             edt_slant3.Text := '';

             pnl_Height.Caption := '';
             pnl_Height.Color   := ClbtnFace;
             edt_store.Text     := '';
             edt_Ref1.Text      := '';
             Robot.Data_No      := 0;
       end;
end;

end.
