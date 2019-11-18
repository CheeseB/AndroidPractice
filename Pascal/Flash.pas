unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Media, FMX.Colors, FMX.Layouts;

type
  TForm3 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    ColorBox1: TColorBox;
    ColorButton1: TColorButton;
    ColorButton2: TColorButton;
    Label1: TLabel;
    Label2: TLabel;
    ToolBar1: TToolBar;
    Label3: TLabel;
    Camera: TCameraComponent;
    procedure FormCreate(Sender: TObject);
    procedure ColorButton1Click(Sender: TObject);
    procedure ColorButton2Click(Sender: TObject);
  private
  procedure SetFlashState(Active : Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.ColorButton1Click(Sender: TObject);
begin
  Colorbox1.Color:=TalphaColorRec.White;
  SetFlashState(True);
end;

procedure TForm3.ColorButton2Click(Sender: TObject);
begin
  ColorBox1.Color := TalphaColorRec.Black;
  SetFlashState(False);
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  label1.Enabled := Camera.HasFlash;
  Camera.Active := True;
end;

procedure TForm3.SetFlashState(Active: Boolean);
begin
if Active then
begin
  Camera.TorchMode := TTorchMode.ModeOn;
end
else
  Camera.TorchMode := TTorchMode.ModeOff;
end;

end.
