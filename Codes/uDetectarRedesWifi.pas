unit uDetectarRedesWifi;
interface
uses
  Windows,
  System.SysUtils,
  System.Classes,
  nduWlanAPI,  // in 'nduWlanAPI.pas',
  nduWlanTypes; //in 'nduWlanTypes.pas';


//You may require the headers at:
//http://www.delphibasics.info/home/delphibasicsprojects/wifiscanner
  type
  TConexaoWifi = class(TObject)
  private
    FInterfaceName : string;
    FGuide: string;
    FProfile : string;
    FNetworkName : string;
    FSignalQuality: Currency;
    FAuthAlgorithm1 : string;
    FAuthAlgorithm2 : string;

  public
    property InterfaceName  : string;   read FInterfaceName  write FInterfaceName  ;
    property Guide          : string;   read FGuide          write FGuide          ;
    property Profile        : string;   read FProfile        write FProfile        ;
    property NetworkName    : string;   read FNetworkName    write FNetworkName    ;
    property SignalQuality  : Currency; read FSignalQuality  write FSignalQuality  ;
    property AuthAlgorithm1 : string;   read FAuthAlgorithm1 write FAuthAlgorithm1 ;
    property AuthAlgorithm2 : string;   read FAuthAlgorithm2 write FAuthAlgorithm2 ;

    constructor Create; override;
    destructor Destroy; override;
  end;


  type TDetectarWifi = class(TObject)
  private

    function fDOT11_AUTH_ALGORITHM_To_String( Dummy :Tndu_DOT11_AUTH_ALGORITHM):String;
  public
    function fScan: TStringlist;
    constructor Create; override;
    destructor Destroy; override;
  end;


implementation

uses

function fDOT11_AUTH_ALGORITHM_To_String( Dummy :Tndu_DOT11_AUTH_ALGORITHM):String;
begin
    Result:='';
    case Dummy of
        DOT11_AUTH_ALGO_80211_OPEN          : Result:= '80211_OPEN';
        DOT11_AUTH_ALGO_80211_SHARED_KEY    : Result:= '80211_SHARED_KEY';
        DOT11_AUTH_ALGO_WPA                 : Result:= 'WPA';
        DOT11_AUTH_ALGO_WPA_PSK             : Result:= 'WPA_PSK';
        DOT11_AUTH_ALGO_WPA_NONE            : Result:= 'WPA_NONE';
        DOT11_AUTH_ALGO_RSNA                : Result:= 'RSNA';
        DOT11_AUTH_ALGO_RSNA_PSK            : Result:= 'RSNA_PSK';
        DOT11_AUTH_ALGO_IHV_START           : Result:= 'IHV_START';
        DOT11_AUTH_ALGO_IHV_END             : Result:= 'IHV_END';
    end;
end;

function fDOT11_CIPHER_ALGORITHM_To_String( Dummy :Tndu_DOT11_CIPHER_ALGORITHM):String;
begin
    Result:='';
    case Dummy of
    DOT11_CIPHER_ALGO_NONE      : Result:= 'NONE';
    DOT11_CIPHER_ALGO_WEP40     : Result:= 'WEP40';
    DOT11_CIPHER_ALGO_TKIP      : Result:= 'TKIP';
    DOT11_CIPHER_ALGO_CCMP      : Result:= 'CCMP';
    DOT11_CIPHER_ALGO_WEP104    : Result:= 'WEP104';
    DOT11_CIPHER_ALGO_WPA_USE_GROUP : Result:= 'WPA_USE_GROUP OR RSN_USE_GROUP';
    //DOT11_CIPHER_ALGO_RSN_USE_GROUP : Result:= 'RSN_USE_GROUP';
    DOT11_CIPHER_ALGO_WEP           : Result:= 'WEP';
    DOT11_CIPHER_ALGO_IHV_START     : Result:= 'IHV_START';
    DOT11_CIPHER_ALGO_IHV_END       : Result:= 'IHV_END';
    end;
