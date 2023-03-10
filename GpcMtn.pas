unit gpcmtn;

interface

uses
  Windows;

const
  MTR_NONE = $ffffffff;

// MtnW/RBoardRegister
  MTN_TIMER		= $00;
  MTN_SYNC_CMD	= $01;
  MTN_INTR_FLAG	= $02;
  MTN_INTR_MASK	= $03;
  MTN_EL_LOGIC	= $04;
  MTN_TEST_DO	= $05;
  MTN_AXISA_DO	= $06;
  MTN_AXISB_DO	= $07;
  MTN_DO		= $08;
  MTN_RESET		= $09;
  MTN_SYNC		= $10;
//
  MTN_TIMER_CNT			= $00;
  MTN_IN_CNT			= $01;
  MTN_INTERLOCK_STATUS	= $05;
  MTN_ILOCK_RESET		= $05;
  MTN_AXISA_DI			= $06;
  MTN_AXISB_DI			= $07;
  MTN_DI1				= $08;
  MTN_DI2				= $09;

// Open
  MTR_FLAG_NORMAL		= $00;
  MTR_FLAG_OVERLAPPED	        = $01;

  MTR_ILOCK_RESET_OFF	        = $10;
  MTR_EXT_RESET_OFF		= $100;
  MTR_EXT_CLOCK                 = $1000;
  MTR_FLAG_SHARE		= $10000;

// Reset
  MTR_RESET_CTL			= $00;
  MTR_RESET_MOTION		= $01;

// Set/GetPulseOut
  MTR_METHOD			= $00;
  MTR_IDLING			= $01;
  MTR_FINISH_FLAG		= $03;
  MTR_SYNC_OUT			= $04;

  MTR_PULSE_OUT			= $00;
  MTR_INP			= $01;
  MTR_PULSE_OFF			= $02;

  MTR_SYNC_OFF                  = $00;
  MTR_ACC_START			= $08;
  MTR_ACC_FINISH		= $09;
  MTR_DEC_START			= $0a;
  MTR_DEC_FINISH		= $0b;

// Set/GetLimitConfig
  MTR_MASK			= $00;
  MTR_LOGIC			= $01;
  MTR_SD_FUNC			= $02;
  MTR_SD_ACTIVE			= $03;
  MTR_ORG_FUNC			= $04;
  MTR_ORG_ACTIVE		= $05;
  MTR_ORG_EZ_COUNT		= $06;
  MTR_ALM_FUNC			= $07;
  MTR_SIGNAL_FILTER		= $08;
  MTR_EL_FUNC			= $09;
  MTR_EZ_ACTIVE			= $10;
  MTR_LTC_FUNC			= $11;
  MTR_CLR_FUNC			= $12;
  MTR_PCS_FUNC			= $13;
  MTR_PCS_ACTIVE		= $14;

  MTR_CHANGE_SD_SPEED	= $00;
  MTR_DEC_STOP_SIGNAL	= $01;
  MTR_SD_OFF			= $02;

  MTR_SIGNAL_LEVEL		= $00;
  MTR_SIGNAL_LATCH		= $02;

  MTR_ORG_STOP			= $00;
  MTR_ORG_DEC_EZ_STOP	= $01;
  MTR_ORG_EZ_STOP		= $02;
  MTR_ORG_REVERSAL		= $03;
  MTR_ORG_REV_EZ_STOP		= $04;
  MTR_ORG_STOP_ZERO		= $05;
  MTR_ORG_EZ_STOP_ZERO	        = $06;
  MTR_ORG_REV_EZ_ZERO	        = $07;

  MTR_ALM_STOP			= $00;
  MTR_ALM_DEC_STOP		= $01;

  MTR_OFF			= $00;
  MTR_ON			= $01;

  MTR_EL_STOP			= $00;
  MTR_EL_DEC_STOP		= $01;

  MTR_DOWN_EDGE			= $00;
  MTR_UP_EDGE			= $01;
  MTR_LOW_LEVEL			= $02;
  MTR_HIGH_LEVEL		= $03;

