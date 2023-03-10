unit highcheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Buttons, OoMisc, AdPort,
  ShellApi, jpeg;

type
  Tmain_form = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    PageControl1: TPageControl;
    ts_param: TTabSheet;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    et_xp1: TEdit;
    Label8: TLabel;
    et_xp3: TEdit;
    et_xp2: TEdit;
    et_xp5: TEdit;
    et_xp4: TEdit;
    et_yp5: TEdit;
    et_yp4: TEdit;
    et_yp3: TEdit;
    et_yp2: TEdit;
    et_yp1: TEdit;
    Label9: TLabel;
    gb_robotcontrol: TGroupBox;
    bt_origin: TButton;
    bt_servoon: TButton;
    bt_servooff: TButton;
    bt_mode: TButton;
    et_movex: TEdit;
    et_movey: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    bt_movepoint: TButton;
    Label16: TLabel;
    mm_status: TMemo;
    bt_Clear: TButton;
    ts_Specification: TTabSheet;
    et_p1lower: TEdit;
    et_p1upper: TEdit;
    et_p2lower: TEdit;
    et_p2upper: TEdit;
    et_p4lower: TEdit;
    et_p3lower: TEdit;
    et_p3upper: TEdit;
    et_p4upper: TEdit;
    et_p5lower: TEdit;
    et_p5upper: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    pnlStt: TPanel;
    BitBtn1: TBitBtn;
    Timer1: TTimer;
    TabSheet2: TTabSheet;
    btn_Moving: TButton;
    spdConfigPort: TSpeedButton;
    spdChkCom: TSpeedButton;
    spdNotePad: TSpeedButton;
    spdCal: TSpeedButton;
    spdSpec: TSpeedButton;
    spdHistory: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    GroupBox3: TGroupBox;
    cmbProcessNo: TComboBox;
    GroupBox9: TGroupBox;
    edt_height: TEdit;
    edt_store: TEdit;
    bbt_SaveProNo: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    et_xp6: TEdit;
    et_yp6: TEdit;
    et_xp7: TEdit;
    et_yp7: TEdit;
    et_xp8: TEdit;
    et_yp8: TEdit;
    et_xp9: TEdit;
    et_yp9: TEdit;
    et_xp10: TEdit;
    et_yp10: TEdit;
    et_xp11: TEdit;
    et_yp11: TEdit;
    et_xp12: TEdit;
    et_yp12: TEdit;
    et_xp13: TEdit;
    et_yp13: TEdit;
    et_xp14: TEdit;
    et_yp14: TEdit;
    Label42: TLabel;
    et_xp15: TEdit;
    et_yp15: TEdit;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    lbl_sp13: TLabel;
    lbl_sp14: TLabel;
    lbl_sp15: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label39: TLabel;
    Button3: TButton;
    Button4: TButton;
    Label40: TLabel;
    edtComM1: TEdit;
    spdExit2: TSpeedButton;
    GroupBox5: TGroupBox;
    edt_Max: TEdit;
    edt_Min: TEdit;
    Label41: TLabel;
    Label46: TLabel;
    spdSave: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Label47: TLabel;
    Label48: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    pnl_SttMove: TPanel;
    Button1: TButton;
    Button2: TButton;
    spdConn: TSpeedButton;
    bt_robotconnect: TButton;
    mm: TMemo;
    Edit5: TEdit;
    Button5: TButton;
    bt_moving: TButton;
    Button6: TButton;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox12: TGroupBox;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    EdtX12_1: TEdit;
    EdtX12_2: TEdit;
    EdtY12_1: TEdit;
    EdtY12_2: TEdit;
    GroupBox11: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    GroupBox14: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    GroupBox13: TGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    GroupBox15: TGroupBox;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    GroupBox16: TGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    GroupBox17: TGroupBox;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    GroupBox18: TGroupBox;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    GroupBox19: TGroupBox;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    GroupBox20: TGroupBox;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    GroupBox21: TGroupBox;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    GroupBox22: TGroupBox;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    EdtX14_1: TEdit;
    EdtX14_2: TEdit;
    EdtX13_1: TEdit;
    EdtX13_2: TEdit;
    EdtX15_1: TEdit;
    EdtX15_2: TEdit;
    EdtY13_1: TEdit;
    EdtY13_2: TEdit;
    EdtY15_1: TEdit;
    EdtY15_2: TEdit;
    EdtY14_1: TEdit;
    EdtY14_2: TEdit;
    EdtX4_1: TEdit;
    EdtX4_2: TEdit;
    EdtX6_1: TEdit;
    EdtX6_2: TEdit;
    EdtX5_1: TEdit;
    EdtX5_2: TEdit;
    EdtX7_1: TEdit;
    EdtX7_2: TEdit;
    EdtY4_1: TEdit;
    EdtY4_2: TEdit;
    EdtY6_1: TEdit;
    EdtY6_2: TEdit;
    EdtY5_1: TEdit;
    EdtY5_2: TEdit;
    EdtY7_1: TEdit;
    EdtY7_2: TEdit;
    EdtX8_1: TEdit;
    EdtX8_2: TEdit;
    EdtX10_1: TEdit;
    EdtX10_2: TEdit;
    EdtX11_1: TEdit;
    EdtX11_2: TEdit;
    EdtX9_1: TEdit;
    EdtX9_2: TEdit;
    EdtY8_1: TEdit;
    EdtY8_2: TEdit;
    EdtY10_1: TEdit;
    EdtY10_2: TEdit;
    EdtY9_1: TEdit;
    EdtY9_2: TEdit;
    EdtY11_2: TEdit;
    EdtY11_1: TEdit;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    GroupBox4: TGroupBox;
    edtSpeed: TEdit;
    btnSpeed: TButton;
    GroupBox2: TGroupBox;
    bbtSsS: TBitBtn;
    GroupBox23: TGroupBox;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    GroupBox24: TGroupBox;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    GroupBox26: TGroupBox;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    EdtX2_1: TEdit;
    EdtX2_2: TEdit;
    EdtX3_1: TEdit;
    EdtX3_2: TEdit;
    EdtY2_1: TEdit;
    EdtY2_2: TEdit;
    EdtY3_1: TEdit;
    EdtY3_2: TEdit;
    EdtX1_1: TEdit;
    EdtX1_2: TEdit;
    EdtY1_1: TEdit;
    EdtY1_2: TEdit;
    bbtCreate: TBitBtn;
    GroupBox6: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    lbl_point13: TLabel;
    lbl_point14: TLabel;
    lbl_point15: TLabel;
    edt_p1: TEdit;
    edt_p2: TEdit;
    edt_p3: TEdit;
    edt_p4: TEdit;
    edt_p5: TEdit;
    edt_p6: TEdit;
    edt_p7: TEdit;
    edt_p8: TEdit;
    edt_p9: TEdit;
    edt_p10: TEdit;
    edt_p11: TEdit;
    edt_p12: TEdit;
    edt_p13: TEdit;
    edt_p14: TEdit;
    edt_p15: TEdit;
    bbt_Res: TBitBtn;
    bbt_Svoff: TBitBtn;
    bbt_Svon: TBitBtn;
    EdtP1ResultMin: TEdit;
    GroupBox27: TGroupBox;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    EdtP4: TEdit;
    EdtP6: TEdit;
    EdtP5: TEdit;
    EdtP7: TEdit;
    EdtP8: TEdit;
    EdtP10: TEdit;
    EdtP9: TEdit;
    EdtP11: TEdit;
    EdtP12: TEdit;
    EdtP14: TEdit;
    EdtP13: TEdit;
    EdtP15: TEdit;
    GroupBox28: TGroupBox;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    edtSlant2: TEdit;
    edtSlant3: TEdit;
    edtSlant4: TEdit;
    EdtP2ResultMax: TEdit;
    EdtP2ResultMin: TEdit;
    EdtP3ResultMax: TEdit;
    EdtP3ResultMin: TEdit;
    bbt_Start: TBitBtn;
    GroupBox25: TGroupBox;
    edt_Total: TEdit;
    BitBtn2: TBitBtn;
    GroupBox8: TGroupBox;
    lbl_slant1: TLabel;
    lbl_slant2: TLabel;
    lbl_slant3: TLabel;
    lbl_Ref1: TLabel;
    edt_slant1: TEdit;
    edt_Slant3: TEdit;
    edt_slant2: TEdit;
    edt_Ref1: TEdit;
    Memo1: TMemo;
    GroupBox7: TGroupBox;
    lblWait: TLabel;
    pnl_height: TPanel;
    Panel2: TPanel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    EdtP1: TEdit;
    EdtP2: TEdit;
    EdtP3: TEdit;
    pnl_Busy: TPanel;
    EdtP1ResultMax: TEdit;
    GroupBox10: TGroupBox;
    GroupBox29: TGroupBox;
    Label147: TLabel;
    Label148: TLabel;
    edt_4_15max: TEdit;
    edt_4_15min: TEdit;
    GroupBox30: TGroupBox;
    Label149: TLabel;
    Label150: TLabel;
    edt_4_7max: TEdit;
    edt_4_7min: TEdit;
    GroupBox31: TGroupBox;
    Label151: TLabel;
    Label152: TLabel;
    edt_8_11max: TEdit;
    edt_8_11min: TEdit;
    GroupBox32: TGroupBox;
    Label153: TLabel;
    Label154: TLabel;
    edt_12_15max: TEdit;
    edt_12_15min: TEdit;
    bbt_SaveSpec: TBitBtn;
    Button7: TButton;
    SpeedButton1: TSpeedButton;
    bt_save: TButton;
    BitBtn4: TBitBtn;
    TabSheet7: TTabSheet;
    Panel3: TPanel;
    Image2: TImage;
    Label155: TLabel;
    Label156: TLabel;
    l_slant2: TLabel;
    l_slant3: TLabel;
    l_slant4: TLabel;
    l_slant1: TLabel;
    edtSlant1: TEdit;
    Label146: TLabel;
    lbl8_11: TLabel;
    lbl4_7: TLabel;
    lbl12_15: TLabel;
    GroupBox33: TGroupBox;
    edt_Zx: TEdit;
    edt_Zy: TEdit;
    Label157: TLabel;
    Label158: TLabel;
    lbl_Sep_Date: TLabel;
    procedure bt_robotconnectClick(Sender: TObject);
    procedure bt_modeClick(Sender: TObject);
    procedure bt_servoonClick(Sender: TObject);
    procedure bt_servooffClick(Sender: TObject);
    procedure bt_originClick(Sender: TObject);
    procedure bt_movepointClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure bt_ClearClick(Sender: TObject);
    procedure bbtSsSClick(Sender: TObject);
    procedure edt_heightChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure bbt_ResClick(Sender: TObject);
    procedure bbt_SvoffClick(Sender: TObject);
    procedure bbt_SvonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbt_StartClick(Sender: TObject);
    procedure bbt_SaveProNoClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure bt_saveClick(Sender: TObject);
    procedure btnSpeedClick(Sender: TObject);
    procedure spdHistoryClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure spdChkComClick(Sender: TObject);
    procedure spdNotePadClick(Sender: TObject);
    procedure spdCalClick(Sender: TObject);
    procedure spdConfigPortClick(Sender: TObject);
    procedure spdSaveClick(Sender: TObject);
    procedure bbtCreateClick(Sender: TObject);
    procedure spdConnClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure bt_movingClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbt_SaveSpecClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  main_form: Tmain_form;

