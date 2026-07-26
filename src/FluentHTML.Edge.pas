/// <summary>
///   TEdgeBrowser bileşeni için gelişmiş sınıf genişletmeleri (Class Helper) sunan birimdir.
/// </summary>
/// <seealso cref="Yazar">
///   Uğur PARLAYAN
/// </seealso>
unit FluentHTML.Edge;

interface

{$region 'gözardı edilecek olan uyarı ve ipucu listesi'}
{$WARN UNIT_PLATFORM              OFF}
{$WARN SYMBOL_PLATFORM            OFF}
{$WARN SUSPICIOUS_TYPECAST        OFF}
{$WARN IMPLICIT_STRING_CAST       OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS  OFF}
{$WARN NO_RETVAL                  OFF}
{$WARN HIDDEN_VIRTUAL             OFF}
{$endregion}

uses
    System.SysUtils
  , Vcl.Edge
  ;

type
  /// <summary>
  ///   TEdgeBrowser bileşeni için yerel dosya yükleme, zoom, yazdır ve PDF kaydetme kolaylıkları sağlayan class helper yapısıdır.
  /// </summary>
  TEdgeBrowserHelper = class helper for TEdgeBrowser
  public
    /// <summary>
    ///   WebView2 ortamının oluşturulmuş olduğunu garanti eder.
    /// </summary>
    procedure EnsureWebView;

    /// <summary>
    ///   Mevcut sayfayı yeniden yükler.
    /// </summary>
    procedure Reload;

    /// <summary>
    ///   Sayfayı yakınlaştırır (%10 büyütür).
    /// </summary>
    procedure ZoomIn;

    /// <summary>
    ///   Sayfayı uzaklaştırır (%10 küçültür).
    /// </summary>
    procedure ZoomOut;

    /// <summary>
    ///   Sayfa yakınlaştırmasını varsayılana (%100) sıfırlar.
    /// </summary>
    procedure ZoomReset;

    /// <summary>
    ///   Sayfa yakınlaştırmasını %125 seviyesine getirir.
    /// </summary>
    procedure ZoomFit;

    /// <summary>
    ///   Sayfayı yazdırır (window.print betiğini tetikler).
    /// </summary>
    procedure Print;

    /// <summary>
    ///   Mevcut Edge WebView2 arayüzünün PDF dışa aktarımı destekleyip desteklemediğini kontrol eder.
    /// </summary>
    /// <returns>Destekleniyorsa True</returns>
    function SupportsPdf: Boolean;

    /// <summary>
    ///   Sayfayı asenkron olarak PDF dosyası olarak kaydeder.
    /// </summary>
    /// <param name="APath">Hedef PDF dosya yolu</param>
    /// <param name="ACallback">İşlem tamamlandığında tetiklenecek geri çağırım prosedürü</param>
    procedure PrintToPdfAsync(const APath: string; ACallback: TProc<HRESULT, Boolean>);

    /// <summary>
    ///   Windows dosya yolunu (C:\...) URL formatına (file:///C:/...) dönüştürerek TEdgeBrowser üzerinde yükler.
    /// </summary>
    /// <param name="AFilePath">Yerel HTML dosyasının tam yolu</param>
    procedure NavigateLocalFile(const AFilePath: string);
  end;

implementation

uses
    Winapi.Windows
  , Winapi.ActiveX
  , Winapi.WebView2
  ;

type
  TPrintToPdfCompletedHandler = class(TInterfacedObject, ICoreWebView2PrintToPdfCompletedHandler)
  private
    FCallback: TProc<HRESULT, Boolean>;
  public
    constructor Create(ACallback: TProc<HRESULT, Boolean>);
    function Invoke(errorCode: HRESULT; isSuccessful: Integer): HRESULT; stdcall;
  end;

{ TPrintToPdfCompletedHandler }

constructor TPrintToPdfCompletedHandler.Create(ACallback: TProc<HRESULT, Boolean>);
begin
  inherited Create;
  FCallback := ACallback;
end;

function TPrintToPdfCompletedHandler.Invoke(errorCode: HRESULT; isSuccessful: Integer): HRESULT;
begin
  if Assigned(FCallback) then
    FCallback(errorCode, isSuccessful <> 0);
  Result := S_OK;
end;

{ TEdgeBrowserHelper }

procedure TEdgeBrowserHelper.EnsureWebView;
begin
  if not Self.WebViewCreated then
    Self.CreateWebView;
end;

procedure TEdgeBrowserHelper.Reload;
var
  LInterface: ICoreWebView2;
begin
  if Self.WebViewCreated then
  begin
    LInterface := Self.DefaultInterface;
    if Assigned(LInterface) then
      LInterface.Reload;
  end;
end;

procedure TEdgeBrowserHelper.ZoomIn;
var
  LNewZoom: Double;
begin
  LNewZoom := Self.ZoomFactor + 0.1;
  if LNewZoom <= 5.0 then
    Self.ZoomFactor := LNewZoom;
end;

procedure TEdgeBrowserHelper.ZoomOut;
var
  LNewZoom: Double;
begin
  LNewZoom := Self.ZoomFactor - 0.1;
  if LNewZoom >= 0.25 then
    Self.ZoomFactor := LNewZoom;
end;

procedure TEdgeBrowserHelper.ZoomReset;
begin
  Self.ZoomFactor := 1.0;
end;

procedure TEdgeBrowserHelper.ZoomFit;
begin
  Self.ZoomFactor := 1.25;
end;

procedure TEdgeBrowserHelper.Print;
begin
  if Self.WebViewCreated then
    Self.ExecuteScript('window.print();');
end;

function TEdgeBrowserHelper.SupportsPdf: Boolean;
var
  LCoreWebView2: ICoreWebView2;
  LWebView7: ICoreWebView2_7;
begin
  Result := False;
  if Self.WebViewCreated then
  begin
    LCoreWebView2 := Self.DefaultInterface;
    Result := Supports(LCoreWebView2, ICoreWebView2_7, LWebView7);
  end;
end;

procedure TEdgeBrowserHelper.PrintToPdfAsync(const APath: string; ACallback: TProc<HRESULT, Boolean>);
var
  LCoreWebView2: ICoreWebView2;
  LWebView7: ICoreWebView2_7;
begin
  if not Self.WebViewCreated then
    Exit;

  LCoreWebView2 := Self.DefaultInterface;
  if Supports(LCoreWebView2, ICoreWebView2_7, LWebView7) then
  begin
    LWebView7.PrintToPdf(
      PWideChar(APath),
      nil,
      TPrintToPdfCompletedHandler.Create(ACallback) as ICoreWebView2PrintToPdfCompletedHandler
    );
  end;
end;

procedure TEdgeBrowserHelper.NavigateLocalFile(const AFilePath: string);
var
  LFullPath, LUrl: string;
begin
  LFullPath := ExpandFileName(AFilePath);
  LUrl := 'file:///' + StringReplace(LFullPath, '\', '/', [rfReplaceAll]);
  Self.Navigate(LUrl);
end;

end.