// Set/GetCounterConfig
  MTR_ENCODER_MODE		= $00;
  MTR_ENCODER_CLEAR		= $01;
  MTR_COUNTER_CLEAR_ORG	= $02;
  MTR_COUNTER_CLEAR_CLR	= $03;
  MTR_LATCH_MODE		= $04;
  MTR_DECLINO_MODE		= $05;
  MTR_SOFT_LATCH		= $06;

  MTR_SINGLE			= $01;
  MTR_DOUBLE			= $02;
  MTR_QUAD			= $03;
  MTR_UP_DOWN			= $04;

  MTR_LTC			= $02;

  MTR_SPEED			= $00;

// Set/GetComparator
  MTR_COMP1			= $01;
  MTR_COMP2			= $02;
  MTR_COMP3			= $03;
  MTR_COMP4			= $04;
  MTR_COMP5			= $05;

// Set/GetSync
  MTR_START_MODE		= $00;
  MTR_EXT_START			= $02;
  MTR_EXT_STOP			= $03;
  MTR_START_LINE		= $04; 
  MTR_STOP_LINE			= $05;

  MTR_X				= $01;
  MTR_Y				= $02;
  MTR_Z				= $04;
  MTR_U				= $08;
  MTR_SYNC_X			= $10;
  MTR_SYNC_Y			= $11;
  MTR_SYNC_Z			= $12;
  MTR_SYNC_U			= $13;
  MTR_SYNC_EXT			= $20;

  MTR_SIGNAL_EDGE		= $01;

  MTR_CSTP_STOP			= $01;
  MTR_CSTP_DEC_STOP		= $02;

// Set/Get/StartMotion
  MTR_JOG			= $00;
  MTR_ORG			= $01;
  MTR_PTP			= $02;
  MTR_TIMER			= $04;
  MTR_SINGLE_STEP		= $05;
  MTR_ORG_SEARCH		= $10;
  MTR_ORG_EXIT			= $11;
  MTR_ORG_ZERO			= $12;
  MTR_PTP_REPEAT		= $10000;
  MTR_REPEAT_CLEAR		= $20000;
  MTR_LIMIT			= $100;

// MtnSet(Get)MotionLine
  MTR_LINE_NORMAL		= $00;
  MTR_LINE_REPEAT		= $10000;

// MtnSet(Get)MotionArc
  MTR_ARC_NORMAL		= $00;
  MTR_ARC_REPEAT		= $10000;

// StartMotion
  MTR_ACC			= $00;
  MTR_CONST			= $01;
  MTR_CONST_DEC			= $02;

  MTR_LINE			= $06;
  MTR_SYNC_LINE			= $07;
  MTR_ARC			= $08;
  MTR_CP			= $20;

// StopMotion
  MTR_DEC_STOP			= $00;
  MTR_IMMEDIATE_STOP	= $01;

// OutputSync
  MTR_SYNC_NORMAL		= $05;
  MTR_SYNC_SLAVE		= $06;
  MTR_SYNC_MASTER		= $07;

// ChangeSpeed
  MTR_IMMEDIATE_CHANGE	= $00;
  MTR_ACCDEC_CHANGE		= $01;
  MTR_LOW_SPEED			= $03;
  MTR_DEC_LOW_SPEED		= $04;

// ChangeStep
  MTR_RELATIVE			= $00;

// GetStatus
  MTR_BUSY				= $00;
  MTR_FINISH_STATUS		= $01;
  MTR_LIMIT_STATUS		= $02;
  MTR_INTERLOCK_STATUS	= $04;
  MTR_PRIREG_STATUS		= $08;
  MTR_SYNC_STATUS		= $09;
  MTR_PTP_REPEAT_NUM	= $10;
  MTR_IP_REPEAT_NUM		= $11;

// Read/Write/ClearCounter, SetSampleCounter
  MTR_ENCODER			= $00;
  MTR_COUNTER			= $01;
  MTR_REMAINS			= $02;
  MTR_DECLINO			= $100;
  MTR_ABSOLUTE		= $200;
  MTR_LATCH			  = $1000;

// StartRepeat
  MTR_IP			= $10;

