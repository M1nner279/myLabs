Unit Unit1;

Interface

Uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtDlgs,
    Unit2, Unit3;

Type
    ERRORS = (Success, RangeError, FileReadError, FileWriteError,
      LowNumbFileError, HighNumbFileError);

    TMainForm = Class(TForm)
        MainMenu: TMainMenu;
        FileTab: TMenuItem;
        FileOpenTab: TMenuItem;
        FileSaveTab: TMenuItem;
        FileSeparatorTab: TMenuItem;
        FileExitTab: TMenuItem;
        InstructTab: TMenuItem;
        DevelopTab: TMenuItem;
        Task_Label: TLabel;
        FirstAngleHelp_Label: TLabel;
        FirstAngle_TEdit: TEdit;
        SecondAngleHelp_TLabel: TLabel;
        SecondAngle_TEdit: TEdit;
        CountButton: TButton;
        OpenTextFileDialog: TOpenTextFileDialog;
        SaveTextFileDialog: TSaveTextFileDialog;
        ResultLabel: TLabel;
        Procedure ExitOnCloseQuery(Sender: TObject; Var CanClose: Boolean);
        Procedure CountButtonOnClick(Sender: TObject);
        Procedure InstructTabOnClick(Sender: TObject);
        Procedure DevelopTabOnClick(Sender: TObject);
        Procedure FileExitTabOnClick(Sender: TObject);
        Function ReadFileData(Sender: TObject; Var MyFile: TextFile): ERRORS;
        Procedure FileOpenTabOnClick(Sender: TObject);
        Procedure FirstAngleOnChange(Sender: TObject);
        Procedure SecondAngleOnChange(Sender: TObject);
        Procedure FileSaveTabOnClick(Sender: TObject);
        Procedure FirstAngleEditKeyDown(Sender: TObject; Var Key: Word;
          Shift: TShiftState);
        Procedure FormCreate(Sender: TObject);
        Procedure FormKeyDown(Sender: TObject; Var Key: Word;
          Shift: TShiftState);
        Procedure FirstAngle_TEditClick(Sender: TObject);
        Procedure SecondAngle_TEditClick(Sender: TObject);
        Procedure FirstAngle_TEditKeyPress(Sender: TObject; Var Key: Char);
        Procedure FirstAngle_TEditContextPopup(Sender: TObject;
          MousePos: TPoint; Var Handled: Boolean);
        Procedure SecondAngle_TEditContextPopup(Sender: TObject;
          MousePos: TPoint; Var Handled: Boolean);
        Procedure SecondAngleEditOnKeyDown(Sender: TObject; Var Key: Word;
          Shift: TShiftState);
        Procedure SecondAngleEditKeyPress(Sender: TObject; Var Key: Char);
    Private
        { Private declarations }
    Public
        { Public declarations }
    End;

Const
    MESSAGES: Array [Errors] Of String = ('',
      'Проверьте правильность данных в файле', 'Файл не открывается для чтения',
      'Файл не открывается для записи', 'Мало данных в файле',
      'Слишком много данных в файле');
    Digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    Control = [VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN];
    ENTER = 13;
    BACKSPACE = #8;
    NONE = #0;
    MAX_BOUND = 179;
    MIN_BOUND = 1;

Var
    IsSaved: Boolean;
    MainForm: TMainForm;

Implementation

{$R *.dfm}

Procedure TMainForm.InstructTabOnClick(Sender: TObject);
Var
    InstructForm: TInstructForm;
Begin
    InstructForm := TInstructForm.Create(Self);
    InstructForm.Icon := MainForm.Icon;
    InstructForm.ShowModal;
    InstructForm.Free;
End;

Procedure TMainForm.DevelopTabOnClick(Sender: TObject);
Var
    DevelopForm: TDevelopForm;
Begin
    DevelopForm := TDevelopForm.Create(Self);
    DevelopForm.Icon := MainForm.Icon;
    DevelopForm.ShowModal;
    DevelopForm.Free;
End;

Procedure TMainForm.CountButtonOnClick(Sender: TObject);
Var
    Angle1, Angle2: Integer;
Begin
    Try
        Angle1 := StrToInt(FirstAngle_TEdit.Text);
    Except
        Angle1 := 0;
    End;
    Try
        Angle2 := StrToInt(SecondAngle_TEdit.Text);
    Except
        Angle2 := 0;
    End;
    ResultLabel.Width := 250;
    If ((Angle1 + Angle2) > 90) And (Angle1 < 90) And (Angle2 < 90) Then
        ResultLabel.Caption := 'Треугольник является остроугольным'
    Else If Angle1 + Angle2 > MAX_BOUND Then
        ResultLabel.Caption := 'Такой треугольник не может существовать'
    Else
        ResultLabel.Caption := 'Треугольник не является остроугольным';
    ResultLabel.Visible := True;
    FileSaveTab.Enabled := True;
End;

Procedure TMainForm.ExitOnCloseQuery(Sender: TObject; Var CanClose: Boolean);
Var
    Confirmation: Integer;