implementation
uses comstore,usedll,global_param,gpcmtn,ComPort,Gb_Func,History;
{$R *.dfm}



procedure Tmain_form.bbtCreateClick(Sender: TObject);
begin
       lbl_Sep_Date.Caption := Read_Or_Write_Files('R dd');
       if lbl_Sep_Date.Caption <> FormatDateTime('yyyy-mm-dd',now) then
           Init_LogFile();
end;

procedure Tmain_form.bbtSsSClick(Sender: TObject);
begin
       main_form.AlphaBlend      := true;
       main_form.AlphaBlendValue := 99;
       frmComPort.ShowModal;
end;

procedure Tmain_form.bbt_StartClick(Sender: TObject);
var
    Re : real ;
    ReMax,ReMin : real ;
    Rp1,Rp2,Rp3,Rp4 : real ;
    SpMax ,SpMin : real ;
    Pr : real ;
    slant2,slant3,slant4 : real;
    sl4_15   : real;
    j1,j2,j3,j4 : boolean;
    i        : Integer;
    DataAv   : array[0..11] of real;
begin

    /////// Prepaer.............................................................
    for i := 1 to 15 do
    begin
          Gb_Point[i].Text := ''  ;
    end;

     edtp1.Text := '';
     edtp2.Text := '';
     edtp3.Text := '';
     edtp4.Text := '';
     edtp5.Text := '';
     edtp6.Text := '';
     edtp7.Text := '';
     edtp8.Text := '';
     edtp9.Text := '';
     edtp10.Text := '';
     edtp11.Text := '';
     edtp12.Text := '';
     edtp13.Text := '';
     edtp14.Text := '';
     edtp15.Text := '';

     edtp1.Color := clwindow;
     edtp2.Color := clwindow;
     edtp3.Color := clwindow;
     edtp4.Color := clwindow;
     edtp5.Color := clwindow;
     edtp6.Color := clwindow;
     edtp7.Color := clwindow;
     edtp8.Color := clwindow;
     edtp9.Color := clwindow;
     edtp10.Color := clwindow;
     edtp11.Color := clwindow;
     edtp12.Color := clwindow;
     edtp13.Color := clwindow;
     edtp14.Color := clwindow;
     edtp15.Color := clwindow;

    edtSlant1.Text := '' ;
    edtSlant2.Text := '' ;
    edtSlant3.Text := '' ;
    edtSlant4.Text := '' ;

    edtSlant1.Color := ClWhite ;
    edtSlant2.Color := ClWhite ;
    edtSlant3.Color := ClWhite ;
    edtSlant4.Color := ClWhite ;

