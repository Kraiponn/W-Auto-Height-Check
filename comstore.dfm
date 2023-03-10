object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 269
  Width = 371
  object MainMenu1: TMainMenu
    Left = 48
    Top = 32
    object File1: TMenuItem
      Caption = 'File'
      object E1: TMenuItem
        Caption = 'Exit'
        OnClick = E1Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
  object systemtimer: TTimer
    OnTimer = systemtimerTimer
    Left = 128
    Top = 48
  end
  object ApdComPort1: TApdComPort
    ComNumber = 8
    Baud = 9600
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    Left = 56
    Top = 136
  end
  object ApdComPort2: TApdComPort
    ComNumber = 8
    Baud = 9600
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    Left = 152
    Top = 139
  end
  object ComMc: TApdComPort
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    OnTriggerAvail = ComMcTriggerAvail
    Left = 200
    Top = 48
  end
  object Tim_clr: TTimer
    Enabled = False
    OnTimer = Tim_clrTimer
    Left = 64
    Top = 200
  end
end
