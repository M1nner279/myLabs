unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TDevelopForm = class(TForm)
    Button1: TButton;
    DevelopLabel: TLabel;
    procedure DevelopFormOnCreate(Sender: TObject);
    procedure DevelopExitButtonOnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DevelopForm: TDevelopForm;

implementation

{$R *.dfm}

procedure TDevelopForm.DevelopExitButtonOnClick(Sender: TObject);
begin
    Close;
end;

procedure TDevelopForm.DevelopFormOnCreate(Sender: TObject);
begin
    DevelopLabel.Caption := 'Разработал Кучко Максим' + #13#10 + 'Группа 351005, 03.02.24';
    DevelopLabel.Width := 300;
    DevelopLabel.Left := (ClientWidth - DevelopLabel.Width) div 2;
end;

end.
