/// <summary>
///   TDataSet verilerini HTML5 'table' etiket ağacına dönüştürmek için kullanılan yardımcı birimdir.
/// </summary>
/// <seealso cref="Yazar">
///   Uğur PARLAYAN
/// </seealso>
unit FluentHTML.DataSet;

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
    Data.DB
  , System.SysUtils
  , FluentHTML
  ;

/// <summary>
///   TDataSet (FDQuery, ClientDataSet vb.) verilerini otomatik olarak HTML5 'table' etiket ağacına dönüştürür.
/// </summary>
/// <param name="aDataSet">Veri kaynağı TDataSet nesnesi</param>
/// <param name="aTableClass">Tabloya atanacak CSS sınıfı (opsiyonel)</param>
/// <returns>THTMLTag tablosu</returns>
function DataSetToHTMLTable(const aDataSet: TDataSet; const aTableClass: String = ''): THTMLTag;

implementation

function DataSetToHTMLTable(const aDataSet: TDataSet; const aTableClass: String): THTMLTag;
var
  aTable, aThead, aTbody, aTrRow, aTrHeader: THTMLTag;
  i: Integer;
  Field: TField;
  Bookmark: TBookmark;
begin
  Result := nil;
  if not Assigned(aDataSet) then Exit;

  aTable := table([]);
  if aTableClass <> '' then aTable.class_(aTableClass);

  // 1. Başlıklar (thead -> tr -> th)
  aThead := thead([]);
  aTrHeader := tr([]);
  for i := 0 to aDataSet.FieldCount - 1 do
  begin
    aTrHeader.Items.Add(th(aDataSet.Fields[i].DisplayName));
  end;
  aThead.Items.Add(aTrHeader);
  aTable.Items.Add(aThead);

  // 2. Satırlar (tbody -> tr -> td)
  aTbody := tbody([]);
  if aDataSet.Active then
  begin
    aDataSet.DisableControls;
    Bookmark := aDataSet.GetBookmark;
    try
      aDataSet.First;
      while not aDataSet.Eof do
      begin
        aTrRow := tr([]);
        for i := 0 to aDataSet.FieldCount - 1 do
        begin
          Field := aDataSet.Fields[i];
          aTrRow.Items.Add(td(Field.AsString));
        end;
        aTbody.Items.Add(aTrRow);
        aDataSet.Next;
      end;
    finally
      if aDataSet.BookmarkValid(Bookmark) then
        aDataSet.GotoBookmark(Bookmark);
      aDataSet.FreeBookmark(Bookmark);
      aDataSet.EnableControls;
    end;
  end;
  aTable.Items.Add(aTbody);

  Result := aTable;
end;

end.
