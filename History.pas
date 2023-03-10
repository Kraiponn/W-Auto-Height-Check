unit History;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, GIFImg, pngimage, jpeg, ExtCtrls;

type
  TfrmHistory = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Image2: TImage;
    Image3: TImage;
    Panel2: TPanel;
    Image1: TImage;
    mmView: TMemo;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistory: TfrmHistory;

implementation
uses highcheck;
{$R *.dfm}

procedure TfrmHistory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       main_form.AlphaBlend      := false;
       main_form.AlphaBlendValue := 255;
end;

end.
