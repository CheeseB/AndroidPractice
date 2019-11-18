unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Edit1: TEdit;
    Button3: TButton;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Button4: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
label1.Enabled:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
label1.Enabled:=false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
label2.Caption:=edit1.Text;
edit1.Clear;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
num1 :integer;
num2 :integer;
sum :integer;
begin
num1:=StrToInt(edit2.Text);
num2:=StrToInt(edit3.Text);
sum:=num1+num2;
label3.Caption :=IntToStr(sum);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
label4.Enabled:=true;
label5.Enabled:=false;
label6.Enabled:=false;
label4.Color:=clred;
label5.Color:=clnone;
label6.Color:=clnone;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
label4.Enabled:=false;
label5.Enabled:=true;
label6.Enabled:=false;
label4.Color:=clnone;
label5.Color:=clyellow;
label6.Color:=clnone;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
label4.Enabled:=false;
label5.Enabled:=false;
label6.Enabled:=true;
label4.Color:=clnone;
label5.Color:=clnone;
label6.Color:=cllime;
end;

end.
