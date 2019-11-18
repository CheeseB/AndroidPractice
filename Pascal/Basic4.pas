unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
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
    Button12: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button10Click(Sender: TObject);
begin
label1.Font.Name:='±¼¸²';
end;

procedure TForm2.Button11Click(Sender: TObject);
begin
label1.Font.Name:='±Ã¼­';
end;

procedure TForm2.Button12Click(Sender: TObject);
begin
label1.Font.Name:='°íµñ';
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
label1.Color:=clyellow;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
label1.Color:=claqua;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
label1.Color:=cllime;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
label1.Font.Color:=clred;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
label1.Font.Color:=clblue;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
label1.Font.Color:=clpurple;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
label1.Font.Size:=5;
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
label1.Font.Size:=20;
end;

procedure TForm2.Button9Click(Sender: TObject);
begin
label1.Font.Size:=40;
end;

end.
