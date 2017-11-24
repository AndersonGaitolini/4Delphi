unit uWiFiTestes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TuFoWifiTestes = class(TForm)
    btnDescobrirWifi: TButton;
    edtShow: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFoWifiTestes: TuFoWifiTestes;

implementation

uses
 nduWlanAPI, nduWlanTypes, uDetectarRedesWifi;

{$R *.dfm}

end.
