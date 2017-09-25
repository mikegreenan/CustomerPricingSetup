unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, ADODB, Grids, DBGrids, IniFiles, ComCtrls,
  ExtCtrls, AdvObj, BaseGrid, AdvGrid, DBAdvGrid;

type
  TfrmMain = class(TForm)
    conMain: TADOConnection;
    qryCustomerProductPricingDetail: TADOQuery;
    dsCustomerPricing: TDataSource;
    dsCustomerPricingDetail: TDataSource;
    strngfldCustomerPricingDetailName: TStringField;
    fltfldCustomerPricingDetailMargin: TFloatField;
    cmdInsertCustomerProductPricingDetail: TADOCommand;
    tblCustomerProductPricing: TADOTable;
    tblJobOption: TADOTable;
    pgc1: TPageControl;
    tsProduct: TTabSheet;
    tsFreight: TTabSheet;
    btnAdd: TButton;
    btnEdit: TButton;
    dsCustomerFreightPricing: TDataSource;
    dbgrdCustomerFreightPricing: TDBGrid;
    dbnvgr1: TDBNavigator;
    tblCustomerFreightPricing: TADOTable;
    DBAdvGrid1: TDBAdvGrid;
    DBAdvGrid2: TDBAdvGrid;
    Button1: TButton;
    tblCustomerProductPricingid: TAutoIncField;
    tblCustomerProductPricingCode: TStringField;
    tblCustomerProductPricingDescription: TStringField;
    tblCustomerProductPricingDateCreated: TDateTimeField;
    tblCustomerProductPricingDateCreatedUsername: TStringField;
    tblCustomerProductPricingDateModified: TDateTimeField;
    tblCustomerProductPricingDateModifiedUsername: TStringField;
    procedure qryCustomerPricingAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClick(Sender: TObject);
    procedure tblCustomerProductPricingAfterScroll(DataSet: TDataSet);
    procedure btnEditClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses PriceCodeDlg;

{$R *.dfm}

procedure TfrmMain.qryCustomerPricingAfterScroll(DataSet: TDataSet);
begin
with qryCustomerProductPricingDetail do
begin
  Close;
  Parameters.ParamByName('CustomerPricingID').Value:=DataSet.FieldByName('ID').AsString;
  Open;
end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  appINI : TIniFile;
begin
appINI := TIniFile.Create(Changefileext(application.exename, '.ini'));
with appINI do
	begin
	conMain.ConnectionString := ReadString('Database','leponline','') ;
	free;
	end;
//Open connections

conMain.Open();
tblCustomerProductPricing.Open;
qryCustomerProductPricingDetail.Open;
tblCustomerFreightPricing.Open;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
tblCustomerProductPricing.Close;
qryCustomerProductPricingDetail.Close;
tblCustomerFreightPricing.close;
conMain.Close;
end;

procedure TfrmMain.btnAddClick(Sender: TObject);
var CustomerPricingId:Integer;
begin
dlgPriceCode.Caption:= 'Add a price code';
dlgPriceCode.edtCode.Text:='';
dlgPriceCode.edtDescription.Text:='';

if (dlgPriceCode.ShowModal = mrOk) then
        begin
        with tblCustomerProductPricing do
                begin
                Insert;
                FieldByName('Code').Value :=dlgPriceCode.edtCode.Text;
                FieldByName('Description').Value :=dlgPriceCode.edtDescription.Text;
                FieldByName('DateCreated').Value:= Now;
                FieldByName('DateCreatedUsername').Value:=Caption;
                Post;
                CustomerPricingId:=FieldByName('Id').AsInteger;
                end;
        tblJobOption.Open;
        with cmdInsertCustomerProductPricingDetail do
                begin
                while not tblJobOption.Eof do
                    begin
                    Parameters.ParamByName('CustomerPricingID').Value:=CustomerPricingId;
                    Parameters.ParamByName('JobOptionID').Value:=tblJobOption.FieldByName('Id').Value;
                    Parameters.ParamByName('Margin').Value:='0';
                    Parameters.ParamByName('DateCreated').Value:=Now;
                    Parameters.ParamByName('DateCreatedUsername').Value:=Caption;
                    Execute;
                    tblJobOption.Next;
                    end;
                end;
        tblJobOption.Close;
        with qryCustomerProductPricingDetail do
            begin
            Close;
            Parameters.ParamByName('CustomerPricingID').Value:=CustomerPricingId;
            Open;
            end;
        end;
end;

procedure TfrmMain.tblCustomerProductPricingAfterScroll(DataSet: TDataSet);
begin
with qryCustomerProductPricingDetail do
    begin
    Close;
    Parameters.ParamByName('CustomerPricingID').Value:=DataSet.FieldByName('Id').AsInteger;
    Open;
    end;
end;

procedure TfrmMain.btnEditClick(Sender: TObject);
begin
dlgPriceCode.edtCode.Text:= tblCustomerProductPricing.FieldByName('Code').AsString;
dlgPriceCode.edtDescription.Text:=tblCustomerProductPricing.FieldByName('Description').AsString;
dlgPriceCode.Caption:= 'Add a price code';
if (dlgPriceCode.ShowModal = mrOk) then
        begin
        with tblCustomerProductPricing do
                begin
                Edit;
                FieldByName('Code').Value :=dlgPriceCode.edtCode.Text;
                FieldByName('Description').Value :=dlgPriceCode.edtDescription.Text;
                FieldByName('DateModified').Value:= Now;
                FieldByName('DateModifiedUsername').Value:=Caption;
                Post;
                end;
        end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
conMain.BeginTrans;
try
tblCustomerProductPricing.First;
tblJobOption.Open;
while not tblCustomerProductPricing.Eof do
    begin
    tblJobOption.First;
    with cmdInsertCustomerProductPricingDetail do
        begin
        while not tblJobOption.Eof do
            begin
            Parameters.ParamByName('CustomerPricingID').Value:=tblCustomerProductPricing.FieldByName('id').AsInteger;
            Parameters.ParamByName('CustomerPricingID2').Value:=tblCustomerProductPricing.FieldByName('id').AsInteger;
            Parameters.ParamByName('JobOptionID').Value:=tblJobOption.FieldByName('Id').Value;
            Parameters.ParamByName('JobOptionID2').Value:=tblJobOption.FieldByName('Id').Value;
            Parameters.ParamByName('Margin2').Value:='0';
            Parameters.ParamByName('DateCreated2').Value:=Now;
            Parameters.ParamByName('DateCreatedUsername2').Value:=Caption;
            Execute;
            tblJobOption.Next;
            end;
        end;
    tblCustomerProductPricing.Next;
    end;
conMain.CommitTrans;
ShowMessage('Committed');
except on E:Exception do
    begin
    conMain.RollbackTrans;
    ShowMessage('Rolled back');
    end;
end;//try end;
tblJobOption.Close;
tblCustomerProductPricing.Refresh;
qryCustomerProductPricingDetail.Refresh;
end;

end.
