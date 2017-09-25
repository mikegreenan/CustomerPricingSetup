program CustomerPricing;

uses
  Forms,
  SysUtils,
  MainFrm in 'MainFrm.pas' {frmMain},
  LoginDlg in 'LoginDlg.pas' {dlgLogin},
  PriceCodeDlg in 'PriceCodeDlg.pas' {dlgPriceCode};

{$R *.res}
  var temp: string;
begin
temp:=Trim(TdlgLogin.Execute);
if temp <> '' then
   begin
   Application.Initialize;
   Application.CreateForm(TfrmMain, frmMain);
  frmMain.Caption:=temp;
   Application.CreateForm(TdlgPriceCode, dlgPriceCode);
   Application.Run;
   end
else
   begin
   Application.MessageBox('You are not authorized to use this application.', 'Password Protected Delphi application') ;
   end;
end.
