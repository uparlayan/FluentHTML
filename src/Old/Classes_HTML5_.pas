/// <summary>
///   HTML TAG NESNESİNİN tanımlandığı birimdir.
/// </summary>
/// <remarks>
///   HTML Taglarının yapısını tanımlar. Buna olaylar, öznitelikler ve alt
///   elemanlar da dahildir.
/// </remarks>
/// <seealso cref="Yazar">
///   Uğur PARLAYAN
/// </seealso>
/// <seealso cref="Created By">
///   01.01.2019
/// </seealso>
unit Classes_HTML5_;

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
    Types_HTML5_                //  THTMLAttributes = array of string;
  , System.Generics.Collections //  TObjectList<T>
  ;

type
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
      function TagName              ( const Value: String): THTMLTag;
      function Context              ( const Value: String): THTMLTag; overload;
      function Context              ( const Value: THTMLTag): THTMLTag; overload;
      function ToString             : String;
      {$region 'Attribute Tool'}
      {$endregion}
      {$region 'Attributes'}
      function accesskey        ( const aValue: String): THTMLTag;
      function autocapitalize   ( const aValue: String): THTMLTag;
      function class_           ( const aValue: String): THTMLTag;
      function contenteditable  ( const aValue: String): THTMLTag;
      function contextmenu      ( const aValue: String): THTMLTag;
      function data             ( const aValue: String): THTMLTag;
      function dir              ( const aValue: String): THTMLTag;
      function draggable        ( const aValue: String): THTMLTag;
      function dropzone         ( const aValue: String): THTMLTag;
      function hidden           ( const aValue: String): THTMLTag;
      function id               ( const aValue: String): THTMLTag;
      function itemprop         ( const aValue: String): THTMLTag;
      function lang             ( const aValue: String): THTMLTag;
      function slot             ( const aValue: String): THTMLTag;
      function spellcheck       ( const aValue: String): THTMLTag;
      function style            ( const aValue: String): THTMLTag;
      function tabindex         ( const aValue: String): THTMLTag;
      function title            ( const aValue: String): THTMLTag;
      function translate        ( const aValue: String): THTMLTag;
      function accept           ( const aValue: String): THTMLTag;
      function accept_charset   ( const aValue: String): THTMLTag;
      function action           ( const aValue: String): THTMLTag;
      function align            ( const aValue: String): THTMLTag;
      function allow            ( const aValue: String): THTMLTag;
      function alt              ( const aValue: String): THTMLTag;
      function async            ( const aValue: String): THTMLTag;
      function autocomplete     ( const aValue: String): THTMLTag;
      function autofocus        ( const aValue: String): THTMLTag;
      function autoplay         ( const aValue: String): THTMLTag;
      function background       ( const aValue: String): THTMLTag;
      function bgcolor          ( const aValue: String): THTMLTag;
      function border           ( const aValue: String): THTMLTag;
      function buffered         ( const aValue: String): THTMLTag;
      function challenge        ( const aValue: String): THTMLTag;
      function charset          ( const aValue: String): THTMLTag;
      function checked          ( const aValue: String): THTMLTag;
      function cite             ( const aValue: String): THTMLTag;
      function code             ( const aValue: String): THTMLTag;
      function codebase         ( const aValue: String): THTMLTag;
      function color            ( const aValue: String): THTMLTag;
      function cols             ( const aValue: String): THTMLTag;
      function colspan          ( const aValue: String): THTMLTag;
      function content          ( const aValue: String): THTMLTag;
      function controls         ( const aValue: String): THTMLTag;
      function coords           ( const aValue: String): THTMLTag;
      function crossorigin      ( const aValue: String): THTMLTag;
      function csp              ( const aValue: String): THTMLTag;
      function datetime         ( const aValue: String): THTMLTag;
      function decoding         ( const aValue: String): THTMLTag;
      function default          ( const aValue: String): THTMLTag;
      function defer            ( const aValue: String): THTMLTag;
      function dirname          ( const aValue: String): THTMLTag;
      function disabled         ( const aValue: String): THTMLTag;
      function download         ( const aValue: String): THTMLTag;
      function enctype          ( const aValue: String): THTMLTag;
      function enterkeyhint     ( const aValue: String): THTMLTag;
      function for_             ( const aValue: String): THTMLTag;
      function form             ( const aValue: String): THTMLTag;
      function formaction       ( const aValue: String): THTMLTag;
      function formnovalidate   ( const aValue: String): THTMLTag;
      function headers          ( const aValue: String): THTMLTag;
      function height           ( const aValue: String): THTMLTag;
      function high             ( const aValue: String): THTMLTag;
      function href             ( const aValue: String): THTMLTag;
      function hreflang         ( const aValue: String): THTMLTag;
      function http_equiv       ( const aValue: String): THTMLTag;
      function icon             ( const aValue: String): THTMLTag;
      function importance       ( const aValue: String): THTMLTag;
      function integrity        ( const aValue: String): THTMLTag;
      function intrinsicsize    ( const aValue: String): THTMLTag;
      function inputmode        ( const aValue: String): THTMLTag;
      function ismap            ( const aValue: String): THTMLTag;
      function keytype          ( const aValue: String): THTMLTag;
      function kind             ( const aValue: String): THTMLTag;
      function label_           ( const aValue: String): THTMLTag;
      function language         ( const aValue: String): THTMLTag;
      function loading          ( const aValue: String): THTMLTag;
      function list             ( const aValue: String): THTMLTag;
      function loop             ( const aValue: String): THTMLTag;
      function low              ( const aValue: String): THTMLTag;
      function manifest         ( const aValue: String): THTMLTag;
      function max              ( const aValue: String): THTMLTag;
      function maxlength        ( const aValue: String): THTMLTag;
      function minlength        ( const aValue: String): THTMLTag;
      function media            ( const aValue: String): THTMLTag;
      function method           ( const aValue: String): THTMLTag;
      function min              ( const aValue: String): THTMLTag;
      function multiple         ( const aValue: String): THTMLTag;
      function muted            ( const aValue: String): THTMLTag;
      function name             ( const aValue: String): THTMLTag;
      function novalidate       ( const aValue: String): THTMLTag;
      function open             ( const aValue: String): THTMLTag;
      function optimum          ( const aValue: String): THTMLTag;
      function pattern          ( const aValue: String): THTMLTag;
      function ping             ( const aValue: String): THTMLTag;
      function placeholder      ( const aValue: String): THTMLTag;
      function poster           ( const aValue: String): THTMLTag;
      function preload          ( const aValue: String): THTMLTag;
      function radiogroup       ( const aValue: String): THTMLTag;
      function readonly         ( const aValue: String): THTMLTag;
      function referrerpolicy   ( const aValue: String): THTMLTag;
      function rel              ( const aValue: String): THTMLTag;
      function required         ( const aValue: String): THTMLTag;
      function reversed         ( const aValue: String): THTMLTag;
      function rows             ( const aValue: String): THTMLTag;
      function rowspan          ( const aValue: String): THTMLTag;
      function sandbox          ( const aValue: String): THTMLTag;
      function scope            ( const aValue: String): THTMLTag;
      function scoped           ( const aValue: String): THTMLTag;
      function selected         ( const aValue: String): THTMLTag;
      function shape            ( const aValue: String): THTMLTag;
      function size             ( const aValue: String): THTMLTag;
      function sizes            ( const aValue: String): THTMLTag;
      function span             ( const aValue: String): THTMLTag;
      function src              ( const aValue: String): THTMLTag;
      function srcdoc           ( const aValue: String): THTMLTag;
      function srclang          ( const aValue: String): THTMLTag;
      function srcset           ( const aValue: String): THTMLTag;
      function start            ( const aValue: String): THTMLTag;
      function step             ( const aValue: String): THTMLTag;
      function summary          ( const aValue: String): THTMLTag;
      function target           ( const aValue: String): THTMLTag;
      function type_            ( const aValue: String): THTMLTag;
      function usemap           ( const aValue: String): THTMLTag;
      function value            ( const aValue: String): THTMLTag;
      function width            ( const aValue: String): THTMLTag;
      function wrap             ( const aValue: String): THTMLTag;
      {$endregion}
      {$region 'events'}
      {$region 'window events'}
      function onafterprint        ( const aScript: String): THTMLTag;
      function onbeforeprint       ( const aScript: String): THTMLTag;
      function onbeforeunload      ( const aScript: String): THTMLTag;
      function onerror             ( const aScript: String): THTMLTag;
      function onhashchange        ( const aScript: String): THTMLTag;
      function onload              ( const aScript: String): THTMLTag;
      function onmessage           ( const aScript: String): THTMLTag;
      function onoffline           ( const aScript: String): THTMLTag;
      function ononline            ( const aScript: String): THTMLTag;
      function onpagehide          ( const aScript: String): THTMLTag;
      function onpageshow          ( const aScript: String): THTMLTag;
      function onpopstate          ( const aScript: String): THTMLTag;
      function onresize            ( const aScript: String): THTMLTag;
      function onstorage           ( const aScript: String): THTMLTag;
      function onunload            ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'form events'}
      function onblur              ( const aScript: String): THTMLTag;
      function onchange            ( const aScript: String): THTMLTag;
      function oncontextmenu       ( const aScript: String): THTMLTag;
      function onfocus             ( const aScript: String): THTMLTag;
      function oninput             ( const aScript: String): THTMLTag;
      function oninvalid           ( const aScript: String): THTMLTag;
      function onreset             ( const aScript: String): THTMLTag;
      function onsearch            ( const aScript: String): THTMLTag;
      function onselect            ( const aScript: String): THTMLTag;
      function onsubmit            ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'keyboard events'}
      function onkeydown           ( const aScript: String): THTMLTag;
      function onkeypress          ( const aScript: String): THTMLTag;
      function onkeyup             ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'mouse events'}
      function onclick             ( const aScript: String): THTMLTag;
      function ondblclick          ( const aScript: String): THTMLTag;
      function onmousedown         ( const aScript: String): THTMLTag;
      function onmousemove         ( const aScript: String): THTMLTag;
      function onmouseout          ( const aScript: String): THTMLTag;
      function onmouseover         ( const aScript: String): THTMLTag;
      function onmouseup           ( const aScript: String): THTMLTag;
      function onmousewheel        ( const aScript: String): THTMLTag;
      function onwheel             ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'drag events'}
      function ondrag              ( const aScript: String): THTMLTag;
      function ondragend           ( const aScript: String): THTMLTag;
      function ondragenter         ( const aScript: String): THTMLTag;
      function ondragleave         ( const aScript: String): THTMLTag;
      function ondragover          ( const aScript: String): THTMLTag;
      function ondragstart         ( const aScript: String): THTMLTag;
      function ondrop              ( const aScript: String): THTMLTag;
      function onscroll            ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'clipboard events'}
      function oncopy              ( const aScript: String): THTMLTag;
      function oncut               ( const aScript: String): THTMLTag;
      function onpaste             ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'media events'}
      function onabort             ( const aScript: String): THTMLTag;
      function oncanplay           ( const aScript: String): THTMLTag;
      function oncanplaythrough    ( const aScript: String): THTMLTag;
      function oncuechange         ( const aScript: String): THTMLTag;
      function ondurationchange    ( const aScript: String): THTMLTag;
      function onemptied           ( const aScript: String): THTMLTag;
      function onended             ( const aScript: String): THTMLTag;
      function onerror_            ( const aScript: String): THTMLTag;
      function onloadeddata        ( const aScript: String): THTMLTag;
      function onloadedmetadata    ( const aScript: String): THTMLTag;
      function onloadstart         ( const aScript: String): THTMLTag;
      function onpause             ( const aScript: String): THTMLTag;
      function onplay              ( const aScript: String): THTMLTag;
      function onplaying           ( const aScript: String): THTMLTag;
      function onprogress          ( const aScript: String): THTMLTag;
      function onratechange        ( const aScript: String): THTMLTag;
      function onseeked            ( const aScript: String): THTMLTag;
      function onseeking           ( const aScript: String): THTMLTag;
      function onstalled           ( const aScript: String): THTMLTag;
      function onsuspend           ( const aScript: String): THTMLTag;
      function ontimeupdate        ( const aScript: String): THTMLTag;
      function onvolumechange      ( const aScript: String): THTMLTag;
      function onwaiting           ( const aScript: String): THTMLTag;
      {$endregion}
      {$region 'misc events'}
      function ontoggle            ( const aScript: String): THTMLTag;
      {$endregion}
      {$endregion}
  end;

implementation

uses
    System.SysUtils     //  format
  ;

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

end.
