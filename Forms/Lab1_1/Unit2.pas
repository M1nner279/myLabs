unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TInstructForm = class(TForm)
    Button1: TButton;
    InstructLabel: TLabel;
    procedure ExitButtonOnClick(Sender: TObject);
    procedure InstructFormOnCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InstructForm: TInstructForm;

implementation

{$R *.dfm}

procedure TInstructForm.InstructFormOnCreate(Sender: TObject);
begin
    InstructLabel.Caption := '1. Вводите значения двух углов' + #13#10 + '2. Нажмите на кнопку чтобы получить результат';
    InstructLabel.Width := 400;
    InstructLabel.Left := (ClientWidth - InstructLabel.Width) div 2;
end;

procedure TInstructForm.ExitButtonOnClick(Sender: TObject);
begin
    Close;
end;

end.
