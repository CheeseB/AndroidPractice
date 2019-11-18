unit abcd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    edit_Input: TLabeledEdit;
    label_Output: TLabel;
    btn_Close: TBitBtn;
    btn_Length: TButton;
    procedure btn_LengthClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btn_CloseClick(Sender: TObject);
begin
form2.Destroy;
end;

procedure TForm2.btn_LengthClick(Sender: TObject);
var
data : string;
begin
data :=edit_Input.Text;
//label_output.catpion := IntToStr(Length(data));
//label_output.caption := (Length(data)).ToString;
//lable_output.caption := (data.length).ToString;
label_output.Caption := '문자 수는'+data.Length.ToString+'글자입니다.(공백 포함)';
end;

end.
