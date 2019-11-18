unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TformColor = class(TForm)
    cPanel: TPanel;
    btnYellow: TButton;
    btnGreen: TButton;
    btnBlue: TButton;
    btnWhite: TButton;
    btnBlack: TButton;
    btnRed: TButton;
    btnMaroon: TButton;
    btnGray: TButton;
    btnMoneyGreen: TButton;
    btnMedGray: TButton;
    btnPurple: TButton;
    btnPink: TButton;
    btnNavy: TButton;
    btnAqua: TButton;
    btnTeal: TButton;
    btnOlive: TButton;
    btnSilver: TButton;
    btnSkyblue: TButton;
    btnLime: TButton;
    btnCream: TButton;
    ListBox1: TListBox;
    procedure btnYellowClick(Sender: TObject);
    procedure btnGreenClick(Sender: TObject);
    procedure btnBlueClick(Sender: TObject);
    procedure btnWhiteClick(Sender: TObject);
    procedure btnBlackClick(Sender: TObject);
    procedure btnRedClick(Sender: TObject);
    procedure btnMaroonClick(Sender: TObject);
    procedure btnGrayClick(Sender: TObject);
    procedure btnMoneyGreenClick(Sender: TObject);
    procedure btnMedGrayClick(Sender: TObject);
    procedure btnPurpleClick(Sender: TObject);
    procedure btnPinkClick(Sender: TObject);
    procedure btnOliveClick(Sender: TObject);
    procedure btnTealClick(Sender: TObject);
    procedure btnAquaClick(Sender: TObject);
    procedure btnNavyClick(Sender: TObject);
    procedure btnSilverClick(Sender: TObject);
    procedure btnSkyblueClick(Sender: TObject);
    procedure btnLimeClick(Sender: TObject);
    procedure btnCreamClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formColor: TformColor;

implementation

{$R *.dfm}

procedure TformColor.btnAquaClick(Sender: TObject);
begin
formColor.Color:=clAqua;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnBlackClick(Sender: TObject);
begin
formColor.Color:=clBlack;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnBlueClick(Sender: TObject);
begin
formColor.Color:=clBlue;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnMoneyGreenClick(Sender: TObject);
begin
formColor.Color:=clMoneygreen;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnCreamClick(Sender: TObject);
begin
formColor.Color:=clCream;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnSkyblueClick(Sender: TObject);
begin
formColor.Color:=clSkyblue;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnGrayClick(Sender: TObject);
begin
formColor.Color:=clGray;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnGreenClick(Sender: TObject);
begin
formColor.Color:=clGreen;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnLimeClick(Sender: TObject);
begin
formColor.Color:=clLime;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnMaroonClick(Sender: TObject);
begin
formColor.Color:=clMaroon;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnNavyClick(Sender: TObject);
begin
formColor.Color:=clNavy;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnOliveClick(Sender: TObject);
begin
formColor.Color:=clOlive;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnMedGrayClick(Sender: TObject);
begin
formColor.Color:=clMedGray;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnPinkClick(Sender: TObject);
begin
formColor.Color:=clFuchsia;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnPurpleClick(Sender: TObject);
begin
formColor.Color:=clPurple;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnRedClick(Sender: TObject);
begin
formColor.Color:=clRed;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnSilverClick(Sender: TObject);
begin
formColor.Color:=clSilver;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnTealClick(Sender: TObject);
begin
formColor.Color:=clTeal;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnWhiteClick(Sender: TObject);
begin
formColor.Color:=clWhite;
listBox1.Color :=clBlack;
end;

procedure TformColor.btnYellowClick(Sender: TObject);
begin
formColor.Color:=clYellow;
listBox1.Color :=clBlack;
end;

end.
