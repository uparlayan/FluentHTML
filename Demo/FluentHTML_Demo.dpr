program FluentHTML_Demo;

uses
  System.StartUpCopy,
  FMX.Forms,
  Ana_ in 'Ana_.pas' {Form1},
  HTML_Pages_ in 'HTML_Pages_.pas',
  Classes_HTML5_ in '..\src\Classes_HTML5_.pas',
  Methods_HTML5_ in '..\src\Methods_HTML5_.pas',
  Types_HTML5_ in '..\src\Types_HTML5_.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