// Set/GetSampleCounter
  MTR_BUSY_SAMP			= $400;
  MTR_REPEAT			= $1000;

// GetSampleStatus
  MTR_SAMPLE_FINISHED	= $00;
  MTR_NOW_SAMPLING		= $01;
  MTR_WAITING_BUSY		= $02;
  MTR_FULL_BUFFER		= $03;
  MTR_EMPTY_DATA		= $04;

// MtnSet(Get)Revise
  MTR_PULSE			= $00;
  MTR_REVISE_MODE		= $01;
  MTR_COUNTER_MODE		= $02;
  MTR_REST_RT			= $03;
  MTR_REST_FT			= $04;

  MTR_REVISE_OFF		= $00;
  MTR_BACK			= $01;
  MTR_SLIP			= $02;

// MtnSet(Get)ERCConfig
  MTR_AUTO			= $00;
  MTR_WIDTH			= $02;
  MTR_OFF_TIMER			= $03;
  MTR_SIGNAL_ON			= $04;
  MTR_SIGNAL_OFF		= $05;

  MTR_ZERO			= $00;
  MTR_12MICRO			= $01;
  MTR_102MICRO			= $02;
  MTR_409MICRO			= $03;
  MTR_1600MICRO			= $04;
  MTR_13M			= $05;
  MTR_52M			= $06;
  MTR_104M			= $07;
  MTR_LEVEL			= $08;

  MTR_ACTIVE_LOW		= $00;
  MTR_ACTIVE_HIGH		= $01;


// MTNCONP struct
  MTR_NO			= $00;
  MTR_EQ			= $01;
  MTR_EQ_UP			= $02;
  MTR_EQ_DOWN			= $03;
  MTR_LT			= $04;
  MTR_GT			= $05;
  MTR_SOFT_LIMIT		= $06;

  MTR_STOP			= $01;
  MTR_DEC			= $02;
  MTR_CHG_REG			= $03;

  MTR_CMP_COUNTER		= $00;
  MTR_CMP_ENCODER		= $01;
  MTR_CMP_DECLINO		= $02;
  MTR_CMP_SPEED			= $05;

// MTNMOTION struct
  MTR_ACC_NORMAL		= $00;
  MTR_ACC_SIN			= $01;
  MTR_FH			= $100;
  MTR_CW			= 1;
  MTR_CCW			= -1;

// MTNLINE struct
  MTR_LINE_JOG			= $16;
  MTR_SP_COMPOSE		= $1000;

// MTNARC struct
  MTR_ARC_CW			= $00;
  MTR_ARC_CCW			= $01;

// Command Buffer
  MTR_CMD_MOVE			= $87;
  MTR_CMD_CLOCK			= $85;
  MTR_CMD_LOW_SPEED		= $81;
  MTR_CMD_SPEED			= $82;
  MTR_CMD_ACC			= $83;
  MTR_CMD_DEC			= $84;
  MTR_CMD_ACC_SPEED		= $89;
  MTR_CMD_DEC_SPEED		= $8a;
  MTR_CMD_STEP			= $80;
  MTR_CMD_CENTER		= $88;
  MTR_CMD_START_MODE	= $50;

  MTR_CMD_JOG_P			= $00;
  MTR_CMD_JOG_M			= $08;
  MTR_CMD_ORG_P			= $10;
  MTR_CMD_ORG_M			= $18;
  MTR_CMD_ORG_EXIT_P	= $12;
  MTR_CMD_ORG_EXIT_M	= $1a;
  MTR_CMD_ORG_SEARCH_P	= $15;
  MTR_CMD_ORG_SEARCH_M	= $1d;
  MTR_CMD_PTP			= $41;
  MTR_CMD_ORG_ZERO		= $44;
  MTR_CMD_SINGLE_STEP_P	= $46;
  MTR_CMD_SINGLE_STEP_M	= $4e;
  MTR_CMD_TIMER			= $47;
  MTR_CMD_LINE			= $61;
  MTR_CMD_ARC_CW		= $64;
  MTR_CMD_ARC_CCW		= $65;

  MTR_CMD_ACC_SIN		= $400;
  MTR_CMD_FH_OFF		= $4000000;
  MTR_CMD_SP_COMPOSE	= $8000;

  MTR_CMD_CONST			= $51;
  MTR_CMD_ACC_DEC		= $53;
  MTR_CMD_CONST_DEC		= $52;

  MTR_CMD_AUTO_START	= $00;
  MTR_CMD_STEP_START	= $01;


