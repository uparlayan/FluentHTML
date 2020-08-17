unit Ana_;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser,
  FMX.StdCtrls, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    pnl_Toolbar: TPanel;
    bt_Test: TButton;
    WB: TWebBrowser;
    procedure KlikManager(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  HTML_Pages_;

{$R *.fmx}

procedure TForm1.KlikManager(Sender: TObject);
begin
  if (Sender = bt_Test) then begin
      WB.LoadFromStrings(HomePage, '');
  end else
  if (Sender = nil) then begin
  end else
  if (Sender = nil) then begin
  end else
  if (Sender = nil) then begin
  end else
  if (Sender = nil) then begin
  end else
  begin
    { Standart else sonu }
  end;
end;

end.
