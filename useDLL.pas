unit useDLL;

interface

uses  Windows, GpcMtn;
type wordarray = array[0..15] of word;

  function  OpenPort(name:ansistring ; buad:integer ; xwnd :hwnd):boolean ;
  stdcall;  external'RoboCom.dll';
  function  WritePort(data:ansistring ; data_length:integer):boolean ;
  stdcall;  external'RoboCom.dll';
  function  ClosePort():boolean ;
  stdcall;  external'RoboCom.dll';
  function  IsPortOpened():boolean ;
  stdcall;  external'RoboCom.dll';

function MtnReset(hDeviceHandle: THandle; wAxis: WORD; wMode: WORD): Integer; stdcall; external 'RoboCom.dll';
function MtnSetPulseOut(hDeviceHandle: THandle; wAxis: WORD; wMode: WORD; wConfig: WORD): Integer; stdcall; external 'RoboCom.dll';
function MtnSetLimitConfig(hDeviceHandle: THandle; wAxis: WORD; wMode: WORD; wConfig: WORD): Integer; stdcall; external 'RoboCom.dll';
function MtnSetCounterConfig(hDeviceHandle: THandle; wAxis: WORD; wMode: WORD; wConfig: WORD): Integer; stdcall; external 'RoboCom.dll';
function MtnSetMotion(hDeviceHandle: THandle; wAxis: WORD; dwMode: DWORD; var lpMotion: MTNMOTION): Integer; stdcall; external 'RoboCom.dll';
function MtnSetMotionLine(hDeviceHandle: THandle; dwMove: DWORD; var lpLine: MTNLINE): Integer; stdcall; external 'RoboCom.dll';
function MtnStartMotion(hDeviceHandle: THandle; wAxis, wStartMode, wMoveMode: WORD): Integer; stdcall; external 'RoboCom.dll';
function MtnStopMotion(hDeviceHandle: THandle; wAxis: WORD; wMode: WORD): Integer; stdcall; external 'RoboCom.dll';
function MtnGetStatus(hDeviceHandle: THandle; wAxis: WORD; wMode: WORD; var lpdwStatus: DWORD): Integer; stdcall; external 'RoboCom.dll';
function MtnReadSpeed(hDeviceHandle: THandle; wAxis: WORD; var lpfSpeed: Single): Integer; stdcall; external 'RoboCom.dll';
function MtnReadCounter(hDeviceHandle: THandle; wAxis: WORD; wCntMode: WORD; var lplPos: Integer): Integer; stdcall; external 'RoboCom.dll';
function MtnClearCounter(hDeviceHandle: THandle; wAxis: WORD; wCntMode: WORD): Integer; stdcall; external 'RoboCom.dll';
function MtnOutputDO(hDeviceHandle: THandle;wAxis: WORD ;wDO: WORD): Integer; stdcall; external 'RoboCom.dll';

function MtnSetComparator(hDeviceHandle: THandle; wAxis: WORD; wCompNo: WORD; var lpComp: integer): Integer; stdcall; external 'RoboCom.dll';
function MtnSetSync(hDeviceHandle: THandle; wAxis: WORD; wMode: WORD; var lpwSync: WORD): Integer; stdcall; external 'RoboCom.dll';
function MtnSetMotionArc(hDeviceHandle: THandle; dwMove: DWORD; var lpArc: MTNARC): Integer; stdcall; external 'RoboCom.dll';
function MtnOutputSync(hDeviceHandle: THandle; wSignal: WORD): Integer; stdcall; external 'RoboCom.dll';
function MtnSetEvent(hDeviceHandle: THandle; var lpEvent: MTNEVENTREQ): Integer; stdcall; external 'RoboCom.dll';
function MtnSetEventMask(hDeviceHandle: THandle; wAxis: WORD; var lpMask: MTNEVENTTABLE): Integer; stdcall; external 'RoboCom.dll';

//----> use for get wave

function MtnSetSampleCounter(ulSampleRate:longword): Integer; stdcall; external 'RoboCom.dll';
function MtnGetAllSampleData(var pulSampleNum: longword; var lpCounterData: MTNSAMPDATA; var lpEncoderData: MTNSAMPDATA): Integer; stdcall; external 'RoboCom.dll';
function MtnGetSampleData(axis:word;var pulSampleNum: longword; var lpCounterData: MTNSAMPDATA; var lpEncoderData: MTNSAMPDATA): Integer; stdcall; external 'RoboCom.dll';
function MtnStartSampleCounter(): Integer; stdcall; external 'RoboCom.dll';
function MtnStopSampleCounter(): Integer; stdcall; external 'RoboCom.dll';

//--------> PC to Robot