// -----------------------------------------------------------------------
//
//		  Error identifier
//
// -----------------------------------------------------------------------
  MTR_ERROR_SUCCESS = $00000000;            //
  MTR_ERROR_NOT_DEVICE = $C0000001;         //
  MTR_ERROR_NOT_OPEN = $C0000002;           //
  MTR_ERROR_INVALID_HANDLE = $C0000003;     //
  MTR_ERROR_ALREADY_OPEN = $C0000004;       //
  MTR_ERROR_NOT_SUPPORTED = $C0000009;      //
  MTR_ERROR_NOW_MOVING = $C0001000;			//

  MTR_ERROR_NOW_STOPPED = $C0001001;        //
  MTR_ERROR_NOW_SAMPLING = $C0001002;       //
  MTR_ERROR_NOW_STOP_SAMPLING = $C0001003;  //
  MTR_ERROR_NOW_BUSY_CMD_BUFF = $C0001004;  //
  MTR_ERROR_NOW_STOP_CMD_BUFF = $C0001005;  //
  MTR_ERROR_EEPROM_BUSY = $C0001006;		//

  MTR_ERROR_WRITE_FAILED = $C0001010;       //
  MTR_ERROR_READ_FAILED = $C0001011;        //
  MTR_ERROR_INVALID_DEVICE = $C0001012;     //
  MTR_ERROR_INVALID_AXIS = $C0001013;       //
  MTR_ERROR_INVALID_SPEED = $C0001014;      //
  MTR_ERROR_INVALID_ACCDEC = $C0001015;     //
  MTR_ERROR_INVALID_PULSE = $C0001016;      //
  MTR_ERROR_INVALID_PARAMETER = $C0001017;  //
  MTR_ERROR_INVALID_INDEX = $C0001018;		//
  MTR_ERROR_REPEAT_LINE_ARC = $C0001019;	//
  MTR_ERROR_NOW_INTERLOCKED = $C0001020;    //
  MTR_ERROR_IMPOSSIBLE = $C0001021;         //
  MTR_ERROR_WRITE_FAILED_EEPROM = $C0001022;//
  MTR_ERROR_READ_FAILED_EEPROM = $C0001023; //
  MTR_ERROR_NOT_ALLOCATE_MEMORY = $C0001024;//
  MTR_ERROR_NOW_WAIT_STA = $C0001025;		//
  MTR_ERROR_EMPTY_DATA = $C0001026;			//
  MTR_INVALID_HANDLE_VALUE = $FFFFFFFF;     //


// -----------------------------------------------------------------------
//
// function value
//
// -----------------------------------------------------------------------
  MTN_FUNC_OPEN_DEVICE	    = $01;
  MTN_FUNC_CLOSE_DEVICE	    = $02;
  MTN_FUNC_GET_INFO_DEVICE  = $03;

  MTN_FUNC_WMOVE_CMD	    = $10;
  MTN_FUNC_WBITCTRL_CMD	    = $11;
  MTN_FUNC_WREGCTRL_CMD	    = $12;
  MTN_FUNC_RMOVE_STATUS	    = $13;
  MTN_FUNC_RAXISA_STATUS    = $14;
  MTN_FUNC_RAXISB_STATUS    = $15;

  MTN_FUNC_WCMD_REGISTER    = $20;
  MTN_FUNC_RMAIN_STATUS0    = $21;
  MTN_FUNC_RMAIN_STATUS1    = $22;
  MTN_FUNC_RSUB_STATUS	    = $23;

  MTN_FUNC_WALL_BUFFER	    = $30;
  MTN_FUNC_WBUFFER0	        = $31;
  MTN_FUNC_WBUFFER1	        = $32;
  MTN_FUNC_WBUFFER2	        = $33;
  MTN_FUNC_WBUFFER3	        = $34;
  MTN_FUNC_RALL_BUFFER	    = $35;
  MTN_FUNC_RBUFFER0	        = $36;
  MTN_FUNC_RBUFFER1	        = $37;
  MTN_FUNC_RBUFFER2	        = $38;
  MTN_FUNC_RBUFFER3	        = $39;

  MTN_FUNC_SET_INTERRUPT	    = $40;
  MTN_FUNC_GET_INTERRUPT_FACTOR = $41;

  MTN_FUNC_WBOARD_REGISTER  = $50;
  MTN_FUNC_RBOARD_REGISTER  = $51;

