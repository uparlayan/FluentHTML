program FluentHTML_Demo;

uses
  Winapi.Windows,
  Winapi.ActiveX,
  Vcl.Forms,
  Ana_ in 'Ana_.pas' {Form1},
  HTML_Pages_ in 'HTML_Pages_.pas',
  FluentHTML.Component in '..\src\FluentHTML.Component.pas',
  FluentHTML.DataSet in '..\src\FluentHTML.DataSet.pas',
  FluentHTML in '..\src\FluentHTML.pas',
  FluentHTML.Edge in '..\src\FluentHTML.Edge.pas';

{$R *.res}

begin
  SetEnvironmentVariable('WEBVIEW2_ADDITIONAL_BROWSER_ARGUMENTS',
    '--disable-web-security --disable-site-isolation-trials --disable-features=IsolateOrigins,site-per-process');
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

  CoUninitialize;
end.