//    EdtP1ResultMin.Text := '' ;
//    EdtP2ResultMin.Text := '' ;
//    EdtP3ResultMin.Text := '' ;
//
//    EdtP1ResultMin.Color := ClWhite ;
//    EdtP2ResultMin.Color := ClWhite ;
//    EdtP3ResultMin.Color := ClWhite ;

    pnl_Busy.Color   := ClYellow ;
    pnl_Busy.Caption := 'BUSY' ;

    SpMax := StrToFloat(edt_Max.Text) ;
    SpMin := StrToFloat(edt_Min.Text) ;

    /////// Set Zero Point.
    Memo1.Clear ;
    Move_StartPoint(EdtX1_1.Text,EdtY1_1.Text);
    DataModule1.ComMc.PutString('V1'+#13);
    delay(200) ;

    /////// Point 1.............................................................
    //edtSlant1.Text := '0.000';
    Rp1 := GetPoint(6) ;
    delay(100) ;

    Rp2 := GetPoint(4) ;
    delay(100) ;

    Rp3 := GetPoint(7) ;
    delay(100) ;

    Rp4 := GetPoint(5) ;
    delay(100) ;



    ReMax := FindMax(Rp1,Rp2,Rp3,Rp4);
    ReMin := FindMin(Rp1,Rp2,Rp3,Rp4);
    DataAv[0] := Rp1;   DataAv[1] := Rp2;
    DataAv[2] := Rp3;   DataAv[3] := Rp4;

    slant2 := ReMax-ReMin;
    edtSlant2.Text := FormatFloat('0.000',slant2);

    if (slant2 >= 0) and (slant2 <= Robot.ref_slant2) then
      begin
              j2 := true;
              edtSlant2.Color := Cllime;
      end
    else
      begin
              j2 := false;
              edtSlant2.Color := Clred;
      end;

//    if (ReMin >= SpMin)and(ReMax <= SpMax) then
//        EdtP1ResultMax.Color := Cllime
//    else
//        EdtP1ResultMax.Color := ClRed ;

    /////// Point 2.............................................................
    Rp1 := GetPoint(10);
    delay(100) ;

    Rp2 := GetPoint(8);
    delay(100) ;

    Rp3 := GetPoint(11);
    delay(100) ;

    Rp4 := GetPoint(9);
    delay(100) ;

    ReMax := FindMax(Rp1,Rp2,Rp3,Rp4) ;
    ReMin := FindMin(Rp1,Rp2,Rp3,Rp4) ;
    DataAv[4] := Rp1;   DataAv[5] := Rp2;
    DataAv[6] := Rp3;   DataAv[7] := Rp4;

    slant3 := ReMax-ReMin;
    edtSlant3.Text := FormatFloat('0.000',slant3) ;


    if (slant3 >= 0) and (slant3 <= Robot.ref_slant3) then
      begin
              j3 := true;
              edtSlant3.Color := Cllime;
      end
    else
      begin
              j3 := false;
              edtSlant3.Color := Clred;
      end;

    /////// Point 3.............................................................
    Rp1 := GetPoint(14) ;
    delay(100) ;

    Rp2 := GetPoint(12) ;
    delay(100) ;

    Rp3 := GetPoint(15) ;
    delay(100) ;

    Rp4 := GetPoint(13) ;
    delay(100) ;

    ReMax := FindMax(Rp1,Rp2,Rp3,Rp4) ;
    ReMin := FindMin(Rp1,Rp2,Rp3,Rp4) ;

    DataAv[8]  := Rp1;   DataAv[9]  := Rp2;
    DataAv[10] := Rp3;   DataAv[11] := Rp4;

    slant4 := ReMax-ReMin;
    edtSlant4.Text := FormatFloat('0.000',slant4) ;


    if (slant4 >= 0) and (slant4 <= Robot.ref_slant4) then
      begin
              j4 := true;
              edtSlant4.Color := Cllime;
      end
    else
      begin
              j4 := false;
              edtSlant4.Color := Clred;
      end;

    MaxHeight := Find_Max(DataAv);
    MinHeight := Find_Min(DataAv);
    sl4_15    := MaxHeight-MinHeight;
    edtSlant1.Text :=  FormatFloat('0.000',sl4_15);
//    if (sl4_15 >= 0) and (sl4_15 <= Robot.ref_slant1) then
//    begin
//            j1 := true;
//            //edtSlant1.Color := Cllime;
//    end
//    else
//    begin
//            j1 := false;
//            edtSlant1.Color := Clred;
//    end;

     j1 := Calulate_Process4();

    /////// Total Judge.........................................................
    if (j1 = true) and (j2 = true) and (j3 = true) and (j4 = true)  then
    begin
            LoadFileInitial('W COUNT DATA');
            pnl_Busy.Caption := 'OK' ;
            pnl_Busy.Color   := Cllime ;
            Save_LogFile(true);
    end else
    begin
            LoadFileInitial('W COUNT DATA');
            pnl_Busy.Caption := 'NG' ;
            pnl_Busy.Color   := ClRed ;
            Save_LogFile(false);
    end;

    /////// Move to Initial.....................................................
    Move_StartPoint(EdtX1_1.Text,EdtY1_1.Text);
end;

procedure Tmain_form.bbt_SvoffClick(Sender: TObject);
begin
       ServoOff();
end;

procedure Tmain_form.bbt_SvonClick(Sender: TObject);
begin
       ServoOn();
       sleep(500);
       Robot_Speed();
end;

procedure Tmain_form.bbt_SaveProNoClick(Sender: TObject);
begin
       LoadFileInitial('W PROCESS NO');
       LoadFileInitial('R POINT CONTROL');
end;

procedure Tmain_form.bbt_SaveSpecClick(Sender: TObject);
begin
       LoadFileInitial('W SPEC');
end;

procedure Tmain_form.BitBtn2Click(Sender: TObject);
begin
       //Dat_Total := strtoint(edt_Total.Text);
       LoadFileInitial('W COUNT DATAe');
end;

procedure Tmain_form.BitBtn3Click(Sender: TObject);
begin
       ResetError(3);
end;

procedure Tmain_form.BitBtn4Click(Sender: TObject);
begin
       Close;
end;

procedure Tmain_form.bbt_ResClick(Sender: TObject);
begin
       ResetError(3);
       DataModule1.Tim_clr.Interval := 1300;
       DataModule1.Tim_clr.Enabled  := true;
end;

procedure Tmain_form.btnSpeedClick(Sender: TObject);
begin
       LoadFileInitial('W SERVO SPEED');
end;

procedure Tmain_form.bt_ClearClick(Sender: TObject);
begin
       mm_status.Clear;
       Timer1.Enabled := true;
       Move_StartPoint(edt_Zx.Text,edt_Zy.Text);
       Timer1.Enabled := false;
end;

procedure Tmain_form.bt_modeClick(Sender: TObject);
var mode : integer;
begin
      mm_status.Clear;
      SetRemoteMode(1);
      sleep(100);
      GetRemoteMode(mode);
      mm_status.Text :=  '  Please wait for check mode..'+slinebreak;
      sleep(1000);
      Move_StartPoint(et_xp1.Text,et_yp1.Text);
      sleep(2000);
      ResetError(3);
      sleep(1000);
      mm_status.Text := mm_status.Text+'Complete for check'+slinebreak+
                        'Mode : '+inttostr(mode);
end;

procedure Tmain_form.bt_movepointClick(Sender: TObject);
begin
         Timer1.Enabled := true;
         if pnlStt.Color  = clLime then
         begin
                mm_status.Clear;
                Move_StartPoint(EdtX1_1.Text,EdtY1_1.Text);
         end

         else
         begin
                pnlStt.Color := clRed;
                pnlStt.Caption := 'MOTOR ERROR';
                ShowMessage('   Servo motor never on, Please open servo motor before execute.');
         end;

         Timer1.Enabled := false;
end;

procedure Tmain_form.bt_movingClick(Sender: TObject);
begin
       Move_StartPoint(EdtX1_1.Text,EdtY1_1.Text);
end;

procedure Tmain_form.bt_originClick(Sender: TObject);
begin
          ORIGIN_POINT();
end;

procedure Tmain_form.bt_robotconnectClick(Sender: TObject);
begin
       LoadFileInitial('W COMm1');
       mm_status.Clear;
       ClosePort();                             //---> Close before Open
       robot_port := self.Handle;               //---> get handle
       OpenPort(edtComM1.Text,38400,robot_port);
       if not IsPortOpened()then
       mm_status.Text := 'Comport not Open' else
       mm_status.Text := 'Comport is Opened';
end;

procedure Tmain_form.bt_saveClick(Sender: TObject);
begin
       LoadFileInitial('W POINT CONTROL');
end;

procedure Tmain_form.bt_servooffClick(Sender: TObject);
begin
        ServoOff();
end;

procedure Tmain_form.bt_servoonClick(Sender: TObject);
begin
        ServoOn();
        sleep(500);
        LoadFileInitial('W SERVO SPEED');
end;

procedure Tmain_form.Button3Click(Sender: TObject);
begin
      with DataModule1 do
      begin
            Commc.PutString('AQ'+#13);  sleep(1000);
            Commc.PutString('V1'+#13);  sleep(1000);
            Commc.PutString('AQ'+#13);  sleep(500);
            Commc.PutString('AS'+#13);  sleep(700);
            Commc.PutString('AP'+#13);  sleep(900);
            Commc.PutString('AO,1'+#13);
      end;
end;

procedure Tmain_form.Button4Click(Sender: TObject);
begin
       mm.Clear;   Edit5.Text := '';
end;

procedure Tmain_form.Button5Click(Sender: TObject);
begin
         DataModule1.ComMc.PutString(Edit5.Text+#13)
end;

procedure Tmain_form.Button6Click(Sender: TObject);
begin
    Move_StartPoint('40000','20000');
    Move_StartPoint('15000','50000');
end;

procedure Tmain_form.edt_heightChange(Sender: TObject);
var
   Capt : byte;
   I,J  : byte;
   str  : string;
begin
       Capt := pos(#13,edt_Height.Text);
       if Capt <> 0 then
       begin
               //M1,-02.5000\0D
               //pnl_height.Caption := '';

               for I := 1 to Capt-1 do
                  edt_store.Text := edt_store.Text+edt_Height.Text;

               if (edt_store.Text[4] = '+') or (edt_store.Text[4] = '-') then
                begin
                        for J := 4 to Capt - 2 do
                            str := str+edt_store.Text[J];

                        Main_Process(str);
                end;

               str := '';
               edt_Height.Text := '';
               edt_store.Text  := '';
       end;
end;

procedure Tmain_form.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
       Resize := false;
end;

procedure Tmain_form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       Read_Or_Write_Files('W dd');
       if pnlStt.Color = cllime then
       begin
                Move_StartPoint(edt_Zx.Text,edt_Zy.Text);
                sleep(500);
                ServoOff(); sleep(150);
       end;
end;

procedure Tmain_form.FormShow(Sender: TObject);
begin
       Robot.Data_No    := 0;
       Robot.Process_No := 0;
       Robot.Tdat       := '';
       Timer1.Enabled   := false;
       Initial_System();
       LoadFileInitial('R COMm1');
       LoadFileInitial('R PROCESS NO');
       LoadFileInitial('R COM_MC');
       LoadFileInitial('R POINT CONTROL');
       LoadFileInitial('R SERVO SPEED');
       LoadFileInitial('R SPEC');
       LoadFileInitial('R AUTO ZERO');
       LoadFileInitial('R COUNT DATA');

       Gb_Point[1]  := EdtP1  ;
       Gb_Point[2]  := EdtP2  ;
       Gb_Point[3]  := EdtP3  ;
       Gb_Point[4]  := EdtP4  ;
       Gb_Point[5]  := EdtP5  ;
       Gb_Point[6]  := EdtP6  ;
       Gb_Point[7]  := EdtP7  ;
       Gb_Point[8]  := EdtP8  ;
       Gb_Point[9]  := EdtP9  ;
       Gb_Point[10] := EdtP10 ;
       Gb_Point[11] := EdtP11 ;
       Gb_Point[12] := EdtP12 ;
       Gb_Point[13] := EdtP13 ;
       Gb_Point[14] := EdtP14 ;
       Gb_Point[15] := EdtP15 ;

       lbl_Sep_Date.Caption := Read_Or_Write_Files('R dd');
       if lbl_Sep_Date.Caption <> FormatDateTime('yyyy-mm-dd',now) then
        begin
                Init_LogFile();
                edt_Total.Text := '0';
                LoadFileInitial('W COUNT DATAe');
        end;

end;

procedure Tmain_form.spdCalClick(Sender: TObject);
begin
       ShellExecute(0,'open',pchar('calc'),nil,nil,SW_NORMAL);
end;

procedure Tmain_form.spdChkComClick(Sender: TObject);
begin
       ShellExecute(0,'open',pchar('devmgmt.msc'),nil,nil,SW_NORMAL);
end;

procedure Tmain_form.spdConfigPortClick(Sender: TObject);
begin
       main_form.AlphaBlend      := true;
       main_form.AlphaBlendValue := 99;
       frmComPort.ShowModal;
end;

procedure Tmain_form.spdConnClick(Sender: TObject);
begin
//       LoadFileInitial('W COMm1');
//       mm_status.Clear;
//       ClosePort();                             //---> Close before Open
//       robot_port := self.Handle;               //---> get handle
//       OpenPort(edtComM1.Text,38400,robot_port);
//       if not IsPortOpened()then
//        begin
//                mm_status.Text := 'Comport not Open';
//                spdConn.Font.Color := ClRed;
//        end
//       else
//        begin
//                mm_status.Text := 'Comport is Opened';
//                spdConn.Font.Color := ClBlue;
//        end;
        Initial_Controller(Self.Handle);
end;

procedure Tmain_form.spdHistoryClick(Sender: TObject);
begin
       main_form.AlphaBlend      := true;
       main_form.AlphaBlendValue := 99;
       frmHistory.ShowModal;
end;

procedure Tmain_form.spdNotePadClick(Sender: TObject);
begin
        ShellExecute(0,'open',pchar('notepad'),nil,nil,SW_NORMAL);
end;

procedure Tmain_form.spdSaveClick(Sender: TObject);
begin
        LoadFileInitial('W SPEC');
end;

procedure Tmain_form.SpeedButton1Click(Sender: TObject);
begin
        Close;
end;

procedure Tmain_form.Timer1Timer(Sender: TObject);
begin
       GetRemoteStatus(rxreg);
       StatusBar1.Panels[1].Text := 'X: '+inttostr(rxreg[4]+rxreg[5]);
       StatusBar1.Panels[2].Text := 'Y: '+inttostr(rxreg[6]+rxreg[7]);
       et_movex.Text := inttostr(rxreg[4]);
       et_movey.Text := inttostr(rxreg[6]);
end;

end.
