unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TForm2 = class(TForm)
    e1: TEdit;
    se: TSpinEdit;
    btn1: TButton;
    e2: TEdit;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);
var
varString : string;
varInteger : integer;
varReal : real;
varBoolean : boolean;
varChar : char;

begin

varString := e1.Text;
showMessage('�Է��� ���ڿ� ������ ����:'+varString);

varInteger := se.Value;
showMessage('�Է��� ������ ������ ����:'+IntToStr(varInteger));

varReal := StrToFloat(e2.Text);
showMessage('�Է��� �Ǽ��� ������ ����:'+FloatToStr(varReal));

varBoolean := True;
varBoolean := False;
varString := 'YangJiMon';
varChar := varString[4];
showMessage('���ڿ�'+varString+'�� 4��° ��ġ�� ����:'+varChar);

end;

end.
