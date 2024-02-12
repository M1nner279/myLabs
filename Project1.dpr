program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles,
  Unit2 in 'Unit2.pas' {InstructForm},
  Unit3 in 'Unit3.pas' {DevelopForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Dark');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TInstructForm, InstructForm);
  Application.CreateForm(TDevelopForm, DevelopForm);
  Application.Run;
end.
