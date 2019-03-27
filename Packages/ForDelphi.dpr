program ForDelphi;

uses
  Vcl.Forms,
  u4DelphiPrincipal in '..\Codes\u4DelphiPrincipal.pas' {uFo4DelphiPrincipal},
  uWiFiTestes in '..\Codes\uWiFiTestes.pas' {uFoWifiTestes},
  nduCType in '..\Codes\WlanAPI\nduCType.pas',
  nduEapTypes in '..\Codes\WlanAPI\nduEapTypes.pas',
  nduL2cmn in '..\Codes\WlanAPI\nduL2cmn.pas',
  nduNtDDNdis in '..\Codes\WlanAPI\nduNtDDNdis.pas',
  nduWinDot11 in '..\Codes\WlanAPI\nduWinDot11.pas',
  nduWinNT in '..\Codes\WlanAPI\nduWinNT.pas',
  nduWlanAPI in '..\Codes\WlanAPI\nduWlanAPI.pas',
  nduWlanTypes in '..\Codes\WlanAPI\nduWlanTypes.pas',
  uDetectarRedesWifi in '..\Codes\uDetectarRedesWifi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TuFo4DelphiPrincipal, uFo4DelphiPrincipal);
  Application.Run;
end.
