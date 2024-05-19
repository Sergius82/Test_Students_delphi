program St21;

uses
  System.StartUpCopy,
  FMX.Forms,
  ST1 in 'ST1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
