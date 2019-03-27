unit uWiFiTestes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TuFoWifiTestes = class(TForm)
    btnDescobrirWifi: TButton;
    edtShow: TEdit;
    procedure btnDescobrirWifiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFoWifiTestes: TuFoWifiTestes;

implementation

uses
 nduWlanAPI, nduWlanTypes, uDetectarRedesWifi, u4DelphiPrincipal;

 var

 aDetectarWifi : TDetectarWifi;

{$R *.dfm}

procedure TuFoWifiTestes.btnDescobrirWifiClick(Sender: TObject);
var list : TStringList;
  I : Integer;
begin
  list := aDetectarWifi.fScan;

  for I := 0 to list.Count-1 do
     uFo4DelphiPrincipal.mmo1.Lines.Add(list.Strings[i]);
end;

procedure TuFoWifiTestes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  aDetectarWifi.Free
end;

procedure TuFoWifiTestes.FormCreate(Sender: TObject);
begin
   aDetectarWifi := TDetectarWifi.Create;
end;

end.
