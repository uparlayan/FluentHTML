unit HTML_Pages_;

interface

uses
    Classes_HTML5_
  , Methods_HTML5_
  ;

function HomePage: string;

implementation

uses
    System.SysUtils
  ;

function HomePage: string;
var
  aHTML: THTMLTag;
begin

  aHTML := html([
                  head([ meta.charset('UTF-8')
                       , title('Basit HTML4 Haber Kağıdı')
                       ])
                , body([ h1('HTML4 Simple Newsletter template in Firefox 37 with JAWS 15')
                       , p_('This video is a captioned demonstration of a simple newsletter written in HTML4. It is being displayed in Firefox 37 and accessed using JAWS 15.')
                       , div_(
                               video([ source().src('http://weba11y.com/Examples/HTML5A11y2015/demos/SimpleNewsletter1.mp4').type_('video/mp4')
                                     , source().src('http://weba11y.com/Examples/HTML5A11y2015/demos/SimpleNewsletter1.webm').type_('video/webm')
                                     , source().src('http://weba11y.com/Examples/HTML5A11y2015/demos/SimpleNewsletter1.ogv').type_('video/ogv')
                                     ]).style('height:765px;width:915px;')
                             ).style('margin-left:200px')
                       ])
               ]).lang('en')
               ;
{
weba11y.com/Examples/HTML5A11y2015/demos/
 <body>
 <div style="margin-left:200px">
 <video controls style="height:765px;width:915px;">
  <source src="SimpleNewsletter1.mp4" type="video/mp4">
  <source src="SimpleNewsletter1.webm" type="video/webm">
  <source src="SimpleNewsletter1.ogv" type="video/ogg">
  <track default label="English" kind="subtitles" srclang="en-US" id="englishTrack" src="simpleNewsletterHTML4.vtt">
  Your browser does not support the video element
</video>
</div>
</body>
}
  Result := '<!DOCTYPE HTML>'#13#10 + aHTML.ToString;
  FreeAndNil(aHTML);
end;

end.
