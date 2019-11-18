unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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
label1.Caption :='내가만든 첫 양지몬은 바보';
form1.Color := clblack;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
label1.Caption :='내가만든 첫 양지몬은 멍충이';
form1.Color := cllime;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
label1.Caption :='내가만든 첫 양지몬은 똥쟁이';
form1.Color := clyellow;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
label1.Color :=clblack;
end;

end.
