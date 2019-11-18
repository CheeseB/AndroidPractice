unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    btnNameClick: TButton;
    btnClickme: TButton;
    Edtname: TLabeledEdit;
    editInput: TEdit;
    lbloutput: TLabel;
    procedure btnNameClickClick(Sender: TObject);
    procedure btnClickmeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnClickmeClick(Sender: TObject);
begin
lbloutput.Caption:= editinput.Text;
end;

procedure TForm2.btnNameClickClick(Sender: TObject);
begin
lbloutput.Caption:='Hello'+edtname.Text+'!';
end;

end.
