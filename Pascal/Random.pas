unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, math;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
iran : integer;
begin
randomize;
iran := random(100)+1;
memo1.Lines.Add(inttostr(iran));
end;

procedure TForm2.Button2Click(Sender: TObject);
var
iran : integer;
begin
randomize;
iran := randomrange(1,100);
memo1.lines.Add(inttostr(iran));
end;

end.
