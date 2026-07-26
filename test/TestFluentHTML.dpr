program TestFluentHTML;

{$APPTYPE CONSOLE}

uses
    System.SysUtils
  , System.IOUtils
  , FluentHTML in '..\src\FluentHTML.pas'
  , FluentHTML.DataSet in '..\src\FluentHTML.DataSet.pas'
  , FluentHTML.Component in '..\src\FluentHTML.Component.pas'
  , FluentHTML.Edge in '..\src\FluentHTML.Edge.pas'
  , HTML_Pages_ in '..\Demo\HTML_Pages_.pas'
  ;

procedure AssertTrue(const aCondition: Boolean; const aMessage: String);
begin
  if not aCondition then
  begin
    Writeln('[FAIL] ' + aMessage);
    Halt(1);
  end
  else
  begin
    Writeln('[PASS] ' + aMessage);
  end;
end;

procedure TestVoidTags;
var
  aTag: THTMLTag;
  S: String;
begin
  Writeln('--- 1. Void Tags Test ---');
  
  aTag := img('/logo.png', 'Logo');
  S := aTag.ToString;
  AssertTrue(Pos('<img', S) > 0, 'img tag baslangici dogru');
  AssertTrue(Pos('src="/logo.png"', S) > 0, 'img src attr dogru');
  AssertTrue(Pos('alt="Logo"', S) > 0, 'img alt attr dogru');
  AssertTrue(Pos('</img>', S) = 0, 'img void tag kapanis etiketi barindirmamali');
  FreeAndNil(aTag);

  aTag := br;
  S := aTag.ToString;
  AssertTrue(Pos('<br', S) > 0, 'br tag baslangici dogru');
  AssertTrue(Pos('</br>', S) = 0, 'br void tag kapanis etiketi barindirmamali');
  FreeAndNil(aTag);
end;

procedure TestTreeStructure;
var
  aTable: THTMLTag;
  S: String;
begin
  Writeln('--- 2. Tree Structure Test ---');
  
  aTable := table([
              thead([
                tr([ th('Header 1'), th('Header 2') ])
              ])
            , tbody([
                tr([ td('Val 1'), td('Val 2') ])
              ])
            ]).class_('my-table');
  S := aTable.ToString;
  AssertTrue(Pos('<table class="my-table"', S) > 0, 'table class_ attribute dogru');
  AssertTrue(Pos('<thead>', S) > 0, 'thead tagi mevcut');
  AssertTrue(Pos('<th>Header 1</th>', S) > 0, 'th icerigi dogru');
  AssertTrue(Pos('<td>Val 1</td>', S) > 0, 'td icerigi dogru');
  AssertTrue(Pos('</table>', S) > 0, 'table kapanis etiketi mevcut');
  FreeAndNil(aTable);
end;

procedure TestAttributeValidation;
var
  aTag: THTMLTag;
  ExceptionRaised: Boolean;
begin
  Writeln('--- 3. Attribute Validation Test ---');
  
  aTag := p_('Test Metni');
  ExceptionRaised := False;
  try
    aTag.action('/invalid-action');
  except
    on E: Exception do
    begin
      ExceptionRaised := True;
      Writeln('  -> Yakalanan beklenen istisna: ' + E.Message);
    end;
  end;
  AssertTrue(ExceptionRaised, 'p_ etiketine action eklendiginde istisna firlatilmali');
  FreeAndNil(aTag);
end;

procedure TestPragmaticOverloads;
var
  aTag: THTMLTag;
  S: String;
begin
  Writeln('--- 4. Pragmatic Overloads Test ---');
  
  aTag := a_('https://example.com', 'Example Site');
  S := aTag.ToString;
  AssertTrue(Pos('href="https://example.com"', S) > 0, 'a_ href attr dogru');
  AssertTrue(Pos('>Example Site</a>', S) > 0, 'a_ icerik metni dogru');
  FreeAndNil(aTag);

  aTag := link('/styles.css');
  S := aTag.ToString;
  AssertTrue(Pos('href="/styles.css"', S) > 0, 'link href attr dogru');
  AssertTrue(Pos('rel="stylesheet"', S) > 0, 'link rel default attr dogru');
  FreeAndNil(aTag);

  aTag := script('').src('/app.js');
  S := aTag.ToString;
  AssertTrue(Pos('src="/app.js"', S) > 0, 'script src attr dogru');
  AssertTrue(Pos('</script>', S) > 0, 'script kapanis etiketi mevcut');
  FreeAndNil(aTag);
