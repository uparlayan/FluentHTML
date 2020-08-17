/// <summary>
///   HTML TAG NESNESİ ile ilgili nesne yardımcılarını ve ek veri tiplerini
///   tanımlar.
/// </summary>
/// <seealso cref="Yazar">
///   Uğur PARLAYAN
/// </seealso>
/// <seealso cref="Created By">
///   01.01.2019
/// </seealso>
unit Types_HTML5_;

interface

{$region 'gözardı edilecek olan uyarı ve ipucu listesi'}
{ //  Uyarı ve ipucu listesi aşağıdaki linkte yer alıyor. UP.
  https://marc.durdin.net/2012/05/delphi-xe2s-hidden-hints-and-warnings-options/ }
{$WARN UNIT_PLATFORM              OFF}  //  Platfown Spesifik uyarısını kapatır
{$WARN SYMBOL_PLATFORM            OFF}  //  W1002 spesifik platform, incele ( https://stackoverflow.com/questions/352479/delphi-warning-w1002-symbol-filesetdate-is-specific-to-a-platform )
{$WARN SUSPICIOUS_TYPECAST        OFF}  //  W1044 spesifik platform, incele ( https://stackoverflow.com/questions/283759/convert-string-to-pansichar-in-delphi-2009 )
{$WARN IMPLICIT_STRING_CAST       OFF}  //  W1057 (Örtük tip dönüştürme: String to utf8string)
{$WARN IMPLICIT_STRING_CAST_LOSS  OFF}  //  W1058 (örtük tip dönüştürme: utf8string to string)
{$WARN NO_RETVAL                  OFF}  //  W1058 (örtük tip dönüştürme: utf8string to string)
{$WARN HIDDEN_VIRTUAL             OFF}  //  W1010 (Temel sınıftaki sanal yöntem gizlenmiş...)
{$endregion}

type
  THTMLItems = array of string;
  THTMLItems_Helper = record helper for THTMLItems
    public
      function Count: Integer;
  end;

implementation

{ THTMLAttributes_Helper }

function THTMLItems_Helper.Count: Integer;
begin
  Result := High(Self);
end;

end.
