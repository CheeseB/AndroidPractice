unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Colors,
  FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation, FMX.Objects, FMX.Media;

type
  TFlashlight = class(TForm)
    Camera: TCameraComponent;
    Image1: TImage;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    Layout1: TLayout;
    Button1: TButton;
    Button2: TButton;
    flash1: TColorButton;
    flash2: TColorButton;
    flash3: TColorButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure flash1Click(Sender: TObject);
    procedure flash2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure flash3Click(Sender: TObject);
  private
  procedure SetFlashState(Active: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flashlight: TFlashlight;

implementation

{$R *.fmx}

{ TFlashlight }

procedure TFlashlight.Button1Click(Sender: TObject);
begin
if Timer1.Interval =50 then
begin
  showmessage('최저수치입니다.');
end
else
begin
  Timer1.Interval := Timer1.Interval-50;
  Timer2.Interval := Timer1.Interval *2;
end;
end;

procedure TFlashlight.Button2Click(Sender: TObject);
begin
  Timer1.Interval := Timer1.Interval+50;
  Timer2.Interval := Timer1.Interval *2;
end;

procedure TFlashlight.flash1Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  SetFlashState(True);
end;

procedure TFlashlight.flash2Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  SetFlashState(False);
end;

procedure TFlashlight.flash3Click(Sender: TObject);
begin
  Timer1.Enabled := True;
  Timer2.Enabled := True;
end;

procedure TFlashlight.FormCreate(Sender: TObject);
begin
  Camera.Active := True;
  Timer1.Enabled := True;
  Timer2.Enabled := True;
end;

procedure TFlashlight.SetFlashState(Active: Boolean);
begin
if Active then
begin
  Camera.TorchMode := TTorchMode.ModeOn;
end
else
  Camera.TorchMode := TTorchMode.ModeOff;
end;

procedure TFlashlight.Timer1Timer(Sender: TObject);
begin
SetFlashState(True);
end;

procedure TFlashlight.Timer2Timer(Sender: TObject);
begin
SetFlashState(False);
end;

end.