end;

procedure TestDataSetIntegration;
var
  aTable: THTMLTag;
begin
  Writeln('--- 5. DataSet Integration Test ---');
  aTable := DataSetToHTMLTable(nil);
  AssertTrue(aTable = nil, 'nil DataSet verildiginde nil dondururs');
end;

procedure TestIDEComponent;
var
  Comp: TFluentHTMLComponent;
begin
  Writeln('--- 6. IDE Component Test ---');
  Comp := TFluentHTMLComponent.Create(nil);
  try
    Comp.TableClass := 'table-bordered';
    AssertTrue(Comp.TableClass = 'table-bordered', 'TableClass property dogru');
    AssertTrue(Comp.DataSet = nil, 'Default DataSet nil olmali');
    AssertTrue(Comp.GenerateHTMLTable = '', 'nil DataSet ile GenerateHTMLTable bos string donmeli');
  finally
    FreeAndNil(Comp);
  end;
end;

procedure TestHomePage;
var
  S: String;
  LPath: String;
begin
  Writeln('--- 7. HomePage Output Test ---');
  S := HomePage;
  Writeln('  -> HomePage Toplam Uzunluk: ', Length(S), ' karakter.');
  AssertTrue(Length(S) > 100, 'HomePage metin uzunlugu > 100 olmali');
  AssertTrue(Pos('<!DOCTYPE html>', S) > 0, 'HomePage DOCTYPE barindirmali');
  AssertTrue(Pos('<html', S) > 0, 'HomePage html tagi barindirmali');
  AssertTrue(Pos('FluentHTML', S) > 0, 'HomePage FluentHTML metni barindirmali');

  LPath := TPath.Combine(ExtractFilePath(ParamStr(0)), 'index.html');
  TFile.WriteAllText(LPath, S, TEncoding.UTF8);
  Writeln('  -> index.html diske yazildi: ', LPath, ' (Mevcut: ', FileExists(LPath), ')');
  AssertTrue(FileExists(LPath), 'index.html diske yazilmis olmali');
end;

procedure TestEdgeBrowserHelper;
var
  LFilePath: String;
  LUrl: String;
begin
  Writeln('--- 8. EdgeBrowser Helper & Local File URL Test ---');
  LFilePath := TPath.Combine(ExtractFilePath(ParamStr(0)), 'index.html');
  LUrl := 'file:///' + StringReplace(ExpandFileName(LFilePath), '\', '/', [rfReplaceAll]);
  
  AssertTrue(Pos('file:///', LUrl) = 1, 'Local File URL file:/// protokolü ile baslamali');
  AssertTrue(Pos('index.html', LUrl) > 0, 'Local File URL hedef dosya adini barindirmali');
  AssertTrue(Pos('\', LUrl) = 0, 'Local File URL ters bolu (backslash) barindirmamali');
end;

begin
  try
    Writeln('=== FluentHTML Automated Console Test Suite ===');
    Writeln;
    TestVoidTags;
    Writeln;
    TestTreeStructure;
    Writeln;
    TestAttributeValidation;
    Writeln;
    TestPragmaticOverloads;
    Writeln;
    TestDataSetIntegration;
    Writeln;
    TestIDEComponent;
    Writeln;
    TestHomePage;
    Writeln;
    TestEdgeBrowserHelper;
    Writeln;
    Writeln('=== ALL TESTS PASSED SUCCESSFULLY! ===');
    Readln;
  except
    on E: Exception do
    begin
      Writeln('FATAL ERROR: ', E.ClassName, ': ', E.Message);
      Halt(1);
    end;
  end;
end.
