object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'MainForm'
  ClientHeight = 330
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poMainFormCenter
  OnCloseQuery = ExitOnCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 20
  object Task_Label: TLabel
    Left = 8
    Top = 16
    Width = 525
    Height = 40
    Caption = 
      #1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1086#1087#1088#1077#1076#1077#1083#1103#1077#1090' '#1086#1089#1090#1088#1086#1091#1075#1086#1083#1100#1085#1086#1089#1090#1100' '#1090#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082#1072' '#1087#1086' '#1076#1074#1091#1084 +
      ' '#1074#1074#1077#1076#1105#1085#1085#1099#1084' '#1091#1075#1083#1072#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object FirstAngleHelp_Label: TLabel
    Left = 24
    Top = 80
    Width = 221
    Height = 20
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1077#1088#1074#1086#1075#1086' '#1091#1075#1083#1072
    WordWrap = True
  end
  object SecondAngleHelp_TLabel: TLabel
    Left = 24
    Top = 168
    Width = 219
    Height = 20
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1074#1090#1086#1088#1086#1075#1086' '#1091#1075#1083#1072
    WordWrap = True
  end
  object ResultLabel: TLabel
    Left = 312
    Top = 123
    Width = 81
    Height = 20
    Caption = 'ResultLabel'
    Color = clHotLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object FirstAngle_TEdit: TEdit
    Left = 24
    Top = 120
    Width = 221
    Height = 28
    MaxLength = 3
    TabOrder = 0
    TextHint = '1..179'#176
    OnChange = FirstAngleOnChange
    OnClick = FirstAngle_TEditClick
    OnContextPopup = FirstAngle_TEditContextPopup
    OnKeyDown = FirstAngleEditKeyDown
    OnKeyPress = FirstAngle_TEditKeyPress
  end
  object SecondAngle_TEdit: TEdit
    Left = 24
    Top = 208
    Width = 221
    Height = 28
    MaxLength = 3
    TabOrder = 1
    TextHint = '1..179'#176
    OnChange = SecondAngleOnChange
    OnClick = SecondAngle_TEditClick
    OnContextPopup = SecondAngle_TEditContextPopup
    OnKeyDown = SecondAngleEditOnKeyDown
    OnKeyPress = SecondAngleEditKeyPress
  end
  object CountButton: TButton
    Left = 16
    Top = 272
    Width = 241
    Height = 41
    Caption = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1086#1089#1090#1088#1086#1091#1075#1086#1083#1100#1085#1086#1089#1090#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = CountButtonOnClick
  end
  object MainMenu: TMainMenu
    Left = 384
    Top = 216
    object FileTab: TMenuItem
      Caption = #1060#1072#1081#1083
      object FileOpenTab: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        ShortCut = 16463
        OnClick = FileOpenTabOnClick
      end
      object FileSaveTab: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Enabled = False
        ShortCut = 16467
        OnClick = FileSaveTabOnClick
      end
      object FileSeparatorTab: TMenuItem
        Caption = '-'
      end
      object FileExitTab: TMenuItem
        Caption = #1042#1099#1081#1090#1080
        ShortCut = 16465
        OnClick = FileExitTabOnClick
      end
    end
    object InstructTab: TMenuItem
      Caption = #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103
      OnClick = InstructTabOnClick
    end
    object DevelopTab: TMenuItem
      Caption = #1054' '#1088#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1077
      OnClick = DevelopTabOnClick
    end
  end
  object OpenTextFileDialog: TOpenTextFileDialog
    DefaultExt = '.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 384
    Top = 272
  end
  object SaveTextFileDialog: TSaveTextFileDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt'
    FilterIndex = 0
    Encodings.Strings = (
      'ANSI'
      'UTF-8')
    Left = 464
    Top = 248
  end
end
