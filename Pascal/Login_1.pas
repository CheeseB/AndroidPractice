unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Unit4;

type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    inputID: TLabeledEdit;
    inputPass: TLabeledEdit;
    Login: TButton;
    registID: TLabeledEdit;
    registPass: TLabeledEdit;
    registName: TLabeledEdit;
    registAge: TLabeledEdit;
    Regist: TButton;
    procedure LoginClick(Sender: TObject);
    procedure RegistClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  age : string;
  food : string;
  name : string;
  kg : string;
  heigh : string;
  id : string;
  password : string;

implementation

{$R *.dfm}

procedure TForm3.LoginClick(Sender: TObject);
var
txtProfile : textFile;
Sdata : string;
begin
if not fileExists(inputID.Text+'.txt') then
begin
 showmessage('���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�. �ٽ��ϼ���.');
 exit;
end
else
  assignfile(txtProfile, registID.Text+'.txt' );
  reset(txtProfile);
  readln(txtProfile, Sdata);
  readln(txtProfile, Sdata);

  readln(txtProfile, Sdata);
  form4.Name.Caption := Sdata;
  readln(txtProfile,Sdata);
  form4.Age.Caption := Sdata;
  closefile(txtProfile);
  form4.Show;
  form4.LoginStatus.Caption:='����� ���� �α������Դϴ�.';
end;

procedure TForm3.RegistClick(Sender: TObject);
var
textProfile : textfile;
begin
if not fileExists(registID.Text + '.txt') then
begin
  assignfile(textProfile, registID.Text+'.txt');
  rewrite(textProfile);

  writeln(textProfile,  registID.Text);
  writeln(textProfile,  registPass.Text);
  writeln(textProfile,  registName.Text);
  writeln(textProfile,  registAge.Text);
  closeFile(textProfile);
  showmessage('ȸ������ �Ϸ�');
end
else
  showmessage('�̹� �ִ� ���̵��Դϴ�.');
end;

end.
