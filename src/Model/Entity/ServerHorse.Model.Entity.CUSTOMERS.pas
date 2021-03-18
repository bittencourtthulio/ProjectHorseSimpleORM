unit ServerHorse.Model.Entity.CUSTOMERS;

interface

uses
  SimpleAttributes;

type
  [Tabela('Customers')]
  TCUSTOMERS = class
  private
    FNAME :String;
    FGUUID: String;
    procedure SetNAME (const Value :String);
    function GetNAME :String;
    procedure SetGUUID(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    [Campo('GUUID'), Pk]
    property GUUID : String read FGUUID write SetGUUID;
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

procedure TCUSTOMERS.SetGUUID(const Value: String);
begin
  FGUUID := Value;
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
