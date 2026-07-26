unit Ana_;

interface

uses
    Winapi.Windows
  , Winapi.ActiveX
  , System.SysUtils
  , System.Classes
  , System.IOUtils
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.StdCtrls
  , Vcl.ExtCtrls
  , Vcl.Edge
  , Winapi.WebView2
  , FluentHTML.Edge
  ;

type
  TForm1 = class(TForm)
    pnl_Toolbar: TPanel;
    bt_Test: TButton;
    EdgeWB: TEdgeBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_TestClick(Sender: TObject);
    procedure EdgeWBCreateWebViewCompleted(Sender: TCustomEdgeBrowser; AResult: HRESULT);
  private
    FCikisYolu: string;
    procedure UpdateDemoDashboard;
    procedure EnsureWebViewLoaderDLL;
  public
  end;

var
  Form1: TForm1;

implementation

uses
    HTML_Pages_
  ;

{$R *.dfm}

procedure TForm1.EnsureWebViewLoaderDLL;
var
  LExeDir, LDllTarget, LFallbackDll: string;
begin
  LExeDir := ExtractFilePath(ParamStr(0));
  LDllTarget := TPath.Combine(LExeDir, 'WebView2Loader.dll');
  if not TFile.Exists(LDllTarget) then
  begin
    LFallbackDll := TPath.Combine(TPath.Combine(LExeDir, 'Exe'), 'WebView2Loader.dll');
    if TFile.Exists(LFallbackDll) then
    begin
      try
        TFile.Copy(LFallbackDll, LDllTarget, True);
      except
      end;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  LUserDataDir: string;
begin
  EnsureWebViewLoaderDLL;

  FCikisYolu := TPath.Combine(ExtractFilePath(ParamStr(0)), 'index.html');

  // Set writable Local AppData UserDataFolder for WebView2
  LUserDataDir := TPath.Combine(TPath.GetCachePath, 'FluentHTML_WebView2');
  try
    ForceDirectories(LUserDataDir);
  except
  end;
  EdgeWB.UserDataFolder := LUserDataDir;

  EdgeWB.OnCreateWebViewCompleted := EdgeWBCreateWebViewCompleted;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  UpdateDemoDashboard;
end;

procedure TForm1.EdgeWBCreateWebViewCompleted(Sender: TCustomEdgeBrowser; AResult: HRESULT);
begin
  if Succeeded(AResult) then
  begin
    UpdateDemoDashboard;
  end;
end;

procedure TForm1.bt_TestClick(Sender: TObject);
begin
  UpdateDemoDashboard;
end;

procedure TForm1.UpdateDemoDashboard;
begin
  TFile.WriteAllText(FCikisYolu, HomePage, TEncoding.UTF8);

  if EdgeWB.WebViewCreated then
    EdgeWB.NavigateLocalFile(FCikisYolu)
  else
    EdgeWB.CreateWebView;
end;

end.
