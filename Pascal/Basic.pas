unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    SpinButton1: TSpinButton;
    Edit2: TEdit;
    SpinButton2: TSpinButton;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label3: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Button3: TButton;
    SpinButton3: TSpinButton;
    Edit10: TEdit;
    Label4: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Button4: TButton;
    SpinButton4: TSpinButton;
    Button5: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Button6: TButton;
    Button7: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Button8: TButton;
    procedure SpinButton1DownClick(Sender: TObject);
    procedure SpinButton1UpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpinButton2DownClick(Sender: TObject);
    procedure SpinButton2UpClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpinButton3DownClick(Sender: TObject);
    procedure SpinButton3UpClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpinButton4DownClick(Sender: TObject);
    procedure SpinButton4UpClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation {여기 위: 다른파일도 // 아래: 이파일만}
var
k : byte;
si : ShortInt;
x : single;
it : integer;

{$R *.dfm}
{여기 위:전역 // 아래:지역}
procedure TForm1.Button1Click(Sender: TObject);
begin
edit3.Text :=IntToStr(High(k));
edit4.Text :=IntToStr(Low(k));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
edit5.Text :=IntToStr(High(si));
edit6.Text :=IntToStr(Low(si));
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
edit8.Text := single.MaxValue.ToString;
edit9.Text := single.MinValue.ToString;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
edit11.Text :=IntToStr(High(it));
edit12.Text :=IntToStr(Low(it));
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
showMessage('안녕 델파이');
label5.Caption:='시작과 끝 델파이';
end;

procedure TForm1.Button6Click(Sender: TObject);
var c: Char;
begin
c:='A';
showMessage(c);
end;

procedure TForm1.Button7Click(Sender: TObject);
var s: String;
begin
s:='Delphi Export';
showMessage(s);
end;

procedure TForm1.Button8Click(Sender: TObject);
var
c: Boolean;
a,b: integer;
begin
a:=3;
b:=4;
if a>b then c:= True else c:= False;
showMessage(BoolToStr(c,True));

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
k:=0;
si:=0;
x:=0;
it:=0;
end;

procedure TForm1.SpinButton1DownClick(Sender: TObject);

begin
k:=k-1;
edit1.Text :=IntToStr(k);
end;

procedure TForm1.SpinButton1UpClick(Sender: TObject);
begin
k:=k+1;
edit1.Text :=IntToStr(k);
end;

procedure TForm1.SpinButton2DownClick(Sender: TObject);
begin
si:=si-1;
edit2.Text :=IntToStr(si);
end;

procedure TForm1.SpinButton2UpClick(Sender: TObject);
begin
si:=si+1;
edit2.Text :=IntToStr(si);
end;

procedure TForm1.SpinButton3DownClick(Sender: TObject);
begin
x:=x-1;
edit7.Text :=FloatToStr(x);
end;

procedure TForm1.SpinButton3UpClick(Sender: TObject);
begin
x:=x+1;
edit7.Text :=FloatToStr(x);
end;

procedure TForm1.SpinButton4DownClick(Sender: TObject);
begin
it:=it-1;
edit10.Text :=IntToStr(it);
end;

procedure TForm1.SpinButton4UpClick(Sender: TObject);
begin
it:=it+1;
edit10.Text :=IntToStr(it);
end;

end.
