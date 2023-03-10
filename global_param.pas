unit global_param;
interface
uses usedll,

  Windows, Messages, SysUtils, Variants, Classes, Graphics,  Forms,
  Dialogs, StdCtrls, ComCtrls, OoMisc, AdPort ,inifiles ;
type
     MyRob = record
          BaudRateMc : integer;
          Data_No    : byte;
          Process_No : byte;
          Max_Spe    : single;
          Min_Spe    : single;
          ref_slant1 : real;
          ref_slant2 : real;
          ref_slant3 : real;
          ref_slant4 : real;
          Tdat       : string;
          Error_     : boolean;
          max_4_15   : real;
          min_4_15   : real;
          max_4_7    : real;
          min_4_7    : real;
          max_8_11   : real;
          min_8_11   : real;
          max_12_15  : real;
          min_12_15  : real;
     end;

var
    Robot       : MyRob;
    robot_port  : hwnd;
    txreg,rxreg : wordarray;
    cnt_add     : word;
    Dat_Total   : integer;
    Name1       : string;

    Data_AddPro1 : array[0..3] of real;
    Data_AddPro2 : array[0..3] of real;
    Data_AddPro3 : array[0..3] of real;
    Data_AddPro4 : array[0..3] of real;

    arr : array[0..14] of real;
    AReal2 : array[0..3]  of real;
    AReal3 : array[0..3]  of real;
    AReal4 : array[0..3]  of real;

    MaxHeight,MinHeight  : real;
    MaxSlant1,MinSlant1  : real;
    MaxSlant2,MinSlant2  : real;
    MaxSlant3,MinSlant3  : real;

    Gb_Point : array [1..15] of TEdit ;

    const
       _ZERO_   = 0;
       _FIRST_  = 1;
       _SECOND_ = 2;
       _THIRD_  = 3;

       procedure Delay(msecs:integer);

implementation

////////////////////////////////////////////////////////
//        Delay                                       //
//                                                    //
//  Can Use for ather program (Program BUSY when use) //
////////////////////////////////////////////////////////
procedure Delay(msecs:integer);
var
    FirstTickCount:longint;
begin
    FirstTickCount := GetTickCount;
repeat
    Application.ProcessMessages;
until ((GetTickCount-FirstTickCount) >= Longint(msecs));
end;
//{{{{{{{{{{{{ END }}}}}}}}}}}}//

end.
