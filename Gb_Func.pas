unit Gb_Func;

interface
uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, ComCtrls, StdCtrls, Buttons, DB, ADODB, Registry ,math,
     ExtCtrls,IniFiles;

  //----- THE DATA FROM SENSOR MACHINE IS ' M1,-02.5000\0D '  >>> 12 Digit With /r

     function Read_Or_Write_Files(Item : string) : string;
     function Move_Point(x_get: string; y_get : string) : boolean;
     function Find_Max(Arr: array of real): real;
     function Find_Min(Arr: array of real): real;
     function Check_Init(ProType : word) : string;
     function Check_BeforeSave(ProType : word) : string;
     function Calulate_Process4() : boolean;

     procedure Robot_Speed();
     procedure ORIGIN_POINT();
     procedure LoadFileInitial(Item : string);
     procedure Init_LogFile();
     procedure Initial_System();
     procedure Main_Process(dat : string);
     procedure Move_StartPoint(x_get : string; y_get : string);

     procedure Cal_Procees1();
     procedure Cal_Procees2_3();
     procedure Save_LogFile(Result1 : boolean);
     procedure Process1(dat : string);
     procedure Process2_3(dat : string);
     procedure Initial_Controller(add : Thandle);
     function ServoOff() : boolean;
     function ServoOn() : boolean;

     function GetPoint(P : integer) : real ;
     function FindMax(P1 : real;P2 : real;
                      P3 : real;P4 : real) : real ;

     function FindMin(P1 : real;P2 : real;
                      P3 : real;P4 : real) : real ;

   var
     Data_Save : TextFile;

implementation
uses global_param,highcheck,comstore,ComPort,gpcmtn,useDLL ;

function GetPoint(P : integer) : real ;
var i,j,k : integer ;
    str,str1 : string ;
    X1,X2,Y1,Y2 : string ;
    Data,Data1 : real ;
    sData : string ;