Begin
    If ResultLabel.Visible And Not IsSaved Then
    Begin
        Confirmation := Application.MessageBox('Вы не сохранили результат' +
          #13#10 + 'Хотите сохранить?', 'Выход', MB_YESNOCANCEL + MB_APPLMODAL +
          MB_DEFBUTTON2);
        Case Confirmation Of
            IDYES:
                Begin
                    FileSaveTabOnClick(Sender);
                    CanClose := True;
                End;
            IDNO:
                CanClose := True;
        Else
            CanClose := False;
        End;
    End
    Else
    Begin
        Confirmation := Application.MessageBox('Вы действительно хотите выйти?',
          'Выход', MB_YESNO + MB_APPLMODAL);
        CanClose := Confirmation = IDYES;
    End;
End;

Procedure TMainForm.FileExitTabOnClick(Sender: TObject);
Begin
    MainForm.Close;
End;

Function IsReadable(Var F: TextFile): Errors;
Var
    CodeError: Errors;
Begin
    CodeError := Success;
    Try
        Reset(F);
    Except
        CodeError := FileReadError;
    End;
    IsReadable := CodeError;
End;

Function IsWriteable(Var F: TextFile): Errors;
Var
    CodeError: Errors;
Begin
    CodeError := Success;
    Try
        Append(F);
    Except
        CodeError := FileWriteError;
    End;
    IsWriteable := CodeError;
End;

Function GoFromSpace(Var MyFile: TextFile): Boolean;
Var
    Cht: Char;

