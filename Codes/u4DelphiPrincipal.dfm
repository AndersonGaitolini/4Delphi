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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmo1: TMemo
    Left = 0
    Top = 0
    Width = 530
    Height = 438
    Align = alClient
    Lines.Strings = (
      'mmo1')
    TabOrder = 0
    OnDblClick = mmo1DblClick
    ExplicitLeft = 72
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
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
