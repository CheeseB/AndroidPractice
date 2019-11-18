unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TformVisible = class(TForm)
    btnShow: TButton;
    btnHide: TButton;
    pnl: TPanel;
    Image1: TImage;
    procedure btnShowClick(Sender: TObject);
    procedure btnHideClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formVisible: TformVisible;

implementation

{$R *.dfm}

procedure TformVisible.btnHideClick(Sender: TObject);
begin
pnl.Visible:=False;
end;

procedure TformVisible.btnShowClick(Sender: TObject);
begin
pnl.Visible:=True;
end;

end.
