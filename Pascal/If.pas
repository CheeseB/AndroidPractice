unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  labelededit2.Clear;
  labelededit1.Clear;
  listbox2.Clear;
  listbox1.Clear;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  form2.Destroy;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin

if labelededit2.Text = '남' then
begin
  listbox1.Items.Add(labelededit1.Text);
  labelededit2.Clear;
  labelededit1.Clear;
end

else if labelededit2.Text = '여' then
begin
  listbox2.Items.Add(labelededit1.Text);
  labelededit2.Clear;
  labelededit1.Clear;
end

else
begin
  showmessage('남,여 둘중 하나 선택하세요');
  labelededit2.Clear;
end;

end;

end.
