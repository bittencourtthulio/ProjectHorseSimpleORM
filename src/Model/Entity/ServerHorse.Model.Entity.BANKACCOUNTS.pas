unit ServerHorse.Model.Entity.BANKACCOUNTS;

interface

uses
  SimpleAttributes;

type
  [Tabela('BankAccounts')]
  TBANKACCOUNTS = class
  private
    FIDTYPESBANKACCOUNTS: String;
    FSTATUS: String;
    FDESCRIPTION: String;
    FGUUID: String;
    FOPENINGBALANCE: Currency;
    procedure SetDESCRIPTION(const Value: String);
    procedure SetGUUID(const Value: String);
    procedure SetIDTYPESBANKACCOUNTS(const Value: String);
    procedure SetOPENINGBALANCE(const Value: Currency);
    procedure SetSTATUS(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    [Campo('GUUID'), Pk]
    property GUUID : String read FGUUID write SetGUUID;
    [Campo('DESCRIPTION')]
    property DESCRIPTION : String read FDESCRIPTION write SetDESCRIPTION;
    [Campo('OPENINGBALANCE')]
    property OPENINGBALANCE : Currency read FOPENINGBALANCE write SetOPENINGBALANCE;
    [Campo('IDTYPESBANKACCOUNTS')]
    property IDTYPESBANKACCOUNTS : String read FIDTYPESBANKACCOUNTS write SetIDTYPESBANKACCOUNTS;
    [Campo('STATUS')]
    property STATUS : String read FSTATUS write SetSTATUS;
  end;


implementation

{ TBANKACCOUNTS }

constructor TBANKACCOUNTS.Create;
begin

end;

destructor TBANKACCOUNTS.Destroy;
begin

  inherited;
end;

procedure TBANKACCOUNTS.SetDESCRIPTION(const Value: String);
begin
  FDESCRIPTION := Value;
end;

procedure TBANKACCOUNTS.SetGUUID(const Value: String);
begin
  FGUUID := Value;
end;

procedure TBANKACCOUNTS.SetIDTYPESBANKACCOUNTS(const Value: String);
begin
  FIDTYPESBANKACCOUNTS := Value;
end;

procedure TBANKACCOUNTS.SetOPENINGBALANCE(const Value: Currency);
begin
  FOPENINGBALANCE := Value;
end;

procedure TBANKACCOUNTS.SetSTATUS(const Value: String);
begin
  FSTATUS := Value;
end;

end.
