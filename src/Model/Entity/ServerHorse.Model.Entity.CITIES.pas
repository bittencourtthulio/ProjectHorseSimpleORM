unit ServerHorse.Model.Entity.CITIES;

interface

uses
  SimpleAttributes;

type
  [Tabela('Cities')]
  TCITIES = class
  private
    FGUUID: String;
    FCITY: String;
    FIDSTATE: String;
    procedure SetCITY(const Value: String);
    procedure SetGUUID(const Value: String);
    procedure SetIDSTATE(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    [Campo('GUUID'), Pk]
    property GUUID : String read FGUUID write SetGUUID;
    [Campo('IDSTATE')]
    property IDSTATE : String read FIDSTATE write SetIDSTATE;
    [Campo('CITY')]
    property CITY : String read FCITY write SetCITY;
  end;

implementation

{ TCITIES }

constructor TCITIES.Create;
begin

end;

destructor TCITIES.Destroy;
begin

  inherited;
end;

procedure TCITIES.SetCITY(const Value: String);
begin
  FCITY := Value;
end;

procedure TCITIES.SetGUUID(const Value: String);
begin
  FGUUID := Value;
end;

procedure TCITIES.SetIDSTATE(const Value: String);
begin
  FIDSTATE := Value;
end;

end.