begin
    /// Assign Point.
    case P of
    1:
    begin
        X1 := main_form.EdtX1_1.Text ;
        Y1 := main_form.EdtY1_1.Text ;
        X2 := main_form.EdtX1_2.Text ;
        Y2 := main_form.EdtY1_2.Text ;
    end;
    2:
    begin
        X1 := main_form.EdtX2_1.Text ;
        Y1 := main_form.EdtY2_1.Text ;
        X2 := main_form.EdtX2_2.Text ;
        Y2 := main_form.EdtY2_2.Text ;
    end;
    3:
    begin
        X1 := main_form.EdtX3_1.Text ;
        Y1 := main_form.EdtY3_1.Text ;
        X2 := main_form.EdtX3_2.Text ;
        Y2 := main_form.EdtY3_2.Text ;
    end;
    4:
    begin
        X1 := main_form.EdtX4_1.Text ;
        Y1 := main_form.EdtY4_1.Text ;
        X2 := main_form.EdtX4_2.Text ;
        Y2 := main_form.EdtY4_2.Text ;
    end;
    5:
    begin
        X1 := main_form.EdtX5_1.Text ;
        Y1 := main_form.EdtY5_1.Text ;
        X2 := main_form.EdtX5_2.Text ;
        Y2 := main_form.EdtY5_2.Text ;
    end;
    6:
    begin
        X1 := main_form.EdtX6_1.Text ;
        Y1 := main_form.EdtY6_1.Text ;
        X2 := main_form.EdtX6_2.Text ;
        Y2 := main_form.EdtY6_2.Text ;
    end;
    7:
    begin
        X1 := main_form.EdtX7_1.Text ;
        Y1 := main_form.EdtY7_1.Text ;
        X2 := main_form.EdtX7_2.Text ;
        Y2 := main_form.EdtY7_2.Text ;
    end;
    8:
    begin
        X1 := main_form.EdtX8_1.Text ;
        Y1 := main_form.EdtY8_1.Text ;
        X2 := main_form.EdtX8_2.Text ;
        Y2 := main_form.EdtY8_2.Text ;
    end;
    9:
    begin
        X1 := main_form.EdtX9_1.Text ;
        Y1 := main_form.EdtY9_1.Text ;
        X2 := main_form.EdtX9_2.Text ;
        Y2 := main_form.EdtY9_2.Text ;
    end;
    10:
    begin
        X1 := main_form.EdtX10_1.Text ;
        Y1 := main_form.EdtY10_1.Text ;
        X2 := main_form.EdtX10_2.Text ;
        Y2 := main_form.EdtY10_2.Text ;
    end;
    11:
    begin
        X1 := main_form.EdtX11_1.Text ;
        Y1 := main_form.EdtY11_1.Text ;
        X2 := main_form.EdtX11_2.Text ;
        Y2 := main_form.EdtY11_2.Text ;
    end;
    12:
    begin
        X1 := main_form.EdtX12_1.Text ;
        Y1 := main_form.EdtY12_1.Text ;
        X2 := main_form.EdtX12_2.Text ;
        Y2 := main_form.EdtY12_2.Text ;
    end;
    13:
    begin
        X1 := main_form.EdtX13_1.Text ;
        Y1 := main_form.EdtY13_1.Text ;
        X2 := main_form.EdtX13_2.Text ;
        Y2 := main_form.EdtY13_2.Text ;
    end;
    14:
    begin
        X1 := main_form.EdtX14_1.Text ;
        Y1 := main_form.EdtY14_1.Text ;
        X2 := main_form.EdtX14_2.Text ;
        Y2 := main_form.EdtY14_2.Text ;
    end;
    15:
    begin
        X1 := main_form.EdtX15_1.Text ;
        Y1 := main_form.EdtY15_1.Text ;
        X2 := main_form.EdtX15_2.Text ;
        Y2 := main_form.EdtY15_2.Text ;
    end;
    end;

    main_form.Memo1.Clear ;
    DataModule1.ComMc.PutString('AQ'+#13);
    while(Pos('AQ',main_form.Memo1.Text) = 0) do
    delay(100) ;


    Move_StartPoint(X1,Y1);
    main_form.Memo1.Clear ;
    DataModule1.ComMc.PutString('AS'+#13);
    while(Pos('AS',main_form.Memo1.Text) = 0) do
    delay(100) ;
    Move_StartPoint(X2,Y2);

    main_form.Memo1.Clear ;
    DataModule1.ComMc.PutString('AP'+#13);
    while(Pos('AP',main_form.Memo1.Text) = 0) do
    delay(100) ;

    main_form.Memo1.Clear ;
    DataModule1.ComMc.PutString('AO,1'+#13);
    while(Pos('AO',main_form.Memo1.Text) = 0) do
    delay(100) ;
    //while(Pos(#13,Memo1.Text) = 0) do



    str := '' ;
    for i := 4 to Length(main_form.Memo1.Text)- 1 do
        str := str + main_form.Memo1.Text[i] ;


    k := 1 ;

    Data1 := 0 ;
    Data  := 0 ;
    while k <> 0 do
    begin
        sData := '' ;
        j := pos(',',str) ;
        for i := 1 to j - 1 do
            sData := sData+str[i] ;

        if pos('FF',sData) = 0 then
        begin
            Data1 := strtofloat(sData) ;

            if Data < Data1 then
                Data := Data1;
        end;

        str1 := '' ;
        for i := j+1 to Length(str) do
            str1 := str1+str[i] ;

        str := str1 ;

        k := pos(',',str) ;
    end;
    try
        Result := Data ;
        Gb_Point[P].Text := floattostr(Data) ;
    except
        Result := 0 ;
        Gb_Point[P].Text := '000' ;
    end;
end;

function FindMax(P1 : real;P2 : real;
                 P3 : real;P4 : real) : real ;
var Re : real ;
begin
    if P1 > P2 then
        Re := P1
    else
        Re := P2 ;
    if Re > P3 then
        Re := Re
    else
        Re := P3 ;
    if Re > P4 then
        Re := Re
    else
        Re := P4 ;
    Result := Re ;
end;

function FindMin(P1 : real;P2 : real;
                 P3 : real;P4 : real) : real ;
var Re : real ;
begin
    if P1 < P2 then
        Re := P1
    else
        Re := P2 ;
    if Re < P3 then
        Re := Re
    else
        Re := P3 ;
    if Re < P4 then
        Re := Re
    else
        Re := P4 ;
    Result := Re ;
end;


//******************************************************************************
//--------------             THE MAIN PROGRAM               ------------------\\
procedure Main_Process(dat : string);
begin
      with main_form do
      begin
             case Robot.Process_No of
                 _ZERO_ :  Process1(dat);

                 _FIRST_:  Process2_3(dat);

                 _SECOND_: Process2_3(dat);

                 _THIRD_:  ;
             end;
      end;
end;


//******************************************************************************
//-------------      ON SERVO MOTOR
function ServoOn() : boolean;
var
 i : byte;
 resp : boolean;
 Label  End_Pro;
begin
      with main_form do
      begin
              mm_status.Clear;
              txreg[0] := $34;
              txreg[1] := $000F;;
              SendRemoteCommand(txreg, rxreg);
              //sleep(500);

              for I := 1 to 10 do
                begin
                       txreg[0] := $34;
                       txreg[1] := $000F;;
                       SendRemoteCommand(txreg, rxreg);  sleep(200);
                       GetRemoteStatus(rxreg);
                       if rxreg[0] = $0200 then
                        begin
                                resp := true;
                                mm_status.Text := 'Servo On is finished + ' +
                                                  inttostr(SendRemoteCommand(txreg, rxreg));
                                pnlStt.Color   := ClLime;
                                pnlStt.Caption := 'SERVO ON';
                                //sleep(100);
                                pnl_SttMove.Color := Cllime;
                               goto End_Pro;
                        end;

                       Application.ProcessMessages;
              end;

              resp := false;
              pnlStt.Color   := Clred;
              pnlStt.Caption := 'SERVO OFF';

              End_Pro:
                result := resp;
      end;
end;

//******************************************************************************
//-------------      OFF SERVO MOTOR
function ServoOff() : boolean;
var
  i : byte;
  resp : boolean;
  label skipOut;
begin
      with main_form do
      begin
              mm_status.Clear;
//              txreg[0] := $32;
//              txreg[2] :=  15;
//              SendRemoteCommand(txreg, rxreg);
//              sleep(500);


              txreg[0] := $35;
              txreg[1] := $000F;
              SendRemoteCommand(txreg, rxreg);

//              while rxreg[0] = $100 do
//              begin
//                     GetRemoteStatus(rxreg);
//                     Application.ProcessMessages;
//
//                     if rxreg[0] = $0200 then
//                      begin
//                             goto skipOut;
//                      end;
//              end;
//
//
//              mm_status.Text := 'Servo Off is finished + ' +inttostr(SendRemoteCommand(txreg, rxreg));
//              pnlStt.Color   := ClbtnFace;
//              pnlStt.Caption := 'SERVO OFF';
//              sleep(100);
//              pnl_SttMove.Color := Clred;

              sleep(500);
              GetRemoteStatus(rxreg);
              label65.Caption := inttostr(rxreg[0]);
              for I := 1 to 10 do
                begin
                       txreg[0] := $35;
                       txreg[1] := $000F;
                       SendRemoteCommand(txreg, rxreg);
                       sleep(200);
                       GetRemoteStatus(rxreg);
                       if rxreg[0] = $200 then
                        begin
                                resp := true;
                                mm_status.Text := 'Servo Off is finished + ' +
                                                  inttostr(SendRemoteCommand(txreg, rxreg));
                                pnlStt.Color   := Clred;
                                pnlStt.Caption := 'SERVO OFF';
                                //sleep(100);
                                //pnl_SttMove.Color := Clred;
                               goto skipOut;
                        end;

                       Application.ProcessMessages;
              end;

              resp := false;
              MessageDlg('    Time out, Error at set the motor to offline mode'+slinebreak+
                          'please check the comunication or try again.',mtError,[mbOk],0);

              skipOut:
                result := resp;
      end;
end;


//******************************************************************************
//--------------     INITIAL CONTROLLER AND SERVO
procedure Initial_Controller(add : Thandle);
var
    mode : integer;
    res1,res2,res3  : boolean;
begin
      with main_form do
      begin
             LoadFileInitial('W COMm1');
             mm_status.Clear;
             ClosePort();                             //---> Close before Open
             robot_port := add;               //---> get handle
             OpenPort(edtComM1.Text,38400,robot_port);
             if not IsPortOpened()then
              begin
                      mm_status.Text := 'Comport not Open'+slinebreak;;
                      spdConn.Font.Color := ClRed;
              end
             else
              begin
                      mm_status.Text := 'Comport is Opened'+slinebreak;;
                      spdConn.Font.Color := ClBlue;
              end; //-------------------- End Connect Machine

//            mm_status.Clear;
//            SetRemoteMode(1);
//            sleep(100);
//
//            GetRemoteMode(mode);
//
//            mm_status.Text :=  '  Please wait for check mode..'+slinebreak;
//            sleep(500);
////            Move_StartPoint(et_xp1.Text,et_yp1.Text);
////            sleep(700);
////            ResetError(3);
////            sleep(1000);
//            mm_status.Text := mm_status.Text+'Complete for check'+slinebreak+
//                              'Mode : '+inttostr(mode)+slinebreak; //------------ End Config Mode
//
//            sleep(700);
              SetRemoteMode(1);    sleep(400);
              GetRemoteMode(mode); sleep(400);
              res1 := ServoOn();

              txreg[0] := $32;
              txreg[2] :=  15;
              SendRemoteCommand(txreg, rxreg); sleep(250);

            res2 := ServoOff();  sleep(500);
            ResetError(3);      sleep(400);
            res3 := ServoOn();

            if (res1 = true) and (res2 = true) and (res3 = true) and (pnlStt.Color = Cllime) then
            begin
                   LoadFileInitial('W SERVO SPEED');
            end  else
            begin
                    sleep(1200);
                    MessageDlg('    Mistake about setup the motor, Please try click ok for try again',
                                mtWarning,[mbOk],0);
                    sleep(1500);
                    bt_servoon.Click;  sleep(1000);
                    ORIGIN_POINT();
            end;

      end;
end;

//******************************************************** ORIGIN POINT OF MOTOR
procedure ORIGIN_POINT();
begin
      with main_form do
      begin
       Robot.Error_ := false;
       if pnlstt.Color = clLime then
       begin
              mm_status.Clear;
              txreg[0] := $32;
              txreg[1] :=  15;
              SendRemoteCommand(txreg, rxreg);
              if rxreg[0]= $100  then
              begin
                     sleep(100);

                     while rxreg[0]= $100 do
                       begin
                            GetRemoteStatus(rxreg);
                            if rxreg[0] <> 16384 then
                            begin
                                    if rxreg[0]= $200 then
                                       begin
                                                pnlStt.Color := ClLime;
                                                mm_status.Text := 'Origin is finished :'+ inttostr(rxreg[0]);
                                       end

                                    else
                                       begin
                                                pnlStt.Color := ClYellow;
                                                mm_status.Text := 'Please Waiting..';
                                       end;
                            end

                            else
                            begin
                                    mm_status.Text := '      The motor move to the origin'+
                                                      ' point is error'+slinebreak+
                                                      '      Please off motor and reset before'+
                                                      ' try again.';//+mm_status.Text;
                                    pnlStt.Color := ClRed;
                                    pnlStt.Caption := 'Error(TimeOut)';
                            end;
                             application.ProcessMessages;
                       end;
              end

              else
              begin
                       MessageDlg('   Mistake at move state to the origin'+slinebreak+
                                  'Please off motor or reboot motor before execute',
                                  mtWarning,[mbOk],0);

              end;
       end

      else
      begin
              pnlStt.Color := clRed;
              pnlStt.Caption := 'MOTOR ERROR';
              ShowMessage('   Servo motor never on, Please open servo motor before execute.');
      end;
      end;
end;

//##############################################################################
//--------------------    CHECK THE MAX DATA
function Find_Max(Arr: array of real): real;
var
   M: real;
   i : integer;
begin
        M := Arr[Low(Arr)];
        for i := 1 to High(Arr) do
          if Arr[i] > M then M := Arr[i];
        Result := M;
end;

//##############################################################################
//--------------------    CHECK THE MIN DATA
function Find_Min(Arr: array of real): real;
var
  M : real;
  i : integer;
begin
        M := Arr[Low(Arr)];
        for i := 1 to High(Arr) do
          if Arr[i] <  M then M := Arr[i];
        Result := M;
end;


//******************************************************************************
//--------------             THE MAIN PROGRAM               ------------------\\
procedure Robot_Speed();
var
    spd : integer;
begin
      with main_form do
      begin
              spd := strtoint(edtSpeed.Text);

              txreg[0] :=  $38;
              txreg[1] :=  0;
              txreg[2] :=  3000;

              SendRemoteCommand(txreg, rxreg);
               if rxreg[0] = $100 then
                begin
                 sleep(100);
                  while rxreg[0]=$100 do
                  begin
                   application.ProcessMessages;
                   GetRemoteStatus(rxreg);
                    if rxreg[0]= $200 then
                    begin
                            // panel1.Caption := 'ok';
                              //DataModule1.ComMc.PutString('W1'+#13);
                              mm_status.Text := 'ok';
                              //Result := true;
                    end else
                     begin
                            //panel1.Caption := 'wait';
                              mm_status.Text := 'Waiting';
                     end;
                  end;
             end;
      end;
end;


//******************************************************************************
//
function Move_Point(x_get: string; y_get : string) : boolean;
var
    x_u,x_l : word;
    y_u,y_l : word;
    x_pos,y_pos : integer;
    tem : cardinal;
begin
      with main_form do
      begin
              x_pos := strtoint(x_get);
              y_pos := strtoint(y_get);

              if x_pos > 0 then
              begin
              x_u := (x_pos div 65536);
              x_l := (x_pos mod 65536);
              end

              else
              begin
                    tem := $FFFFFFFF -abs( x_pos) ;
                    x_u := (tem div 65536);
                    x_l := (tem mod 65536);
              end;

              if y_pos > 0 then
              begin
              y_u := (y_pos div 65536);
              y_l := (y_pos mod 65536);
              end
              else
              begin
                    tem := $FFFFFFFF - abs(y_pos) ;
                    y_u := (tem div 65536);
                    y_l := (tem mod 65536);
              end;
//              showmessage(inttostr(x_u)+'/'+inttostr(x_l)+'***'+
//                          inttostr(y_u)+'/'+inttostr(y_l));

              txreg[0] :=  $7;
              txreg[1] :=  8;
              txreg[2] :=  3;
              txreg[3] :=  0;
              txreg[4] :=  x_l;
              txreg[5] :=  x_u;
              txreg[6] :=  y_l;
              txreg[7] :=  y_u;
              txreg[8] :=  0;
              txreg[9] :=  0;
              txreg[10] := 0;
              txreg[11] := 0;
              txreg[12] := 0;
              txreg[13] := 0;
              txreg[14] := 0;
              txreg[15] := 0;

              SendRemoteCommand(txreg, rxreg);
               if rxreg[0] = $100 then
                begin
                 sleep(100);
                  while rxreg[0]=$100 do
                  begin
                   application.ProcessMessages;
                   GetRemoteStatus(rxreg);
                    if rxreg[0]= $200 then
                    begin
                              sleep(800);
                              DataModule1.ComMc.PutString('M1'+#13);
                              mm_status.Text := 'ok';
                              //sleep(400);
                              Result := true;
                    end else
                     begin
                              btn_Moving.Caption := 'Moving';
                              mm_status.Text := 'Waiting';
                     end;
                  end;
             end;
      end;
end;

//******************************************************************************
//
procedure Move_StartPoint(x_get : string; y_get : string);
var
    x_u,x_l : word;
    y_u,y_l : word;
    x_pos,y_pos : integer;
    tem : cardinal;
begin
      with main_form do
      begin
              x_pos := strtointdef(x_get,0);
              y_pos := strtointdef(y_get,0);

              if x_pos > 0 then
              begin
              x_u := (x_pos div 65536);
              x_l := (x_pos mod 65536);
              end

              else
              begin
                    tem := $FFFFFFFF -abs( x_pos) ;
                    x_u := (tem div 65536);
                    x_l := (tem mod 65536);
              end;

              if y_pos > 0 then
              begin
              y_u := (y_pos div 65536);
              y_l := (y_pos mod 65536);
              end
              else
              begin
                    tem := $FFFFFFFF - abs(y_pos) ;
                    y_u := (tem div 65536);
                    y_l := (tem mod 65536);
              end;
//              showmessage(inttostr(x_u)+'/'+inttostr(x_l)+'***'+
//                          inttostr(y_u)+'/'+inttostr(y_l));

              txreg[0] :=  $7;
              txreg[1] :=  8;
              txreg[2] :=  3;
              txreg[3] :=  0;
              txreg[4] :=  x_l;
              txreg[5] :=  x_u;
              txreg[6] :=  y_l;
              txreg[7] :=  y_u;
              txreg[8] :=  0;
              txreg[9] :=  0;
              txreg[10] := 0;
              txreg[11] := 0;
              txreg[12] := 0;
              txreg[13] := 0;
              txreg[14] := 0;
              txreg[15] := 0;

              SendRemoteCommand(txreg, rxreg);
               if rxreg[0] = $100 then
                begin
                 sleep(100);
                  while rxreg[0]=$100 do
                  begin
                   application.ProcessMessages;
                   GetRemoteStatus(rxreg);
                    if rxreg[0]= $200 then
                    begin

                              sleep(500);
                              mm_status.Text := 'ok';
                              //DataModule1.ComMc.PutString('V1'+#13);
                    end else
                     begin
                            //panel1.Caption := 'wait';
                              mm_status.Text := 'Waiting';
                     end;
                  end;
             end;
      end;
end;



//******************************************************************************
//--------------             WORKING FOR THE FIRST PROCESS
procedure Process1(dat : string);
var
    max4,max5,max6,max7,max8 : real;
    max9,max10,max11,max12   : real;
    max13,max14,max15        : real;
begin
      with main_form do
      begin
            if (edt_p4.Text = '') and (Robot.Data_No = 0) then  //----- POINT4
            begin
                   inc(cnt_add);
                   case cnt_add of
                    1:  Data_AddPro1[0] := StrToFloat(dat);
                    2:  Data_AddPro1[1] := StrToFloat(dat);
                    3:  Data_AddPro1[2] := StrToFloat(dat);
                    4:
                    begin
                        Data_AddPro1[3] := StrToFloat(dat);
                        cnt_add := 0;
                        Robot.Data_No := 1;
                        max4 := Find_Max(Data_AddPro1);
                        edt_p4.Text := floattostr(max4);
                    end;
                   end;
            end;

            if (edt_p5.Text = '') and (Robot.Data_No = 1) then
            begin
                   inc(cnt_add);
                   case cnt_add of
                    1:  Data_AddPro1[0] := StrToFloat(dat);
                    2:  Data_AddPro1[1] := StrToFloat(dat);
                    3:  Data_AddPro1[2] := StrToFloat(dat);
                    4:
                    begin
                        Data_AddPro1[3] := StrToFloat(dat);
                        cnt_add := 0;
                        Robot.Data_No := 2;
                        max5 := Find_Max(Data_AddPro1);
                        edt_p5.Text := floattostr(max5);
                    end;
                   end;
            end;

            if (edt_p6.Text = '') and (Robot.Data_No = 2) then
            begin
                   inc(cnt_add);
                   case cnt_add of
                    1:  Data_AddPro1[0] := StrToFloat(dat);
                    2:  Data_AddPro1[1] := StrToFloat(dat);
                    3:  Data_AddPro1[2] := StrToFloat(dat);
                    4:
                    begin
                        Data_AddPro1[3] := StrToFloat(dat);
                        cnt_add := 0;
                        Robot.Data_No := 3;
                        max6 := Find_Max(Data_AddPro1);
                        edt_p6.Text := floattostr(max6);
                    end;
                   end;
            end;

            if (edt_p7.Text = '') and (Robot.Data_No = 3) then
            begin
                   inc(cnt_add);
                   case cnt_add of
                    1:  Data_AddPro1[0] := StrToFloat(dat);
                    2:  Data_AddPro1[1] := StrToFloat(dat);
                    3:  Data_AddPro1[2] := StrToFloat(dat);
                    4:
                    begin
                        Data_AddPro1[3] := StrToFloat(dat);
                        cnt_add := 0;
                        Robot.Data_No := 4;
                        max7 := Find_Max(Data_AddPro1);
                        edt_p7.Text := floattostr(max7);
                    end;
                   end;
            end;  //*******************************************************************************


            if (edt_p8.Text = '') and (Robot.Data_No = 4) then  //----- POINT4
            begin
                   inc(cnt_add);
                   case cnt_add of
                    1:  Data_AddPro2[0] := StrToFloat(dat);
                    2:  Data_AddPro2[1] := StrToFloat(dat);
                    3:  Data_AddPro2[2] := StrToFloat(dat);
                    4:
                    begin
                        Data_AddPro2[3] := StrToFloat(dat);
                        cnt_add := 0;
                        Robot.Data_No := 5;
                        max8 := Find_Max(Data_AddPro2);
                        edt_p8.Text := floattostr(max8);
                    end;
                   end;
            end;

            if (edt_p9.Text = '') and (Robot.Data_No = 5) then
            begin
                   inc(cnt_add);
                   case cnt_add of
                    1:  Data_AddPro2[0] := StrToFloat(dat);
                    2:  Data_AddPro2[1] := StrToFloat(dat);
                    3:  Data_AddPro2[2] := StrToFloat(dat);
                    4:
                    begin
                        Data_AddPro2[3] := StrToFloat(dat);
                        cnt_add := 0;
                        Robot.Data_No := 6;
                        max9 := Find_Max(Data_AddPro2);
                        edt_p9.Text := floattostr(max9);
                    end;
                   end;
            end;

            if (edt_p10.Text = '') and (Robot.Data_No = 6) then
            begin
                   inc(cnt_add);
                   case cnt_add of
                    1:  Data_AddPro2[0] := StrToFloat(dat);
                    2:  Data_AddPro2[1] := StrToFloat(dat);
                    3:  Data_AddPro2[2] := StrToFloat(dat);
                    4:
                    begin
                        Data_AddPro2[3] := StrToFloat(dat);
                        cnt_add := 0;
                        Robot.Data_No := 7;
                        max10 := Find_Max(Data_AddPro2);
                        edt_p10.Text := floattostr(max10);
                    end;
                   end;
            end;

            if (edt_p11.Text = '') and (Robot.Data_No = 7) then
            begin
                   inc(cnt_add);
                   case cnt_add of
                    1:  Data_AddPro2[0] := StrToFloat(dat);
                    2:  Data_AddPro2[1] := StrToFloat(dat);
                    3:  Data_AddPro2[2] := StrToFloat(dat);
                    4:
                    begin
                        Data_AddPro2[3] := StrToFloat(dat);
                        cnt_add := 0;
                        Robot.Data_No := 8;
                        max7 := Find_Max(Data_AddPro2);
                        edt_p11.Text := floattostr(max11);
                    end;
                   end;
            end;  //*******************************************************************************

            if (edt_p12.Text = '') and (Robot.Data_No = 9) then  //----- POINT4
            begin
                   inc(cnt_add);
                   case cnt_add of
                    1:  Data_AddPro3[0] := StrToFloat(dat);
                    2:  Data_AddPro3[1] := StrToFloat(dat);
                    3:  Data_AddPro3[2] := StrToFloat(dat);
                    4:
                    begin
                        Data_AddPro3[3] := StrToFloat(dat);
                        cnt_add := 0;
                        Robot.Data_No := 10;
                        max12 := Find_Max(Data_AddPro3);
                        edt_p12.Text := floattostr(max12);
                    end;
                   end;
            end;

            if (edt_p13.Text = '') and (Robot.Data_No = 10) then
            begin
                   inc(cnt_add);
                   case cnt_add of
                    1:  Data_AddPro3[0] := StrToFloat(dat);
                    2:  Data_AddPro3[1] := StrToFloat(dat);
                    3:  Data_AddPro3[2] := StrToFloat(dat);
                    4:
                    begin
                        Data_AddPro3[3] := StrToFloat(dat);
                        cnt_add := 0;
                        Robot.Data_No := 11;
                        max13 := Find_Max(Data_AddPro3);
                        edt_p13.Text := floattostr(max13);
                    end;
                   end;
            end;

            if (edt_p14.Text = '') and (Robot.Data_No = 11) then
            begin
                   inc(cnt_add);
                   case cnt_add of
                    1:  Data_AddPro3[0] := StrToFloat(dat);
                    2:  Data_AddPro3[1] := StrToFloat(dat);
                    3:  Data_AddPro3[2] := StrToFloat(dat);
                    4:
                    begin
                        Data_AddPro3[3] := StrToFloat(dat);
                        cnt_add := 0;
                        Robot.Data_No := 12;
                        max14 := Find_Max(Data_AddPro3);
                        edt_p14.Text := floattostr(max14);
                    end;
                   end;
            end;

            if (edt_p15.Text = '') and (Robot.Data_No = 12) then
            begin
                   inc(cnt_add);
                   case cnt_add of
                    1:  Data_AddPro3[0] := StrToFloat(dat);
                    2:  Data_AddPro3[1] := StrToFloat(dat);
                    3:  Data_AddPro3[2] := StrToFloat(dat);
                    4:
                    begin
                        Data_AddPro3[3] := StrToFloat(dat);
                        cnt_add := 0;
                        Robot.Data_No := 0;
                        max15 := Find_Max(Data_AddPro3);
                        edt_p15.Text := floattostr(max15);
                    end;
                   end;
            end;  //*******************************************************************************

//            inc(Robot.Data_No);
//            if Robot.Data_No > 15 then Robot.Data_No := 1;
//
//             case Robot.Data_No of
//                  1 : edt_p1.Text  := dat;
//                  2 : edt_p2.Text  := dat;
//                  3 : edt_p3.Text  := dat;
//                  4 : edt_p4.Text  := dat;
//                  5 : edt_p5.Text  := dat;
//                  6 : edt_p6.Text  := dat;
//                  7 : edt_p7.Text  := dat;
//                  8 : edt_p8.Text  := dat;
//                  9 : edt_p9.Text  := dat;
//                  10: edt_p10.Text := dat;
//                  11: edt_p11.Text := dat;
//                  12: edt_p12.Text := dat;
//                  13: edt_p13.Text := dat;
//                  14: edt_p14.Text := dat;
//                  15:
//                    begin
//                            edt_p15.Text := dat;
//                            Cal_Procees1();
//                    end;
//             end;
      end;
end;

//******************************************************************************
//--------------
procedure Cal_Procees1();
var
    slant1,slant2,slant3 : real;
    //Ref_height           : real;
    j2,j3,j4,Re_j     : boolean;
begin
      with main_form do
      begin

//                AReal1[0] := StrToFloat(edt_p1.Text);
//                AReal1[1] := StrToFloat(edt_p2.Text);
//                AReal1[2] := StrToFloat(edt_p3.Text);
//                AReal1[3] := StrToFloat(edt_p4.Text);
//                AReal1[4] := StrToFloat(edt_p5.Text);
//                AReal1[5] := StrToFloat(edt_p6.Text);
//                AReal1[6] := StrToFloat(edt_p7.Text);
//                AReal1[7] := StrToFloat(edt_p8.Text);
//                AReal1[8] := StrToFloat(edt_p9.Text);
//                AReal1[9] := StrToFloat(edt_p10.Text);
//                AReal1[10] := StrToFloat(edt_p11.Text);
//                AReal1[11] := StrToFloat(edt_p12.Text);
//                AReal1[12] := StrToFloat(edt_p13.Text);
//                AReal1[13] := StrToFloat(edt_p14.Text);
//                AReal1[14] := StrToFloat(edt_p15.Text);
//
//                MaxHeight     := Find_Max(AReal1);
//                MinHeight     := Find_Min(AReal1);
//                Ref_Height    :=  MaxHeight-MinHeight;
//                edt_Ref1.Text := floattostr(Ref_Height);
//                edit3.Text := floattostr(MaxHeight);
//                edit4.Text := floattostr(MinHeight);

                AReal2[0] := StrToFloat(edt_p4.Text);
                AReal2[1] := StrToFloat(edt_p5.Text);
                AReal2[2] := StrToFloat(edt_p6.Text);
                AReal2[3] := StrToFloat(edt_p7.Text);
                MaxSlant1 := Find_Max(AReal2);
                MinSlant1 := Find_Min(AReal2);
                slant1    :=  MaxSlant1-MinSlant1;
                edt_Slant1.Text := floattostr(slant1);
                label47.Caption := floattostr(MaxSlant1);
                label48.Caption := floattostr(MinSlant1);

                AReal3[0] := StrToFloat(edt_p8.Text);
                AReal3[1] := StrToFloat(edt_p9.Text);
                AReal3[2] := StrToFloat(edt_p10.Text);
                AReal3[3] := StrToFloat(edt_p11.Text);
                MaxSlant2 := Find_Max(AReal3);
                MinSlant2 := Find_Min(AReal3);
                slant2    :=  MaxSlant2-MinSlant2;
                edt_Slant2.Text := floattostr(slant2);
                label52.Caption := floattostr(MaxSlant2);
                label53.Caption := floattostr(MinSlant2);

                AReal4[0] := StrToFloat(edt_p12.Text);
                AReal4[1] := StrToFloat(edt_p13.Text);
                AReal4[2] := StrToFloat(edt_p14.Text);
                AReal4[3] := StrToFloat(edt_p15.Text);
                MaxSlant3 := Find_Max(AReal4);
                MinSlant3 := Find_Min(AReal4);
                slant3    :=  MaxSlant3-MinSlant3;
                edt_Slant3.Text := floattostr(slant3);
                label54.Caption := floattostr(MaxSlant3);
                label55.Caption := floattostr(MinSlant3);


//
//               if (Ref_Height >= Robot.Min_Spe) and (Ref_Height <= Robot.Max_Spe) then
//                  j1 := true
//               else j1 := false;

               if (slant1 >= Robot.Min_Spe) and (slant1 <= Robot.Max_Spe) then
                  j2 := true
               else j2 := false;

               if (slant2 >= Robot.Min_Spe) and (slant2 <= Robot.Max_Spe) then
                  j3 := true
               else j3 := false;

               if (slant3 >= Robot.Min_Spe) and (slant3 <= Robot.Max_Spe) then
                  j4 := true
               else j4 := false;

               if (j2 = true) and (j3 = true) and (j4 = true) then
                    Re_j := true
               else  Re_j := false;

               Save_LogFile(Re_j);
      end;
end;

//******************************************************************************
//--------------
procedure Cal_Procees2_3();
var
    slant1,slant2,slant3 : real;
    Ref_height           : real;
    j1,j2,j3,j4,Re_j     : boolean;
begin
      with main_form do
      begin

             try
//                          AReal1[0] := StrToFloat(edt_p1.Text);
//                          AReal1[1] := StrToFloat(edt_p2.Text);
//                          AReal1[2] := StrToFloat(edt_p3.Text);
//                          AReal1[3] := StrToFloat(edt_p4.Text);
//                          AReal1[4] := StrToFloat(edt_p5.Text);
//                          AReal1[5] := StrToFloat(edt_p6.Text);
//                          AReal1[6] := StrToFloat(edt_p7.Text);
//                          AReal1[7] := StrToFloat(edt_p8.Text);
//                          AReal1[8] := StrToFloat(edt_p9.Text);
//                          AReal1[9] := StrToFloat(edt_p10.Text);
//                          AReal1[10] := StrToFloat(edt_p11.Text);
//                          AReal1[11] := StrToFloat(edt_p12.Text);
//
//                          MaxHeight     := Find_Max(AReal1);
//                          MinHeight     := Find_Min(AReal1);
                          Ref_Height    :=  MaxHeight-MinHeight;
                          edt_Ref1.Text := floattostr(Ref_Height);
                          edit3.Text := floattostr(MaxHeight);
                          edit4.Text := floattostr(MinHeight);

                          AReal2[0] := StrToFloat(edt_p1.Text);
                          AReal2[1] := StrToFloat(edt_p2.Text);
                          AReal2[2] := StrToFloat(edt_p3.Text);
                          AReal2[3] := StrToFloat(edt_p4.Text);
                          MaxSlant1 := Find_Max(AReal2);
                          MinSlant1 := Find_Min(AReal2);
                          slant1    :=  MaxSlant1-MinSlant1;
                          edt_Slant1.Text := floattostr(slant1);
                          label47.Caption := floattostr(MaxSlant1);
                          label48.Caption := floattostr(MinSlant1);

                          AReal3[0] := StrToFloat(edt_p5.Text);
                          AReal3[1] := StrToFloat(edt_p6.Text);
                          AReal3[2] := StrToFloat(edt_p7.Text);
                          AReal3[3] := StrToFloat(edt_p8.Text);
                          MaxSlant2 := Find_Max(AReal3);
                          MinSlant2 := Find_Min(AReal3);
                          slant2    :=  MaxSlant2-MinSlant2;
                          edt_Slant2.Text := floattostr(slant2);
                          label52.Caption := floattostr(MaxSlant2);
                          label53.Caption := floattostr(MinSlant2);

                          AReal4[0] := StrToFloat(edt_p9.Text);
                          AReal4[1] := StrToFloat(edt_p10.Text);
                          AReal4[2] := StrToFloat(edt_p11.Text);
                          AReal4[3] := StrToFloat(edt_p12.Text);
                          MaxSlant3 := Find_Max(AReal4);
                          MinSlant3 := Find_Min(AReal4);
                          slant3    :=  MaxSlant3-MinSlant3;
                          edt_Slant3.Text := floattostr(slant3);
                          label54.Caption := floattostr(MaxSlant3);
                          label55.Caption := floattostr(MinSlant3);
             except

             end;


               if (Ref_Height >= Robot.Min_Spe) and (Ref_Height <= Robot.Max_Spe) then
                  j1 := true
               else j1 := false;

               if (slant1 >= Robot.Min_Spe) and (slant1 <= Robot.Max_Spe) then
                  j2 := true
               else j2 := false;

               if (slant2 >= Robot.Min_Spe) and (slant2 <= Robot.Max_Spe) then
                  j3 := true
               else j3 := false;

               if (slant3 >= Robot.Min_Spe) and (slant3 <= Robot.Max_Spe) then
                  j4 := true
               else j4 := false;

               if (j1 = true) and (j2 = true) and (j3 = true) and (j4 = true) then
                    Re_j := true
               else   Re_j := false;

               Save_LogFile(Re_j);
      end;
end;


//******************************************************************************
//--------------
function Calulate_Process4() : boolean;
begin
      with main_form do
      begin
                  arr[1] := StrToFloat(edtp4.Text);
                  arr[2] := StrToFloat(edtp5.Text);
                  arr[3] := StrToFloat(edtp6.Text);
                  arr[4] := StrToFloat(edtp7.Text);
                  arr[5] := StrToFloat(edtp8.Text);
                  arr[6] := StrToFloat(edtp9.Text);
                  arr[7] := StrToFloat(edtp10.Text);
                  arr[8] := StrToFloat(edtp11.Text);
                  arr[9] := StrToFloat(edtp12.Text);
                  arr[10] := StrToFloat(edtp13.Text);
                  arr[11] := StrToFloat(edtp14.Text);
                  arr[12] := StrToFloat(edtp15.Text);

                  if (arr[1] >= Robot.Min_4_7) and (arr[1] <= Robot.Max_4_7) then
                      EDTP4.Color := Clwindow
                  else EDTP4.Color := Clred;

                  if (arr[2] >= Robot.Min_4_7) and (arr[2] <= Robot.Max_4_7) then
                      EDTP5.Color := Clwindow
                  else  EDTP5.Color := Clred;

                  if (arr[3] >= Robot.Min_4_7) and (arr[3] <= Robot.Max_4_7) then
                      EDTP6.Color := Clwindow
                  else  EDTP6.Color := Clred;

                  if (arr[4] >= Robot.Min_4_7) and (arr[4] <= Robot.Max_4_7) then
                      EDTP7.Color := Clwindow
                  else  EDTP7.Color := Clred;

                  if (arr[5] >= Robot.Min_8_11) and (arr[5] <= Robot.Max_8_11) then
                      EDTP8.Color := Clwindow
                  else  EDTP8.Color := Clred;

                  if (arr[6] >= Robot.Min_8_11) and (arr[6] <= Robot.Max_8_11) then
                      EDTP9.Color := Clwindow
                  else  EDTP9.Color := Clred;

                  if (arr[7] >= Robot.Min_8_11) and (arr[7] <= Robot.Max_8_11) then
                      EDTP10.Color := Clwindow
                  else  EDTP10.Color := Clred;

                  if (arr[8] >= Robot.Min_8_11) and (arr[8] <= Robot.Max_8_11) then
                      EDTP11.Color := Clwindow
                  else  EDTP11.Color := Clred;

                  if (arr[9] >= Robot.Min_12_15) and (arr[9] <= Robot.Max_12_15) then
                      EDTP12.Color := Clwindow
                  else  EDTP12.Color := Clred;

                  if (arr[10] >= Robot.Min_12_15) and (arr[10] <= Robot.Max_12_15) then
                      EDTP13.Color := Clwindow
                  else  EDTP13.Color := Clred;

                  if (arr[11] >= Robot.Min_12_15) and (arr[11] <= Robot.Max_12_15) then
                      EDTP14.Color := Clwindow
                  else  EDTP14.Color := Clred;

                  if (arr[12] >= Robot.Min_12_15) and (arr[12] <= Robot.Max_12_15) then
                      EDTP15.Color := Clwindow
                  else  EDTP15.Color := Clred;


             if (edtP4.Color = clwindow) and (edtp5.Color = clwindow) and (edtp6.Color = clwindow) and
                (edtp7.Color = clwindow) and (edtp8.Color = clwindow) and (edtp9.Color = clwindow) and
                (edtp10.Color = clwindow) and (edtp11.Color = clwindow) and (edtp12.Color = clwindow) and
                (edtp13.Color = clwindow) and (edtp14.Color = clwindow) and (edtp15.Color = clwindow) then
                      Result := true
             else Result := false;


      end;

end;


//******************************************************************************
//--------------             WORKING FOR THE SECOND PROCESS
procedure Process2_3(dat : string);
begin
      with main_form do
      begin
            inc(Robot.Data_No);
            if Robot.Data_No > 12 then Robot.Data_No := 1;

             case Robot.Data_No of
                  1 : edt_p1.Text  := dat;
                  2 : edt_p2.Text  := dat;
                  3 : edt_p3.Text  := dat;
                  4 : edt_p4.Text  := dat;
                  5 : edt_p5.Text  := dat;
                  6 : edt_p6.Text  := dat;
                  7 : edt_p7.Text  := dat;
                  8 : edt_p8.Text  := dat;
                  9 : edt_p9.Text  := dat;
                  10: edt_p10.Text := dat;
                  11: edt_p11.Text := dat;
                  12:
                    begin
                           LoadFileInitial('W COUNT DATA');
                           edt_p12.Text := dat;
                           Cal_Procees2_3();
                    end;
             end;
      end;
end;

//******************************************************************************
//--------------             CONFIG FORM OF PROCESS NUMBER
procedure Check_ProcessNo(ProNo : byte);
begin
      with main_form do
      begin
             case ProNo of
                  0:          //----------  CHOOSE FOR THE FIRST PROCESS
                    begin
                          edt_p12.Visible := true;
                          edt_p13.Visible := true;
                          edt_p14.Visible := true;
                          edt_p15.Visible := true;

                          edt_p13.Visible := true;
                          edt_p14.Visible := true;
                          edt_p15.Visible := true;

                          et_xp13.Visible := true;
                          et_xp14.Visible := true;
                          et_xp15.Visible := true;
                          et_yp13.Visible := true;
                          et_yp14.Visible := true;
                          et_yp15.Visible := true;

                          lbl_sp13.Visible := true;
                          lbl_sp14.Visible := true;
                          lbl_sp15.Visible := true;

                          lbl_point13.Visible := true;
                          lbl_point14.Visible := true;
                          lbl_point15.Visible := true;

                          lbl_Ref1.Caption   := '---';
                          edt_Ref1.Color     := clGray;
                          lbl_slant1.Caption := '(4)-(7)';
                          lbl_slant2.Caption := '(8)-(11)';
                          lbl_slant3.Caption := '(12)-(15)';

                          bbt_Svoff.Left := 664; bbt_Svon.Top := 21;
                          bbt_Svon.Left  := 664; bbt_Svon.Top := 77;
                          bbt_Res.Left   := 664; bbt_Res.Top  := 128;
                    end;
                  1:        //----------  CHOOSE FOR THE SECOND PROCESS
                    begin
                          edt_p13.Visible := false;
                          edt_p14.Visible := false;
                          edt_p15.Visible := false;

                          edt_p13.Visible := false;
                          edt_p14.Visible := false;
                          edt_p15.Visible := false;

                          et_xp13.Visible := false;
                          et_xp14.Visible := false;
                          et_xp15.Visible := false;
                          et_yp13.Visible := false;
                          et_yp14.Visible := false;
                          et_yp15.Visible := false;

                          lbl_sp13.Visible := false;
                          lbl_sp14.Visible := false;
                          lbl_sp15.Visible := false;

                          lbl_point13.Visible := false;
                          lbl_point14.Visible := false;
                          lbl_point15.Visible := false;

                          edt_Ref1.Color     := clWindow;
                          lbl_Ref1.Caption   := '(1)~(12)';
                          lbl_slant1.Caption := '(1)~(4)';
                          lbl_slant2.Caption := '(5)~(8)';
                          lbl_slant3.Caption := '(9)~(12)';

                          bbt_Svoff.Left := 572; bbt_Svon.Top := 21;
                          bbt_Svon.Left  := 572; bbt_Svon.Top := 77;
                          bbt_Res.Left   := 572; bbt_Res.Top  := 128;
                    end;

                  2:        //----------  CHOOSE FOR THE THIRD PROCESS
                    begin
                          edt_p13.Visible := false;
                          edt_p14.Visible := false;
                          edt_p15.Visible := false;

                          edt_p13.Visible := false;
                          edt_p14.Visible := false;
                          edt_p15.Visible := false;

                          et_xp13.Visible := false;
                          et_xp14.Visible := false;
                          et_xp15.Visible := false;
                          et_yp13.Visible := false;
                          et_yp14.Visible := false;
                          et_yp15.Visible := false;

                          lbl_sp13.Visible := false;
                          lbl_sp14.Visible := false;
                          lbl_sp15.Visible := false;

                          lbl_point13.Visible := false;
                          lbl_point14.Visible := false;
                          lbl_point15.Visible := false;

                          edt_Ref1.Color     := clWindow;
                          lbl_Ref1.Caption   := '(1)~(12)';
                          lbl_slant1.Caption := '(1)~(4)';
                          lbl_slant2.Caption := '(5)~(8)';
                          lbl_slant3.Caption := '(9)~(12)';

                          bbt_Svoff.Left := 572; bbt_Svon.Top := 21;
                          bbt_Svon.Left  := 572; bbt_Svon.Top := 77;
                          bbt_Res.Left   := 572; bbt_Res.Top  := 128;
                    end;
                  3:
                    begin
                          edt_p12.Visible := true;
                          edt_p13.Visible := true;
                          edt_p14.Visible := false;
                          edt_p15.Visible := false;

                          et_xp13.Visible := true;
                          et_xp14.Visible := false;
                          et_xp15.Visible := false;
                          et_yp13.Visible := true;
                          et_yp14.Visible := false;
                          et_yp15.Visible := false;

                          lbl_sp13.Visible := true;
                          lbl_sp14.Visible := false;
                          lbl_sp15.Visible := false;

                          lbl_point13.Visible := true;
                          lbl_point14.Visible := false;
                          lbl_point15.Visible := false;


                          edt_Ref1.Color     := clWindow;
                          lbl_Ref1.Caption   := '(2)~(13)';
                          lbl_slant1.Caption := '(2)-(5)';
                          lbl_slant2.Caption := '(6)-(9)';
                          lbl_slant3.Caption := '(10)-(13)';

                          bbt_Svoff.Left := 664; bbt_Svon.Top := 21;
                          bbt_Svon.Left  := 664; bbt_Svon.Top := 77;
                          bbt_Res.Left   := 664; bbt_Res.Top  := 128;
                    end;
             end;


      end;
end;


//##############################################################################
//
//             CREATE LOG FILE ( .CSV )
//
//##############################################################################
procedure Init_LogFile();
var
    Tstr  : string;
    //Name1 : String;
begin
      with main_form do
      begin
             Tstr := Check_Init(Robot.Process_No);
             try
                    Name1 := ExtractFileDir(ParamStr(0)) + '\LogFiles\'+FormatDateTime('yyyy-mm-dd',now)+'.csv';
                    assignfile(Data_Save,Name1);
                    append(Data_Save);
                    writeln(Data_Save,'');
                    flush(Data_Save);
                    CloseFile(Data_Save);

             except
                    Name1 := ExtractFileDir(ParamStr(0)) + '\LogFiles\'+FormatDateTime('yyyy-mm-dd',now)+'.csv';
                    assignfile(Data_Save,Name1);
                    rewrite(Data_Save);
                    writeln(Data_Save,Tstr);
                    flush(Data_Save);
                    CloseFile(Data_Save);
             end;
      end;
end;



//----------------------------------------------: CHECK INITIAL FILE
function Check_Init(ProType : word) : string;
var
    Tstr  : string;
begin
      with main_form do
      begin
             Tstr := 'No.'+','+'POINT1'+','+'POINT2'+','+'POINT3'+','+'POINT4'+','+'POINT5'+','+'POINT6'
                      +','+'POINT7'+','+'POINT8'+','+'POINT9'+','+'POINT10'+','+'POINT11'+','+
                      'POINT12'+','+'POINT13'+','+'POINT14'+','+'POINT15'+','+'4~15'+
                       ','+'4~7'+','+'8~11'+','+'12~15';

             Result := Tstr;
      end;
end;

//----------------------------------------------: CHECK MODE BEFORE SAVE DATA
function Check_BeforeSave(ProType : word) : string;
var
    Tstr  : string;
begin
      with main_form do
      begin
             Tstr := inttostr(Dat_Total)+','+'0'+','+'0'+','+'0'+','+edtp4.Text+','+edtp5.Text+','+
                     edtp6.Text+','+edtp7.Text+','+edtp8.Text+','+edtp9.Text+','+edtp10.Text+','+
                     edtp11.Text+','+edtp12.Text+','+edtp13.Text+','+edtp14.Text+','
                     +edtp15.Text+','+edtSlant1.Text+','+edtSlant2.Text+','+edtSlant3.Text
                     +','+edtSlant4.Text;
             Result := Tstr;
      end;
end;

//******************************************************************************
//--------------             SAVE DATA TO CSV FILE OR INI FILE
procedure Save_LogFile(Result1 : boolean);
var
    Tstr,Tstr2 : string;
    //Data_Save  : TextFile ;
    //Name1 : String;

begin
      with main_form do
      begin
              Tstr := Check_BeforeSave(Robot.Process_No);
             try

                    {$I-}
                    Name1 := ExtractFileDir(ParamStr(0)) + '\LogFiles\'+FormatDateTime('yyyy-mm-dd',now)+'.csv';
                    //showmessage(Name1);
                    //CloseFile(Data_Save);
                    assignfile(Data_Save,Name1);
                    append(Data_Save);
                    writeln(Data_Save,Tstr);
                    flush(Data_Save);
                    CloseFile(Data_Save);

                    btn_Moving.Caption := 'COMPLETE';
                    pnl_height.Visible := true;
                    lblWait.Visible    := false;

                    if Result1 = true then
                    begin
                            pnl_height.Caption := 'OK';
                            pnl_height.Color   := ClLime;
                    end

                    else
                    begin
                            pnl_height.Caption := 'NG';
                            pnl_height.Color   := ClRed;
                    end;

            except
                     {$I+}
                    //CloseFile(Data_Save);

                    Name1 := ExtractFileDir(ParamStr(0)) + '\LogFiles\'+FormatDateTime('yyyy-mm-dd',now)+'.csv';
                    assignfile(Data_Save,Name1);
                    rewrite(Data_Save);
                    writeln(Data_Save,Tstr);
                    flush(Data_Save);
                    CloseFile(Data_Save);

                    pnl_height.Visible := true;
                    lblWait.Visible    := false;

                    if Result1 = true then
                    begin
                            pnl_height.Caption := 'OK';
                            pnl_height.Color   := ClLime;
                    end

                    else
                    begin
                            pnl_height.Caption := 'NG';
                            pnl_height.Color   := ClRed;
                    end;

                    btn_Moving.Caption := 'COMPLETE';
                    pnl_Height.Visible := true;
                    lblWait.Visible    := false;
             end;
      end;
end;





//******************************************************************************
//--------------     INITIAL FORM AND ALL PARAMETER
procedure Initial_System();
begin
      with main_form do
      begin
             edtSlant1.Text := '';
             edtSlant2.Text := '';
             edtSlant3.Text := '';
             edtSlant4.Text := '';
             edt_height.Text := '';
             et_xp1.Text := '';
             et_xp2.Text := '';
             et_xp3.Text := '';
             et_xp4.Text := '';
             et_xp5.Text := '';
             et_xp6.Text := '';
             et_xp7.Text := '';
             et_xp8.Text := '';
             et_xp9.Text := '';
             et_xp10.Text := '';
             et_xp11.Text := '';
             et_xp12.Text := '';
             et_xp13.Text := '';
             et_xp14.Text := '';
             et_xp15.Text := '';

             et_yp1.Text := '';
             et_yp2.Text := '';
             et_yp3.Text := '';
             et_yp4.Text := '';
             et_yp5.Text := '';
             et_yp6.Text := '';
             et_yp7.Text := '';
             et_yp8.Text := '';
             et_yp9.Text := '';
             et_yp10.Text := '';
             et_yp11.Text := '';
             et_yp12.Text := '';
             et_yp13.Text := '';
             et_yp14.Text := '';
             et_yp15.Text := '';

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
             btn_Moving.Caption := 'COMPLETE';

             edt_slant1.Text := '';
             edt_slant2.Text := '';
             edt_slant3.Text := '';
             et_movex.Text   := '';
             et_movey.Text   := '';

             pnl_Height.Caption := '';
             pnl_Height.Color   := ClbtnFace;
             edt_Height.Text    := '';
             edt_store.Text     := '';
             edt_Ref1.Text      := '';
             pnl_Height.Visible := true;
             lblWait.Visible    := false;

      end;
end;



//******************************************************************************
//--------------     Read And Write The Initial File
procedure LoadFileInitial(Item : string);
var
    nimi : Tinifile ;
    DirRoot   : string ;
    Auto_Zero : string;
begin
    GetDir(0,DirRoot) ;
    {$IOChecks off}
    MkDir('Config') ;
    {$IOChecks on}

    try
          nimi := tinifile.Create(ExtractFilePath(DirRoot+'\Config\')+'InitialFile.nong');
          with DataModule1 do
           begin
      //------------- Write ComPort then interface with height check sensor
                  if Item = 'W COM_MC' then
                    begin
                          nimi.WriteInteger('ConfigPort','BaudRate Machine' ,Commc.Baud) ;
                          Robot.BaudRateMc := ComMc.Baud;
                          nimi.WriteInteger('ConfigPort','ComPort Machine' ,Commc.ComNumber) ;
                    end;

      //------------- Read ComPort then interface with height check sensor
                  if Item = 'R COM_MC' then
                    begin
                          Commc.Baud := nimi.ReadInteger('ConfigPort','BaudRate Machine',9600) ;
                          Robot.BaudRateMc := Commc.Baud;

                          if Commc.Baud = 9600 then  frmComPort.rad9600.Checked    := true;
                          if Commc.Baud = 19200 then frmComPort.rad19200.Checked   := true;
                          if Commc.Baud = 38400 then frmComPort.rad38400.Checked   := true;
                          if Commc.Baud = 57600 then frmComPort.rad57600.Checked   := true;
                          if Commc.Baud = 115200 then frmComPort.rad115200.Checked := true;

                          Commc.ComNumber := nimi.ReadInteger('ConfigPort','ComPort Machine',1) ;
                          Commc.Open := true;
                    end;


                //------------- Write Process number
                if Item = 'W COMm1' then
                begin
                       nimi.WriteString('ConfigPort','COM Mc' ,main_form.edtComM1.Text) ;
                end;

                //------------- Read Process number
                if Item = 'R COMm1' then
                begin
                       main_form.edtComM1.Text := nimi.ReadString('ConfigPort','COM Mc','COM1') ;
                end;

           end;


         with main_form do
         begin
                //------------- Write Process number
                if Item = 'W PROCESS NO' then
                begin
                       case cmbProcessNo.ItemIndex of
                            0: Robot.Process_No := 0;
                            1: Robot.Process_No := 1;
                            2: Robot.Process_No := 2;
                            3: Robot.Process_No := 3;
                       end;

                       nimi.WriteInteger('SEQUENCE MACHINE','PROCESS NO. ' ,Robot.Process_No) ;
                       Check_ProcessNo(Robot.Process_No);
                end;

                //------------- Read Process number
                if Item = 'R PROCESS NO' then
                begin
                       Robot.Process_No := nimi.ReadInteger('SEQUENCE MACHINE','PROCESS NO. ',1) ;
                       case Robot.Process_No of
                            0: cmbProcessNo.ItemIndex := 0;
                            1: cmbProcessNo.ItemIndex := 1;
                            2: cmbProcessNo.ItemIndex := 2;
                            3: cmbProcessNo.ItemIndex := 3;
                       end;
                       Check_ProcessNo(Robot.Process_No);
                end;


                //------------- Write
                if Item = 'W POINT CONTROL' then
                begin
                        if Robot.Process_No = 1 then
                        begin
                                 nimi.WriteString('SPEC CONTROL','xPoint1' ,et_xp1.Text) ;
                                 nimi.WriteString('SPEC CONTROL','xPoint2' ,et_xp2.Text) ;
                                 nimi.WriteString('SPEC CONTROL','xPoint3' ,et_xp3.Text) ;
                                 nimi.WriteString('SPEC CONTROL','xPoint4' ,et_xp4.Text) ;
                                 nimi.WriteString('SPEC CONTROL','xPoint5' ,et_xp5.Text) ;
                                 nimi.WriteString('SPEC CONTROL','xPoint6' ,et_xp6.Text) ;
                                 nimi.WriteString('SPEC CONTROL','xPoint7' ,et_xp7.Text) ;
                                 nimi.WriteString('SPEC CONTROL','xPoint8' ,et_xp8.Text) ;
                                 nimi.WriteString('SPEC CONTROL','xPoint9' ,et_xp9.Text) ;
                                 nimi.WriteString('SPEC CONTROL','xPoint10' ,et_xp10.Text) ;
                                 nimi.WriteString('SPEC CONTROL','xPoint11' ,et_xp11.Text) ;
                                 nimi.WriteString('SPEC CONTROL','xPoint12' ,et_xp12.Text) ;

                                 nimi.WriteString('SPEC CONTROL','yPoint1' ,et_yp1.Text) ;
                                 nimi.WriteString('SPEC CONTROL','yPoint2' ,et_yp2.Text) ;
                                 nimi.WriteString('SPEC CONTROL','yPoint3' ,et_yp3.Text) ;
                                 nimi.WriteString('SPEC CONTROL','yPoint4' ,et_yp4.Text) ;
                                 nimi.WriteString('SPEC CONTROL','yPoint5' ,et_yp5.Text) ;
                                 nimi.WriteString('SPEC CONTROL','yPoint6' ,et_yp6.Text) ;
                                 nimi.WriteString('SPEC CONTROL','yPoint7' ,et_yp7.Text) ;
                                 nimi.WriteString('SPEC CONTROL','yPoint8' ,et_yp8.Text) ;
                                 nimi.WriteString('SPEC CONTROL','yPoint9' ,et_yp9.Text) ;
                                 nimi.WriteString('SPEC CONTROL','yPoint10' ,et_yp10.Text) ;
                                 nimi.WriteString('SPEC CONTROL','yPoint11' ,et_yp11.Text) ;
                                 nimi.WriteString('SPEC CONTROL','yPoint12' ,et_yp12.Text) ;


                        end;

                        if Robot.Process_No = 2 then
                        begin
                                 nimi.WriteString('SPEC CONTROL','x3Point1' ,et_xp1.Text) ;
                                 nimi.WriteString('SPEC CONTROL','x3Point2' ,et_xp2.Text) ;
                                 nimi.WriteString('SPEC CONTROL','x3Point3' ,et_xp3.Text) ;
                                 nimi.WriteString('SPEC CONTROL','x3Point4' ,et_xp4.Text) ;
                                 nimi.WriteString('SPEC CONTROL','x3Point5' ,et_xp5.Text) ;
                                 nimi.WriteString('SPEC CONTROL','x3Point6' ,et_xp6.Text) ;
                                 nimi.WriteString('SPEC CONTROL','x3Point7' ,et_xp7.Text) ;
                                 nimi.WriteString('SPEC CONTROL','x3Point8' ,et_xp8.Text) ;
                                 nimi.WriteString('SPEC CONTROL','x3Point9' ,et_xp9.Text) ;
                                 nimi.WriteString('SPEC CONTROL','x3Point10' ,et_xp10.Text) ;
                                 nimi.WriteString('SPEC CONTROL','x3Point11' ,et_xp11.Text) ;
                                 nimi.WriteString('SPEC CONTROL','x3Point12' ,et_xp12.Text) ;

                                 nimi.WriteString('SPEC CONTROL','y3Point1' ,et_yp1.Text) ;
                                 nimi.WriteString('SPEC CONTROL','y3Point2' ,et_yp2.Text) ;
                                 nimi.WriteString('SPEC CONTROL','y3Point3' ,et_yp3.Text) ;
                                 nimi.WriteString('SPEC CONTROL','y3Point4' ,et_yp4.Text) ;
                                 nimi.WriteString('SPEC CONTROL','y3Point5' ,et_yp5.Text) ;
                                 nimi.WriteString('SPEC CONTROL','y3Point6' ,et_yp6.Text) ;
                                 nimi.WriteString('SPEC CONTROL','y3Point7' ,et_yp7.Text) ;
                                 nimi.WriteString('SPEC CONTROL','y3Point8' ,et_yp8.Text) ;
                                 nimi.WriteString('SPEC CONTROL','y3Point9' ,et_yp9.Text) ;
                                 nimi.WriteString('SPEC CONTROL','y3Point10' ,et_yp10.Text) ;
                                 nimi.WriteString('SPEC CONTROL','y3Point11' ,et_yp11.Text) ;
                                 nimi.WriteString('SPEC CONTROL','y3Point12' ,et_yp12.Text) ;
                        end;
                            /////////////////////////////////////////////////////////////////////////////
                            nimi.WriteString('POS CONTROL','X1_1' ,EdtX1_1.Text) ;
                            nimi.WriteString('POS CONTROL','X1_2' ,EdtX1_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y1_1' ,EdtY1_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y1_2' ,EdtY1_2.Text) ;

                            nimi.WriteString('POS CONTROL','X2_1' ,EdtX2_1.Text) ;
                            nimi.WriteString('POS CONTROL','X2_2' ,EdtX2_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y2_1' ,EdtY2_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y2_2' ,EdtY2_2.Text) ;

                            nimi.WriteString('POS CONTROL','X3_1' ,EdtX3_1.Text) ;
                            nimi.WriteString('POS CONTROL','X3_2' ,EdtX3_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y3_1' ,EdtY3_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y3_2' ,EdtY3_2.Text) ;

                            nimi.WriteString('POS CONTROL','X4_1' ,EdtX4_1.Text) ;
                            nimi.WriteString('POS CONTROL','X4_2' ,EdtX4_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y4_1' ,EdtY4_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y4_2' ,EdtY4_2.Text) ;

                            nimi.WriteString('POS CONTROL','X5_1' ,EdtX5_1.Text) ;
                            nimi.WriteString('POS CONTROL','X5_2' ,EdtX5_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y5_1' ,EdtY5_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y5_2' ,EdtY5_2.Text) ;

                            nimi.WriteString('POS CONTROL','X6_1' ,EdtX6_1.Text) ;
                            nimi.WriteString('POS CONTROL','X6_2' ,EdtX6_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y6_1' ,EdtY6_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y6_2' ,EdtY6_2.Text) ;

                            nimi.WriteString('POS CONTROL','X7_1' ,EdtX7_1.Text) ;
                            nimi.WriteString('POS CONTROL','X7_2' ,EdtX7_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y7_1' ,EdtY7_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y7_2' ,EdtY7_2.Text) ;

                            /////////////////////////////////////////////////////////////////////////////
                            nimi.WriteString('POS CONTROL','X8_1' ,EdtX8_1.Text) ;
                            nimi.WriteString('POS CONTROL','X8_2' ,EdtX8_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y8_1' ,EdtY8_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y8_2' ,EdtY8_2.Text) ;

                            nimi.WriteString('POS CONTROL','X9_1' ,EdtX9_1.Text) ;
                            nimi.WriteString('POS CONTROL','X9_2' ,EdtX9_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y9_1' ,EdtY9_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y9_2' ,EdtY9_2.Text) ;

                            nimi.WriteString('POS CONTROL','X10_1' ,EdtX10_1.Text) ;
                            nimi.WriteString('POS CONTROL','X10_2' ,EdtX10_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y10_1' ,EdtY10_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y10_2' ,EdtY10_2.Text) ;

                            nimi.WriteString('POS CONTROL','X11_1' ,EdtX11_1.Text) ;
                            nimi.WriteString('POS CONTROL','X11_2' ,EdtX11_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y11_1' ,EdtY11_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y11_2' ,EdtY11_2.Text) ;

                            /////////////////////////////////////////////////////////////////////////////
                            nimi.WriteString('POS CONTROL','X12_1' ,EdtX12_1.Text) ;
                            nimi.WriteString('POS CONTROL','X12_2' ,EdtX12_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y12_1' ,EdtY12_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y12_2' ,EdtY12_2.Text) ;

                            nimi.WriteString('POS CONTROL','X13_1' ,EdtX13_1.Text) ;
                            nimi.WriteString('POS CONTROL','X13_2' ,EdtX13_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y13_1' ,EdtY13_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y13_2' ,EdtY13_2.Text) ;

                            nimi.WriteString('POS CONTROL','X14_1' ,EdtX14_1.Text) ;
                            nimi.WriteString('POS CONTROL','X14_2' ,EdtX14_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y14_1' ,EdtY14_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y14_2' ,EdtY14_2.Text) ;

                            nimi.WriteString('POS CONTROL','X15_1' ,EdtX15_1.Text) ;
                            nimi.WriteString('POS CONTROL','X15_2' ,EdtX15_2.Text) ;
                            nimi.WriteString('POS CONTROL','Y15_1' ,EdtY15_1.Text) ;
                            nimi.WriteString('POS CONTROL','Y15_2' ,EdtY15_2.Text) ;

                            nimi.WriteString('POS CONTROL','ORIGIN X' ,edt_Zx.Text) ;
                            nimi.WriteString('POS CONTROL','ORIGIN Y' ,edt_Zy.Text) ;

                end;

                //------------- Read Process number
                if Item = 'R POINT CONTROL' then
                begin
                        if Robot.Process_No = 1 then
                        begin
                                 et_xp1.Text := nimi.ReadString('SPEC CONTROL','xPoint1','1') ;
                                 et_xp2.Text := nimi.ReadString('SPEC CONTROL','xPoint2','1') ;
                                 et_xp3.Text := nimi.ReadString('SPEC CONTROL','xPoint3','1') ;
                                 et_xp4.Text := nimi.ReadString('SPEC CONTROL','xPoint4','1') ;
                                 et_xp5.Text := nimi.ReadString('SPEC CONTROL','xPoint5','1') ;
                                 et_xp6.Text := nimi.ReadString('SPEC CONTROL','xPoint6','1') ;
                                 et_xp7.Text := nimi.ReadString('SPEC CONTROL','xPoint7','1') ;
                                 et_xp8.Text := nimi.ReadString('SPEC CONTROL','xPoint8','1') ;
                                 et_xp9.Text := nimi.ReadString('SPEC CONTROL','xPoint9','1') ;
                                 et_xp10.Text := nimi.ReadString('SPEC CONTROL','xPoint10','1') ;
                                 et_xp11.Text := nimi.ReadString('SPEC CONTROL','xPoint11','1') ;
                                 et_xp12.Text := nimi.ReadString('SPEC CONTROL','xPoint12','1') ;

                                 et_yp1.Text := nimi.ReadString('SPEC CONTROL','yPoint1','1') ;
                                 et_yp2.Text := nimi.ReadString('SPEC CONTROL','yPoint2','1') ;
                                 et_yp3.Text := nimi.ReadString('SPEC CONTROL','yPoint3','1') ;
                                 et_yp4.Text := nimi.ReadString('SPEC CONTROL','yPoint4','1') ;
                                 et_yp5.Text := nimi.ReadString('SPEC CONTROL','yPoint5','1') ;
                                 et_yp6.Text := nimi.ReadString('SPEC CONTROL','yPoint6','1') ;
                                 et_yp7.Text := nimi.ReadString('SPEC CONTROL','yPoint7','1') ;
                                 et_yp8.Text := nimi.ReadString('SPEC CONTROL','yPoint8','1') ;
                                 et_yp9.Text := nimi.ReadString('SPEC CONTROL','yPoint9','1') ;
                                 et_yp10.Text := nimi.ReadString('SPEC CONTROL','yPoint10','1') ;
                                 et_yp11.Text := nimi.ReadString('SPEC CONTROL','yPoint11','1') ;
                                 et_yp12.Text := nimi.ReadString('SPEC CONTROL','yPoint12','1') ;
                        end;

                        if Robot.Process_No = 2 then
                        begin
                                 et_xp1.Text := nimi.ReadString('SPEC CONTROL','x3Point1','1') ;
                                 et_xp2.Text := nimi.ReadString('SPEC CONTROL','x3Point2','1') ;
                                 et_xp3.Text := nimi.ReadString('SPEC CONTROL','x3Point3','1') ;
                                 et_xp4.Text := nimi.ReadString('SPEC CONTROL','x3Point4','1') ;
                                 et_xp5.Text := nimi.ReadString('SPEC CONTROL','x3Point5','1') ;
                                 et_xp6.Text := nimi.ReadString('SPEC CONTROL','x3Point6','1') ;
                                 et_xp7.Text := nimi.ReadString('SPEC CONTROL','x3Point7','1') ;
                                 et_xp8.Text := nimi.ReadString('SPEC CONTROL','x3Point8','1') ;
                                 et_xp9.Text := nimi.ReadString('SPEC CONTROL','x3Point9','1') ;
                                 et_xp10.Text := nimi.ReadString('SPEC CONTROL','x3Point10','1') ;
                                 et_xp11.Text := nimi.ReadString('SPEC CONTROL','x3Point11','1') ;
                                 et_xp12.Text := nimi.ReadString('SPEC CONTROL','x3Point12','1') ;

                                 et_yp1.Text := nimi.ReadString('SPEC CONTROL','y3Point1','1') ;
                                 et_yp2.Text := nimi.ReadString('SPEC CONTROL','y3Point2','1') ;
                                 et_yp3.Text := nimi.ReadString('SPEC CONTROL','y3Point3','1') ;
                                 et_yp4.Text := nimi.ReadString('SPEC CONTROL','y3Point4','1') ;
                                 et_yp5.Text := nimi.ReadString('SPEC CONTROL','y3Point5','1') ;
                                 et_yp6.Text := nimi.ReadString('SPEC CONTROL','y3Point6','1') ;
                                 et_yp7.Text := nimi.ReadString('SPEC CONTROL','y3Point7','1') ;
                                 et_yp8.Text := nimi.ReadString('SPEC CONTROL','y3Point8','1') ;
                                 et_yp9.Text := nimi.ReadString('SPEC CONTROL','y3Point9','1') ;
                                 et_yp10.Text := nimi.ReadString('SPEC CONTROL','y3Point10','1') ;
                                 et_yp11.Text := nimi.ReadString('SPEC CONTROL','y3Point11','1') ;
                                 et_yp12.Text := nimi.ReadString('SPEC CONTROL','y3Point12','1') ;
                        end;

                            /////////////////////////////////////////////////////////////////////////////
                            EdtX1_1.Text := nimi.ReadString('POS CONTROL','X1_1' ,'10000') ;
                            EdtX1_2.Text := nimi.ReadString('POS CONTROL','X1_2' ,'20000') ;
                            EdtY1_1.Text := nimi.ReadString('POS CONTROL','Y1_1' ,'30000') ;
                            EdtY1_2.Text := nimi.ReadString('POS CONTROL','Y1_2' ,'40000') ;

                            EdtX2_1.Text := nimi.ReadString('POS CONTROL','X2_1' ,'10000') ;
                            EdtX2_2.Text := nimi.ReadString('POS CONTROL','X2_2' ,'20000') ;
                            EdtY2_1.Text := nimi.ReadString('POS CONTROL','Y2_1' ,'30000') ;
                            EdtY2_2.Text := nimi.ReadString('POS CONTROL','Y2_2' ,'40000') ;

                            EdtX3_1.Text := nimi.ReadString('POS CONTROL','X3_1' ,'10000') ;
                            EdtX3_2.Text := nimi.ReadString('POS CONTROL','X3_2' ,'20000') ;
                            EdtY3_1.Text := nimi.ReadString('POS CONTROL','Y3_1' ,'30000') ;
                            EdtY3_2.Text := nimi.ReadString('POS CONTROL','Y3_2' ,'40000') ;

                            EdtX4_1.Text := nimi.ReadString('POS CONTROL','X4_1' ,'10000') ;
                            EdtX4_2.Text := nimi.ReadString('POS CONTROL','X4_2' ,'20000') ;
                            EdtY4_1.Text := nimi.ReadString('POS CONTROL','Y4_1' ,'30000') ;
                            EdtY4_2.Text := nimi.ReadString('POS CONTROL','Y4_2' ,'40000') ;

                            EdtX5_1.Text := nimi.ReadString('POS CONTROL','X5_1' ,'10000') ;
                            EdtX5_2.Text := nimi.ReadString('POS CONTROL','X5_2' ,'20000') ;
                            EdtY5_1.Text := nimi.ReadString('POS CONTROL','Y5_1' ,'30000') ;
                            EdtY5_2.Text := nimi.ReadString('POS CONTROL','Y5_2' ,'40000') ;

                            EdtX6_1.Text := nimi.ReadString('POS CONTROL','X6_1' ,'10000') ;
                            EdtX6_2.Text := nimi.ReadString('POS CONTROL','X6_2' ,'20000') ;
                            EdtY6_1.Text := nimi.ReadString('POS CONTROL','Y6_1' ,'30000') ;
                            EdtY6_2.Text := nimi.ReadString('POS CONTROL','Y6_2' ,'40000') ;

                            EdtX7_1.Text := nimi.ReadString('POS CONTROL','X7_1' ,'10000') ;
                            EdtX7_2.Text := nimi.ReadString('POS CONTROL','X7_2' ,'20000') ;
                            EdtY7_1.Text := nimi.ReadString('POS CONTROL','Y7_1' ,'30000') ;
                            EdtY7_2.Text := nimi.ReadString('POS CONTROL','Y7_2' ,'40000') ;

                            /////////////////////////////////////////////////////////////////////////////
                            EdtX8_1.Text := nimi.ReadString('POS CONTROL','X8_1' ,'10000') ;
                            EdtX8_2.Text := nimi.ReadString('POS CONTROL','X8_2' ,'20000') ;
                            EdtY8_1.Text := nimi.ReadString('POS CONTROL','Y8_1' ,'30000') ;
                            EdtY8_2.Text := nimi.ReadString('POS CONTROL','Y8_2' ,'40000') ;

                            EdtX9_1.Text := nimi.ReadString('POS CONTROL','X9_1' ,'10000') ;
                            EdtX9_2.Text := nimi.ReadString('POS CONTROL','X9_2' ,'20000') ;
                            EdtY9_1.Text := nimi.ReadString('POS CONTROL','Y9_1' ,'30000') ;
                            EdtY9_2.Text := nimi.ReadString('POS CONTROL','Y9_2' ,'40000') ;

                            EdtX10_1.Text := nimi.ReadString('POS CONTROL','X10_1' ,'10000') ;
                            EdtX10_2.Text := nimi.ReadString('POS CONTROL','X10_2' ,'20000') ;
                            EdtY10_1.Text := nimi.ReadString('POS CONTROL','Y10_1' ,'30000') ;
                            EdtY10_2.Text := nimi.ReadString('POS CONTROL','Y10_2' ,'40000') ;

                            EdtX11_1.Text := nimi.ReadString('POS CONTROL','X11_1' ,'10000') ;
                            EdtX11_2.Text := nimi.ReadString('POS CONTROL','X11_2' ,'20000') ;
                            EdtY11_1.Text := nimi.ReadString('POS CONTROL','Y11_1' ,'30000') ;
                            EdtY11_2.Text := nimi.ReadString('POS CONTROL','Y11_2' ,'40000') ;

                            /////////////////////////////////////////////////////////////////////////////
                            EdtX12_1.Text := nimi.ReadString('POS CONTROL','X12_1' ,'10000') ;
                            EdtX12_2.Text := nimi.ReadString('POS CONTROL','X12_2' ,'20000') ;
                            EdtY12_1.Text := nimi.ReadString('POS CONTROL','Y12_1' ,'30000') ;
                            EdtY12_2.Text := nimi.ReadString('POS CONTROL','Y12_2' ,'40000') ;

                            EdtX13_1.Text := nimi.ReadString('POS CONTROL','X13_1' ,'10000') ;
                            EdtX13_2.Text := nimi.ReadString('POS CONTROL','X13_2' ,'20000') ;
                            EdtY13_1.Text := nimi.ReadString('POS CONTROL','Y13_1' ,'30000') ;
                            EdtY13_2.Text := nimi.ReadString('POS CONTROL','Y13_2' ,'40000') ;

                            EdtX14_1.Text := nimi.ReadString('POS CONTROL','X14_1' ,'10000') ;
                            EdtX14_2.Text := nimi.ReadString('POS CONTROL','X14_2' ,'20000') ;
                            EdtY14_1.Text := nimi.ReadString('POS CONTROL','Y14_1' ,'30000') ;
                            EdtY14_2.Text := nimi.ReadString('POS CONTROL','Y14_2' ,'40000') ;

                            EdtX15_1.Text := nimi.ReadString('POS CONTROL','X15_1' ,'10000') ;
                            EdtX15_2.Text := nimi.ReadString('POS CONTROL','X15_2' ,'20000') ;
                            EdtY15_1.Text := nimi.ReadString('POS CONTROL','Y15_1' ,'30000') ;
                            EdtY15_2.Text := nimi.ReadString('POS CONTROL','Y15_2' ,'40000') ;


                            edt_Zx.Text := nimi.ReadString('POS CONTROL','ORIGIN X' ,'151') ;
                            edt_Zy.Text := nimi.ReadString('POS CONTROL','ORIGIN Y' ,'865') ;
                end;


                //------------- Write
                if Item = 'W SERVO SPEED' then
                begin
                       nimi.WriteString('SPEC CONTROL','Servo Speed' ,edtSpeed.Text) ;
                       Robot_Speed();
                end;

                //------------- Read
                if Item = 'R SERVO SPEED' then
                begin
                       edtSpeed.Text := nimi.ReadString('SPEC CONTROL','Servo Speed','100') ;
                       Robot_Speed();
                end;

                //------------- Write
                if Item = 'W SPEC' then
                begin

                       nimi.WriteString('SPEC CONTROL','MAX4_7' ,edt_4_7max.Text) ;
                       nimi.WriteString('SPEC CONTROL','MIN4_7' ,edt_4_7min.Text) ;

                       nimi.WriteString('SPEC CONTROL','MAX8_11' ,edt_8_11max.Text) ;
                       nimi.WriteString('SPEC CONTROL','MIN8_11' ,edt_8_11min.Text) ;
                       nimi.WriteString('SPEC CONTROL','MAX12_15' ,edt_12_15max.Text) ;
                       nimi.WriteString('SPEC CONTROL','MIN12_15' ,edt_12_15min.Text) ;

                       Robot.max_4_7  := strtofloat(edt_4_7max.Text);
                       Robot.min_4_7  := strtofloat(edt_4_7min.Text);
                       Robot.max_8_11  := strtofloat(edt_8_11max.Text);
                       Robot.min_8_11  := strtofloat(edt_8_11min.Text);
                       Robot.max_12_15 := strtofloat(edt_12_15max.Text);
                       Robot.min_12_15 := strtofloat(edt_12_15min.Text);

                       lbl4_7.Caption   := edt_4_7min.Text+'~'+edt_4_7max.Text;
                       lbl8_11.Caption  := edt_8_11min.Text+'~'+edt_8_11max.Text;
                       lbl12_15.Caption := edt_12_15min.Text+'~'+edt_12_15max.Text;

                       Robot.ref_slant2 := Robot.Max_4_7-Robot.Min_4_7;
                       Robot.ref_slant3 := Robot.Max_8_11-Robot.Min_8_11;
                       Robot.ref_slant4 := Robot.Max_12_15-Robot.Min_12_15;

                       l_slant2.Caption := '0'+'~'+FormatFloat('0.000',Robot.ref_slant2);
                       l_slant3.Caption := '0'+'~'+FormatFloat('0.000',Robot.ref_slant3);
                       l_slant4.Caption := '0'+'~'+FormatFloat('0.000',Robot.ref_slant4);
                end;

                //------------- Read
                if Item = 'R SPEC' then
                begin
                       edt_4_7max.Text := nimi.ReadString('SPEC CONTROL','MAX4_7','0.57');
                       edt_4_7min.Text := nimi.ReadString('SPEC CONTROL','MIN4_7','0.53');
                       edt_8_11max.Text := nimi.ReadString('SPEC CONTROL','MAX8_11','0.57');
                       edt_8_11min.Text := nimi.ReadString('SPEC CONTROL','MIN8_11','0.53');
                       edt_12_15max.Text := nimi.ReadString('SPEC CONTROL','MAX12_15','0.57');
                       edt_12_15min.Text := nimi.ReadString('SPEC CONTROL','MIN12_15','0.53');

                       Robot.max_4_7  := strtofloat(edt_4_7max.Text);
                       Robot.min_4_7  := strtofloat(edt_4_7min.Text);
                       Robot.max_8_11  := strtofloat(edt_8_11max.Text);
                       Robot.min_8_11  := strtofloat(edt_8_11min.Text);
                       Robot.max_12_15 := strtofloat(edt_12_15max.Text);
                       Robot.min_12_15 := strtofloat(edt_12_15min.Text);

                       lbl4_7.Caption   := edt_4_7min.Text+'~'+edt_4_7max.Text;
                       lbl8_11.Caption  := edt_8_11min.Text+'~'+edt_8_11max.Text;
                       lbl12_15.Caption := edt_12_15min.Text+'~'+edt_12_15max.Text;

                       Robot.ref_slant2 := Robot.Max_4_7-Robot.Min_4_7;
                       Robot.ref_slant3 := Robot.Max_8_11-Robot.Min_8_11;
                       Robot.ref_slant4 := Robot.Max_12_15-Robot.Min_12_15;

                       l_slant2.Caption := '0'+'~'+FormatFloat('0.000',Robot.ref_slant2);
                       l_slant3.Caption := '0'+'~'+FormatFloat('0.000',Robot.ref_slant3);
                       l_slant4.Caption := '0'+'~'+FormatFloat('0.000',Robot.ref_slant4);
                end;

                //------------- Write
                if Item = 'W AUTO ZERO' then
                begin
                       if frmComPort.radSr_On.Checked = true then
                       begin
                              Auto_Zero := 'ON';
                              DataModule1.ComMc.PutString('V1'+#13);
                       end
                       else
                       begin
                              Auto_Zero := 'OFF';
                              DataModule1.ComMc.PutString('W1'+#13);
                       end;
                       nimi.WriteString('SPEC CONTROL','AUTO ZERO' ,Auto_Zero);
                end;

                //------------- Read
                if Item = 'R AUTO ZERO' then
                begin
                       Auto_Zero := nimi.ReadString('SPEC CONTROL','AUTO ZERO','ON');
                       if Auto_Zero = 'ON' then
                       begin
                              frmComPort.radSr_On.Checked := true;
                              DataModule1.ComMc.PutString('V1'+#13);
                       end
                       else
                       begin
                              frmComPort.radSr_Off.Checked := true;
                              DataModule1.ComMc.PutString('W1'+#13);
                       end;
                end;


                //------------- Write
                if Item = 'W COUNT DATA' then
                begin
                       inc(Dat_Total);
                       nimi.WriteInteger('Total of data','COUNT' ,Dat_Total);
                       edt_Total.Text := inttostr(Dat_Total);
                end;

                //------------- Write
                if Item = 'W COUNT DATAe' then
                begin
                       Dat_Total := strtoint(edt_Total.Text);
                       nimi.WriteInteger('Total of data','COUNT' ,Dat_Total);
                end;

                //------------- Read
                if Item = 'R COUNT DATA' then
                begin
                       Dat_Total := nimi.ReadInteger('Total of data','COUNT',0);
                       edt_Total.Text := inttostr(Dat_Total);
                end;

         end;

    except

    end;

end;


//##############################################################################
function Read_Or_Write_Files(Item : string) : string;
var
    nimi       : Tinifile ;
    DirRoot    : string ;
    Td : string;
begin
    GetDir(0,DirRoot) ;
    {$IOChecks off}
    MkDir('Config') ;
    {$IOChecks on}

    try
    nimi := tinifile.Create(ExtractFilePath(DirRoot+'\Config\')+'InitialFile.nong');
    with main_form do
     begin
//------------- Write ComPort of qr code
            if Item = 'W dd' then
              begin
                    Td := formatdatetime('yyyy-mm-dd',now);
                    nimi.WriteString('SEPARED FILE','Date' ,Td) ;

              end;

//------------- Read ComPort of qr code
            if Item = 'R dd' then
              begin
                    Td := nimi.ReadString('SEPARED FILE','Date','2012-12-12') ;
              end;

           result := Td;
    end;

    except

    end;

end;



end.
