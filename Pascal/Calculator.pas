unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, strUtils;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var
value1, value2, rst : single;
Mode : Byte;

{$R *.dfm}

procedure TForm1.Button13Click(Sender: TObject);
begin
value1:=StrToCurr(edit1.Text);
edit1.Text :='0';
Mode :=1;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
value1:=StrToCurr(edit1.Text);
edit1.Text :='0';
Mode :=2;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
value1:=StrToCurr(edit1.Text);
edit1.Text :='0';
Mode :=3;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
value1:=StrToCurr(edit1.Text);
edit1.Text :='0';
Mode :=4;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
edit1.Text :=LeftStr(edit1.Text, Length(edit1.Text)-1);
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
edit1.Text:='0';
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
value2:=StrToCurr(Edit1.Text);

case mode of
1: rst :=value1+value2;
2: rst :=value1-value2;
3: rst :=value1/value2;
4: rst :=value1*value2;
end;
edit1.Text := CurrToStr(rst);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if edit1.Text='0' then edit1.Text := TButton(Sender).Caption
else edit1.Text := edit1.Text + TButton(Sender).Caption;
end;

end.
