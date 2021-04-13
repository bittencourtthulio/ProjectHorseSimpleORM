unit ServerHorse.Model.Entity.OCCUPATION;

interface

uses
  SimpleAttributes;

type
  [Tabela('Occupation')]
  TOCCUPATION = class
  private
    FDESCRIPTION :String;
    FGUUID: String;
    procedure SetDESCRIPTION (const Value :String);
    function GetDESCRIPTION :String;
    procedure SetGUUID(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    [Campo('GUUID'), Pk]
    property GUUID : String read FGUUID write SetGUUID;
    [Campo('DESCRIPTION')]
    property DESCRIPTION :String read GetDESCRIPTION write SetDESCRIPTION;
end;

implementation

constructor TOCCUPATION.Create;
begin

end;

destructor TOCCUPATION.Destroy;
begin

  inherited;
end;

procedure TOCCUPATION.SetGUUID(const Value: String);
begin
  FGUUID := Value;
end;

procedure TOCCUPATION.SetDESCRIPTION (const Value :String);
begin
  FDESCRIPTION := Value;
end;

function TOCCUPATION.GetDESCRIPTION :String;
begin
  Result := FDESCRIPTION;
end;


end.