Begin
    Cht := ' ';
    While Not EoF(MyFile) And ((Cht = ' ') Or (Cht = #13) Or (Cht = #10)) Do
        Read(MyFile, Cht);
    If (Cht = ' ') Or (Cht = #13) Or (Cht = #10) Then
        GoFromSpace := False
    Else
        GoFromSpace := True;
End;

Function TMainForm.ReadFileData(Sender: TObject; Var MyFile: TextFile): ERRORS;
Var
    CodeError: Errors;
    First, Second: Integer;

Begin
    First := 0;
    Second := 0;
    CodeError := Success;
    Try
        Read(MyFile, First);
    Except
        CodeError := RangeError;
    End;
    If (CodeError = Success) And
      ((First < MIN_BOUND) Or (First > MAX_BOUND)) Then
        CodeError := RangeError;
    If CodeError = Success Then
    Begin
        Try
            Read(MyFile, Second);
        Except
            CodeError := RangeError;
        End;
        If (CodeError = Success) And
          ((Second < MIN_BOUND) Or (Second > MAX_BOUND)) Then
            CodeError := RangeError;
    End;
    If (CodeError = Success) And ((First = 0) Or (Second = 0)) Then
        CodeError := LowNumbFileError
    Else If (CodeError = Success) And GoFromSpace(MyFile) Then
        CodeError := HighNumbFileError;
    If CodeError = Success Then
    Begin
        FirstAngle_TEdit.Text := IntToStr(First);
        SecondAngle_TEdit.Text := IntToStr(Second);
    End;
    ReadFileData := CodeError;
End;

Procedure TMainForm.FileOpenTabOnClick(Sender: TObject);
Var
    MyFile: TextFile;
    CodeError: ERRORS;
    FileName: String;
    IsNotEnd: Boolean;
Begin
    IsNotEnd := True;
    While IsNotEnd And OpenTextFileDialog.Execute() Do
    Begin
        FileName := OpenTextFileDialog.FileName;
        AssignFile(MyFile, FileName);
        CodeError := IsReadable(MyFile);
        If CodeError = Success Then
        Begin
            CodeError := ReadFileData(Sender, MyFile);
            CloseFile(MyFile);
        End;
        If CodeError = Success Then
            IsNotEnd := False
        Else
            Application.MessageBox(PChar(Messages[CodeError]), 'Ошибка', MB_OK);
    End;
End;

Procedure TMainForm.FileSaveTabOnClick(Sender: TObject);
Var
    MyFile: TextFile;
    CodeError: ERRORS;
    FilePath: String;
    IsNotEnd: Boolean;
Begin
    IsNotEnd := True;
    While SaveTextFileDialog.Execute() And IsNotEnd Do
    Begin
        FilePath := SaveTextFileDialog.FileName;
        AssignFile(MyFile, FilePath);
        CodeError := IsWriteable(MyFile);
        If CodeError = Success Then
        Begin
            Write(MyFile, #13#10, ResultLabel.Caption);
            CloseFile(MyFile);
            IsNotEnd := False;
        End
        Else
            Application.MessageBox(PChar(Messages[CodeError]), 'Ошибка', MB_OK);
    End;
End;

Procedure TMainForm.FirstAngleEditKeyDown(Sender: TObject; Var Key: Word;
  Shift: TShiftState);
Begin
    If ((SsShift In Shift) Or (SsCtrl In Shift)) And
      ((Key = VK_RIGHT) Or (Key = VK_LEFT)) Then
        Key := Key
    Else If (SsShift In Shift) Or (SsCtrl In Shift) Then
        Key := 0;
    If Key = VK_DELETE Then
        Key := 0;
    If (Key = ENTER) And CountButton.Enabled Then
        CountButton.OnClick(Sender);

End;

Function IsValidNumbStr(SelStart: Integer; Middle: String; Key: Char): Boolean;
Var
    NewStr: String;
Begin
    NewStr := Copy(Middle, 0, SelStart) + Key + Copy(Middle, SelStart + 1);
    IsValidNumbStr := (StrToInt(NewStr) > MAX_BOUND) Or
      (StrToInt(NewStr) < MIN_BOUND);
End;

Function IsCanDelete(SelStart, SelLength: Integer; Middle: String): Boolean;
Begin
    If (SelLength = 0) Or (SelLength = Length(Middle)) Then
        IsCanDelete := Not((SelStart = 1) And (Length(Middle) > 1) And
          (Middle[2] = '0'))
    Else
        IsCanDelete := False;
End;

Procedure TMainForm.FirstAngle_TEditKeyPress(Sender: TObject; Var Key: Char);
Var
    Middle: String;
Begin
    Middle := FirstAngle_TEdit.Text;
    If (Key In Digits) Then
    Begin
        If (Key = '0') And (FirstAngle_TEdit.SelStart = 0) Then
            Key := NONE
        Else If IsValidNumbStr(FirstAngle_TEdit.SelStart, Middle, Key) Then
            Key := NONE
    End
    Else If Not((Key = BACKSPACE) And IsCanDelete(FirstAngle_TEdit.SelStart,
      FirstAngle_TEdit.SelLength, Middle)) Then
        Key := NONE;
End;

Procedure TMainForm.FirstAngleOnChange(Sender: TObject);
Begin
    CountButton.Enabled := (FirstAngle_TEdit.Text <> '') And
      (SecondAngle_TEdit.Text <> '');
    FileSaveTab.Enabled := False;
    ResultLabel.Visible := False;
End;

Procedure TMainForm.FirstAngle_TEditClick(Sender: TObject);
Begin
    FirstAngle_TEdit.SelectAll();
End;

Procedure TMainForm.FirstAngle_TEditContextPopup(Sender: TObject;
  MousePos: TPoint; Var Handled: Boolean);
Begin
    Handled := True;
End;

Procedure TMainForm.FormCreate(Sender: TObject);
Begin
    KeyPreview := True;
    OnKeyDown := FormKeyDown;
End;

Procedure TMainForm.FormKeyDown(Sender: TObject; Var Key: Word;
  Shift: TShiftState);
Begin
    If (Key = VK_DOWN) And (ActiveControl Is TEdit) Then
        If TEdit(ActiveControl).TabOrder < High(TabOrder) Then
            SelectNext(ActiveControl, True, True);
    If (Key = VK_UP) And (ActiveControl Is TEdit) Then
        If TEdit(ActiveControl).TabOrder > Low(TabOrder) Then
            SelectNext(ActiveControl, False, True);
End;

Procedure TMainForm.SecondAngleEditKeyPress(Sender: TObject; Var Key: Char);
Var
    Middle: String;
Begin
    Middle := SecondAngle_TEdit.Text;
    If (Key In Digits) Then
    Begin
        If (Key = '0') And (SecondAngle_TEdit.SelStart = 0) Then
            Key := NONE
        Else If IsValidNumbStr(SecondAngle_TEdit.SelStart, Middle, Key) Then
            Key := NONE
    End
    Else If Not((Key = BACKSPACE) And IsCanDelete(SecondAngle_TEdit.SelStart,
      SecondAngle_TEdit.SelLength, Middle)) Then
        Key := NONE;
End;

Procedure TMainForm.SecondAngleEditOnKeyDown(Sender: TObject; Var Key: Word;
  Shift: TShiftState);
Begin
    If ((SsShift In Shift) Or (SsCtrl In Shift)) And
      ((Key = VK_RIGHT) Or (Key = VK_LEFT)) Then
        Key := Key
    Else If (SsShift In Shift) Or (SsCtrl In Shift) Then
        Key := 0;
    If Key = VK_DELETE Then
        Key := 0;
    If (Key = ENTER) And CountButton.Enabled Then
        CountButton.OnClick(Sender);

End;

Procedure TMainForm.SecondAngleOnChange(Sender: TObject);
Begin
    CountButton.Enabled := (FirstAngle_TEdit.Text <> '') And
      (SecondAngle_TEdit.Text <> '');
    FileSaveTab.Enabled := False;
    ResultLabel.Visible := False;
End;

Procedure TMainForm.SecondAngle_TEditClick(Sender: TObject);
Begin
    SecondAngle_TEdit.SelectAll();
End;

Procedure TMainForm.SecondAngle_TEditContextPopup(Sender: TObject;
  MousePos: TPoint; Var Handled: Boolean);
Begin
    Handled := True;
End;

End.
