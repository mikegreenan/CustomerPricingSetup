unit PriceCodeDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TdlgPriceCode = class(TForm)
    lblCode: TLabel;
    lblDescription: TLabel;
    edtCode: TEdit;
    edtDescription: TEdit;
    btnOkay: TButton;
    btnCancel: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgPriceCode: TdlgPriceCode;

implementation

{$R *.dfm}

end.
