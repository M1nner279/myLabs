object DevelopForm: TDevelopForm
  Left = 0
  Top = 120
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1054' '#1088#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1077
  ClientHeight = 179
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = DevelopFormOnCreate
  TextHeight = 20
  object DevelopLabel: TLabel
    Left = 184
    Top = 32
    Width = 4
    Height = 20
    WordWrap = True
  end
  object Button1: TButton
    Left = 208
    Top = 120
    Width = 113
    Height = 33
    Caption = #1042#1099#1081#1090#1080
    TabOrder = 0
    OnClick = DevelopExitButtonOnClick
  end
end
