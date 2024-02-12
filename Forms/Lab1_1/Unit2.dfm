object InstructForm: TInstructForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103
  ClientHeight = 179
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = InstructFormOnCreate
  TextHeight = 20
  object InstructLabel: TLabel
    Left = 184
    Top = 32
    Width = 84
    Height = 20
    Caption = 'InstructLabel'
    WordWrap = True
  end
  object Button1: TButton
    Left = 208
    Top = 120
    Width = 113
    Height = 33
    Caption = #1042#1099#1081#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'ExitButton'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    WordWrap = True
    OnClick = ExitButtonOnClick
  end
end
