object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FluentHTML VCL TEdgeBrowser Demo'
  ClientHeight = 720
  ClientWidth = 1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnl_Toolbar: TPanel
    Left = 0
    Top = 0
    Width = 1080
    Height = 41
    Align = alTop
    TabOrder = 0
    object bt_Test: TButton
      Left = 10
      Top = 8
      Width = 160
      Height = 25
      Caption = 'HTML5 G'#246'sterimi Yenile'
      TabOrder = 0
      OnClick = bt_TestClick
    end
  end
  object EdgeWB: TEdgeBrowser
    Left = 0
    Top = 41
    Width = 1080
    Height = 679
    Align = alClient
    TabOrder = 1
    AllowSingleSignOnUsingOSPrimaryAccount = False
  end
end
