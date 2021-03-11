unit ServerHorse.Model.Entity.CUSTOMERS;

interface

uses
  SimpleAttributes;

type
  [Tabela('Customers')]
  TCUSTOMERS = class
  private
    FNAME :String;
    FID: integer;
    procedure SetNAME (const Value :String);
    function GetNAME :String;
    procedure SetID(const Value: integer);
  public
    constructor Create;
    destructor Destroy; override;
    [Campo('ID'), AutoInc, Pk]
    property ID : integer read FID write SetID;
    [Campo('NAME')]
    property NAME :String read GetNAME write SetNAME;
end;

implementation

constructor TCUSTOMERS.Create;
begin

end;

destructor TCUSTOMERS.Destroy;
begin

  inherited;
end;

procedure TCUSTOMERS.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TCUSTOMERS.SetNAME (const Value :String);
begin
  FNAME := Value;
end;

function TCUSTOMERS.GetNAME :String;
begin
  Result := FNAME;
end;


end.
