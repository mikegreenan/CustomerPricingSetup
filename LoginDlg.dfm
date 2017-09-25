object dlgLogin: TdlgLogin
  Left = 830
  Top = 448
  BorderStyle = bsDialog
  Caption = 'MyLEP login...'
  ClientHeight = 110
  ClientWidth = 175
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsername: TLabel
    Left = 10
    Top = 12
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object lblPassword: TLabel
    Left = 10
    Top = 45
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object edtCode: TEdit
    Left = 70
    Top = 8
    Width = 100
    Height = 21
    MaxLength = 40
    TabOrder = 0
  end
  object edtPassword: TEdit
    Left = 72
    Top = 40
    Width = 100
    Height = 21
    MaxLength = 136
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnOkay: TButton
    Left = 8
    Top = 76
    Width = 75
    Height = 25
    Caption = '&Okay'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 94
    Top = 76
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
