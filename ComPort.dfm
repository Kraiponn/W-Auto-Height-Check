object frmComPort: TfrmComPort
  Left = 0
  Top = 0
  Caption = 'SENSOR CONFIGULATION..'
  ClientHeight = 243
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 16
    Width = 377
    Height = 201
    BevelInner = bvRaised
    BevelKind = bkTile
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 16
      Top = 16
      Width = 185
      Height = 161
      Caption = 'Setting Comport'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object rad9600: TRadioButton
        Left = 16
        Top = 24
        Width = 65
        Height = 17
        Caption = '9600 '
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rad9600Click
      end
      object rad19200: TRadioButton
        Left = 16
        Top = 47
        Width = 65
        Height = 17
        Caption = '19200 '
        TabOrder = 1
        OnClick = rad19200Click
      end
      object rad38400: TRadioButton
        Left = 16
        Top = 70
        Width = 65
        Height = 17
        Caption = '38400'
        TabOrder = 2
        OnClick = rad38400Click
      end
      object rad57600: TRadioButton
        Left = 104
        Top = 24
        Width = 65
        Height = 17
        Caption = '57600'
        TabOrder = 3
        OnClick = rad57600Click
      end
      object rad115200: TRadioButton
        Left = 104
        Top = 47
        Width = 65
        Height = 17
        Caption = '115200 '
        TabOrder = 4
        OnClick = rad115200Click
      end
      object btnConnect: TButton
        Left = 16
        Top = 112
        Width = 153
        Height = 33
        Caption = 'Connect'
        TabOrder = 5
        OnClick = btnConnectClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 207
      Top = 16
      Width = 154
      Height = 161
      Caption = 'Auto Zero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object radSr_On: TRadioButton
        Left = 24
        Top = 24
        Width = 89
        Height = 40
        Caption = 'ON'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = radSr_OnClick
      end
      object radSr_Off: TRadioButton
        Left = 24
        Top = 88
        Width = 105
        Height = 33
        Caption = 'OFF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = radSr_OffClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 224
    Width = 391
    Height = 19
    Panels = <>
  end
end
