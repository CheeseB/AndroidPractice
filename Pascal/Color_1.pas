unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TformColor = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formColor: TformColor;

implementation

{$R *.dfm}

procedure TformColor.Button1Click(Sender: TObject);
begin
formColor.Color := clYellow;
end;

procedure TformColor.Button2Click(Sender: TObject);
begin
formColor.Color := clBlue;
end;

procedure TformColor.FormCreate(Sender: TObject);
begin
formColor.Color := clRed;
end;

end.
