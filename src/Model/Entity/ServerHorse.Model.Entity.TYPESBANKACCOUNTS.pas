unit ServerHorse.Model.Entity.TYPESBANKACCOUNTS;

interface

uses
  SimpleAttributes;

type

  [Tabela('TypesBankAccounts')]
  TTYPESBANKACCOUNTS = class
  private
    FDESCRIPTION: String;
    FGUUID: String;
    procedure SetDESCRIPTION(const Value: String);
    procedure SetGUUID(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    [Campo('GUUID'), Pk]
    property GUUID : String read FGUUID write SetGUUID;
    [Campo('DESCRIPTION')]
    property DESCRIPTION : String read FDESCRIPTION write SetDESCRIPTION;
  end;

implementation

{ TTYPESBANKACCOUNTS }

constructor TTYPESBANKACCOUNTS.Create;
begin

end;

destructor TTYPESBANKACCOUNTS.Destroy;
begin

  inherited;
end;

procedure TTYPESBANKACCOUNTS.SetDESCRIPTION(const Value: String);
begin
  FDESCRIPTION := Value;
end;

procedure TTYPESBANKACCOUNTS.SetGUUID(const Value: String);
begin
  FGUUID := Value;
end;

end.
