unit u4DelphiPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TuFo4DelphiPrincipal = class(TForm)
    mmMenu4Delphi: TMainMenu;
    mmExperimentos: TMenuItem;
    mmLANWAN: TMenuItem;
    mmWIFI: TMenuItem;
    procedure mmWIFIClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFo4DelphiPrincipal: TuFo4DelphiPrincipal;

implementation

uses
  uWiFiTestes;

{$R *.dfm}

procedure TuFo4DelphiPrincipal.mmWIFIClick(Sender: TObject);
begin
  uFoWifiTestes := TuFoWifiTestes.Create(Application);
  try
    uFoWifiTestes.ShowModal;
  finally
    uFoWifiTestes.Free;
  end;
end;

end.
