unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
num1 : integer;
num2 : integer;
devide : integer;
begin
num1 := StrToInt(edit1.Text);
num2 := StrToInt(edit2.Text);
if num1 mod num2 =0 then ShowMessage(FloatToStr(num1/num2))
else ShowMessage('나눌수 없습니다');

end;

end.
