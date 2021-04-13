unit ServerHorse.Model.Entity.COUNTRIES;

interface

uses
  SimpleAttributes;

type
  [Tabela('Countries')]
  TCOUNTRIES = class
  private
    FCOUNTRY: String;
    FGUUID: String;
    procedure SetCOUNTRY(const Value: String);
    procedure SetGUUID(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    [Campo('GUUID'), Pk]
    property GUUID : String read FGUUID write SetGUUID;
    [Campo('COUNTRY')]
    property COUNTRY : String read FCOUNTRY write SetCOUNTRY;

end;

implementation

{ TCOUNTRIES }

constructor TCOUNTRIES.Create;
begin

end;

destructor TCOUNTRIES.Destroy;
begin

  inherited;
end;

procedure TCOUNTRIES.SetCOUNTRY(const Value: String);
begin
  FCOUNTRY := Value;
end;

procedure TCOUNTRIES.SetGUUID(const Value: String);
begin
  FGUUID := Value;
end;

end.
