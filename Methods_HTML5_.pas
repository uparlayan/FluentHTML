/// <summary>
///   HTML5 Taglarının Delphi'ye implementasyonu için kullanılır.
/// </summary>
/// <remarks>
///   HTML'in 5. Sürümü temel alınmıştır. Bu nedenle geriye doğru uyumlu DEĞİLDİR !!!
/// </remarks>
/// <seealso href="https://developer.mozilla.org/en-US/docs/Web/HTML/Element">
///   HTML Elements (EN)
/// </seealso>
/// <seealso href="https://developer.mozilla.org/tr/docs/Web/HTML/Element">
///   HTML Elementleri (TR)
/// </seealso>
/// <seealso cref="Yazar">
///   Uğur PARLAYAN
/// </seealso>
/// <seealso cref="Created By">
///   01.01.2019
/// </seealso>
unit Methods_HTML5_;

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

uses
    Classes_HTML5_
  ;
{ Kaynakça
  * https://developer.mozilla.org/en-US/docs/Web/HTML/Element
  * https://developer.mozilla.org/tr/docs/Web/HTML/Element
}
  {$region 'Yardımcı işlevler'}
  function iif(aResult: Boolean; aTrue, aFalse: String): String; inline; overload;
  function iif(aResult: Boolean; aTrue, aFalse: THTMLTag): THTMLTag; inline; overload; deprecated 'Bir değişken olmadan kullanıldığında bellek sızıntısına sebep olur. ÖNERİ : String olan sürümü kullanın...';
  {$endregion}
  {$region 'Ana kök'}
  function doctype        : THTMLTag;
  function html           (const aContent: THTMLTag): THTMLTag; overload;
  function html           (const aContent: String): THTMLTag; overload;
  function html           (const aContent: array of THTMLTag): THTMLTag; overload;
  function html           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Belge üst verisi'}
  function base           : THTMLTag;
  function head           (const aContent: THTMLTag): THTMLTag; overload;
  function head           (const aContent: String): THTMLTag; overload;
  function head           (const aContent: array of THTMLTag): THTMLTag; overload;
  function head           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function link           : THTMLTag;
  function meta           : THTMLTag;
  function style          (const aContent: THTMLTag): THTMLTag; overload;
  function style          (const aContent: String): THTMLTag; overload;
  function style          (const aContent: array of THTMLTag): THTMLTag; overload;
  function style          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function title          (const aContent: THTMLTag): THTMLTag; overload;
  function title          (const aContent: String): THTMLTag; overload;
  function title          (const aContent: array of THTMLTag): THTMLTag; overload;
  function title          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Bölümleme kökü'}
  function body           (const aContent: THTMLTag): THTMLTag; overload;
  function body           (const aContent: String): THTMLTag; overload;
  function body           (const aContent: array of THTMLTag): THTMLTag; overload;
  function body           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'İçerik bölümleme'}
  function address        (const aContent: THTMLTag): THTMLTag; overload;
  function address        (const aContent: String): THTMLTag; overload;
  function address        (const aContent: array of THTMLTag): THTMLTag; overload;
  function address        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function article        (const aContent: THTMLTag): THTMLTag; overload;
  function article        (const aContent: String): THTMLTag; overload;
  function article        (const aContent: array of THTMLTag): THTMLTag; overload;
  function article        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function aside          (const aContent: THTMLTag): THTMLTag; overload;
  function aside          (const aContent: String): THTMLTag; overload;
  function aside          (const aContent: array of THTMLTag): THTMLTag; overload;
  function aside          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function footer         (const aContent: THTMLTag): THTMLTag; overload;
  function footer         (const aContent: String): THTMLTag; overload;
  function footer         (const aContent: array of THTMLTag): THTMLTag; overload;
  function footer         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function header         (const aContent: THTMLTag): THTMLTag; overload;
  function header         (const aContent: String): THTMLTag; overload;
  function header         (const aContent: array of THTMLTag): THTMLTag; overload;
  function header         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function h1             (const aContent: THTMLTag): THTMLTag; overload;
  function h1             (const aContent: String): THTMLTag; overload;
  function h1             (const aContent: array of THTMLTag): THTMLTag; overload;
  function h1             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function h2             (const aContent: THTMLTag): THTMLTag; overload;
  function h2             (const aContent: String): THTMLTag; overload;
  function h2             (const aContent: array of THTMLTag): THTMLTag; overload;
  function h2             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function h3             (const aContent: THTMLTag): THTMLTag; overload;
  function h3             (const aContent: String): THTMLTag; overload;
  function h3             (const aContent: array of THTMLTag): THTMLTag; overload;
  function h3             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function h4             (const aContent: THTMLTag): THTMLTag; overload;
  function h4             (const aContent: String): THTMLTag; overload;
  function h4             (const aContent: array of THTMLTag): THTMLTag; overload;
  function h4             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function h5             (const aContent: THTMLTag): THTMLTag; overload;
  function h5             (const aContent: String): THTMLTag; overload;
  function h5             (const aContent: array of THTMLTag): THTMLTag; overload;
  function h5             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function h6             (const aContent: THTMLTag): THTMLTag; overload;
  function h6             (const aContent: String): THTMLTag; overload;
  function h6             (const aContent: array of THTMLTag): THTMLTag; overload;
  function h6             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function hgroup         (const aContent: THTMLTag): THTMLTag; overload;
  function hgroup         (const aContent: String): THTMLTag; overload;
  function hgroup         (const aContent: array of THTMLTag): THTMLTag; overload;
  function hgroup         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function main_          (const aContent: THTMLTag): THTMLTag; overload;
  function main_          (const aContent: String): THTMLTag; overload;
  function main_          (const aContent: array of THTMLTag): THTMLTag; overload;
  function main_          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function nav            (const aContent: THTMLTag): THTMLTag; overload;
  function nav            (const aContent: String): THTMLTag; overload;
  function nav            (const aContent: array of THTMLTag): THTMLTag; overload;
  function nav            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function section        (const aContent: THTMLTag): THTMLTag; overload;
  function section        (const aContent: String): THTMLTag; overload;
  function section        (const aContent: array of THTMLTag): THTMLTag; overload;
  function section        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Metin içeriği'}
  function blockquote     (const aContent: THTMLTag): THTMLTag; overload;
  function blockquote     (const aContent: String): THTMLTag; overload;
  function blockquote     (const aContent: array of THTMLTag): THTMLTag; overload;
  function blockquote     (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function dd             (const aContent: THTMLTag): THTMLTag; overload;
  function dd             (const aContent: String): THTMLTag; overload;
  function dd             (const aContent: array of THTMLTag): THTMLTag; overload;
  function dd             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function dir            (const aContent: THTMLTag): THTMLTag; overload;
  function dir            (const aContent: String): THTMLTag; overload;
  function dir            (const aContent: array of THTMLTag): THTMLTag; overload;
  function dir            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function div_           (const aContent: THTMLTag): THTMLTag; overload;
  function div_           (const aContent: String): THTMLTag; overload;
  function div_           (const aContent: array of THTMLTag): THTMLTag; overload;
  function div_           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function dl             (const aContent: THTMLTag): THTMLTag; overload;
  function dl             (const aContent: String): THTMLTag; overload;
  function dl             (const aContent: array of THTMLTag): THTMLTag; overload;
  function dl             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function dt             (const aContent: THTMLTag): THTMLTag; overload;
  function dt             (const aContent: String): THTMLTag; overload;
  function dt             (const aContent: array of THTMLTag): THTMLTag; overload;
  function dt             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function figcaption     (const aContent: THTMLTag): THTMLTag; overload;
  function figcaption     (const aContent: String): THTMLTag; overload;
  function figcaption     (const aContent: array of THTMLTag): THTMLTag; overload;
  function figcaption     (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function figure         (const aContent: THTMLTag): THTMLTag; overload;
  function figure         (const aContent: String): THTMLTag; overload;
  function figure         (const aContent: array of THTMLTag): THTMLTag; overload;
  function figure         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function hr             : THTMLTag;
  function li             (const aContent: THTMLTag): THTMLTag; overload;
  function li             (const aContent: String): THTMLTag; overload;
  function li             (const aContent: array of THTMLTag): THTMLTag; overload;
  function li             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function ol             (const aContent: THTMLTag): THTMLTag; overload;
  function ol             (const aContent: String): THTMLTag; overload;
  function ol             (const aContent: array of THTMLTag): THTMLTag; overload;
  function ol             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function p_             (const aContent: THTMLTag): THTMLTag; overload;
  function p_             (const aContent: String): THTMLTag; overload;
  function p_             (const aContent: array of THTMLTag): THTMLTag; overload;
  function p_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function pre            (const aContent: THTMLTag): THTMLTag; overload;
  function pre            (const aContent: String): THTMLTag; overload;
  function pre            (const aContent: array of THTMLTag): THTMLTag; overload;
  function pre            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function ul             (const aContent: THTMLTag): THTMLTag; overload;
  function ul             (const aContent: String): THTMLTag; overload;
  function ul             (const aContent: array of THTMLTag): THTMLTag; overload;
  function ul             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Satır içi metin anlambilimi'}
  function a_             (const aContent: THTMLTag): THTMLTag; overload;
  function a_             (const aContent: String): THTMLTag; overload;
  function a_             (const aContent: array of THTMLTag): THTMLTag; overload;
  function a_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function abbr           (const aContent: THTMLTag): THTMLTag; overload;
  function abbr           (const aContent: String): THTMLTag; overload;
  function abbr           (const aContent: array of THTMLTag): THTMLTag; overload;
  function abbr           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function b_             (const aContent: THTMLTag): THTMLTag; overload;
  function b_             (const aContent: String): THTMLTag; overload;
  function b_             (const aContent: array of THTMLTag): THTMLTag; overload;
  function b_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function bdi            (const aContent: THTMLTag): THTMLTag; overload;
  function bdi            (const aContent: String): THTMLTag; overload;
  function bdi            (const aContent: array of THTMLTag): THTMLTag; overload;
  function bdi            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function bdo            (const aContent: THTMLTag): THTMLTag; overload;
  function bdo            (const aContent: String): THTMLTag; overload;
  function bdo            (const aContent: array of THTMLTag): THTMLTag; overload;
  function bdo            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function br             : THTMLTag;
  function cite           (const aContent: THTMLTag): THTMLTag; overload;
  function cite           (const aContent: String): THTMLTag; overload;
  function cite           (const aContent: array of THTMLTag): THTMLTag; overload;
  function cite           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function code           (const aContent: THTMLTag): THTMLTag; overload;
  function code           (const aContent: String): THTMLTag; overload;
  function code           (const aContent: array of THTMLTag): THTMLTag; overload;
  function code           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function data           (const aContent: THTMLTag): THTMLTag; overload;
  function data           (const aContent: String): THTMLTag; overload;
  function data           (const aContent: array of THTMLTag): THTMLTag; overload;
  function data           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function dfn            (const aContent: THTMLTag): THTMLTag; overload;
  function dfn            (const aContent: String): THTMLTag; overload;
  function dfn            (const aContent: array of THTMLTag): THTMLTag; overload;
  function dfn            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function em             (const aContent: THTMLTag): THTMLTag; overload;
  function em             (const aContent: String): THTMLTag; overload;
  function em             (const aContent: array of THTMLTag): THTMLTag; overload;
  function em             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function i_             (const aContent: THTMLTag): THTMLTag; overload;
  function i_             (const aContent: String): THTMLTag; overload;
  function i_             (const aContent: array of THTMLTag): THTMLTag; overload;
  function i_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function kbd            (const aContent: THTMLTag): THTMLTag; overload;
  function kbd            (const aContent: String): THTMLTag; overload;
  function kbd            (const aContent: array of THTMLTag): THTMLTag; overload;
  function kbd            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function mark           (const aContent: THTMLTag): THTMLTag; overload;
  function mark           (const aContent: String): THTMLTag; overload;
  function mark           (const aContent: array of THTMLTag): THTMLTag; overload;
  function mark           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function q_             (const aContent: THTMLTag): THTMLTag; overload;
  function q_             (const aContent: String): THTMLTag; overload;
  function q_             (const aContent: array of THTMLTag): THTMLTag; overload;
  function q_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function rb             (const aContent: THTMLTag): THTMLTag; overload;
  function rb             (const aContent: String): THTMLTag; overload;
  function rb             (const aContent: array of THTMLTag): THTMLTag; overload;
  function rb             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function rp             (const aContent: THTMLTag): THTMLTag; overload;
  function rp             (const aContent: String): THTMLTag; overload;
  function rp             (const aContent: array of THTMLTag): THTMLTag; overload;
  function rp             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function rt             (const aContent: THTMLTag): THTMLTag; overload;
  function rt             (const aContent: String): THTMLTag; overload;
  function rt             (const aContent: array of THTMLTag): THTMLTag; overload;
  function rt             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function rtc            (const aContent: THTMLTag): THTMLTag; overload;
  function rtc            (const aContent: String): THTMLTag; overload;
  function rtc            (const aContent: array of THTMLTag): THTMLTag; overload;
  function rtc            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function ruby           (const aContent: THTMLTag): THTMLTag; overload;
  function ruby           (const aContent: String): THTMLTag; overload;
  function ruby           (const aContent: array of THTMLTag): THTMLTag; overload;
  function ruby           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function s_             (const aContent: THTMLTag): THTMLTag; overload;
  function s_             (const aContent: String): THTMLTag; overload;
  function s_             (const aContent: array of THTMLTag): THTMLTag; overload;
  function s_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function samp           (const aContent: THTMLTag): THTMLTag; overload;
  function samp           (const aContent: String): THTMLTag; overload;
  function samp           (const aContent: array of THTMLTag): THTMLTag; overload;
  function samp           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function small          (const aContent: THTMLTag): THTMLTag; overload;
  function small          (const aContent: String): THTMLTag; overload;
  function small          (const aContent: array of THTMLTag): THTMLTag; overload;
  function small          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function span           (const aContent: THTMLTag): THTMLTag; overload;
  function span           (const aContent: String): THTMLTag; overload;
  function span           (const aContent: array of THTMLTag): THTMLTag; overload;
  function span           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function strong         (const aContent: THTMLTag): THTMLTag; overload;
  function strong         (const aContent: String): THTMLTag; overload;
  function strong         (const aContent: array of THTMLTag): THTMLTag; overload;
  function strong         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function sub            (const aContent: THTMLTag): THTMLTag; overload;
  function sub            (const aContent: String): THTMLTag; overload;
  function sub            (const aContent: array of THTMLTag): THTMLTag; overload;
  function sub            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function sup            (const aContent: THTMLTag): THTMLTag; overload;
  function sup            (const aContent: String): THTMLTag; overload;
  function sup            (const aContent: array of THTMLTag): THTMLTag; overload;
  function sup            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function time           (const aContent: THTMLTag): THTMLTag; overload;
  function time           (const aContent: String): THTMLTag; overload;
  function time           (const aContent: array of THTMLTag): THTMLTag; overload;
  function time           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function tt             (const aContent: THTMLTag): THTMLTag; overload;
  function tt             (const aContent: String): THTMLTag; overload;
  function tt             (const aContent: array of THTMLTag): THTMLTag; overload;
  function tt             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function u_             (const aContent: THTMLTag): THTMLTag; overload;
  function u_             (const aContent: String): THTMLTag; overload;
  function u_             (const aContent: array of THTMLTag): THTMLTag; overload;
  function u_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function var_           (const aContent: THTMLTag): THTMLTag; overload;
  function var_           (const aContent: String): THTMLTag; overload;
  function var_           (const aContent: array of THTMLTag): THTMLTag; overload;
  function var_           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function wbr            : THTMLTag;
  {$endregion}
  {$region 'Görüntü ve çokluortam'}
  function area           : THTMLTag;
  function audio          (const aContent: THTMLTag): THTMLTag; overload;
  function audio          (const aContent: String): THTMLTag; overload;
  function audio          (const aContent: array of THTMLTag): THTMLTag; overload;
  function audio          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function img            : THTMLTag;
  function map            (const aContent: THTMLTag): THTMLTag; overload;
  function map            (const aContent: String): THTMLTag; overload;
  function map            (const aContent: array of THTMLTag): THTMLTag; overload;
  function map            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function track          : THTMLTag;
  function video          (const aContent: THTMLTag): THTMLTag; overload;
  function video          (const aContent: String): THTMLTag; overload;
  function video          (const aContent: array of THTMLTag): THTMLTag; overload;
  function video          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Gömülü içerik'}
  function applet         (const aContent: THTMLTag): THTMLTag; overload;
  function applet         (const aContent: String): THTMLTag; overload;
  function applet         (const aContent: array of THTMLTag): THTMLTag; overload;
  function applet         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function embed          : THTMLTag;
  function iframe         (const aContent: THTMLTag): THTMLTag; overload;
  function iframe         (const aContent: String): THTMLTag; overload;
  function iframe         (const aContent: array of THTMLTag): THTMLTag; overload;
  function iframe         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function noembed        (const aContent: THTMLTag): THTMLTag; overload;
  function noembed        (const aContent: String): THTMLTag; overload;
  function noembed        (const aContent: array of THTMLTag): THTMLTag; overload;
  function noembed        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function object_        (const aContent: THTMLTag): THTMLTag; overload;
  function object_        (const aContent: String): THTMLTag; overload;
  function object_        (const aContent: array of THTMLTag): THTMLTag; overload;
  function object_        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function param          : THTMLTag;
  function picture        (const aContent: THTMLTag): THTMLTag; overload;
  function picture        (const aContent: String): THTMLTag; overload;
  function picture        (const aContent: array of THTMLTag): THTMLTag; overload;
  function picture        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function source         : THTMLTag;
  {$endregion}
  {$region 'Betikleme'}
  function canvas         (const aContent: THTMLTag): THTMLTag; overload;
  function canvas         (const aContent: String): THTMLTag; overload;
  function canvas         (const aContent: array of THTMLTag): THTMLTag; overload;
  function canvas         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function noscript       (const aContent: THTMLTag): THTMLTag; overload;
  function noscript       (const aContent: String): THTMLTag; overload;
  function noscript       (const aContent: array of THTMLTag): THTMLTag; overload;
  function noscript       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function script         (const aContent: THTMLTag): THTMLTag; overload;
  function script         (const aContent: String): THTMLTag; overload;
  function script         (const aContent: array of THTMLTag): THTMLTag; overload;
  function script         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Sınırlayıcı düzenlemeler'}
  function del            (const aContent: THTMLTag): THTMLTag; overload;
  function del            (const aContent: String): THTMLTag; overload;
  function del            (const aContent: array of THTMLTag): THTMLTag; overload;
  function del            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function ins            (const aContent: THTMLTag): THTMLTag; overload;
  function ins            (const aContent: String): THTMLTag; overload;
  function ins            (const aContent: array of THTMLTag): THTMLTag; overload;
  function ins            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Tablo içeriği'}
  function caption        (const aContent: THTMLTag): THTMLTag; overload;
  function caption        (const aContent: String): THTMLTag; overload;
  function caption        (const aContent: array of THTMLTag): THTMLTag; overload;
  function caption        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function col            : THTMLTag;
  function colgroup       (const aContent: THTMLTag): THTMLTag; overload;
  function colgroup       (const aContent: String): THTMLTag; overload;
  function colgroup       (const aContent: array of THTMLTag): THTMLTag; overload;
  function colgroup       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function table          (const aContent: THTMLTag): THTMLTag; overload;
  function table          (const aContent: String): THTMLTag; overload;
  function table          (const aContent: array of THTMLTag): THTMLTag; overload;
  function table          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function tbody          (const aContent: THTMLTag): THTMLTag; overload;
  function tbody          (const aContent: String): THTMLTag; overload;
  function tbody          (const aContent: array of THTMLTag): THTMLTag; overload;
  function tbody          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function td             (const aContent: THTMLTag): THTMLTag; overload;
  function td             (const aContent: String): THTMLTag; overload;
  function td             (const aContent: array of THTMLTag): THTMLTag; overload;
  function td             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function tfoot          (const aContent: THTMLTag): THTMLTag; overload;
  function tfoot          (const aContent: String): THTMLTag; overload;
  function tfoot          (const aContent: array of THTMLTag): THTMLTag; overload;
  function tfoot          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function th             (const aContent: THTMLTag): THTMLTag; overload;
  function th             (const aContent: String): THTMLTag; overload;
  function th             (const aContent: array of THTMLTag): THTMLTag; overload;
  function th             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function thead          (const aContent: THTMLTag): THTMLTag; overload;
  function thead          (const aContent: String): THTMLTag; overload;
  function thead          (const aContent: array of THTMLTag): THTMLTag; overload;
  function thead          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function tr             (const aContent: THTMLTag): THTMLTag; overload;
  function tr             (const aContent: String): THTMLTag; overload;
  function tr             (const aContent: array of THTMLTag): THTMLTag; overload;
  function tr             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Formlar'}
  function button         (const aContent: THTMLTag): THTMLTag; overload;
  function button         (const aContent: String): THTMLTag; overload;
  function button         (const aContent: array of THTMLTag): THTMLTag; overload;
  function button         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function datalist       (const aContent: THTMLTag): THTMLTag; overload;
  function datalist       (const aContent: String): THTMLTag; overload;
  function datalist       (const aContent: array of THTMLTag): THTMLTag; overload;
  function datalist       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function fieldset       (const aContent: THTMLTag): THTMLTag; overload;
  function fieldset       (const aContent: String): THTMLTag; overload;
  function fieldset       (const aContent: array of THTMLTag): THTMLTag; overload;
  function fieldset       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function form           (const aContent: THTMLTag): THTMLTag; overload;
  function form           (const aContent: String): THTMLTag; overload;
  function form           (const aContent: array of THTMLTag): THTMLTag; overload;
  function form           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function input          : THTMLTag;
  function label_         (const aContent: THTMLTag): THTMLTag; overload;
  function label_         (const aContent: String): THTMLTag; overload;
  function label_         (const aContent: array of THTMLTag): THTMLTag; overload;
  function label_         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function legend         (const aContent: THTMLTag): THTMLTag; overload;
  function legend         (const aContent: String): THTMLTag; overload;
  function legend         (const aContent: array of THTMLTag): THTMLTag; overload;
  function legend         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function meter          (const aContent: THTMLTag): THTMLTag; overload;
  function meter          (const aContent: String): THTMLTag; overload;
  function meter          (const aContent: array of THTMLTag): THTMLTag; overload;
  function meter          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function optgroup       (const aContent: THTMLTag): THTMLTag; overload;
  function optgroup       (const aContent: String): THTMLTag; overload;
  function optgroup       (const aContent: array of THTMLTag): THTMLTag; overload;
  function optgroup       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function option         (const aContent: THTMLTag): THTMLTag; overload;
  function option         (const aContent: String): THTMLTag; overload;
  function option         (const aContent: array of THTMLTag): THTMLTag; overload;
  function option         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function output         (const aContent: THTMLTag): THTMLTag; overload;
  function output         (const aContent: String): THTMLTag; overload;
  function output         (const aContent: array of THTMLTag): THTMLTag; overload;
  function output         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function progress       (const aContent: THTMLTag): THTMLTag; overload;
  function progress       (const aContent: String): THTMLTag; overload;
  function progress       (const aContent: array of THTMLTag): THTMLTag; overload;
  function progress       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function select         (const aContent: THTMLTag): THTMLTag; overload;
  function select         (const aContent: String): THTMLTag; overload;
  function select         (const aContent: array of THTMLTag): THTMLTag; overload;
  function select         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function textarea       (const aContent: THTMLTag): THTMLTag; overload;
  function textarea       (const aContent: String): THTMLTag; overload;
  function textarea       (const aContent: array of THTMLTag): THTMLTag; overload;
  function textarea       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Etkileşimli elemanlar'}
  function details        (const aContent: THTMLTag): THTMLTag; overload;
  function details        (const aContent: String): THTMLTag; overload;
  function details        (const aContent: array of THTMLTag): THTMLTag; overload;
  function details        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function dialog         (const aContent: THTMLTag): THTMLTag; overload;
  function dialog         (const aContent: String): THTMLTag; overload;
  function dialog         (const aContent: array of THTMLTag): THTMLTag; overload;
  function dialog         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function menu           (const aContent: THTMLTag): THTMLTag; overload;
  function menu           (const aContent: String): THTMLTag; overload;
  function menu           (const aContent: array of THTMLTag): THTMLTag; overload;
  function menu           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function menuitem       (const aContent: THTMLTag): THTMLTag; overload;
  function menuitem       (const aContent: String): THTMLTag; overload;
  function menuitem       (const aContent: array of THTMLTag): THTMLTag; overload;
  function menuitem       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function summary        (const aContent: THTMLTag): THTMLTag; overload;
  function summary        (const aContent: String): THTMLTag; overload;
  function summary        (const aContent: array of THTMLTag): THTMLTag; overload;
  function summary        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Web bileşenleri'}
  function content        (const aContent: THTMLTag): THTMLTag; overload;
  function content        (const aContent: String): THTMLTag; overload;
  function content        (const aContent: array of THTMLTag): THTMLTag; overload;
  function content        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function element        (const aContent: THTMLTag): THTMLTag; overload;
  function element        (const aContent: String): THTMLTag; overload;
  function element        (const aContent: array of THTMLTag): THTMLTag; overload;
  function element        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function shadow         (const aContent: THTMLTag): THTMLTag; overload;
  function shadow         (const aContent: String): THTMLTag; overload;
  function shadow         (const aContent: array of THTMLTag): THTMLTag; overload;
  function shadow         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function slot           (const aContent: THTMLTag): THTMLTag; overload;
  function slot           (const aContent: String): THTMLTag; overload;
  function slot           (const aContent: array of THTMLTag): THTMLTag; overload;
  function slot           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  function template       (const aContent: THTMLTag): THTMLTag; overload;
  function template       (const aContent: String): THTMLTag; overload;
  function template       (const aContent: array of THTMLTag): THTMLTag; overload;
  function template       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}

implementation

uses
    System.SysUtils           //  FreeAndNil
  ;

{$region 'Yardımcı işlevler'}
function iif(aResult: Boolean; aTrue, aFalse: String): String; inline;
begin
  if  (aResult = True)
  then Result := aTrue
  else Result := aFalse;
end;

function iif(aResult: Boolean; aTrue, aFalse: THTMLTag): THTMLTag; inline;
begin
  if  (aResult = True)
  then Result := aTrue
  else Result := aFalse;
end;
{$endregion}

{$region 'Ana kök' }
function doctype: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('doctype');
end;

function html(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('html');
  Result.Items.Add( aContent );
end;

function html(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('html');
  Result.Context( aContent );
end;

function html(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('html');
  Result.Items.AddRange( aContent );
end;

function html(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('html');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

{$region 'Belge üst verisi' }
function base: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('base');
end;

function head(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('head');
  Result.Items.Add( aContent );
end;

function head(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('head');
  Result.Context( aContent );
end;

function head(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('head');
  Result.Items.AddRange( aContent );
end;

function head(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('head');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function link: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('link');
end;

function meta: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('meta');
end;

function style(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('style');
  Result.Items.Add( aContent );
end;

function style(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('style');
  Result.Context( aContent );
end;

function style(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('style');
  Result.Items.AddRange( aContent );
end;

function style(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('style');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function title(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('title');
  Result.Items.Add( aContent );
end;

function title(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('title');
  Result.Context( aContent );
end;

function title(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('title');
  Result.Items.AddRange( aContent );
end;

function title(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('title');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

{$region 'Bölümleme kökü' }
function body(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('body');
  Result.Items.Add( aContent );
end;

function body(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('body');
  Result.Context( aContent );
end;

function body(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('body');
  Result.Items.AddRange( aContent );
end;

function body(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('body');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

{$region 'İçerik bölümleme' }
function address(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('address');
  Result.Items.Add( aContent );
end;

function address(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('address');
  Result.Context( aContent );
end;

function address(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('address');
  Result.Items.AddRange( aContent );
end;

function address(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('address');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function article(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('article');
  Result.Items.Add( aContent );
end;

function article(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('article');
  Result.Context( aContent );
end;

function article(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('article');
  Result.Items.AddRange( aContent );
end;

function article(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('article');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function aside(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('aside');
  Result.Items.Add( aContent );
end;

function aside(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('aside');
  Result.Context( aContent );
end;

function aside(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('aside');
  Result.Items.AddRange( aContent );
end;

function aside(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('aside');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function footer(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('footer');
  Result.Items.Add( aContent );
end;

function footer(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('footer');
  Result.Context( aContent );
end;

function footer(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('footer');
  Result.Items.AddRange( aContent );
end;

function footer(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('footer');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function header(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('header');
  Result.Items.Add( aContent );
end;

function header(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('header');
  Result.Context( aContent );
end;

function header(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('header');
  Result.Items.AddRange( aContent );
end;

function header(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('header');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function h1(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h1');
  Result.Items.Add( aContent );
end;

function h1(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h1');
  Result.Context( aContent );
end;

function h1(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h1');
  Result.Items.AddRange( aContent );
end;

function h1(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h1');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function h2(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h2');
  Result.Items.Add( aContent );
end;

function h2(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h2');
  Result.Context( aContent );
end;

function h2(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h2');
  Result.Items.AddRange( aContent );
end;

function h2(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h2');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function h3(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h3');
  Result.Items.Add( aContent );
end;

function h3(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h3');
  Result.Context( aContent );
end;

function h3(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h3');
  Result.Items.AddRange( aContent );
end;

function h3(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h3');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function h4(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h4');
  Result.Items.Add( aContent );
end;

function h4(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h4');
  Result.Context( aContent );
end;

function h4(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h4');
  Result.Items.AddRange( aContent );
end;

function h4(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h4');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function h5(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h5');
  Result.Items.Add( aContent );
end;

function h5(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h5');
  Result.Context( aContent );
end;

function h5(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h5');
  Result.Items.AddRange( aContent );
end;

function h5(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h5');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function h6(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h6');
  Result.Items.Add( aContent );
end;

function h6(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h6');
  Result.Context( aContent );
end;

function h6(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h6');
  Result.Items.AddRange( aContent );
end;

function h6(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('h6');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function hgroup(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('hgroup');
  Result.Items.Add( aContent );
end;

function hgroup(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('hgroup');
  Result.Context( aContent );
end;

function hgroup(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('hgroup');
  Result.Items.AddRange( aContent );
end;

function hgroup(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('hgroup');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function main_(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('main');
  Result.Items.Add( aContent );
end;

function main_(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('main');
  Result.Context( aContent );
end;

function main_(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('main');
  Result.Items.AddRange( aContent );
end;

function main_(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('main');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function nav(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('nav');
  Result.Items.Add( aContent );
end;

function nav(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('nav');
  Result.Context( aContent );
end;

function nav(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('nav');
  Result.Items.AddRange( aContent );
end;

function nav(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('nav');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function section(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('section');
  Result.Items.Add( aContent );
end;

function section(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('section');
  Result.Context( aContent );
end;

function section(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('section');
  Result.Items.AddRange( aContent );
end;

function section(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('section');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

{$region 'Metin içeriği' }
function blockquote(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('blockquote');
  Result.Items.Add( aContent );
end;

function blockquote(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('blockquote');
  Result.Context( aContent );
end;

function blockquote(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('blockquote');
  Result.Items.AddRange( aContent );
end;

function blockquote(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('blockquote');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function dd(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dd');
  Result.Items.Add( aContent );
end;

function dd(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dd');
  Result.Context( aContent );
end;

function dd(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dd');
  Result.Items.AddRange( aContent );
end;

function dd(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dd');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function dir(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dir');
  Result.Items.Add( aContent );
end;

function dir(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dir');
  Result.Context( aContent );
end;

function dir(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dir');
  Result.Items.AddRange( aContent );
end;

function dir(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dir');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function div_(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('div');
  Result.Items.Add( aContent );
end;

function div_(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('div');
  Result.Context( aContent );
end;

function div_(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('div');
  Result.Items.AddRange( aContent );
end;

function div_(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('div');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function dl(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dl');
  Result.Items.Add( aContent );
end;

function dl(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dl');
  Result.Context( aContent );
end;

function dl(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dl');
  Result.Items.AddRange( aContent );
end;

function dl(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dl');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function dt(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dt');
  Result.Items.Add( aContent );
end;

function dt(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dt');
  Result.Context( aContent );
end;

function dt(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dt');
  Result.Items.AddRange( aContent );
end;

function dt(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dt');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function figcaption(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('figcaption');
  Result.Items.Add( aContent );
end;

function figcaption(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('figcaption');
  Result.Context( aContent );
end;

function figcaption(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('figcaption');
  Result.Items.AddRange( aContent );
end;

function figcaption(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('figcaption');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function figure(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('figure');
  Result.Items.Add( aContent );
end;

function figure(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('figure');
  Result.Context( aContent );
end;

function figure(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('figure');
  Result.Items.AddRange( aContent );
end;

function figure(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('figure');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function hr: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('hr');
end;

function li(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('li');
  Result.Items.Add( aContent );
end;

function li(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('li');
  Result.Context( aContent );
end;

function li(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('li');
  Result.Items.AddRange( aContent );
end;

function li(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('li');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function ol(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ol');
  Result.Items.Add( aContent );
end;

function ol(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ol');
  Result.Context( aContent );
end;

function ol(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ol');
  Result.Items.AddRange( aContent );
end;

function ol(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ol');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function p_(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('p');
  Result.Items.Add( aContent );
end;

function p_(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('p');
  Result.Context( aContent );
end;

function p_(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('p');
  Result.Items.AddRange( aContent );
end;

function p_(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('p');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function pre(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('pre');
  Result.Items.Add( aContent );
end;

function pre(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('pre');
  Result.Context( aContent );
end;

function pre(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('pre');
  Result.Items.AddRange( aContent );
end;

function pre(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('pre');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function ul(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ul');
  Result.Items.Add( aContent );
end;

function ul(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ul');
  Result.Context( aContent );
end;

function ul(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ul');
  Result.Items.AddRange( aContent );
end;

function ul(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ul');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

{$region 'Satır içi metin anlambilimi' }
function a_(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('a');
  Result.Items.Add( aContent );
end;

function a_(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('a');
  Result.Context( aContent );
end;

function a_(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('a');
  Result.Items.AddRange( aContent );
end;

function a_(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('a');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function abbr(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('abbr');
  Result.Items.Add( aContent );
end;

function abbr(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('abbr');
  Result.Context( aContent );
end;

function abbr(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('abbr');
  Result.Items.AddRange( aContent );
end;

function abbr(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('abbr');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function b_(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('b');
  Result.Items.Add( aContent );
end;

function b_(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('b');
  Result.Context( aContent );
end;

function b_(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('b');
  Result.Items.AddRange( aContent );
end;

function b_(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('b');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function bdi(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('bdi');
  Result.Items.Add( aContent );
end;

function bdi(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('bdi');
  Result.Context( aContent );
end;

function bdi(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('bdi');
  Result.Items.AddRange( aContent );
end;

function bdi(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('bdi');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function bdo(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('bdo');
  Result.Items.Add( aContent );
end;

function bdo(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('bdo');
  Result.Context( aContent );
end;

function bdo(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('bdo');
  Result.Items.AddRange( aContent );
end;

function bdo(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('bdo');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function br: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('br');
end;

function cite(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('cite');
  Result.Items.Add( aContent );
end;

function cite(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('cite');
  Result.Context( aContent );
end;

function cite(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('cite');
  Result.Items.AddRange( aContent );
end;

function cite(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('cite');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function code(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('code');
  Result.Items.Add( aContent );
end;

function code(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('code');
  Result.Context( aContent );
end;

function code(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('code');
  Result.Items.AddRange( aContent );
end;

function code(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('code');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function data(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('data');
  Result.Items.Add( aContent );
end;

function data(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('data');
  Result.Context( aContent );
end;

function data(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('data');
  Result.Items.AddRange( aContent );
end;

function data(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('data');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function dfn(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dfn');
  Result.Items.Add( aContent );
end;

function dfn(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dfn');
  Result.Context( aContent );
end;

function dfn(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dfn');
  Result.Items.AddRange( aContent );
end;

function dfn(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dfn');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function em(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('em');
  Result.Items.Add( aContent );
end;

function em(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('em');
  Result.Context( aContent );
end;

function em(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('em');
  Result.Items.AddRange( aContent );
end;

function em(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('em');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function i_(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('i');
  Result.Items.Add( aContent );
end;

function i_(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('i');
  Result.Context( aContent );
end;

function i_(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('i');
  Result.Items.AddRange( aContent );
end;

function i_(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('i');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function kbd(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('kbd');
  Result.Items.Add( aContent );
end;

function kbd(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('kbd');
  Result.Context( aContent );
end;

function kbd(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('kbd');
  Result.Items.AddRange( aContent );
end;

function kbd(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('kbd');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function mark(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('mark');
  Result.Items.Add( aContent );
end;

function mark(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('mark');
  Result.Context( aContent );
end;

function mark(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('mark');
  Result.Items.AddRange( aContent );
end;

function mark(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('mark');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function q_(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('q');
  Result.Items.Add( aContent );
end;

function q_(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('q');
  Result.Context( aContent );
end;

function q_(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('q');
  Result.Items.AddRange( aContent );
end;

function q_(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('q');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function rb(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rb');
  Result.Items.Add( aContent );
end;

function rb(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rb');
  Result.Context( aContent );
end;

function rb(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rb');
  Result.Items.AddRange( aContent );
end;

function rb(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rb');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function rp(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rp');
  Result.Items.Add( aContent );
end;

function rp(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rp');
  Result.Context( aContent );
end;

function rp(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rp');
  Result.Items.AddRange( aContent );
end;

function rp(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rp');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function rt(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rt');
  Result.Items.Add( aContent );
end;

function rt(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rt');
  Result.Context( aContent );
end;

function rt(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rt');
  Result.Items.AddRange( aContent );
end;

function rt(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rt');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function rtc(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rtc');
  Result.Items.Add( aContent );
end;

function rtc(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rtc');
  Result.Context( aContent );
end;

function rtc(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rtc');
  Result.Items.AddRange( aContent );
end;

function rtc(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('rtc');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function ruby(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ruby');
  Result.Items.Add( aContent );
end;

function ruby(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ruby');
  Result.Context( aContent );
end;

function ruby(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ruby');
  Result.Items.AddRange( aContent );
end;

function ruby(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ruby');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function s_(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('s');
  Result.Items.Add( aContent );
end;

function s_(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('s');
  Result.Context( aContent );
end;

function s_(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('s');
  Result.Items.AddRange( aContent );
end;

function s_(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('s');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function samp(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('samp');
  Result.Items.Add( aContent );
end;

function samp(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('samp');
  Result.Context( aContent );
end;

function samp(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('samp');
  Result.Items.AddRange( aContent );
end;

function samp(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('samp');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function small(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('small');
  Result.Items.Add( aContent );
end;

function small(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('small');
  Result.Context( aContent );
end;

function small(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('small');
  Result.Items.AddRange( aContent );
end;

function small(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('small');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function span(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('span');
  Result.Items.Add( aContent );
end;

function span(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('span');
  Result.Context( aContent );
end;

function span(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('span');
  Result.Items.AddRange( aContent );
end;

function span(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('span');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function strong(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('strong');
  Result.Items.Add( aContent );
end;

function strong(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('strong');
  Result.Context( aContent );
end;

function strong(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('strong');
  Result.Items.AddRange( aContent );
end;

function strong(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('strong');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function sub(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('sub');
  Result.Items.Add( aContent );
end;

function sub(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('sub');
  Result.Context( aContent );
end;

function sub(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('sub');
  Result.Items.AddRange( aContent );
end;

function sub(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('sub');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function sup(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('sup');
  Result.Items.Add( aContent );
end;

function sup(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('sup');
  Result.Context( aContent );
end;

function sup(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('sup');
  Result.Items.AddRange( aContent );
end;

function sup(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('sup');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function time(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('time');
  Result.Items.Add( aContent );
end;

function time(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('time');
  Result.Context( aContent );
end;

function time(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('time');
  Result.Items.AddRange( aContent );
end;

function time(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('time');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function tt(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tt');
  Result.Items.Add( aContent );
end;

function tt(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tt');
  Result.Context( aContent );
end;

function tt(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tt');
  Result.Items.AddRange( aContent );
end;

function tt(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tt');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function u_(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('u');
  Result.Items.Add( aContent );
end;

function u_(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('u');
  Result.Context( aContent );
end;

function u_(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('u');
  Result.Items.AddRange( aContent );
end;

function u_(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('u');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function var_(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('var');
  Result.Items.Add( aContent );
end;

function var_(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('var');
  Result.Context( aContent );
end;

function var_(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('var');
  Result.Items.AddRange( aContent );
end;

function var_(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('var');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function wbr: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('wbr');
end;
{$endregion}

{$region 'Görüntü ve çokluortam' }
function area: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('area');
end;

function audio(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('audio');
  Result.Items.Add( aContent );
end;

function audio(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('audio');
  Result.Context( aContent );
end;

function audio(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('audio');
  Result.Items.AddRange( aContent );
end;

function audio(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('audio');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function img: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('img');
end;

function map(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('map');
  Result.Items.Add( aContent );
end;

function map(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('map');
  Result.Context( aContent );
end;

function map(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('map');
  Result.Items.AddRange( aContent );
end;

function map(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('map');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function track: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('track');
end;

function video(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('video');
  Result.Items.Add( aContent );
end;

function video(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('video');
  Result.Context( aContent );
end;

function video(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('video');
  Result.Items.AddRange( aContent );
end;

function video(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('video');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

{$region 'Gömülü içerik' }
function applet(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('applet');
  Result.Items.Add( aContent );
end;

function applet(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('applet');
  Result.Context( aContent );
end;

function applet(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('applet');
  Result.Items.AddRange( aContent );
end;

function applet(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('applet');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function embed: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('embed');
end;

function iframe(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('iframe');
  Result.Items.Add( aContent );
end;

function iframe(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('iframe');
  Result.Context( aContent );
end;

function iframe(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('iframe');
  Result.Items.AddRange( aContent );
end;

function iframe(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('iframe');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function noembed(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('noembed');
  Result.Items.Add( aContent );
end;

function noembed(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('noembed');
  Result.Context( aContent );
end;

function noembed(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('noembed');
  Result.Items.AddRange( aContent );
end;

function noembed(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('noembed');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function object_(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('object');
  Result.Items.Add( aContent );
end;

function object_(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('object');
  Result.Context( aContent );
end;

function object_(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('object');
  Result.Items.AddRange( aContent );
end;

function object_(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('object');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function param: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('param');
end;

function picture(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('picture');
  Result.Items.Add( aContent );
end;

function picture(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('picture');
  Result.Context( aContent );
end;

function picture(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('picture');
  Result.Items.AddRange( aContent );
end;

function picture(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('picture');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function source: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('source');
end;
{$endregion}

{$region 'Betikleme' }
function canvas(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('canvas');
  Result.Items.Add( aContent );
end;

function canvas(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('canvas');
  Result.Context( aContent );
end;

function canvas(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('canvas');
  Result.Items.AddRange( aContent );
end;

function canvas(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('canvas');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function noscript(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('noscript');
  Result.Items.Add( aContent );
end;

function noscript(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('noscript');
  Result.Context( aContent );
end;

function noscript(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('noscript');
  Result.Items.AddRange( aContent );
end;

function noscript(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('noscript');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function script(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('script');
  Result.Items.Add( aContent );
end;

function script(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('script');
  Result.Context( aContent );
end;

function script(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('script');
  Result.Items.AddRange( aContent );
end;

function script(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('script');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

{$region 'Sınırlayıcı düzenlemeler' }
function del(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('del');
  Result.Items.Add( aContent );
end;

function del(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('del');
  Result.Context( aContent );
end;

function del(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('del');
  Result.Items.AddRange( aContent );
end;

function del(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('del');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function ins(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ins');
  Result.Items.Add( aContent );
end;

function ins(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ins');
  Result.Context( aContent );
end;

function ins(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ins');
  Result.Items.AddRange( aContent );
end;

function ins(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('ins');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

{$region 'Tablo içeriği' }
function caption(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('caption');
  Result.Items.Add( aContent );
end;

function caption(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('caption');
  Result.Context( aContent );
end;

function caption(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('caption');
  Result.Items.AddRange( aContent );
end;

function caption(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('caption');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function col: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('col');
end;

function colgroup(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('colgroup');
  Result.Items.Add( aContent );
end;

function colgroup(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('colgroup');
  Result.Context( aContent );
end;

function colgroup(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('colgroup');
  Result.Items.AddRange( aContent );
end;

function colgroup(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('colgroup');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function table(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('table');
  Result.Items.Add( aContent );
end;

function table(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('table');
  Result.Context( aContent );
end;

function table(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('table');
  Result.Items.AddRange( aContent );
end;

function table(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('table');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function tbody(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tbody');
  Result.Items.Add( aContent );
end;

function tbody(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tbody');
  Result.Context( aContent );
end;

function tbody(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tbody');
  Result.Items.AddRange( aContent );
end;

function tbody(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tbody');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function td(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('td');
  Result.Items.Add( aContent );
end;

function td(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('td');
  Result.Context( aContent );
end;

function td(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('td');
  Result.Items.AddRange( aContent );
end;

function td(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('td');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function tfoot(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tfoot');
  Result.Items.Add( aContent );
end;

function tfoot(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tfoot');
  Result.Context( aContent );
end;

function tfoot(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tfoot');
  Result.Items.AddRange( aContent );
end;

function tfoot(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tfoot');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function th(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('th');
  Result.Items.Add( aContent );
end;

function th(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('th');
  Result.Context( aContent );
end;

function th(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('th');
  Result.Items.AddRange( aContent );
end;

function th(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('th');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function thead(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('thead');
  Result.Items.Add( aContent );
end;

function thead(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('thead');
  Result.Context( aContent );
end;

function thead(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('thead');
  Result.Items.AddRange( aContent );
end;

function thead(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('thead');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function tr(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tr');
  Result.Items.Add( aContent );
end;

function tr(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tr');
  Result.Context( aContent );
end;

function tr(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tr');
  Result.Items.AddRange( aContent );
end;

function tr(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('tr');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

{$region 'Formlar' }
function button(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('button');
  Result.Items.Add( aContent );
end;

function button(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('button');
  Result.Context( aContent );
end;

function button(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('button');
  Result.Items.AddRange( aContent );
end;

function button(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('button');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function datalist(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('datalist');
  Result.Items.Add( aContent );
end;

function datalist(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('datalist');
  Result.Context( aContent );
end;

function datalist(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('datalist');
  Result.Items.AddRange( aContent );
end;

function datalist(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('datalist');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function fieldset(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('fieldset');
  Result.Items.Add( aContent );
end;

function fieldset(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('fieldset');
  Result.Context( aContent );
end;

function fieldset(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('fieldset');
  Result.Items.AddRange( aContent );
end;

function fieldset(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('fieldset');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function form(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('form');
  Result.Items.Add( aContent );
end;

function form(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('form');
  Result.Context( aContent );
end;

function form(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('form');
  Result.Items.AddRange( aContent );
end;

function form(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('form');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function input: THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('input');
end;

function label_(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('label');
  Result.Items.Add( aContent );
end;

function label_(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('label');
  Result.Context( aContent );
end;

function label_(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('label');
  Result.Items.AddRange( aContent );
end;

function label_(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('label');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function legend(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('legend');
  Result.Items.Add( aContent );
end;

function legend(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('legend');
  Result.Context( aContent );
end;

function legend(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('legend');
  Result.Items.AddRange( aContent );
end;

function legend(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('legend');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function meter(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('meter');
  Result.Items.Add( aContent );
end;

function meter(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('meter');
  Result.Context( aContent );
end;

function meter(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('meter');
  Result.Items.AddRange( aContent );
end;

function meter(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('meter');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function optgroup(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('optgroup');
  Result.Items.Add( aContent );
end;

function optgroup(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('optgroup');
  Result.Context( aContent );
end;

function optgroup(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('optgroup');
  Result.Items.AddRange( aContent );
end;

function optgroup(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('optgroup');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function option(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('option');
  Result.Items.Add( aContent );
end;

function option(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('option');
  Result.Context( aContent );
end;

function option(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('option');
  Result.Items.AddRange( aContent );
end;

function option(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('option');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function output(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('output');
  Result.Items.Add( aContent );
end;

function output(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('output');
  Result.Context( aContent );
end;

function output(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('output');
  Result.Items.AddRange( aContent );
end;

function output(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('output');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function progress(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('progress');
  Result.Items.Add( aContent );
end;

function progress(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('progress');
  Result.Context( aContent );
end;

function progress(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('progress');
  Result.Items.AddRange( aContent );
end;

function progress(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('progress');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function select(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('select');
  Result.Items.Add( aContent );
end;

function select(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('select');
  Result.Context( aContent );
end;

function select(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('select');
  Result.Items.AddRange( aContent );
end;

function select(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('select');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function textarea(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('textarea');
  Result.Items.Add( aContent );
end;

function textarea(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('textarea');
  Result.Context( aContent );
end;

function textarea(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('textarea');
  Result.Items.AddRange( aContent );
end;

function textarea(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('textarea');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

{$region 'Etkileşimli elemanlar' }
function details(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('details');
  Result.Items.Add( aContent );
end;

function details(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('details');
  Result.Context( aContent );
end;

function details(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('details');
  Result.Items.AddRange( aContent );
end;

function details(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('details');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function dialog(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dialog');
  Result.Items.Add( aContent );
end;

function dialog(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dialog');
  Result.Context( aContent );
end;

function dialog(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dialog');
  Result.Items.AddRange( aContent );
end;

function dialog(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('dialog');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function menu(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('menu');
  Result.Items.Add( aContent );
end;

function menu(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('menu');
  Result.Context( aContent );
end;

function menu(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('menu');
  Result.Items.AddRange( aContent );
end;

function menu(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('menu');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function menuitem(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('menuitem');
  Result.Items.Add( aContent );
end;

function menuitem(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('menuitem');
  Result.Context( aContent );
end;

function menuitem(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('menuitem');
  Result.Items.AddRange( aContent );
end;

function menuitem(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('menuitem');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function summary(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('summary');
  Result.Items.Add( aContent );
end;

function summary(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('summary');
  Result.Context( aContent );
end;

function summary(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('summary');
  Result.Items.AddRange( aContent );
end;

function summary(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('summary');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

{$region 'Web bileşenleri' }
function content(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('content');
  Result.Items.Add( aContent );
end;

function content(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('content');
  Result.Context( aContent );
end;

function content(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('content');
  Result.Items.AddRange( aContent );
end;

function content(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('content');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function element(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('element');
  Result.Items.Add( aContent );
end;

function element(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('element');
  Result.Context( aContent );
end;

function element(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('element');
  Result.Items.AddRange( aContent );
end;

function element(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('element');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function shadow(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('shadow');
  Result.Items.Add( aContent );
end;

function shadow(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('shadow');
  Result.Context( aContent );
end;

function shadow(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('shadow');
  Result.Items.AddRange( aContent );
end;

function shadow(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('shadow');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function slot(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('slot');
  Result.Items.Add( aContent );
end;

function slot(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('slot');
  Result.Context( aContent );
end;

function slot(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('slot');
  Result.Items.AddRange( aContent );
end;

function slot(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('slot');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;

function template(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('template');
  Result.Items.Add( aContent );
end;

function template(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('template');
  Result.Context( aContent );
end;

function template(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('template');
  Result.Items.AddRange( aContent );
end;

function template(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('template');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

end.
