unit ServerHorse.Model.Entity.STATES;

interface

uses
  SimpleAttributes;

type
  [Tabela('States')]
  TSTATES = class
  private
    FIDCOUNTRY: String;
    FSTATE: String;
    FGUUID: String;
    procedure SetGUUID(const Value: String);
    procedure SetIDCOUNTRY(const Value: String);
    procedure SetSTATE(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    [Campo('GUUID'), Pk]
    property GUUID : String read FGUUID write SetGUUID;
    [Campo('IDCOUNTRY')]
    property IDCOUNTRY : String read FIDCOUNTRY write SetIDCOUNTRY;
    [Campo('STATE')]
    property STATE : String read FSTATE write SetSTATE;
  end;


implementation

{ TSTATES }

constructor TSTATES.Create;
begin

end;

destructor TSTATES.Destroy;
begin

  inherited;
end;

procedure TSTATES.SetGUUID(const Value: String);
begin
  FGUUID := Value;
end;

procedure TSTATES.SetIDCOUNTRY(const Value: String);
begin
  FIDCOUNTRY := Value;
end;

procedure TSTATES.SetSTATE(const Value: String);
begin
  FSTATE := Value;
end;

end.
