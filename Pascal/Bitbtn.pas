unit bbb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    edit1: TEdit;
    Button1: TButton;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
label1.Caption:='';
edit1.Clear;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
form2.Destroy;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
data : string;
begin
data := edit1.Text;
label1.Caption:=data;
edit1.Text:='';
edit1.Focused;
end;

end.
