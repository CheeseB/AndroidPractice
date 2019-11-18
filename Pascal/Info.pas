unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TDeviceInfoForm = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    btnGetDeviceInfo: TButton;
    ListBox1: TListBox;
    lbOsName: TListBoxItem;
    lbDeviceType: TListBoxItem;
    ibOSVersion: TListBoxItem;
    procedure btnGetDeviceInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeviceInfoForm: TDeviceInfoForm;

implementation
uses
androidapi.JNI.JavaTypes, androidapi.Helpers, androidapi.JNI.Os;

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
function GetCodename(VerString: string): string;
begin
  if VerString = '4.4' then
  Result := 'KITKAT'
  else if VerString = '5.0' then
  Result := 'Lolipop'
  else if VerString = '6.0' then
  Result := 'Marshmallow'
  else if VerString = '6.0.1' then
  Result := 'Marshmallow'
  else if Pos('7.0', VerString)=1 then
  Result := 'Nugat'
  else if Pos('8.0.0', VerString)=1 then
  Result := 'Oreo'
  else Result := 'UNKNOWN';
end;


procedure TDeviceInfoForm.btnGetDeviceInfoClick(Sender: TObject);
var
codename: string;
begin
codename:= 'Unknown';
lbDeviceType.Text := Format('Device Type: %s', [JStringToString(TJBuild.JavaClass.MODEL)]);
lbOSName.Text := Format('OS Name: %s',[GetCodename(JStringToString(TJBuild_VERSION.JavaClass.RELEASE))]);
ibOSVersion.Text := Format('OS Version: %s',[JStringToString(TJBuild_VERSION.JavaClass.RELEASE)]);
end;

end.
