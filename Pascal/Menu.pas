unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.N1Click(Sender: TObject);
begin
form3.Color := clBlack;
end;

procedure TForm3.N2Click(Sender: TObject);
begin
form3.Color:=clBlue;
end;

procedure TForm3.N4Click(Sender: TObject);
begin
form3.Color:=clWhite;
end;

procedure TForm3.N5Click(Sender: TObject);
begin
form3.Color:=clAqua;
end;

procedure TForm3.N6Click(Sender: TObject);
begin
form3.Color:=clMedGray;
end;

end.
