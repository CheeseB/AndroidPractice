unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmQqadEq = class(TForm)
    editA: TEdit;
    editB: TEdit;
    editC: TEdit;
    lblCoefs: TLabel;
    lblX1: TLabel;
    lblX2: TLabel;
    lblNo: TLabel;
    btnFind: TButton;
    procedure btnFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQqadEq: TfrmQqadEq;

implementation

{$R *.dfm}

procedure Prn(xf, xs: Real);
begin
  frmQqadEq.lblX1.Visible :=True;
  frmQqadEq.lblX1.Caption := 'x1=' + FloatToStr(xf);
  frmQqadEq.lblX2.Visible :=True;
  frmQqadEq.lblX2.Caption := 'x2=' + FloatToStr(xs);
end;

procedure CoefInput(var k1, k2, k3 : Real);
begin
  k1 := StrToFloat
  (frmQqadEq.editA.Text);
  k2 := StrToFloat
  (frmQqadEq.editB.Text);
  k3 := StrToFloat
  (frmQqadEq.editC.Text);
end;

procedure Calc(k1, k2, dis: Real; var xf, xs : Real);
begin
  xf:=(-k2 + Sqrt(dis))/(2*k1);
  xs:=(-k2 - Sqrt(dis))/(2*k1);
end;

procedure Init;
begin
  frmQqadEq.lblX1.Visible:=False;
  frmQqadEq.lblX2.Visible:=False;
  frmQqadEq.lblNo.Visible:=False;
end;

procedure TfrmQqadEq.btnFindClick(Sender: TObject);
var
A,B,C,D,X1,X2 : Real;
begin
CoefInput(A,B,C); //��� A,B,C �� �д´�
D := Sqr(B) - 4*A*C; //�Ǻ��� D�� ����Ѵ�
if D>=0 then  // D�� 0���� ũ�ų� ������
begin
  Calc(A,B,D,X1,X2); //A,B,D�� �̿��� �� X1, X2�� ����Ѵ�.
  Prn(X1,X2); // �� X1, X2�� ����Ѵ�.
end
else // �׷��� ������
lblNo.Visible:=True;  // ����ڿ��� �ع��� ���ٰ� �˸���.
end;

end.
