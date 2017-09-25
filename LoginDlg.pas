unit LoginDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TdlgLogin = class(TForm)
    lblUsername: TLabel;
    lblPassword: TLabel;
    edtCode: TEdit;
    edtPassword: TEdit;
    btnOkay: TButton;
    btnCancel: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
     class function Execute : string;
  end;

var
  dlgLogin: TdlgLogin;

implementation



{$R *.dfm}

 class function TdlgLogin.Execute: string;
 begin
   with TdlgLogin.Create(nil) do
   try
        ShowModal;
        Result := edtCode.Text;
   finally
     Free;
   end;
 end;


end.
