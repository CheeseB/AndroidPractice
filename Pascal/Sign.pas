unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TForm3 = class(TForm)
    ToolBar1: TToolBar;
    btnReset: TButton;
    btnOK: TButton;
    Layout1: TLayout;
    RoundRect1: TRoundRect;
    Path1: TPath;
    Rectangle1: TRectangle;
    Label1: TLabel;
    procedure RoundRect1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure RoundRect1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnOKClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.btnOKClick(Sender: TObject);
var
B: TBrushBitmap;
begin
B := TBrushBitmap.Create;
B.Bitmap.Assign(Path1.MakeScreenshot);
B.Bitmap.Resize(trunc(path1.Width), trunc(path1.Height));
rectangle1.Fill.Kind := Tbrushkind.Bitmap;
rectangle1.Fill.Bitmap.Assign(B);
path1.Data.Clear;
end;

procedure TForm3.btnResetClick(Sender: TObject);
begin
rectangle1.Fill.Kind := TBrushKind.None;
path1.Data.Clear;
layout1.Repaint;
end;

procedure TForm3.RoundRect1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
if ssLeft in Shift then
Path1.Data.MoveTo(TpointF.Create(X,Y));
end;

procedure TForm3.RoundRect1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
if ssLeft in Shift then
begin
  path1.Data.LineTo(TpointF.Create(X,Y));
  RoundRect1.Repaint;
end;
end;

end.
