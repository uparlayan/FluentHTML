unit HTML_Pages_;

interface

uses
    FluentHTML
  ;

/// <summary>
///   Modern HTML5 Dashboard ve Vitrin sayfasını üreten fonksiyon.
/// </summary>
function HomePage: string;

implementation

uses
    System.SysUtils
  , Vcl.Dialogs
  ;

function HomePage: string;
var
  aPage: THTMLTag;
  StyleCss: String;
begin
  StyleCss :=
    '  * { box-sizing: border-box; margin: 0; padding: 0; font-family: "Outfit", -apple-system, sans-serif; }' + #13#10 +
    '  body { background-color: #0f172a; color: #f8fafc; line-height: 1.6; padding-bottom: 50px; }' + #13#10 +
    '  header { background: rgba(30, 41, 59, 0.8); backdrop-filter: blur(12px); border-bottom: 1px solid #334155; padding: 1rem 2rem; display: flex; justify-content: space-between; align-items: center; position: sticky; top: 0; z-index: 100; }' + #13#10 +
    '  .logo { font-size: 1.5rem; font-weight: 700; background: linear-gradient(135deg, #38bdf8, #818cf8); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }' + #13#10 +
    '  nav a { color: #94a3b8; text-decoration: none; margin-left: 1.5rem; font-weight: 500; transition: color 0.2s; }' + #13#10 +
    '  nav a:hover { color: #38bdf8; }' + #13#10 +
    '  .container { max-width: 1100px; margin: 2rem auto; padding: 0 1.5rem; }' + #13#10 +
    '  .hero { background: linear-gradient(135deg, #1e1b4b 0%, #312e81 50%, #4338ca 100%); border-radius: 16px; padding: 3rem 2rem; text-align: center; margin-bottom: 2.5rem; box-shadow: 0 10px 25px -5px rgba(67, 56, 202, 0.3); border: 1px solid rgba(129, 140, 248, 0.2); }' + #13#10 +
    '  .hero h1 { font-size: 2.5rem; font-weight: 700; margin-bottom: 1rem; color: #ffffff; }' + #13#10 +
    '  .hero p { font-size: 1.1rem; color: #c7d2fe; max-width: 700px; margin: 0 auto 1.5rem auto; }' + #13#10 +
    '  .search-box { display: flex; justify-content: center; gap: 0.5rem; max-width: 500px; margin: 0 auto; }' + #13#10 +
    '  .search-box input { flex: 1; padding: 0.75rem 1rem; border-radius: 8px; border: 1px solid #4338ca; background: #0f172a; color: #fff; font-size: 1rem; outline: none; }' + #13#10 +
    '  .search-box button { padding: 0.75rem 1.5rem; border-radius: 8px; border: none; background: #6366f1; color: #fff; font-weight: 600; cursor: pointer; transition: background 0.2s; }' + #13#10 +
    '  .search-box button:hover { background: #4f46e5; }' + #13#10 +
    '  .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-bottom: 2.5rem; }' + #13#10 +
    '  .card { background: #1e293b; border: 1px solid #334155; border-radius: 12px; padding: 1.5rem; transition: transform 0.2s, border-color 0.2s; }' + #13#10 +
    '  .card:hover { transform: translateY(-4px); border-color: #6366f1; }' + #13#10 +
    '  .card h3 { color: #38bdf8; margin-bottom: 0.5rem; font-size: 1.25rem; }' + #13#10 +
    '  .card p { color: #94a3b8; font-size: 0.95rem; }' + #13#10 +
    '  .badge { display: inline-block; padding: 0.25rem 0.6rem; border-radius: 9999px; background: rgba(56, 189, 248, 0.1); color: #38bdf8; font-size: 0.75rem; font-weight: 600; margin-bottom: 0.75rem; }' + #13#10 +
    '  .table-section { background: #1e293b; border: 1px solid #334155; border-radius: 12px; padding: 1.5rem; margin-bottom: 2.5rem; overflow-x: auto; }' + #13#10 +
    '  .table-section h2 { color: #f8fafc; margin-bottom: 1rem; font-size: 1.5rem; }' + #13#10 +
    '  table { width: 100%; border-collapse: collapse; text-align: left; }' + #13#10 +
    '  th { background: #0f172a; color: #cbd5e1; padding: 0.75rem 1rem; font-weight: 600; border-bottom: 2px solid #334155; }' + #13#10 +
    '  td { padding: 0.75rem 1rem; border-bottom: 1px solid #334155; color: #94a3b8; }' + #13#10 +
    '  tr:hover td { background: rgba(51, 65, 85, 0.5); color: #f8fafc; }' + #13#10 +
    '  footer { text-align: center; color: #64748b; font-size: 0.9rem; margin-top: 3rem; }';

  aPage := html([
             head([
               meta.charset('UTF-8')
             , meta.name('viewport').content('width=device-width, initial-scale=1.0')
             , title('FluentHTML - Modern HTML5 Vitrin & Gösterim')
             , link('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap')
             , style(StyleCss)
             ])
           , body([
               // Üst Bilgi (Header & Navigation)
               header([
                 div_('FluentHTML').class_('logo')
               , nav([
                   a_('#', 'Ana Sayfa')
                 , a_('#features', 'Özellikler')
                 , a_('#data', 'Veri Tablosu')
                 , a_('#docs', 'Dokümantasyon')
                 ])
               ])

               // Ana Konteyner
             , main_([
                 // Hero Banner
                 section([
                   h1('Delphi ile Akıcı HTML5 Nesne Mimarisi')
                 , p_('FluentHTML, Delphi geliştiricilerine saf HTML5 standartlarında, tip güvenli ve performanslı web içerik üretimi sağlar.')
                 , search([
                     div_([
                       input.type_('search').placeholder('HTML5 etiket veya öznitelik arayın...').id('search_input')
                     , button('Keşfet').type_('button')
                     ]).class_('search-box')
                   ])
                 ]).class_('hero')

                 // Özellik Kartları (Grid)
               , section([
                   article([
                     div_('SAF STANDART').class_('badge')
                   , h3('HTML5 Standart Uyumu')
                   , p_('Hiçbir 3. parti bağımlılık olmadan saf HTML5 etiketlerini ve HTML5.3 <search> bileşenini destekler.')
                   ]).class_('card')

                 , article([
                     div_('PERFORMANS').class_('badge')
                   , h3('Fluent Chaining')
                   , p_('Metod zincirleme (fluent chaining) yapısı ile okunabilir ve esnek kod yazımını mümkün kılar.')
                   ]).class_('card')

                 , article([
                     div_('DELPHI IDE').class_('badge')
                   , h3('IDE & TDataSet Desteği')
                   , p_('Delphi IDE Araç Paleti temsilci bileşeni ve TDataSet HTML tablo dönüştürücü desteği sunar.')
                   ]).class_('card')
                 ]).class_('grid').id('features')

                 // Veri Tablosu Gösterimi
               , section([
                   h2('Örnek HTML5 Veri Tablosu')
                 , table([
                     thead([
                       tr([ th('No'), th('Bileşen / Etiket'), th('Tür'), th('Durum') ])
                     ])
                   , tbody([
                       tr([ td('1'), td('a_(aHref, aText)'), td('Saf Overload'), td('Aktif') ])
                     , tr([ td('2'), td('img(aSrc, aAlt)'), td('Saf Overload'), td('Aktif') ])
                     , tr([ td('3'), td('search(...)'), td('HTML5.3 Tag'), td('Aktif') ])
                     , tr([ td('4'), td('DataSetToHTMLTable'), td('TDataSet Helper'), td('Aktif') ])
                     , tr([ td('5'), td('TFluentHTMLComponent'), td('IDE Component'), td('Aktif') ])
                     ])
                   ])
                 ]).class_('table-section').id('data')
               ]).class_('container')

               // Alt Bilgi (Footer)
             , footer([
                 p_('© 2026 FluentHTML Library - Uğur PARLAYAN | Delphi HTML5 Web Framework Engine')
               ])
             ])
           ]).lang('tr');

  Result := '<!DOCTYPE html>' + #13#10 + aPage.ToString;
  FreeAndNil(aPage);
end;

end.