//---->   for get config of controller
CNF_PNTUNIT = $0001;
CNF_SHIFTNO = $0002;
CNF_HANDNO  = $0004;
CNF_ATSPEED = $0008;
CNF_MNSPEED = $0010;
CNF_STARTUP = $0020;
CNF_ARMTYPE = $0040;
CNF_ACCLEVEL = $0080;
CNF_EXELEVEL = $0100;
//---->  structure of point for get
MVP_PTP = 0;
MVP_LINE  =  $1;
MVP_CP = $2;
MVP_ARCHX = $0100;
MVP_ARCHY = $0200;
MVP_ARCHZ = $0400;

//-----------------------------------------------------------------------
// for get config of controller
//-----------------------------------------------------------------------

type
    t_contcnf = record
        pnt_unit : word;
        shiht_no : word;
        hand_no : word;
        auto_speed : word;
        manual_speed : Word;
        startup_mode : word;
        reset_arm_type : word;
        access_level : word;
        execute_level : word;
    end;

//-----------------------------------------------------------------------
// for get status of controller
//-----------------------------------------------------------------------

type
    t_contsts = record
        arm_type : word;
        servo : word;
        mode : word;
        auto_mode : word;
        org_sens : Word;
        org_finished : word;
    end;
//-----------------------------------------------------------------------
// structure of point for get
//-----------------------------------------------------------------------

type
    t_pntval = record
       arm : integer;   //arm 1= rigth 2=left
       pulse : array[0..5] of integer; //---> point in pulse
       mm : array[0..5] of integer;  //---> data in mm /degree
    end;

//-----------------------------------------------------------------------
// for hand of robot setting command
//-----------------------------------------------------------------------
type
    t_hand = record
       param : array[0..3] of integer;   //----> parameter of hand
    end;

//-----------------------------------------------------------------------
// for shift of robot setting command
//-----------------------------------------------------------------------

type
    t_shift = record
      sft       : array[0..3] of integer;
      sft_plus  : array[0..3] of integer;
      sft_minus : array[0..3] of integer;
    end;

//-----------------------------------------------------------------------
// for palatte of robot setting command
//-----------------------------------------------------------------------

type
    tx_pallet = record
      num : integer;
      pnt_num : integer;
      pnt_val1 :  array[0..5] of integer;
      pnt_val2 :  array[0..5] of integer;
      pnt_val3 :  array[0..5] of integer;
      pnt_val4 :  array[0..5] of integer;
      pnt_val5 :  array[0..5] of integer;
      nx       :  integer;
      ny       :  integer;
      nz       :  integer;
    end;
//-----------------------------------------------------------------------
// for point setting command
//-----------------------------------------------------------------------

type
  t_param = record
  name : array[0..7] of char;   // parameter name
  value : integer;              // value of parameter
  min   : integer;              // min of parameter
  max   : integer;              // max of parameter
  def   : integer;              // default of parameter
  unit1  : array[0..15] of char;  // unit of value(?)
  expln  : array[0..47] of char;  // comment
end;

//-----------------------------------------------------------------------
// for point setting command
//-----------------------------------------------------------------------

type
  t_point = record
  num  : integer;           //number of point
  type1 : integer;          //type of unit (1=pulse,2=mm)
  arm  : integer;           //action (left, rigth)
  value : array[0..5] of integer; // value of point(x,y,z,r,0,0)
  char  : array[0..15] of char;   // comment of point
end;

// -----------------------------------------------------------------------
//	Return code
// -----------------------------------------------------------------------

