/// <summary>
///   Delphi IDE Form ve DataModule görsel tasarımı için TFluentHTMLComponent temsilci bileşenini tanımlar.
/// </summary>
/// <seealso cref="Yazar">
///   Uğur PARLAYAN
/// </seealso>
unit FluentHTML.Component;

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
    System.Classes
  , System.SysUtils
  , Data.DB
  , FluentHTML
  , FluentHTML.DataSet
  ;

type
  /// <summary>
  ///   Delphi IDE Form ve DataModule görsel tasarımında Araç Paletinden (Tool Palette)
  ///   sürüklenip bırakılabilen TFluentHTMLComponent temsilci bileşen sınıfıdır.
  /// </summary>
  TFluentHTMLComponent = class(TComponent)
  private
    FDataSet: TDataSet;
    FTableClass: String;
    procedure SetDataSet(const Value: TDataSet);
  protected
    /// <summary>
    ///   Form tasarımı esnasında bağlı TDataSet bileşeni silindiğinde referansın güvenle sıfırlanmasını sağlar.
    /// </summary>
    /// <param name="AComponent">Etkilenen bileşen</param>
    /// <param name="Operation">Gerçekleştirilen işlem (opRemove vb.)</param>
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    /// <summary>
    ///   TFluentHTMLComponent nesnesi oluşturur.
    /// </summary>
    /// <param name="AOwner">Sahip bileşen (Form veya DataModule)</param>
    constructor Create(AOwner: TComponent); override;

    /// <summary>
    ///   Bağlı TDataSet verisini HTML5 'table' etiket ağacına dönüştürür.
    /// </summary>
    /// <returns>Oluşturulan THTMLTag tablo nesnesi (Kullanıcı tarafından serbest bırakılmalıdır)</returns>
    function GetHTMLTableTag: THTMLTag;

    /// <summary>
    ///   Bağlı TDataSet verisini HTML5 tablo metni (String) olarak üretir.
    /// </summary>
    /// <returns>HTML5 metin çıktısı</returns>
    function GenerateHTMLTable: String;
  published
    /// <summary>
    ///   Object Inspector üzerinden atanabilen görsel veri kaynağı bileşenidir (FDQuery, ClientDataSet vb.).
    /// </summary>
    property DataSet: TDataSet read FDataSet write SetDataSet;

    /// <summary>
    ///   Üretilecek HTML tablosu için CSS sınıf adı (opsiyonel).
    /// </summary>
    property TableClass: String read FTableClass write FTableClass;
  end;

/// <summary>
///   Bileşeni Delphi IDE Araç Paletine (Tool Palette) kaydeder.
/// </summary>
procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('FluentHTML', [TFluentHTMLComponent]);
end;

{ TFluentHTMLComponent }

constructor TFluentHTMLComponent.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataSet := nil;
  FTableClass := '';
end;

procedure TFluentHTMLComponent.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FDataSet) then
    FDataSet := nil;
end;

procedure TFluentHTMLComponent.SetDataSet(const Value: TDataSet);
begin
  if FDataSet <> Value then
  begin
    FDataSet := Value;
    if Assigned(FDataSet) then
      FDataSet.FreeNotification(Self);
  end;
end;

function TFluentHTMLComponent.GetHTMLTableTag: THTMLTag;
begin
  Result := DataSetToHTMLTable(FDataSet, FTableClass);
end;

function TFluentHTMLComponent.GenerateHTMLTable: String;
var
  aTag: THTMLTag;
begin
  Result := '';
  aTag := GetHTMLTableTag;
  if Assigned(aTag) then
  begin
    try
      Result := aTag.ToString;
    finally
      FreeAndNil(aTag);
    end;
  end;
end;

end.
