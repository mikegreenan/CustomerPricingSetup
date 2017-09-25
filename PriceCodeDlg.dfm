object dlgPriceCode: TdlgPriceCode
  Left = 419
  Top = 429
  BorderStyle = bsDialog
  ClientHeight = 112
  ClientWidth = 260
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
  object lblCode: TLabel
    Left = 10
    Top = 12
    Width = 25
    Height = 13
    Caption = 'Code'
  end
  object lblDescription: TLabel
    Left = 10
    Top = 45
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object edtCode: TEdit
    Left = 70
    Top = 8
    Width = 65
    Height = 21
    MaxLength = 5
    TabOrder = 0
  end
  object edtDescription: TEdit
    Left = 70
    Top = 40
    Width = 179
    Height = 21
    MaxLength = 136
    TabOrder = 1
  end
  object btnOkay: TButton
    Left = 88
    Top = 80
    Width = 75
    Height = 25
    Caption = '&Okay'
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 176
    Top = 80
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
