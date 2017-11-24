object uFo4DelphiPrincipal: TuFo4DelphiPrincipal
  Left = 0
  Top = 0
  Caption = '4Delphi - Gerenciador de M'#233'todos e exemplos'
  ClientHeight = 438
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu4Delphi
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmMenu4Delphi: TMainMenu
    Left = 224
    Top = 208
    object mmExperimentos: TMenuItem
      Caption = 'Experimentos'
      object mmLANWAN: TMenuItem
        Caption = 'LAN\WAN'
        object mmWIFI: TMenuItem
          Caption = 'WIFI'
          OnClick = mmWIFIClick
        end
      end
    end
  end
end
