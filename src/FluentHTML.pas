/// <summary>
///   HTML5 Taglarının ve nesnelerinin Delphi'ye implementasyonu için kullanılır.
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
unit FluentHTML;

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
    System.Generics.Collections //  TObjectList<T>
  ;

type
  /// <summary>
  ///   HTML öğe dizisi türüdür.
  /// </summary>
  THTMLItems = array of string;

  /// <summary>
  ///   THTMLItems türü için yardımcı metotlar sunan record helper yapısıdır.
  /// </summary>
  THTMLItems_Helper = record helper for THTMLItems
    public
      /// <summary>
      ///   Dizinin üst sınır indeks değerini (High) döndürür.
      /// </summary>
      /// <returns>Dizinin üst sınır indeks değeri (Integer)</returns>
      function Count: Integer;
  end;

  /// <summary>
  ///   HTML etiketini (Tag), özniteliklerini (Attributes) ve olaylarını (Events) temsil eden sınıftır.
  /// </summary>
  THTMLTag = class(TInterfacedObject)
    private
      FItems                    : TObjectList<THTMLTag>;
      FTagName                  : String;
      FContext                  : String;
      {$region 'attributes'}
      Faccesskey      : String;                     // Global öznitelik
      Fautocapitalize : String;                     // Global öznitelik
      Fclass_         : String;                     // Global öznitelik
      Fcontenteditable: String;                     // Global öznitelik
      Fcontextmenu    : String;                     // Global öznitelik
      Fdata           : String;                     // Global öznitelik
      Fdir            : String;                     // Global öznitelik
      Fdraggable      : String;                     // Global öznitelik
      Fdropzone       : String;                     // Global öznitelik
      Fhidden         : String;                     // Global öznitelik
      Fid             : String;                     // Global öznitelik
      Fitemprop       : String;                     // Global öznitelik
      Flang           : String;                     // Global öznitelik
      Fslot           : String;                     // Global öznitelik
      Fspellcheck     : String;                     // Global öznitelik
      Fstyle          : String;                     // Global öznitelik
      Ftabindex       : String;                     // Global öznitelik
      Ftitle          : String;                     // Global öznitelik
      Ftranslate      : String;                     // Global öznitelik
      Faccept         : String;                     // Yerel öznitelik
      Faccept_charset : String;                     // Yerel öznitelik
      Faction         : String;                     // Yerel öznitelik
      Falign          : String;                     // Yerel öznitelik
      Fallow          : String;                     // Yerel öznitelik
      Falt            : String;                     // Yerel öznitelik
      Fasync          : String;                     // Yerel öznitelik
      Fautocomplete   : String;                     // Yerel öznitelik
      Fautofocus      : String;                     // Yerel öznitelik
      Fautoplay       : String;                     // Yerel öznitelik
      Fbackground     : String;                     // Yerel öznitelik
      Fbgcolor        : String;                     // Yerel öznitelik
      Fborder         : String;                     // Yerel öznitelik
      Fbuffered       : String;                     // Yerel öznitelik
      Fchallenge      : String;                     // Yerel öznitelik
      Fcharset        : String;                     // Yerel öznitelik
      Fchecked        : String;                     // Yerel öznitelik
      Fcite           : String;                     // Yerel öznitelik
      Fcode           : String;                     // Yerel öznitelik
      Fcodebase       : String;                     // Yerel öznitelik
      Fcolor          : String;                     // Yerel öznitelik
      Fcols           : String;                     // Yerel öznitelik
      Fcolspan        : String;                     // Yerel öznitelik
      Fcontent        : String;                     // Yerel öznitelik
      Fcontrols       : String;                     // Yerel öznitelik
      Fcoords         : String;                     // Yerel öznitelik
      Fcrossorigin    : String;                     // Yerel öznitelik
      Fcsp            : String;                     // Yerel öznitelik
      Fdatetime       : String;                     // Yerel öznitelik
      Fdecoding       : String;                     // Yerel öznitelik
      Fdefault        : String;                     // Yerel öznitelik
      Fdefer          : String;                     // Yerel öznitelik
      Fdirname        : String;                     // Yerel öznitelik
      Fdisabled       : String;                     // Yerel öznitelik
      Fdownload       : String;                     // Yerel öznitelik
      Fenctype        : String;                     // Yerel öznitelik
      Fenterkeyhint   : String;                     // Yerel öznitelik
      Ffor_           : String;                     // Yerel öznitelik
      Fform           : String;                     // Yerel öznitelik
      Fformaction     : String;                     // Yerel öznitelik
      Fformnovalidate : String;                     // Yerel öznitelik
      Fheaders        : String;                     // Yerel öznitelik
      Fheight         : String;                     // Yerel öznitelik
      Fhigh           : String;                     // Yerel öznitelik
      Fhref           : String;                     // Yerel öznitelik
      Fhreflang       : String;                     // Yerel öznitelik
      Fhttp_equiv     : String;                     // Yerel öznitelik
      Ficon           : String;                     // Yerel öznitelik
      Fimportance     : String;                     // Yerel öznitelik
      Fintegrity      : String;                     // Yerel öznitelik
      Fintrinsicsize  : String;                     // Yerel öznitelik
      Finputmode      : String;                     // Yerel öznitelik
      Fismap          : String;                     // Yerel öznitelik
      Fkeytype        : String;                     // Yerel öznitelik
      Fkind           : String;                     // Yerel öznitelik
      Flabel_         : String;                     // Yerel öznitelik
      Flanguage       : String;                     // Yerel öznitelik
      Floading        : String;                     // Yerel öznitelik
      Flist           : String;                     // Yerel öznitelik
      Floop           : String;                     // Yerel öznitelik
      Flow            : String;                     // Yerel öznitelik
      Fmanifest       : String;                     // Yerel öznitelik
      Fmax            : String;                     // Yerel öznitelik
      Fmaxlength      : String;                     // Yerel öznitelik
      Fminlength      : String;                     // Yerel öznitelik
      Fmedia          : String;                     // Yerel öznitelik
      Fmethod         : String;                     // Yerel öznitelik
      Fmin            : String;                     // Yerel öznitelik
      Fmultiple       : String;                     // Yerel öznitelik
      Fmuted          : String;                     // Yerel öznitelik
      Fname           : String;                     // Yerel öznitelik
      Fnovalidate     : String;                     // Yerel öznitelik
      Fopen           : String;                     // Yerel öznitelik
      Foptimum        : String;                     // Yerel öznitelik
      Fpattern        : String;                     // Yerel öznitelik
      Fping           : String;                     // Yerel öznitelik
      Fplaceholder    : String;                     // Yerel öznitelik
      Fposter         : String;                     // Yerel öznitelik
      Fpreload        : String;                     // Yerel öznitelik
      Fradiogroup     : String;                     // Yerel öznitelik
      Freadonly       : String;                     // Yerel öznitelik
      Freferrerpolicy : String;                     // Yerel öznitelik
      Frel            : String;                     // Yerel öznitelik
      Frequired       : String;                     // Yerel öznitelik
      Freversed       : String;                     // Yerel öznitelik
      Frows           : String;                     // Yerel öznitelik
      Frowspan        : String;                     // Yerel öznitelik
      Fsandbox        : String;                     // Yerel öznitelik
      Fscope          : String;                     // Yerel öznitelik
      Fscoped         : String;                     // Yerel öznitelik
      Fselected       : String;                     // Yerel öznitelik
      Fshape          : String;                     // Yerel öznitelik
      Fsize           : String;                     // Yerel öznitelik
      Fsizes          : String;                     // Yerel öznitelik
      Fspan           : String;                     // Yerel öznitelik
      Fsrc            : String;                     // Yerel öznitelik
      Fsrcdoc         : String;                     // Yerel öznitelik
      Fsrclang        : String;                     // Yerel öznitelik
      Fsrcset         : String;                     // Yerel öznitelik
      Fstart          : String;                     // Yerel öznitelik
      Fstep           : String;                     // Yerel öznitelik
      Fsummary        : String;                     // Yerel öznitelik
      Ftarget         : String;                     // Yerel öznitelik
      Ftype_          : String;                     // Yerel öznitelik
      Fusemap         : String;                     // Yerel öznitelik
      Fvalue          : String;                     // Yerel öznitelik
      Fwidth          : String;                     // Yerel öznitelik
      Fwrap           : String;                     // Yerel öznitelik
      {$endregion}
      {$region 'Events'}
      {$region 'window events'}
      Fonafterprint             : String;
      Fonbeforeprint            : String;
      Fonbeforeunload           : String;
      Fonerror_                 : String;
      Fonhashchange             : String;
      Fonload                   : String;
      Fonmessage                : String;
      Fonoffline                : String;
      Fononline                 : String;
      Fonpagehide               : String;
      Fonpageshow               : String;
      Fonpopstate               : String;
      Fonresize                 : String;
      Fonstorage                : String;
      Fonunload                 : String;
      {$endregion}
      {$region 'form events'}
      Fonblur                   : String;
      Fonchange                 : String;
      Foncontextmenu            : String;
      Fonfocus                  : String;
      Foninput                  : String;
      Foninvalid                : String;
      Fonreset                  : String;
      Fonsearch                 : String;
      Fonselect                 : String;
      Fonsubmit                 : String;
      {$endregion}
      {$region 'keyboard events'}
      Fonkeydown                : String;
      Fonkeypress               : String;
      Fonkeyup                  : String;
      {$endregion}
      {$region 'mouse events'}
      Fonclick                  : String;
      Fondblclick               : String;
      Fonmousedown              : String;
      Fonmousemove              : String;
      Fonmouseout               : String;
      Fonmouseover              : String;
      Fonmouseup                : String;
      Fonmousewheel             : String;
      Fonwheel                  : String;
      {$endregion}
      {$region 'drag events'}
      Fondrag                   : String;
      Fondragend                : String;
      Fondragenter              : String;
      Fondragleave              : String;
      Fondragover               : String;
      Fondragstart              : String;
      Fondrop                   : String;
      Fonscroll                 : String;
      {$endregion}
      {$region 'clipboard events'}
      Foncopy                   : String;
      Foncut                    : String;
      Fonpaste                  : String;
      {$endregion}
      {$region 'media events'}
      Fonabort                  : String;
      Foncanplay                : String;
      Foncanplaythrough         : String;
      Foncuechange              : String;
      Fondurationchange         : String;
      Fonemptied                : String;
      Fonended                  : String;
      Fonerror                  : String;
      Fonloadeddata             : String;
      Fonloadedmetadata         : String;
      Fonloadstart              : String;
      Fonpause                  : String;
      Fonplay                   : String;
      Fonplaying                : String;
      Fonprogress               : String;
      Fonratechange             : String;
      Fonseeked                 : String;
      Fonseeking                : String;
      Fonstalled                : String;
      Fonsuspend                : String;
      Fontimeupdate             : String;
      Fonvolumechange           : String;
      Fonwaiting                : String;
      {$endregion}
      {$region 'misc events'}
      Fontoggle                 : String;
      {$endregion}
      {$endregion}
    protected
      function ValidateAttribute   ( SupportedTags: THTMLItems): Boolean;
      function iif(aSorgu: Boolean; aTrue, aFalse: String): String;
      function iin(aItem: String; aItemList: THTMLItems): Boolean;
      function Merge(aTag, aContent: String): String;
      procedure Clear;
    public
      property Items: TObjectList<THTMLTag> read FItems;
      function Item(const aIndex: Integer): THTMLTag;
      constructor Create;
      destructor Destroy; override;
      /// <summary>
      ///   'TagName' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function TagName              ( const Value: String): THTMLTag;
      /// <summary>
      ///   'Context' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function Context              ( const Value: String): THTMLTag; overload;
      /// <summary>
      ///   'Context' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function Context              ( const Value: THTMLTag): THTMLTag; overload;
      function ToString             : String;
      {$region 'Attribute Tool'}
      {$endregion}
      {$region 'Attributes'}
      /// <summary>
      ///   'accesskey' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function accesskey        ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'autocapitalize' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function autocapitalize   ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'class_' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function class_           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'contenteditable' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function contenteditable  ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'contextmenu' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function contextmenu      ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'data' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function data             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'dir' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function dir              ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'draggable' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function draggable        ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'dropzone' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function dropzone         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'hidden' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function hidden           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'id' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function id               ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'itemprop' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function itemprop         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'lang' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function lang             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'slot' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function slot             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'spellcheck' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function spellcheck       ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'style' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function style            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'tabindex' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function tabindex         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'title' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function title            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'translate' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function translate        ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'accept' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function accept           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'accept_charset' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function accept_charset   ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'action' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function action           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'align' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function align            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'allow' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function allow            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'alt' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function alt              ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'async' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function async            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'autocomplete' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function autocomplete     ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'autofocus' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function autofocus        ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'autoplay' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function autoplay         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'background' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function background       ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'bgcolor' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function bgcolor          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'border' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function border           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'buffered' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function buffered         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'challenge' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function challenge        ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'charset' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function charset          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'checked' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function checked          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'cite' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function cite             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'code' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function code             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'codebase' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function codebase         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'color' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function color            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'cols' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function cols             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'colspan' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function colspan          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'content' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function content          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'controls' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function controls         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'coords' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function coords           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'crossorigin' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function crossorigin      ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'csp' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function csp              ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'datetime' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function datetime         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'decoding' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function decoding         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'default' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function default          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'defer' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function defer            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'dirname' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function dirname          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'disabled' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function disabled         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'download' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function download         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'enctype' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function enctype          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'enterkeyhint' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function enterkeyhint     ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'for_' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function for_             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'form' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function form             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'formaction' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function formaction       ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'formnovalidate' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function formnovalidate   ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'headers' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function headers          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'height' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function height           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'high' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function high             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'href' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function href             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'hreflang' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function hreflang         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'http_equiv' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function http_equiv       ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'icon' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function icon             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'importance' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function importance       ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'integrity' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function integrity        ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'intrinsicsize' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function intrinsicsize    ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'inputmode' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function inputmode        ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'ismap' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ismap            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'keytype' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function keytype          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'kind' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function kind             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'label_' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function label_           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'language' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function language         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'loading' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function loading          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'list' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function list             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'loop' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function loop             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'low' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function low              ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'manifest' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function manifest         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'max' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function max              ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'maxlength' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function maxlength        ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'minlength' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function minlength        ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'media' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function media            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'method' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function method           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'min' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function min              ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'multiple' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function multiple         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'muted' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function muted            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'name' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function name             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'novalidate' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function novalidate       ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'open' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function open             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'optimum' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function optimum          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'pattern' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function pattern          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'ping' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ping             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'placeholder' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function placeholder      ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'poster' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function poster           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'preload' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function preload          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'radiogroup' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function radiogroup       ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'readonly' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function readonly         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'referrerpolicy' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function referrerpolicy   ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'rel' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function rel              ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'required' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function required         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'reversed' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function reversed         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'rows' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function rows             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'rowspan' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function rowspan          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'sandbox' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function sandbox          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'scope' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function scope            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'scoped' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function scoped           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'selected' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function selected         ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'shape' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function shape            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'size' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function size             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'sizes' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function sizes            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'span' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function span             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'src' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function src              ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'srcdoc' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function srcdoc           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'srclang' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function srclang          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'srcset' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function srcset           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'start' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function start            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'step' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function step             ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'summary' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function summary          ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'target' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function target           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'type_' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function type_            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'usemap' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function usemap           ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'value' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function value            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'width' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function width            ( const aValue: String): THTMLTag;
      /// <summary>
      ///   'wrap' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function wrap             ( const aValue: String): THTMLTag;
      {$endregion}
      {$region 'events'}
      {$region 'window events'}
      /// <summary>
      ///   'onafterprint' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onafterprint        ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onbeforeprint' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onbeforeprint       ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onbeforeunload' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onbeforeunload      ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onerror' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onerror             ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onhashchange' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onhashchange        ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onload' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onload              ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onmessage' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onmessage           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onoffline' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onoffline           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'ononline' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ononline            ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onpagehide' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onpagehide          ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onpageshow' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onpageshow          ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onpopstate' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onpopstate          ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onresize' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onresize            ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onstorage' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onstorage           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onunload' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onunload            ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'form events'}
      /// <summary>
      ///   'onblur' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onblur              ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onchange' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onchange            ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'oncontextmenu' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function oncontextmenu       ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onfocus' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onfocus             ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'oninput' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function oninput             ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'oninvalid' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function oninvalid           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onreset' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onreset             ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onsearch' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onsearch            ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onselect' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onselect            ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onsubmit' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onsubmit            ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'keyboard events'}
      /// <summary>
      ///   'onkeydown' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onkeydown           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onkeypress' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onkeypress          ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onkeyup' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onkeyup             ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'mouse events'}
      /// <summary>
      ///   'onclick' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onclick             ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'ondblclick' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ondblclick          ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onmousedown' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onmousedown         ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onmousemove' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onmousemove         ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onmouseout' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onmouseout          ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onmouseover' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onmouseover         ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onmouseup' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onmouseup           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onmousewheel' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onmousewheel        ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onwheel' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onwheel             ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'drag events'}
      /// <summary>
      ///   'ondrag' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ondrag              ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'ondragend' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ondragend           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'ondragenter' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ondragenter         ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'ondragleave' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ondragleave         ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'ondragover' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ondragover          ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'ondragstart' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ondragstart         ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'ondrop' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ondrop              ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onscroll' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onscroll            ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'clipboard events'}
      /// <summary>
      ///   'oncopy' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function oncopy              ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'oncut' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function oncut               ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onpaste' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onpaste             ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'media events'}
      /// <summary>
      ///   'onabort' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onabort             ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'oncanplay' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function oncanplay           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'oncanplaythrough' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function oncanplaythrough    ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'oncuechange' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function oncuechange         ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'ondurationchange' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ondurationchange    ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onemptied' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onemptied           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onended' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onended             ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onerror_' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onerror_            ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onloadeddata' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onloadeddata        ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onloadedmetadata' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onloadedmetadata    ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onloadstart' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onloadstart         ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onpause' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onpause             ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onplay' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onplay              ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onplaying' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onplaying           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onprogress' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onprogress          ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onratechange' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onratechange        ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onseeked' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onseeked            ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onseeking' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onseeking           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onstalled' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onstalled           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onsuspend' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onsuspend           ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'ontimeupdate' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ontimeupdate        ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onvolumechange' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onvolumechange      ( const aScript: String): THTMLTag;
      /// <summary>
      ///   'onwaiting' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function onwaiting           ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'misc events'}
      /// <summary>
      ///   'ontoggle' özelliğini/niteliğini veya olayını atar.
      /// </summary>
      /// <param name="aValue">Atanacak değer/betik</param>
      /// <returns>THTMLTag nesnesinin kendisi (Fluent Chaining)</returns>
      function ontoggle            ( const aScript: String): THTMLTag;
      {$endregion}
      {$endregion}
  end;

  {$region 'Yardımcı işlevler'}
  /// <summary>
  ///   HTML 'iif' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function iif(aResult: Boolean; aTrue, aFalse: String): String; inline; overload;
  /// <summary>
  ///   HTML 'iif' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function iif(aResult: Boolean; aTrue, aFalse: THTMLTag): THTMLTag; inline; overload; deprecated 'Bir değişken olmadan kullanıldığında bellek sızıntısına sebep olur. ÖNERİ : String olan sürümü kullanın...';
  {$endregion}
  {$region 'Ana kök'}
  /// <summary>
  ///   HTML 'doctype' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function doctype        : THTMLTag; overload;
  /// <summary>
  ///   HTML 'doctype' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function doctype        (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'html' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function html           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'html' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function html           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'html' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function html           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'html' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function html           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Belge üst verisi'}
  /// <summary>
  ///   HTML 'base' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function base           : THTMLTag;
  /// <summary>
  ///   HTML 'head' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function head           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'head' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function head           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'head' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function head           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'head' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function head           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'link' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function link           : THTMLTag; overload;
  /// <summary>
  ///   HTML 'meta' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function meta           : THTMLTag;
  /// <summary>
  ///   HTML 'style' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function style          (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'style' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function style          (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'style' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function style          (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'style' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function style          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'title' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function title          (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'title' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function title          (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'title' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function title          (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'title' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function title          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Bölümleme kökü'}
  /// <summary>
  ///   HTML 'body' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function body           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'body' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function body           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'body' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function body           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'body' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function body           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'İçerik bölümleme'}
  /// <summary>
  ///   HTML 'address' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function address        (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'address' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function address        (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'address' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function address        (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'address' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function address        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'article' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function article        (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'article' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function article        (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'article' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function article        (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'article' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function article        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'aside' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function aside          (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'aside' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function aside          (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'aside' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function aside          (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'aside' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function aside          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'footer' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function footer         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'footer' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function footer         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'footer' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function footer         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'footer' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function footer         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'header' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function header         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'header' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function header         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'header' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function header         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'header' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function header         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h1' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h1             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h1' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h1             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h1' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h1             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h1' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h1             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h2' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h2             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h2' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h2             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h2' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h2             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h2' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h2             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h3' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h3             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h3' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h3             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h3' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h3             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h3' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h3             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h4' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h4             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h4' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h4             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h4' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h4             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h4' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h4             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h5' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h5             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h5' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h5             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h5' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h5             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h5' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h5             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h6' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h6             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h6' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h6             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h6' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h6             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'h6' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function h6             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'hgroup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function hgroup         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'hgroup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function hgroup         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'hgroup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function hgroup         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'hgroup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function hgroup         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'main_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function main_          (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'main_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function main_          (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'main_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function main_          (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'main_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function main_          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'nav' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function nav            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'nav' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function nav            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'nav' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function nav            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'nav' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function nav            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'section' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function section        (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'section' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function section        (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'section' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function section        (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'section' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function section        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Metin içeriği'}
  /// <summary>
  ///   HTML 'blockquote' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function blockquote     (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'blockquote' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function blockquote     (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'blockquote' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function blockquote     (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'blockquote' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function blockquote     (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dd' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dd             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dd' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dd             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dd' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dd             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dd' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dd             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dir' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dir            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dir' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dir            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dir' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dir            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dir' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dir            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'div_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function div_           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'div_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function div_           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'div_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function div_           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'div_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function div_           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dl' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dl             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dl' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dl             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dl' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dl             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dl' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dl             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dt' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dt             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dt' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dt             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dt' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dt             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dt' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dt             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'figcaption' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function figcaption     (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'figcaption' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function figcaption     (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'figcaption' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function figcaption     (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'figcaption' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function figcaption     (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'figure' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function figure         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'figure' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function figure         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'figure' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function figure         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'figure' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function figure         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'hr' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function hr             : THTMLTag;
  /// <summary>
  ///   HTML 'li' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function li             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'li' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function li             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'li' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function li             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'li' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function li             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ol' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ol             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ol' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ol             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ol' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ol             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ol' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ol             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'p_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function p_             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'p_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function p_             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'p_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function p_             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'p_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function p_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'pre' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function pre            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'pre' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function pre            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'pre' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function pre            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'pre' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function pre            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ul' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ul             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ul' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ul             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ul' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ul             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ul' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ul             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Satır içi metin anlambilimi'}
  /// <summary>
  ///   HTML 'a_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function a_             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'a_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function a_             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'a_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function a_             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'a_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function a_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'abbr' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function abbr           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'abbr' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function abbr           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'abbr' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function abbr           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'abbr' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function abbr           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'b_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function b_             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'b_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function b_             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'b_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function b_             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'b_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function b_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'bdi' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function bdi            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'bdi' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function bdi            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'bdi' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function bdi            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'bdi' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function bdi            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'bdo' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function bdo            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'bdo' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function bdo            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'bdo' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function bdo            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'bdo' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function bdo            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'br' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function br             : THTMLTag;
  /// <summary>
  ///   HTML 'cite' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function cite           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'cite' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function cite           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'cite' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function cite           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'cite' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function cite           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'code' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function code           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'code' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function code           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'code' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function code           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'code' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function code           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'data' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function data           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'data' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function data           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'data' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function data           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'data' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function data           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dfn' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dfn            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dfn' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dfn            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dfn' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dfn            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dfn' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dfn            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'em' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function em             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'em' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function em             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'em' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function em             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'em' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function em             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'i_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function i_             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'i_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function i_             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'i_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function i_             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'i_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function i_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'kbd' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function kbd            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'kbd' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function kbd            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'kbd' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function kbd            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'kbd' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function kbd            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'mark' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function mark           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'mark' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function mark           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'mark' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function mark           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'mark' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function mark           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'q_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function q_             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'q_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function q_             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'q_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function q_             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'q_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function q_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rb' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rb             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rb' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rb             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rb' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rb             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rb' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rb             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rp' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rp             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rp' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rp             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rp' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rp             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rp' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rp             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rt' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rt             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rt' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rt             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rt' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rt             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rt' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rt             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rtc' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rtc            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rtc' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rtc            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rtc' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rtc            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'rtc' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function rtc            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ruby' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ruby           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ruby' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ruby           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ruby' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ruby           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ruby' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ruby           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 's_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function s_             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 's_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function s_             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 's_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function s_             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 's_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function s_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'samp' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function samp           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'samp' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function samp           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'samp' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function samp           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'samp' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function samp           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'small' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function small          (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'small' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function small          (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'small' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function small          (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'small' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function small          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'span' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function span           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'span' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function span           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'span' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function span           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'span' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function span           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'strong' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function strong         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'strong' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function strong         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'strong' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function strong         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'strong' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function strong         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'sub' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function sub            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'sub' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function sub            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'sub' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function sub            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'sub' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function sub            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'sup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function sup            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'sup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function sup            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'sup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function sup            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'sup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function sup            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'time' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function time           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'time' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function time           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'time' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function time           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'time' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function time           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tt' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tt             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tt' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tt             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tt' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tt             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tt' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tt             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'u_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function u_             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'u_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function u_             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'u_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function u_             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'u_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function u_             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'var_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function var_           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'var_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function var_           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'var_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function var_           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'var_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function var_           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'wbr' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function wbr            : THTMLTag;
  {$endregion}
  {$region 'Görüntü ve çokluortam'}
  /// <summary>
  ///   HTML 'area' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function area           : THTMLTag;
  /// <summary>
  ///   HTML 'audio' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function audio          (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'audio' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function audio          (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'audio' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function audio          (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'audio' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function audio          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'img' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function img            : THTMLTag; overload;
  /// <summary>
  ///   HTML 'map' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function map            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'map' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function map            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'map' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function map            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'map' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function map            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'track' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function track          : THTMLTag;
  /// <summary>
  ///   HTML 'video' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function video          (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'video' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function video          (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'video' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function video          (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'video' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function video          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Gömülü içerik'}
  /// <summary>
  ///   HTML 'applet' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function applet         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'applet' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function applet         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'applet' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function applet         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'applet' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function applet         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'embed' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function embed          : THTMLTag;
  /// <summary>
  ///   HTML 'iframe' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function iframe         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'iframe' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function iframe         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'iframe' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function iframe         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'iframe' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function iframe         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'noembed' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function noembed        (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'noembed' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function noembed        (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'noembed' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function noembed        (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'noembed' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function noembed        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'object_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function object_        (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'object_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function object_        (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'object_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function object_        (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'object_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function object_        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'param' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function param          : THTMLTag;
  /// <summary>
  ///   HTML 'picture' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function picture        (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'picture' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function picture        (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'picture' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function picture        (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'picture' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function picture        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'source' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function source         : THTMLTag;
  {$endregion}
  {$region 'Betikleme'}
  /// <summary>
  ///   HTML 'canvas' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function canvas         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'canvas' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function canvas         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'canvas' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function canvas         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'canvas' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function canvas         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'noscript' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function noscript       (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'noscript' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function noscript       (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'noscript' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function noscript       (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'noscript' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function noscript       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'script' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function script         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'script' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function script         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'script' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function script         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'script' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function script         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Sınırlayıcı düzenlemeler'}
  /// <summary>
  ///   HTML 'del' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function del            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'del' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function del            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'del' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function del            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'del' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function del            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ins' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ins            (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ins' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ins            (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ins' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ins            (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'ins' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function ins            (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Tablo içeriği'}
  /// <summary>
  ///   HTML 'caption' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function caption        (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'caption' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function caption        (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'caption' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function caption        (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'caption' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function caption        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'col' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function col            : THTMLTag;
  /// <summary>
  ///   HTML 'colgroup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function colgroup       (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'colgroup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function colgroup       (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'colgroup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function colgroup       (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'colgroup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function colgroup       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'table' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function table          (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'table' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function table          (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'table' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function table          (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'table' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function table          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tbody' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tbody          (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tbody' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tbody          (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tbody' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tbody          (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tbody' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tbody          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'td' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function td             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'td' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function td             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'td' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function td             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'td' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function td             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tfoot' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tfoot          (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tfoot' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tfoot          (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tfoot' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tfoot          (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tfoot' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tfoot          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'th' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function th             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'th' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function th             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'th' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function th             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'th' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function th             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'thead' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function thead          (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'thead' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function thead          (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'thead' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function thead          (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'thead' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function thead          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tr' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tr             (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tr' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tr             (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tr' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tr             (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'tr' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function tr             (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Formlar'}
  /// <summary>
  ///   HTML 'button' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function button         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'button' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function button         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'button' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function button         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'button' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function button         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'datalist' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function datalist       (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'datalist' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function datalist       (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'datalist' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function datalist       (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'datalist' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function datalist       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'fieldset' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function fieldset       (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'fieldset' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function fieldset       (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'fieldset' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function fieldset       (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'fieldset' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function fieldset       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'form' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function form           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'form' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function form           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'form' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function form           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'form' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function form           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'input' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function input          : THTMLTag;
  /// <summary>
  ///   HTML 'label_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function label_         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'label_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function label_         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'label_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function label_         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'label_' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function label_         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'legend' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function legend         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'legend' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function legend         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'legend' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function legend         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'legend' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function legend         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'meter' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function meter          (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'meter' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function meter          (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'meter' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function meter          (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'meter' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function meter          (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'optgroup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function optgroup       (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'optgroup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function optgroup       (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'optgroup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function optgroup       (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'optgroup' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function optgroup       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'option' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function option         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'option' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function option         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'option' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function option         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'option' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function option         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'output' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function output         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'output' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function output         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'output' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function output         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'output' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function output         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'progress' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function progress       (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'progress' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function progress       (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'progress' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function progress       (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'progress' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function progress       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'select' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function select         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'select' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function select         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'select' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function select         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'select' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function select         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'textarea' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function textarea       (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'textarea' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function textarea       (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'textarea' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function textarea       (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'textarea' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function textarea       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Etkileşimli elemanlar'}
  /// <summary>
  ///   HTML 'details' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function details        (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'details' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function details        (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'details' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function details        (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'details' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function details        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dialog' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dialog         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dialog' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dialog         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dialog' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dialog         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'dialog' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function dialog         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'menu' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function menu           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'menu' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function menu           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'menu' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function menu           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'menu' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function menu           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'menuitem' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function menuitem       (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'menuitem' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function menuitem       (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'menuitem' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function menuitem       (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'menuitem' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function menuitem       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'summary' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function summary        (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'summary' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function summary        (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'summary' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function summary        (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'summary' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function summary        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Web bileşenleri'}
  /// <summary>
  ///   HTML 'content' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function content        (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'content' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function content        (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'content' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function content        (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'content' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function content        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'element' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function element        (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'element' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function element        (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'element' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function element        (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'element' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function element        (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'shadow' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function shadow         (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'shadow' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function shadow         (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'shadow' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function shadow         (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'shadow' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function shadow         (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'slot' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function slot           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'slot' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function slot           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'slot' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function slot           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'slot' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function slot           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'template' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function template       (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'template' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function template       (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'template' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function template       (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML 'template' etiket nesnesi oluşturur.
  /// </summary>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function template       (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}
  {$region 'Pratik Saf HTML5 Kısayol Overloadları'}
  /// <summary>
  ///   HTML 'a' (bağlantı) etiket nesnesi oluşturur.
  /// </summary>
  /// <param name="aHref">Bağlantı adresi (URL)</param>
  /// <param name="aText">Bağlantı metni</param>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function a_               (const aHref, aText: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'img' (görsel) etiket nesnesi oluşturur.
  /// </summary>
  /// <param name="aSrc">Görsel kaynak adresi (URL)</param>
  /// <param name="aAlt">Alternatif metin</param>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function img              (const aSrc, aAlt: String): THTMLTag; overload;
  /// <summary>
  ///   HTML 'link' etiket nesnesi oluşturur.
  /// </summary>
  /// <param name="aHref">Hedef kaynak adresi (URL)</param>
  /// <param name="aRel">İlişki türü (varsayılan: 'stylesheet')</param>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function link             (const aHref: String; const aRel: String = 'stylesheet'): THTMLTag; overload;
  {$endregion}
  {$region 'HTML5.3 arama bileşeni'}
  /// <summary>
  ///   HTML5.3 'search' arama etiket nesnesi oluşturur.
  /// </summary>
  /// <param name="aContent">Etiket içeriği THTMLTag nesnesi</param>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function search           (const aContent: THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML5.3 'search' arama etiket nesnesi oluşturur.
  /// </summary>
  /// <param name="aContent">Etiket içerik metni</param>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function search           (const aContent: String): THTMLTag; overload;
  /// <summary>
  ///   HTML5.3 'search' arama etiket nesnesi oluşturur.
  /// </summary>
  /// <param name="aContent">Etiket alt elemanlar dizisi</param>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function search           (const aContent: array of THTMLTag): THTMLTag; overload;
  /// <summary>
  ///   HTML5.3 'search' arama etiket nesnesi oluşturur.
  /// </summary>
  /// <param name="aContent">Etiket içerik metni</param>
  /// <param name="aContentList">Etiket alt elemanlar dizisi</param>
  /// <returns>Oluşturulan THTMLTag nesnesi</returns>
  function search           (const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
  {$endregion}

implementation

uses
    System.SysUtils     //  format, FreeAndNil
  ;

{ THTMLItems_Helper }

function THTMLItems_Helper.Count: Integer;
begin
  Result := High(Self);
end;

{ THTMLTag }
function THTMLTag.ValidateAttribute(SupportedTags: THTMLItems): Boolean;
var
  Eleman: String;
begin
  Result := False;
  for Eleman in SupportedTags do
    if Eleman = FTagName then Exit(True);
end;

function THTMLTag.iif(aSorgu: Boolean; aTrue, aFalse: String): String;
begin
  if (aSorgu = True) then Result := aTrue else Result := aFalse;
end;

function THTMLTag.iin(aItem: String; aItemList: THTMLItems): Boolean;
var
  S: String;
begin
  if (aItemList.Count < 0) then Exit(False);
  for S in aItemList do if S.Trim = aItem.Trim then Exit(True);
  Result := False;
end;

function THTMLTag.Merge(aTag, aContent: String): String;
begin
  if (aContent.Trim.IsEmpty = False) then begin
      if (aTag.Trim.IsEmpty = False)
      then Result := format('%s="%s" ', [aTag.Trim, aContent.Trim])
      else Result := aContent.Trim + ' ';
  end else begin
      Result := '';
  end;
end;

procedure THTMLTag.Clear;
begin
  FItems.Clear;
  FTagName             := '';  //  <-  Bu böyle mi olmalı ?! emin değilim... denemeler yapılacak...
  FContext          := '';  //  <-  İsim çakışması. Meta.Content ile self.Content çakışıyor... Ben "Content" denildiğinde başlangıç tagı ile bitiş tagı arasındaki bölümü kastediyorum...
  {$REGION 'Attributes'}
  Faccesskey        := '';
  Fautocapitalize   := '';
  Fclass_           := '';
  Fcontenteditable  := '';
  Fcontextmenu      := '';
  Fdata             := '';
  Fdir              := '';
  Fdraggable        := '';
  Fdropzone         := '';
  Fhidden           := '';
  Fid               := '';
  Fitemprop         := '';
  Flang             := '';
  Fslot             := '';
  Fspellcheck       := '';
  Fstyle            := '';
  Ftabindex         := '';
  Ftitle            := '';
  Ftranslate        := '';
  Faccept           := '';
  Faccept_charset   := '';
  Faction           := '';
  Falign            := '';
  Fallow            := '';
  Falt              := '';
  Fasync            := '';
  Fautocomplete     := '';
  Fautofocus        := '';
  Fautoplay         := '';
  Fbackground       := '';
  Fbgcolor          := '';
  Fborder           := '';
  Fbuffered         := '';
  Fchallenge        := '';
  Fcharset          := '';
  Fchecked          := '';
  Fcite             := '';
  Fcode             := '';
  Fcodebase         := '';
  Fcolor            := '';
  Fcols             := '';
  Fcolspan          := '';
  Fcontent          := '';
  Fcontrols         := '';
  Fcoords           := '';
  Fcrossorigin      := '';
  Fcsp              := '';
  Fdatetime         := '';
  Fdecoding         := '';
  Fdefault          := '';
  Fdefer            := '';
  Fdirname          := '';
  Fdisabled         := '';
  Fdownload         := '';
  Fenctype          := '';
  Fenterkeyhint     := '';
  Ffor_             := '';
  Fform             := '';
  Fformaction       := '';
  Fformnovalidate   := '';
  Fheaders          := '';
  Fheight           := '';
  Fhigh             := '';
  Fhref             := '';
  Fhreflang         := '';
  Fhttp_equiv       := '';
  Ficon             := '';
  Fimportance       := '';
  Fintegrity        := '';
  Fintrinsicsize    := '';
  Finputmode        := '';
  Fismap            := '';
  Fkeytype          := '';
  Fkind             := '';
  Flabel_           := '';
  Flanguage         := '';
  Floading          := '';
  Flist             := '';
  Floop             := '';
  Flow              := '';
  Fmanifest         := '';
  Fmax              := '';
  Fmaxlength        := '';
  Fminlength        := '';
  Fmedia            := '';
  Fmethod           := '';
  Fmin              := '';
  Fmultiple         := '';
  Fmuted            := '';
  Fname             := '';
  Fnovalidate       := '';
  Fopen             := '';
  Foptimum          := '';
  Fpattern          := '';
  Fping             := '';
  Fplaceholder      := '';
  Fposter           := '';
  Fpreload          := '';
  Fradiogroup       := '';
  Freadonly         := '';
  Freferrerpolicy   := '';
  Frel              := '';
  Frequired         := '';
  Freversed         := '';
  Frows             := '';
  Frowspan          := '';
  Fsandbox          := '';
  Fscope            := '';
  Fscoped           := '';
  Fselected         := '';
  Fshape            := '';
  Fsize             := '';
  Fsizes            := '';
  Fspan             := '';
  Fsrc              := '';
  Fsrcdoc           := '';
  Fsrclang          := '';
  Fsrcset           := '';
  Fstart            := '';
  Fstep             := '';
  Fsummary          := '';
  Ftarget           := '';
  Ftype_            := '';
  Fusemap           := '';
  Fvalue            := '';
  Fwidth            := '';
  Fwrap             := '';
  {$ENDREGION}
  {$REGION 'Events'}
  Fonafterprint        := '';
  Fonbeforeprint       := '';
  Fonbeforeunload      := '';
  Fonerror_            := '';
  Fonhashchange        := '';
  Fonload              := '';
  Fonmessage           := '';
  Fonoffline           := '';
  Fononline            := '';
  Fonpagehide          := '';
  Fonpageshow          := '';
  Fonpopstate          := '';
  Fonresize            := '';
  Fonstorage           := '';
  Fonunload            := '';
  Fonblur              := '';
  Fonchange            := '';
  Foncontextmenu       := '';
  Fonfocus             := '';
  Foninput             := '';
  Foninvalid           := '';
  Fonreset             := '';
  Fonsearch            := '';
  Fonselect            := '';
  Fonsubmit            := '';
  Fonkeydown           := '';
  Fonkeypress          := '';
  Fonkeyup             := '';
  Fonclick             := '';
  Fondblclick          := '';
  Fonmousedown         := '';
  Fonmousemove         := '';
  Fonmouseout          := '';
  Fonmouseover         := '';
  Fonmouseup           := '';
  Fonmousewheel        := '';
  Fonwheel             := '';
  Fondrag              := '';
  Fondragend           := '';
  Fondragenter         := '';
  Fondragleave         := '';
  Fondragover          := '';
  Fondragstart         := '';
  Fondrop              := '';
  Fonscroll            := '';
  Foncopy              := '';
  Foncut               := '';
  Fonpaste             := '';
  Fonabort             := '';
  Foncanplay           := '';
  Foncanplaythrough    := '';
  Foncuechange         := '';
  Fondurationchange    := '';
  Fonemptied           := '';
  Fonended             := '';
  Fonerror             := '';
  Fonloadeddata        := '';
  Fonloadedmetadata    := '';
  Fonloadstart         := '';
  Fonpause             := '';
  Fonplay              := '';
  Fonplaying           := '';
  Fonprogress          := '';
  Fonratechange        := '';
  Fonseeked            := '';
  Fonseeking           := '';
  Fonstalled           := '';
  Fonsuspend           := '';
  Fontimeupdate        := '';
  Fonvolumechange      := '';
  Fonwaiting           := '';
  Fontoggle            := '';
  {$ENDREGION}
end;

function THTMLTag.Item(const aIndex: Integer): THTMLTag;
begin
  Result := nil;
  if (AIndex in [0..FItems.Count - 1]) then Result := FItems.Items[aIndex];
end;

function THTMLTag.TagName(const Value: String): THTMLTag;
begin
  FTagName := Value;
  Result := Self;
end;

function THTMLTag.Context(const Value: THTMLTag): THTMLTag;
begin
  FContext := Value.ToString;
  Result   := Self;
end;

function THTMLTag.Context(const Value: String): THTMLTag;
begin
  FContext := Value;
  Result   := Self;
end;

function THTMLTag.ToString: String;
var
  aTag: THTMLTag;
begin
  {$REGION 'Tag başlangıcı'}
  Result := '';
  if (FTagName = 'doctype')
  then Result := '<!DOCTYPE html>'#1
  else Result := Result
          + '<' + FTagName + ' '
          {$region 'Attributes'}
          + Merge('accesskey'       , Faccesskey)
          + Merge('autocapitalize'  , Fautocapitalize)
          + Merge('class'           , Fclass_)
          + Merge('contenteditable' , Fcontenteditable)
          + Merge('contextmenu'     , Fcontextmenu)
          + Merge('data'            , Fdata)
          + Merge('dir'             , Fdir)
          + Merge('draggable'       , Fdraggable)
          + Merge('dropzone'        , Fdropzone)
          + Merge('hidden'          , Fhidden)
          + Merge('id'              , Fid)
          + Merge('itemprop'        , Fitemprop)
          + Merge('lang'            , Flang)
          + Merge('slot'            , Fslot)
          + Merge('spellcheck'      , Fspellcheck)
          + Merge('style'           , Fstyle)
          + Merge('tabindex'        , Ftabindex)
          + Merge('title'           , Ftitle)
          + Merge('translate'       , Ftranslate)
          + Merge('accept'          , Faccept)
          + Merge('accept_charset'  , Faccept_charset)
          + Merge('action'          , Faction)
          + Merge('align'           , Falign)
          + Merge('allow'           , Fallow)
          + Merge('alt'             , Falt)
          + Merge('async'           , Fasync)
          + Merge('autocomplete'    , Fautocomplete)
          + Merge('autofocus'       , Fautofocus)
          + Merge('autoplay'        , Fautoplay)
          + Merge('background'      , Fbackground)
          + Merge('bgcolor'         , Fbgcolor)
          + Merge('border'          , Fborder)
          + Merge('buffered'        , Fbuffered)
          + Merge('challenge'       , Fchallenge)
          + Merge('charset'         , Fcharset)
          + Merge('checked'         , Fchecked)
          + Merge('cite'            , Fcite)
          + Merge('code'            , Fcode)
          + Merge('codebase'        , Fcodebase)
          + Merge('color'           , Fcolor)
          + Merge('cols'            , Fcols)
          + Merge('colspan'         , Fcolspan)
          + Merge('content'         , Fcontent)
          + Merge('controls'        , Fcontrols)
          + Merge('coords'          , Fcoords)
          + Merge('crossorigin'     , Fcrossorigin)
          + Merge('csp '            , Fcsp )
          + Merge('datetime'        , Fdatetime)
          + Merge('decoding'        , Fdecoding)
          + Merge('default'         , Fdefault)
          + Merge('defer'           , Fdefer)
          + Merge('dirname'         , Fdirname)
          + Merge('disabled'        , Fdisabled)
          + Merge('download'        , Fdownload)
          + Merge('enctype'         , Fenctype)
          + Merge('enterkeyhint '   , Fenterkeyhint )
          + Merge('for'             , Ffor_)
          + Merge('form'            , Fform)
          + Merge('formaction'      , Fformaction)
          + Merge('formnovalidate'  , Fformnovalidate)
          + Merge('headers'         , Fheaders)
          + Merge('height'          , Fheight)
          + Merge('high'            , Fhigh)
          + Merge('href'            , Fhref)
          + Merge('hreflang'        , Fhreflang)
          + Merge('http_equiv'      , Fhttp_equiv)
          + Merge('icon'            , Ficon)
          + Merge('importance '     , Fimportance )
          + Merge('integrity'       , Fintegrity)
          + Merge('intrinsicsize '  , Fintrinsicsize )
          + Merge('inputmode'       , Finputmode)
          + Merge('ismap'           , Fismap)
          + Merge('keytype'         , Fkeytype)
          + Merge('kind'            , Fkind)
          + Merge('label'           , Flabel_)
          + Merge('language'        , Flanguage)
          + Merge('loading '        , Floading )
          + Merge('list'            , Flist)
          + Merge('loop'            , Floop)
          + Merge('low'             , Flow)
          + Merge('manifest'        , Fmanifest)
          + Merge('max'             , Fmax)
          + Merge('maxlength'       , Fmaxlength)
          + Merge('minlength'       , Fminlength)
          + Merge('media'           , Fmedia)
          + Merge('method'          , Fmethod)
          + Merge('min'             , Fmin)
          + Merge('multiple'        , Fmultiple)
          + Merge('muted'           , Fmuted)
          + Merge('name'            , Fname)
          + Merge('novalidate'      , Fnovalidate)
          + Merge('open'            , Fopen)
          + Merge('optimum'         , Foptimum)
          + Merge('pattern'         , Fpattern)
          + Merge('ping'            , Fping)
          + Merge('placeholder'     , Fplaceholder)
          + Merge('poster'          , Fposter)
          + Merge('preload'         , Fpreload)
          + Merge('radiogroup'      , Fradiogroup)
          + Merge('readonly'        , Freadonly)
          + Merge('referrerpolicy'  , Freferrerpolicy)
          + Merge('rel'             , Frel)
          + Merge('required'        , Frequired)
          + Merge('reversed'        , Freversed)
          + Merge('rows'            , Frows)
          + Merge('rowspan'         , Frowspan)
          + Merge('sandbox'         , Fsandbox)
          + Merge('scope'           , Fscope)
          + Merge('scoped'          , Fscoped)
          + Merge('selected'        , Fselected)
          + Merge('shape'           , Fshape)
          + Merge('size'            , Fsize)
          + Merge('sizes'           , Fsizes)
          + Merge('span'            , Fspan)
          + Merge('src'             , Fsrc)
          + Merge('srcdoc'          , Fsrcdoc)
          + Merge('srclang'         , Fsrclang)
          + Merge('srcset'          , Fsrcset)
          + Merge('start'           , Fstart)
          + Merge('step'            , Fstep)
          + Merge('summary'         , Fsummary)
          + Merge('target'          , Ftarget)
          + Merge('type'            , Ftype_)
          + Merge('usemap'          , Fusemap)
          + Merge('value'           , Fvalue)
          + Merge('width'           , Fwidth)
          + Merge('wrap'            , Fwrap)
          {$endregion}
          {$region 'Events'}
          + Merge('onafterprint'        , Fonafterprint)
          + Merge('onbeforeprint'       , Fonbeforeprint)
          + Merge('onbeforeunload'      , Fonbeforeunload)
          + Merge('onerror_'            , Fonerror_)
          + Merge('onhashchange'        , Fonhashchange)
          + Merge('onload'              , Fonload)
          + Merge('onmessage'           , Fonmessage)
          + Merge('onoffline'           , Fonoffline)
          + Merge('ononline'            , Fononline)
          + Merge('onpagehide'          , Fonpagehide)
          + Merge('onpageshow'          , Fonpageshow)
          + Merge('onpopstate'          , Fonpopstate)
          + Merge('onresize'            , Fonresize)
          + Merge('onstorage'           , Fonstorage)
          + Merge('onunload'            , Fonunload)
          + Merge('onblur'              , Fonblur)
          + Merge('onchange'            , Fonchange)
          + Merge('oncontextmenu'       , Foncontextmenu)
          + Merge('onfocus'             , Fonfocus)
          + Merge('oninput'             , Foninput)
          + Merge('oninvalid'           , Foninvalid)
          + Merge('onreset'             , Fonreset)
          + Merge('onsearch'            , Fonsearch)
          + Merge('onselect'            , Fonselect)
          + Merge('onsubmit'            , Fonsubmit)
          + Merge('onkeydown'           , Fonkeydown)
          + Merge('onkeypress'          , Fonkeypress)
          + Merge('onkeyup'             , Fonkeyup)
          + Merge('onclick'             , Fonclick)
          + Merge('ondblclick'          , Fondblclick)
          + Merge('onmousedown'         , Fonmousedown)
          + Merge('onmousemove'         , Fonmousemove)
          + Merge('onmouseout'          , Fonmouseout)
          + Merge('onmouseover'         , Fonmouseover)
          + Merge('onmouseup'           , Fonmouseup)
          + Merge('onmousewheel'        , Fonmousewheel)
          + Merge('onwheel'             , Fonwheel)
          + Merge('ondrag'              , Fondrag)
          + Merge('ondragend'           , Fondragend)
          + Merge('ondragenter'         , Fondragenter)
          + Merge('ondragleave'         , Fondragleave)
          + Merge('ondragover'          , Fondragover)
          + Merge('ondragstart'         , Fondragstart)
          + Merge('ondrop'              , Fondrop)
          + Merge('onscroll'            , Fonscroll)
          + Merge('oncopy'              , Foncopy)
          + Merge('oncut'               , Foncut)
          + Merge('onpaste'             , Fonpaste)
          + Merge('onabort'             , Fonabort)
          + Merge('oncanplay'           , Foncanplay)
          + Merge('oncanplaythrough'    , Foncanplaythrough)
          + Merge('oncuechange'         , Foncuechange)
          + Merge('ondurationchange'    , Fondurationchange)
          + Merge('onemptied'           , Fonemptied)
          + Merge('onended'             , Fonended)
          + Merge('onerror'             , Fonerror)
          + Merge('onloadeddata'        , Fonloadeddata)
          + Merge('onloadedmetadata'    , Fonloadedmetadata)
          + Merge('onloadstart'         , Fonloadstart)
          + Merge('onpause'             , Fonpause)
          + Merge('onplay'              , Fonplay)
          + Merge('onplaying'           , Fonplaying)
          + Merge('onprogress'          , Fonprogress)
          + Merge('onratechange'        , Fonratechange)
          + Merge('onseeked'            , Fonseeked)
          + Merge('onseeking'           , Fonseeking)
          + Merge('onstalled'           , Fonstalled)
          + Merge('onsuspend'           , Fonsuspend)
          + Merge('ontimeupdate'        , Fontimeupdate)
          + Merge('onvolumechange'      , Fonvolumechange)
          + Merge('onwaiting'           , Fonwaiting)
          + Merge('ontoggle'            , Fontoggle)
          {$endregion}
          ;
  Result := Result.Trim
          + '>'
          ;
  {$endregion}

  if (iin(FTagName, ['doctype', 'area', 'base', 'br', 'col', 'embed', 'hr', 'img', 'input', 'link', 'meta', 'param', 'source', 'track', 'wbr'{, 'command', 'keygen', 'menuitem'}]) = FALSE) then begin
      Result := Result
              + FContext
              ;
      for aTag in FItems do Result := Result + aTag.ToString;
      Result := Result
              + '</' + FTagName + '>'#1
              ;
  end else begin
      Result := Result + #1
  end;
  Result := StringReplace(Result, #1, #13#10, [rfReplaceAll, rfIgnoreCase]);
end;

constructor THTMLTag.Create;
begin
  inherited Create;
  FItems := TObjectList<THTMLTag>.Create;
end;

destructor THTMLTag.Destroy;
begin
  Clear;
  FreeAndNil(FItems);
  inherited Destroy;
end;

{$region 'attributes}
function THTMLTag.accesskey( const aValue: String): THTMLTag;
begin
  Faccesskey := aValue.Trim;
  Result := Self;
end;

function THTMLTag.autocapitalize( const aValue: String): THTMLTag;
begin
  Fautocapitalize := aValue.Trim;
  Result := Self;
end;

function THTMLTag.class_( const aValue: String): THTMLTag;
begin
  Fclass_ := aValue.Trim;
  Result := Self;
end;

function THTMLTag.contenteditable( const aValue: String): THTMLTag;
begin
  Fcontenteditable := aValue.Trim;
  Result := Self;
end;

function THTMLTag.contextmenu( const aValue: String): THTMLTag;
begin
  Fcontextmenu := aValue.Trim;
  Result := Self;
end;

function THTMLTag.data( const aValue: String): THTMLTag;
begin
  Fdata := aValue.Trim;
  Result := Self;
end;

function THTMLTag.dir( const aValue: String): THTMLTag;
begin
  Fdir := aValue.Trim;
  Result := Self;
end;

function THTMLTag.draggable( const aValue: String): THTMLTag;
begin
  Fdraggable := aValue.Trim;
  Result := Self;
end;

function THTMLTag.dropzone( const aValue: String): THTMLTag;
begin
  Fdropzone := aValue.Trim;
  Result := Self;
end;

function THTMLTag.hidden( const aValue: String): THTMLTag;
begin
  Fhidden := aValue.Trim;
  Result := Self;
end;

function THTMLTag.id( const aValue: String): THTMLTag;
begin
  Fid := aValue.Trim;
  Result := Self;
end;

function THTMLTag.itemprop( const aValue: String): THTMLTag;
begin
  Fitemprop := aValue.Trim;
  Result := Self;
end;

function THTMLTag.lang( const aValue: String): THTMLTag;
begin
  Flang := aValue.Trim;
  Result := Self;
end;

function THTMLTag.slot( const aValue: String): THTMLTag;
begin
  Fslot := aValue.Trim;
  Result := Self;
end;

function THTMLTag.spellcheck( const aValue: String): THTMLTag;
begin
  Fspellcheck := aValue.Trim;
  Result := Self;
end;

function THTMLTag.style( const aValue: String): THTMLTag;
begin
  Fstyle := aValue.Trim;
  Result := Self;
end;

function THTMLTag.tabindex( const aValue: String): THTMLTag;
begin
  Ftabindex := aValue.Trim;
  Result := Self;
end;

function THTMLTag.title( const aValue: String): THTMLTag;
begin
  Ftitle := aValue.Trim;
  Result := Self;
end;

function THTMLTag.translate( const aValue: String): THTMLTag;
begin
  Ftranslate := aValue.Trim;
  Result := Self;
end;

function THTMLTag.accept( const aValue: String): THTMLTag;
begin
  Faccept:= '';
  if (ValidateAttribute(['form','input']) = TRUE)
  then Faccept := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `accept` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.accept_charset( const aValue: String): THTMLTag;
begin
  Faccept_charset:= '';
  if (ValidateAttribute(['form']) = TRUE)
  then Faccept_charset := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `accept_charset` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.action( const aValue: String): THTMLTag;
begin
  Faction:= '';
  if (ValidateAttribute(['form']) = TRUE)
  then Faction := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `action` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.align( const aValue: String): THTMLTag;
begin
  Falign:= '';
  if (ValidateAttribute(['applet','caption','col','colgroup','hr','iframe','img','table','tbody','td','tfoot ','th','thead','tr']) = TRUE)
  then Falign := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `align` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.allow( const aValue: String): THTMLTag;
begin
  Fallow:= '';
  if (ValidateAttribute(['iframe']) = TRUE)
  then Fallow := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `allow` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.alt( const aValue: String): THTMLTag;
begin
  Falt:= '';
  if (ValidateAttribute(['applet','area','img','input']) = TRUE)
  then Falt := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `alt` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.async( const aValue: String): THTMLTag;
begin
  Fasync:= '';
  if (ValidateAttribute(['script']) = TRUE)
  then Fasync := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `async` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.autocomplete( const aValue: String): THTMLTag;
begin
  Fautocomplete:= '';
  if (ValidateAttribute(['form','input','textarea']) = TRUE)
  then Fautocomplete := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `autocomplete` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.autofocus( const aValue: String): THTMLTag;
begin
  Fautofocus:= '';
  if (ValidateAttribute(['button','input','keygen','select','textarea']) = TRUE)
  then Fautofocus := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `autofocus` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.autoplay( const aValue: String): THTMLTag;
begin
  Fautoplay:= '';
  if (ValidateAttribute(['audio','video']) = TRUE)
  then Fautoplay := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `autoplay` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.background( const aValue: String): THTMLTag;
begin
  Fbackground:= '';
  if (ValidateAttribute(['body','table','td','th']) = TRUE)
  then Fbackground := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `background` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.bgcolor( const aValue: String): THTMLTag;
begin
  Fbgcolor:= '';
  if (ValidateAttribute(['body','col','colgroup','marquee','table','tbody','tfoot','td','th','tr']) = TRUE)
  then Fbgcolor := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `bgcolor` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.border( const aValue: String): THTMLTag;
begin
  Fborder:= '';
  if (ValidateAttribute(['img','object','table']) = TRUE)
  then Fborder := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `border` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.buffered( const aValue: String): THTMLTag;
begin
  Fbuffered:= '';
  if (ValidateAttribute(['audio','video']) = TRUE)
  then Fbuffered := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `buffered` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.challenge( const aValue: String): THTMLTag;
begin
  Fchallenge:= '';
  if (ValidateAttribute(['keygen']) = TRUE)
  then Fchallenge := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `challenge` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.charset( const aValue: String): THTMLTag;
begin
  Fcharset:= '';
  if (ValidateAttribute(['meta','script']) = TRUE)
  then Fcharset := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `charset` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.checked( const aValue: String): THTMLTag;
begin
  Fchecked:= '';
  if (ValidateAttribute(['command','input']) = TRUE)
  then Fchecked := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `checked` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.cite( const aValue: String): THTMLTag;
begin
  Fcite:= '';
  if (ValidateAttribute(['blockquote','del','ins','q']) = TRUE)
  then Fcite := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `cite` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.code( const aValue: String): THTMLTag;
begin
  Fcode:= '';
  if (ValidateAttribute(['applet']) = TRUE)
  then Fcode := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `code` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.codebase( const aValue: String): THTMLTag;
begin
  Fcodebase:= '';
  if (ValidateAttribute(['applet']) = TRUE)
  then Fcodebase := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `codebase` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.color( const aValue: String): THTMLTag;
begin
  Fcolor:= '';
  if (ValidateAttribute(['basefont','font','hr']) = TRUE)
  then Fcolor := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `color` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.cols( const aValue: String): THTMLTag;
begin
  Fcols:= '';
  if (ValidateAttribute(['textarea']) = TRUE)
  then Fcols := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `cols` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.colspan( const aValue: String): THTMLTag;
begin
  Fcolspan:= '';
  if (ValidateAttribute(['td','th']) = TRUE)
  then Fcolspan := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `colspan` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.content( const aValue: String): THTMLTag;
begin
  Fcontent:= '';
  if (ValidateAttribute(['meta']) = TRUE)
  then Fcontent := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `content` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.controls( const aValue: String): THTMLTag;
begin
  Fcontrols:= '';
  if (ValidateAttribute(['audio','video']) = TRUE)
  then Fcontrols := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `controls` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.coords( const aValue: String): THTMLTag;
begin
  Fcoords:= '';
  if (ValidateAttribute(['area']) = TRUE)
  then Fcoords := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `coords` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.crossorigin( const aValue: String): THTMLTag;
begin
  Fcrossorigin:= '';
  if (ValidateAttribute(['audio','img','link','script','video']) = TRUE)
  then Fcrossorigin := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `crossorigin` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.csp ( const aValue: String): THTMLTag;
begin
  Fcsp := '';
  if (ValidateAttribute(['iframe']) = TRUE)
  then Fcsp  := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `csp ` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.datetime( const aValue: String): THTMLTag;
begin
  Fdatetime:= '';
  if (ValidateAttribute(['del','ins','time']) = TRUE)
  then Fdatetime := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `datetime` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.decoding( const aValue: String): THTMLTag;
begin
  Fdecoding:= '';
  if (ValidateAttribute(['img']) = TRUE)
  then Fdecoding := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `decoding` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.default( const aValue: String): THTMLTag;
begin
  Fdefault:= '';
  if (ValidateAttribute(['track']) = TRUE)
  then Fdefault := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `default` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.defer( const aValue: String): THTMLTag;
begin
  Fdefer:= '';
  if (ValidateAttribute(['script']) = TRUE)
  then Fdefer := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `defer` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.dirname( const aValue: String): THTMLTag;
begin
  Fdirname:= '';
  if (ValidateAttribute(['input','textarea']) = TRUE)
  then Fdirname := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `dirname` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.disabled( const aValue: String): THTMLTag;
begin
  Fdisabled:= '';
  if (ValidateAttribute(['button','command','fieldset','input','keygen','optgroup','option','select','textarea']) = TRUE)
  then Fdisabled := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `disabled` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.download( const aValue: String): THTMLTag;
begin
  Fdownload:= '';
  if (ValidateAttribute(['a','area']) = TRUE)
  then Fdownload := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `download` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.enctype( const aValue: String): THTMLTag;
begin
  Fenctype:= '';
  if (ValidateAttribute(['form']) = TRUE)
  then Fenctype := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `enctype` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.enterkeyhint ( const aValue: String): THTMLTag;
begin
  Fenterkeyhint := '';
  if (ValidateAttribute(['textarea','contenteditable']) = TRUE)
  then Fenterkeyhint  := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `enterkeyhint ` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.for_( const aValue: String): THTMLTag;
begin
  Ffor_:= '';
  if (ValidateAttribute(['label','output']) = TRUE)
  then Ffor_ := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `for_` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.form( const aValue: String): THTMLTag;
begin
  Fform:= '';
  if (ValidateAttribute(['button','fieldset','input','keygen','label','meter','object','output','progress','select','textarea']) = TRUE)
  then Fform := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `form` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.formaction( const aValue: String): THTMLTag;
begin
  Fformaction:= '';
  if (ValidateAttribute(['input','button']) = TRUE)
  then Fformaction := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `formaction` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.formnovalidate( const aValue: String): THTMLTag;
begin
  Fformnovalidate:= '';
  if (ValidateAttribute(['button']) = TRUE)
  then Fformnovalidate := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `formnovalidate` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.headers( const aValue: String): THTMLTag;
begin
  Fheaders:= '';
  if (ValidateAttribute(['td','th']) = TRUE)
  then Fheaders := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `headers` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.height( const aValue: String): THTMLTag;
begin
  Fheight:= '';
  if (ValidateAttribute(['canvas','embed','iframe','img','input','object','video']) = TRUE)
  then Fheight := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `height` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.high( const aValue: String): THTMLTag;
begin
  Fhigh:= '';
  if (ValidateAttribute(['meter']) = TRUE)
  then Fhigh := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `high` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.href( const aValue: String): THTMLTag;
begin
  Fhref:= '';
  if (ValidateAttribute(['a','area','base','link']) = TRUE)
  then Fhref := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `href` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.hreflang( const aValue: String): THTMLTag;
begin
  Fhreflang:= '';
  if (ValidateAttribute(['a','area','link']) = TRUE)
  then Fhreflang := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `hreflang` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.http_equiv( const aValue: String): THTMLTag;
begin
  Fhttp_equiv:= '';
  if (ValidateAttribute(['meta']) = TRUE)
  then Fhttp_equiv := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `http_equiv` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.icon( const aValue: String): THTMLTag;
begin
  Ficon:= '';
  if (ValidateAttribute(['command']) = TRUE)
  then Ficon := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `icon` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.importance ( const aValue: String): THTMLTag;
begin
  Fimportance := '';
  if (ValidateAttribute(['iframe','img','link','script']) = TRUE)
  then Fimportance  := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `importance ` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.integrity( const aValue: String): THTMLTag;
begin
  Fintegrity:= '';
  if (ValidateAttribute(['link','script']) = TRUE)
  then Fintegrity := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `integrity` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.intrinsicsize ( const aValue: String): THTMLTag;
begin
  Fintrinsicsize := '';
  if (ValidateAttribute(['img']) = TRUE)
  then Fintrinsicsize  := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `intrinsicsize ` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.inputmode( const aValue: String): THTMLTag;
begin
  Finputmode:= '';
  if (ValidateAttribute(['textarea','contenteditable']) = TRUE)
  then Finputmode := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `inputmode` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.ismap( const aValue: String): THTMLTag;
begin
  Fismap:= '';
  if (ValidateAttribute(['img']) = TRUE)
  then Fismap := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `ismap` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.keytype( const aValue: String): THTMLTag;
begin
  Fkeytype:= '';
  if (ValidateAttribute(['keygen']) = TRUE)
  then Fkeytype := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `keytype` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.kind( const aValue: String): THTMLTag;
begin
  Fkind:= '';
  if (ValidateAttribute(['track']) = TRUE)
  then Fkind := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `kind` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.label_( const aValue: String): THTMLTag;
begin
  Flabel_:= '';
  if (ValidateAttribute(['track']) = TRUE)
  then Flabel_ := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `label_` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.language( const aValue: String): THTMLTag;
begin
  Flanguage:= '';
  if (ValidateAttribute(['script']) = TRUE)
  then Flanguage := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `language` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.loading ( const aValue: String): THTMLTag;
begin
  Floading := '';
  if (ValidateAttribute(['img','iframe']) = TRUE)
  then Floading  := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `loading ` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.list( const aValue: String): THTMLTag;
begin
  Flist:= '';
  if (ValidateAttribute(['input']) = TRUE)
  then Flist := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `list` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.loop( const aValue: String): THTMLTag;
begin
  Floop:= '';
  if (ValidateAttribute(['audio','bgsound','marquee','video']) = TRUE)
  then Floop := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `loop` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.low( const aValue: String): THTMLTag;
begin
  Flow:= '';
  if (ValidateAttribute(['meter']) = TRUE)
  then Flow := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `low` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.manifest( const aValue: String): THTMLTag;
begin
  Fmanifest:= '';
  if (ValidateAttribute(['html']) = TRUE)
  then Fmanifest := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `manifest` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.max( const aValue: String): THTMLTag;
begin
  Fmax:= '';
  if (ValidateAttribute(['input','meter','progress']) = TRUE)
  then Fmax := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `max` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.maxlength( const aValue: String): THTMLTag;
begin
  Fmaxlength:= '';
  if (ValidateAttribute(['input','textarea']) = TRUE)
  then Fmaxlength := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `maxlength` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.minlength( const aValue: String): THTMLTag;
begin
  Fminlength:= '';
  if (ValidateAttribute(['input','textarea']) = TRUE)
  then Fminlength := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `minlength` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.media( const aValue: String): THTMLTag;
begin
  Fmedia:= '';
  if (ValidateAttribute(['a','area','link','source','style']) = TRUE)
  then Fmedia := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `media` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.method( const aValue: String): THTMLTag;
begin
  Fmethod:= '';
  if (ValidateAttribute(['form']) = TRUE)
  then Fmethod := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `method` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.min( const aValue: String): THTMLTag;
begin
  Fmin:= '';
  if (ValidateAttribute(['input','meter']) = TRUE)
  then Fmin := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `min` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.multiple( const aValue: String): THTMLTag;
begin
  Fmultiple:= '';
  if (ValidateAttribute(['input','select']) = TRUE)
  then Fmultiple := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `multiple` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.muted( const aValue: String): THTMLTag;
begin
  Fmuted:= '';
  if (ValidateAttribute(['audio','video']) = TRUE)
  then Fmuted := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `muted` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.name( const aValue: String): THTMLTag;
begin
  Fname:= '';
  if (ValidateAttribute(['button','form','fieldset','iframe','input','keygen','object','output','select','textarea','map','meta','param']) = TRUE)
  then Fname := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `name` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.novalidate( const aValue: String): THTMLTag;
begin
  Fnovalidate:= '';
  if (ValidateAttribute(['form']) = TRUE)
  then Fnovalidate := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `novalidate` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.open( const aValue: String): THTMLTag;
begin
  Fopen:= '';
  if (ValidateAttribute(['details']) = TRUE)
  then Fopen := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `open` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.optimum( const aValue: String): THTMLTag;
begin
  Foptimum:= '';
  if (ValidateAttribute(['meter']) = TRUE)
  then Foptimum := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `optimum` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.pattern( const aValue: String): THTMLTag;
begin
  Fpattern:= '';
  if (ValidateAttribute(['input']) = TRUE)
  then Fpattern := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `pattern` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.ping( const aValue: String): THTMLTag;
begin
  Fping:= '';
  if (ValidateAttribute(['a','area']) = TRUE)
  then Fping := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `ping` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.placeholder( const aValue: String): THTMLTag;
begin
  Fplaceholder:= '';
  if (ValidateAttribute(['input','textarea']) = TRUE)
  then Fplaceholder := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `placeholder` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.poster( const aValue: String): THTMLTag;
begin
  Fposter:= '';
  if (ValidateAttribute(['video']) = TRUE)
  then Fposter := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `poster` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.preload( const aValue: String): THTMLTag;
begin
  Fpreload:= '';
  if (ValidateAttribute(['audio','video']) = TRUE)
  then Fpreload := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `preload` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.radiogroup( const aValue: String): THTMLTag;
begin
  Fradiogroup:= '';
  if (ValidateAttribute(['command']) = TRUE)
  then Fradiogroup := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `radiogroup` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.readonly( const aValue: String): THTMLTag;
begin
  Freadonly:= '';
  if (ValidateAttribute(['input','textarea']) = TRUE)
  then Freadonly := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `readonly` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.referrerpolicy( const aValue: String): THTMLTag;
begin
  Freferrerpolicy:= '';
  if (ValidateAttribute(['a','area','iframe','img','link','script']) = TRUE)
  then Freferrerpolicy := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `referrerpolicy` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.rel( const aValue: String): THTMLTag;
begin
  Frel:= '';
  if (ValidateAttribute(['a','area','link']) = TRUE)
  then Frel := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `rel` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.required( const aValue: String): THTMLTag;
begin
  Frequired:= '';
  if (ValidateAttribute(['input','select','textarea']) = TRUE)
  then Frequired := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `required` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.reversed( const aValue: String): THTMLTag;
begin
  Freversed:= '';
  if (ValidateAttribute(['ol']) = TRUE)
  then Freversed := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `reversed` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.rows( const aValue: String): THTMLTag;
begin
  Frows:= '';
  if (ValidateAttribute(['textarea']) = TRUE)
  then Frows := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `rows` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.rowspan( const aValue: String): THTMLTag;
begin
  Frowspan:= '';
  if (ValidateAttribute(['td','th']) = TRUE)
  then Frowspan := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `rowspan` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.sandbox( const aValue: String): THTMLTag;
begin
  Fsandbox:= '';
  if (ValidateAttribute(['iframe']) = TRUE)
  then Fsandbox := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `sandbox` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.scope( const aValue: String): THTMLTag;
begin
  Fscope:= '';
  if (ValidateAttribute(['th']) = TRUE)
  then Fscope := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `scope` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.scoped( const aValue: String): THTMLTag;
begin
  Fscoped:= '';
  if (ValidateAttribute(['style']) = TRUE)
  then Fscoped := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `scoped` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.selected( const aValue: String): THTMLTag;
begin
  Fselected:= '';
  if (ValidateAttribute(['option']) = TRUE)
  then Fselected := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `selected` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.shape( const aValue: String): THTMLTag;
begin
  Fshape:= '';
  if (ValidateAttribute(['a','area']) = TRUE)
  then Fshape := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `shape` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.size( const aValue: String): THTMLTag;
begin
  Fsize:= '';
  if (ValidateAttribute(['input','select']) = TRUE)
  then Fsize := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `size` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.sizes( const aValue: String): THTMLTag;
begin
  Fsizes:= '';
  if (ValidateAttribute(['link','img','source']) = TRUE)
  then Fsizes := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `sizes` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.span( const aValue: String): THTMLTag;
begin
  Fspan:= '';
  if (ValidateAttribute(['col','colgroup']) = TRUE)
  then Fspan := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `span` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.src( const aValue: String): THTMLTag;
begin
  Fsrc:= '';
  if (ValidateAttribute(['audio','embed','iframe','img','input','script','source','track','video']) = TRUE)
  then Fsrc := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `src` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.srcdoc( const aValue: String): THTMLTag;
begin
  Fsrcdoc:= '';
  if (ValidateAttribute(['iframe']) = TRUE)
  then Fsrcdoc := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `srcdoc` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.srclang( const aValue: String): THTMLTag;
begin
  Fsrclang:= '';
  if (ValidateAttribute(['track']) = TRUE)
  then Fsrclang := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `srclang` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.srcset( const aValue: String): THTMLTag;
begin
  Fsrcset:= '';
  if (ValidateAttribute(['img','source']) = TRUE)
  then Fsrcset := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `srcset` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.start( const aValue: String): THTMLTag;
begin
  Fstart:= '';
  if (ValidateAttribute(['ol']) = TRUE)
  then Fstart := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `start` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.step( const aValue: String): THTMLTag;
begin
  Fstep:= '';
  if (ValidateAttribute(['input']) = TRUE)
  then Fstep := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `step` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.summary( const aValue: String): THTMLTag;
begin
  Fsummary:= '';
  if (ValidateAttribute(['table']) = TRUE)
  then Fsummary := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `summary` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.target( const aValue: String): THTMLTag;
begin
  Ftarget:= '';
  if (ValidateAttribute(['a','area','base','form']) = TRUE)
  then Ftarget := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `target` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.type_( const aValue: String): THTMLTag;
begin
  Ftype_:= '';
  if (ValidateAttribute(['button','input','command','embed','object','script','source','style','menu']) = TRUE)
  then Ftype_ := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `type_` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.usemap( const aValue: String): THTMLTag;
begin
  Fusemap:= '';
  if (ValidateAttribute(['img','input','object']) = TRUE)
  then Fusemap := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `usemap` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.value( const aValue: String): THTMLTag;
begin
  Fvalue:= '';
  if (ValidateAttribute(['button','data','input','li','meter','option','progress','param']) = TRUE)
  then Fvalue := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `value` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.width( const aValue: String): THTMLTag;
begin
  Fwidth:= '';
  if (ValidateAttribute(['canvas','embed','iframe','img','input','object','video']) = TRUE)
  then Fwidth := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `width` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;

function THTMLTag.wrap( const aValue: String): THTMLTag;
begin
  Fwrap:= '';
  if (ValidateAttribute(['textarea']) = TRUE)
  then Fwrap := aValue.Trim
  else raise Exception.CreateFMT('`%s` tagı, `wrap` özniteliği ile birlikte kullanılamaz.', [FName]);
  Result := Self;
end;
{$endregion}
{$region 'Events'}
{$region 'window events' }
function THTMLTag.onafterprint( const aScript: String): THTMLTag;
Begin
  Fonafterprint := aScript;
  Result := Self;
end;

function THTMLTag.onbeforeprint( const aScript: String): THTMLTag;
Begin
  Fonbeforeprint := aScript;
  Result := Self;
end;

function THTMLTag.onbeforeunload( const aScript: String): THTMLTag;
Begin
  Fonbeforeunload := aScript;
  Result := Self;
end;

function THTMLTag.onerror( const aScript: String): THTMLTag;
Begin
  Fonerror := aScript;
  Result := Self;
end;

function THTMLTag.onhashchange( const aScript: String): THTMLTag;
Begin
  Fonhashchange := aScript;
  Result := Self;
end;

function THTMLTag.onload( const aScript: String): THTMLTag;
Begin
  Fonload := aScript;
  Result := Self;
end;

function THTMLTag.onmessage( const aScript: String): THTMLTag;
Begin
  Fonmessage := aScript;
  Result := Self;
end;

function THTMLTag.onoffline( const aScript: String): THTMLTag;
Begin
  Fonoffline := aScript;
  Result := Self;
end;

function THTMLTag.ononline( const aScript: String): THTMLTag;
Begin
  Fononline := aScript;
  Result := Self;
end;

function THTMLTag.onpagehide( const aScript: String): THTMLTag;
Begin
  Fonpagehide := aScript;
  Result := Self;
end;

function THTMLTag.onpageshow( const aScript: String): THTMLTag;
Begin
  Fonpageshow := aScript;
  Result := Self;
end;

function THTMLTag.onpopstate( const aScript: String): THTMLTag;
Begin
  Fonpopstate := aScript;
  Result := Self;
end;

function THTMLTag.onresize( const aScript: String): THTMLTag;
Begin
  Fonresize := aScript;
  Result := Self;
end;

function THTMLTag.onstorage( const aScript: String): THTMLTag;
Begin
  Fonstorage := aScript;
  Result := Self;
end;

function THTMLTag.onunload( const aScript: String): THTMLTag;
Begin
  Fonunload := aScript;
  Result := Self;
end;
{$endregion}

{$region 'form events' }
function THTMLTag.onblur( const aScript: String): THTMLTag;
Begin
  Fonblur := aScript;
  Result := Self;
end;

function THTMLTag.onchange( const aScript: String): THTMLTag;
Begin
  Fonchange := aScript;
  Result := Self;
end;

function THTMLTag.oncontextmenu( const aScript: String): THTMLTag;
Begin
  Foncontextmenu := aScript;
  Result := Self;
end;

function THTMLTag.onfocus( const aScript: String): THTMLTag;
Begin
  Fonfocus := aScript;
  Result := Self;
end;

function THTMLTag.oninput( const aScript: String): THTMLTag;
Begin
  Foninput := aScript;
  Result := Self;
end;

function THTMLTag.oninvalid( const aScript: String): THTMLTag;
Begin
  Foninvalid := aScript;
  Result := Self;
end;

function THTMLTag.onreset( const aScript: String): THTMLTag;
Begin
  Fonreset := aScript;
  Result := Self;
end;

function THTMLTag.onsearch( const aScript: String): THTMLTag;
Begin
  Fonsearch := aScript;
  Result := Self;
end;

function THTMLTag.onselect( const aScript: String): THTMLTag;
Begin
  Fonselect := aScript;
  Result := Self;
end;

function THTMLTag.onsubmit( const aScript: String): THTMLTag;
Begin
  Fonsubmit := aScript;
  Result := Self;
end;
{$endregion}

{$region 'keyboard events' }
function THTMLTag.onkeydown( const aScript: String): THTMLTag;
Begin
  Fonkeydown := aScript;
  Result := Self;
end;

function THTMLTag.onkeypress( const aScript: String): THTMLTag;
Begin
  Fonkeypress := aScript;
  Result := Self;
end;

function THTMLTag.onkeyup( const aScript: String): THTMLTag;
Begin
  Fonkeyup := aScript;
  Result := Self;
end;
{$endregion}

{$region 'mouse events' }
function THTMLTag.onclick( const aScript: String): THTMLTag;
Begin
  Fonclick := aScript;
  Result := Self;
end;

function THTMLTag.ondblclick( const aScript: String): THTMLTag;
Begin
  Fondblclick := aScript;
  Result := Self;
end;

function THTMLTag.onmousedown( const aScript: String): THTMLTag;
Begin
  Fonmousedown := aScript;
  Result := Self;
end;

function THTMLTag.onmousemove( const aScript: String): THTMLTag;
Begin
  Fonmousemove := aScript;
  Result := Self;
end;

function THTMLTag.onmouseout( const aScript: String): THTMLTag;
Begin
  Fonmouseout := aScript;
  Result := Self;
end;

function THTMLTag.onmouseover( const aScript: String): THTMLTag;
Begin
  Fonmouseover := aScript;
  Result := Self;
end;

function THTMLTag.onmouseup( const aScript: String): THTMLTag;
Begin
  Fonmouseup := aScript;
  Result := Self;
end;

function THTMLTag.onmousewheel( const aScript: String): THTMLTag;
Begin
  Fonmousewheel := aScript;
  Result := Self;
end;

function THTMLTag.onwheel( const aScript: String): THTMLTag;
Begin
  Fonwheel := aScript;
  Result := Self;
end;
{$endregion}

{$region 'drag events' }
function THTMLTag.ondrag( const aScript: String): THTMLTag;
Begin
  Fondrag := aScript;
  Result := Self;
end;

function THTMLTag.ondragend( const aScript: String): THTMLTag;
Begin
  Fondragend := aScript;
  Result := Self;
end;

function THTMLTag.ondragenter( const aScript: String): THTMLTag;
Begin
  Fondragenter := aScript;
  Result := Self;
end;

function THTMLTag.ondragleave( const aScript: String): THTMLTag;
Begin
  Fondragleave := aScript;
  Result := Self;
end;

function THTMLTag.ondragover( const aScript: String): THTMLTag;
Begin
  Fondragover := aScript;
  Result := Self;
end;

function THTMLTag.ondragstart( const aScript: String): THTMLTag;
Begin
  Fondragstart := aScript;
  Result := Self;
end;

function THTMLTag.ondrop( const aScript: String): THTMLTag;
Begin
  Fondrop := aScript;
  Result := Self;
end;

function THTMLTag.onscroll( const aScript: String): THTMLTag;
Begin
  Fonscroll := aScript;
  Result := Self;
end;
{$endregion}

{$region 'clipboard events' }
function THTMLTag.oncopy( const aScript: String): THTMLTag;
Begin
  Foncopy := aScript;
  Result := Self;
end;

function THTMLTag.oncut( const aScript: String): THTMLTag;
Begin
  Foncut := aScript;
  Result := Self;
end;

function THTMLTag.onpaste( const aScript: String): THTMLTag;
Begin
  Fonpaste := aScript;
  Result := Self;
end;
{$endregion}

{$region 'media events' }
function THTMLTag.onabort( const aScript: String): THTMLTag;
Begin
  Fonabort := aScript;
  Result := Self;
end;

function THTMLTag.oncanplay( const aScript: String): THTMLTag;
Begin
  Foncanplay := aScript;
  Result := Self;
end;

function THTMLTag.oncanplaythrough( const aScript: String): THTMLTag;
Begin
  Foncanplaythrough := aScript;
  Result := Self;
end;

function THTMLTag.oncuechange( const aScript: String): THTMLTag;
Begin
  Foncuechange := aScript;
  Result := Self;
end;

function THTMLTag.ondurationchange( const aScript: String): THTMLTag;
Begin
  Fondurationchange := aScript;
  Result := Self;
end;

function THTMLTag.onemptied( const aScript: String): THTMLTag;
Begin
  Fonemptied := aScript;
  Result := Self;
end;

function THTMLTag.onended( const aScript: String): THTMLTag;
Begin
  Fonended := aScript;
  Result := Self;
end;

function THTMLTag.onerror_( const aScript: String): THTMLTag;
Begin
  Fonerror_ := aScript;
  Result := Self;
end;

function THTMLTag.onloadeddata( const aScript: String): THTMLTag;
Begin
  Fonloadeddata := aScript;
  Result := Self;
end;

function THTMLTag.onloadedmetadata( const aScript: String): THTMLTag;
Begin
  Fonloadedmetadata := aScript;
  Result := Self;
end;

function THTMLTag.onloadstart( const aScript: String): THTMLTag;
Begin
  Fonloadstart := aScript;
  Result := Self;
end;

function THTMLTag.onpause( const aScript: String): THTMLTag;
Begin
  Fonpause := aScript;
  Result := Self;
end;

function THTMLTag.onplay( const aScript: String): THTMLTag;
Begin
  Fonplay := aScript;
  Result := Self;
end;

function THTMLTag.onplaying( const aScript: String): THTMLTag;
Begin
  Fonplaying := aScript;
  Result := Self;
end;

function THTMLTag.onprogress( const aScript: String): THTMLTag;
Begin
  Fonprogress := aScript;
  Result := Self;
end;

function THTMLTag.onratechange( const aScript: String): THTMLTag;
Begin
  Fonratechange := aScript;
  Result := Self;
end;

function THTMLTag.onseeked( const aScript: String): THTMLTag;
Begin
  Fonseeked := aScript;
  Result := Self;
end;

function THTMLTag.onseeking( const aScript: String): THTMLTag;
Begin
  Fonseeking := aScript;
  Result := Self;
end;

function THTMLTag.onstalled( const aScript: String): THTMLTag;
Begin
  Fonstalled := aScript;
  Result := Self;
end;

function THTMLTag.onsuspend( const aScript: String): THTMLTag;
Begin
  Fonsuspend := aScript;
  Result := Self;
end;

function THTMLTag.ontimeupdate( const aScript: String): THTMLTag;
Begin
  Fontimeupdate := aScript;
  Result := Self;
end;

function THTMLTag.onvolumechange( const aScript: String): THTMLTag;
Begin
  Fonvolumechange := aScript;
  Result := Self;
end;

function THTMLTag.onwaiting( const aScript: String): THTMLTag;
Begin
  Fonwaiting := aScript;
  Result := Self;
end;
{$endregion}

{$region 'misc events' }
function THTMLTag.ontoggle( const aScript: String): THTMLTag;
Begin
  Fontoggle := aScript;
  Result := Self;
end;
{$endregion}
{$endregion}


{ Global HTML Tag Methods }
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
  Result.TagName('DOCTYPE');
end;

function doctype(const aContent: THTMLTag): THTMLTag;
begin
  Result := THTMLTag.Create;
  Result.TagName('DOCTYPE');
  Result.Items.Add( aContent );
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


{$region 'Pratik Saf HTML5 Kısayol Overloadları'}
function a_(const aHref, aText: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('a');
  Result.href(aHref);
  Result.Context(aText);
end;

function img(const aSrc, aAlt: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('img');
  Result.src(aSrc);
  Result.alt(aAlt);
end;

function link(const aHref: String; const aRel: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('link');
  Result.href(aHref);
  Result.rel(aRel);
end;
{$endregion}

{$region 'HTML5.3 arama bileşeni'}
function search(const aContent: THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('search');
  Result.Items.Add( aContent );
end;

function search(const aContent: String): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('search');
  Result.Context( aContent );
end;

function search(const aContent: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('search');
  Result.Items.AddRange( aContent );
end;

function search(const aContent: String; const aContentList: array of THTMLTag): THTMLTag; overload;
begin
  Result := THTMLTag.Create;
  Result.TagName('search');
  Result.Context( aContent );
  Result.Items.AddRange( aContentList );
end;
{$endregion}

end.