type
  MTNRETCODE = record
    dwResultCode: array[0..3] of DWORD;
  end;

// -----------------------------------------------------------------------
//	Device structure
// -----------------------------------------------------------------------
type
  MTNDEVICE = record
    wType: WORD;
    wRSW:  WORD;
    wModel: WORD;
  end;

// -----------------------------------------------------------------------
//	Buffer structure
// -----------------------------------------------------------------------
type
  MTNBUFDATA = record
     wBufData: array[0..3] of WORD;
  end;

// -----------------------------------------------------------------------
//	Interrupt structure
// -----------------------------------------------------------------------
type
  MTNINTRDATA = record
    hWnd: DWORD;
    uInterruptMsg: Cardinal;
    hEvent: THandle;
    lpCallBackProc: Pointer;
    dwUser: DWORD;
    uReserved: Cardinal;
  end;

// --------------------------------------------------------------------
//    Event Factor structure
//----------------------------------------------------------------------
type
  MTNEVENTFACTOR = record
     dwREST: array[0..3] of DWORD;
     dwRIST: array[0..3] of DWORD;
  end;

// -----------------------------------------------------------------------
//	Comparator structure
// -----------------------------------------------------------------------
type
  MTNCOMP = record
    wConfig: WORD;
    wMotion: WORD;
    lCounter: Integer;
    wCntType: WORD;
  end;

// -----------------------------------------------------------------------
//	Motion structure
// -----------------------------------------------------------------------
type
  MTNMOTION = record
    wClock: WORD;
    wAccMode: WORD;
    fLowSpeed: Single;
    fSpeed: Single;
    dwAcc: DWORD;
    dwDec: DWORD;
    fSAccSpeed: Single;
    fSDecSpeed: Single;
    lStep: Integer;
  end;

// -----------------------------------------------------------------------
//	MotionLine structure
// -----------------------------------------------------------------------
type
  MTNLINE = record
    wAxis: WORD;
    wClock: WORD;
    wMode: WORD;
    wAccMode: WORD;
    fLowSpeed: Single;
    fSpeed: Single;
    dwAcc: DWORD;
    dwDec: DWORD;
    fSAccSpeed: Single;
    fSDecSpeed: Single;
    lStep: array[0..3] of Integer;
  end;

// -----------------------------------------------------------------------
//	MotionArc structure
// -----------------------------------------------------------------------
type
  MTNARC = record
    wAxis: WORD;
    wClock: WORD;
    wMode: WORD;
    fSpeed: Single;
    lCenterX: Integer;
    lCenterY: Integer;
    lEndX: Integer;
    lEndY: Integer;
  end;

// -----------------------------------------------------------------------
//	SetEventMask structure
// -----------------------------------------------------------------------
type
  MTNEVENTTABLE = record
    wPulseOut: WORD;
    wCounter: WORD;
    wComparator: WORD;
    wSignal: WORD;
    wReserved: WORD;
  end;

// -----------------------------------------------------------------------
//	SetEvent structure
// -----------------------------------------------------------------------
type
  MTNEVENTREQ = record
    hWnd: THandle;
    uPulseOut: Cardinal;
    uCounter: Cardinal;
    uComparator: Cardinal;
    uSignal: Cardinal;
    uReserved: Cardinal;
    hEvent: THandle;
    lpCallBackProc: Pointer;
    dwUser: DWORD;
  end;

// -----------------------------------------------------------------------
//	SetSampleCounter structure
// -----------------------------------------------------------------------
type
  MTNSAMPLEREQ = record
    hWnd: THandle;
    uStopMsg: Cardinal;
    uSampleMsg: Cardinal;
    wAxis: WORD;
    wMode: WORD;
    ulSampleRate: Cardinal;
    ulBufferSize: Cardinal;
    ulSampleCounter: Cardinal;
  end;

// -----------------------------------------------------------------------
//	GetSampleData structure
// -----------------------------------------------------------------------
type
  MTNSAMPDATA = record
	lPosX: Integer;
	lPosY: Integer;
	lPosZ: Integer;
	lPosU: Integer;
  end;

implementation

end.