end;

function fScan: TStringlist;
const
WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_ADHOC_PROFILES =$00000001;
var
  hClient              : THandle;
  dwVersion            : DWORD;
  ResultInt            : DWORD;
  pInterface           : Pndu_WLAN_INTERFACE_INFO_LIST;
  i                    : Integer;
  j                    : Integer;
  pAvailableNetworkList: Pndu_WLAN_AVAILABLE_NETWORK_LIST;
  pInterfaceGuid       : PGUID;
  SDummy               : string;
  wLista : TStringList;
begin

  wLista := TStringList.Create;
  try
    try
      ResultInt:=WlanOpenHandle(1, nil, @dwVersion, @hClient);
      if  ResultInt<> ERROR_SUCCESS then
      begin
         WriteLn('Error Open CLient'+IntToStr(ResultInt));
         Exit;
      end;

      ResultInt:=WlanEnumInterfaces(hClient, nil, @pInterface);
      if  ResultInt<> ERROR_SUCCESS then
      begin
         WriteLn('Error Enum Interfaces '+IntToStr(ResultInt));
         exit;
      end;

      for i := 0 to pInterface^.dwNumberOfItems - 1 do
      begin
       Writeln('Interface       ' + pInterface^.InterfaceInfo[i].strInterfaceDescription);
       WriteLn('GUID            ' + GUIDToString(pInterface^.InterfaceInfo[i].InterfaceGuid));
       Writeln('');
       pInterfaceGuid:= @pInterface^.InterfaceInfo[pInterface^.dwIndex].InterfaceGuid;

          ResultInt:=WlanGetAvailableNetworkList(hClient,pInterfaceGuid,WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_ADHOC_PROFILES,nil,pAvailableNetworkList);
          if  ResultInt<> ERROR_SUCCESS then
          begin
             WriteLn('Error WlanGetAvailableNetworkList '+IntToStr(ResultInt));
             Exit;
          end;

        for j := 0 to pAvailableNetworkList^.dwNumberOfItems - 1 do
        begin
           WriteLn(Format('Profile         %s',[WideCharToString(pAvailableNetworkList^.Network[j].strProfileName)]));
           SDummy:=PChar(@pAvailableNetworkList^.Network[j].dot11Ssid.ucSSID);
           WriteLn(Format('NetworkName     %s',[SDummy]));
           WriteLn(Format('Signal Quality  %d ',[pAvailableNetworkList^.Network[j].wlanSignalQuality])+'%');
           //SDummy := GetEnumName(TypeInfo(Tndu_DOT11_AUTH_ALGORITHM),integer(pAvailableNetworkList^.Network[j].dot11DefaultAuthAlgorithm)) ;
           SDummy:=fDOT11_AUTH_ALGORITHM_To_String(pAvailableNetworkList^.Network[j].dot11DefaultAuthAlgorithm);
           WriteLn(Format('Auth Algorithm  %s ',[SDummy]));
           SDummy:=fDOT11_CIPHER_ALGORITHM_To_String(pAvailableNetworkList^.Network[j].dot11DefaultCipherAlgorithm);
           WriteLn(Format('Auth Algorithm  %s ',[SDummy]));
           Writeln('');
        end;
      end;

      WlanCloseHandle(hClient, nil);

    except on E: Exception do

    end;

  finally
    FreeAndNil(wLista);
  end;

end;

{ TConexaoWifi }

constructor TConexaoWifi.Create;
begin
  inherited;

end;

destructor TConexaoWifi.Destroy;
begin

  inherited;
end;

{ TDetectarWifi }

constructor TDetectarWifi.Create;
begin
  inherited;

end;

destructor TDetectarWifi.Destroy;
begin

  inherited;
end;

function TDetectarWifi.fDOT11_AUTH_ALGORITHM_To_String(
  Dummy: Tndu_DOT11_AUTH_ALGORITHM): String;
begin

end;

function TDetectarWifi.fScan: TStringlist;
begin

end;

end.
