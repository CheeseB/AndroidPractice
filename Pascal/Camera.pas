unit Babo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TForm3 = class(TForm)
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    ShowShareSheetAction1: TShowShareSheetAction;
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}

procedure TForm3.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
showsharesheetaction1.Bitmap.Assign(Image1.Bitmap);
end;

procedure TForm3.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
image1.Bitmap.Assign(Image);
end;

procedure TForm3.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
image1.Bitmap.Assign(Image);
end;

end.