function SetMode(mode : integer) : integer; stdcall; external 'RoboCom.dll';
function GetPoint(var p_point : t_point ; var num : integer): integer;stdcall;  external 'RoboCom.dll';
function SetPoint(var point : t_point ; num : integer): integer;stdcall;  external 'RoboCom.dll';
function SavePoint(): integer;stdcall; external 'RoboCom.dll';   //----> save point to eeprom
function GetParam(target:integer;var param : t_param; var num :integer): integer;stdcall;  external 'RoboCom.dll';
function SetParam(target:integer;var param : t_param; num :integer): integer;stdcall; external 'RoboCom.dll';
function GetMode(var mode): integer;stdcall; external 'RoboCom.dll'; //----> check now mode
function GetShift(var shift:t_shift):integer;stdcall; external 'RoboCom.dll';
function SaveShift(): integer;stdcall; external 'RoboCom.dll';
function SetShift(var shift:t_shift):integer;stdcall; external 'RoboCom.dll';
function GetHand(var hand : t_hand):integer;stdcall; external 'RoboCom.dll';
function SetHand(var hand : t_hand):integer;stdcall; external 'RoboCom.dll';
function SaveHand(): integer;stdcall; external 'RoboCom.dll';
function GetPallet(var p_pallet : tx_pallet;var num : integer):integer;stdcall; external 'RoboCom.dll';
function SetPallet(var p_pallet : tx_pallet;num : integer):integer;stdcall; external 'RoboCom.dll';
function SavePallet(): integer;stdcall; external 'RoboCom.dll';
//------> Manual Mode
function MtnOrgSearch(wAxis: integer):integer;stdcall; external 'RoboCom.dll';
function MtnGetMachineRef( wAxis:WORD ; var lpMref: integer  ): integer; stdcall; external 'RoboCom.dll';
function MtnServoOn(wAxis : integer;wmode:integer):integer; stdcall; external 'RoboCom.dll'; //mode:  0=off,1=on,2=break

//-------> Auto Mode
function GetAutoModeSts(var p_status:word):integer; stdcall; external 'RoboCom.dll';
function GetProgram( wProgramNo:integer; ProgramName:pchar; BinFileName:pchar; TxtFileName: pchar): integer; stdcall; external 'RoboCom.dll';
function StartProgram(): integer; stdcall; external 'RoboCom.dll';
function StopProgram(): integer; stdcall; external 'RoboCom.dll';
function StepProgram(): integer; stdcall; external 'RoboCom.dll';
function ResetProgram(): integer; stdcall; external 'RoboCom.dll';
function GetCurrentLineNo( var p_current_line_no : integer): integer; stdcall; external 'RoboCom.dll';
function SetBreakPoint(stop_line_no: integer ): integer; stdcall; external 'RoboCom.dll';
function DeleteBreakPoint(): integer; stdcall; external 'RoboCom.dll';
function GetBreakPoint(var p_line_no : word):integer;external 'RoboCom.dll';
//-------> System mode

function GetFWVersion( wTarget : integer ; pVersion : pchar ): Integer; stdcall; external 'RoboCom.dll';
function ProgramDownload(xtype : word; Num : word;filename :pchar):integer; stdcall; external 'RoboCom.dll';
//* 0=program in SDRAM, 1-4=program in flash memory, if no program then "" is set. *//
function SetProgram(ProgramName:pchar;BinFileName: pchar): integer; stdcall; external 'RoboCom.dll';
function SaveProgram( wProgramNo: integer): integer; stdcall; external 'RoboCom.dll';
//* wProgramNo : 1 to 4 *//
function GetProgramName(programno : word;ProgramName : pchar): integer; stdcall; external 'RoboCom.dll';
//function GetProgram(programno:word;ProgramName : pchar ; BinFileName:Pchar ; TxtFileName:Pchar ): integer;stdcall; external 'RoboCom.dll';
//* char *ProgramName[0 to 4]; *//

function LoadProgram(programno:word):integer; stdcall; external 'RoboCom.dll';  //---> use for load program from flash memory to ram
function DeleteProgram(programno:word):integer; stdcall; external 'RoboCom.dll'; //---> use for delete program from flash memory
function ResetError( wAxis : word ):integer;stdcall; external 'RoboCom.dll';

//--------> Use for compiler
function Compile( SrcFile : pchar; DstFile : pchar; Errmsg : pchar;var ErrNum:integer): Integer; stdcall; external 'BasCom.dll';

//---> use for getstatus from robot
function GetControllerStatus(var p_contsts : t_contsts):integer; stdcall; external 'RoboCom.dll';
function SetControllerConfig(mode : word ;var p_contcnf : t_contcnf ): integer; stdcall; external  'RoboCom.dll';
function GetControllerConfig(var p_contcnf : T_CONTCNF): integer; stdcall; external 'RoboCom.dll';
//---> Read Point
function GetCurrentPoint(var p_pntval : t_pntval):integer; stdcall; external 'RoboCom.dll';
function MovePoint(axis : word ;mode : word;var p_pntval : t_pntval):integer; stdcall; external 'RoboCom.dll';

//---> I/O
function InputDI(wMode:word;wPortNum:word;var pwDI : word ):integer ;stdcall; external 'RoboCom.dll';
function OutputDO(wMode:word;wPortNum:word;pwDO : word ):integer ;stdcall; external 'RoboCom.dll';

//---> New Function

function SetRemoteMode( iMode : integer): integer; stdcall; external 'RoboCom.dll';
function GetRemoteMode( var p_iMode  : integer):integer; stdcall; external 'RoboCom.dll';
function SendRemoteCommand( txreg: wordarray ; rxreg: wordarray ):integer; stdcall; external 'RoboCom.dll';
function GetRemoteStatus( txreg: wordarray ): integer;stdcall; external 'RoboCom.dll';
//function GetRemoteCommand( txreg: wordarray ): integer;stdcall; external 'RoboCom.dll';

implementation

end.
