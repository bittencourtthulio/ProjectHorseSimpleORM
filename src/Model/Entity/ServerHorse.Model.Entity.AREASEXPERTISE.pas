unit ServerHorse.Model.Entity.AREASEXPERTISE;

interface

uses
  SimpleAttributes;

type
  [Tabela('AreasExpertise')]
  TAREASEXPERTISE = class
  private
    FGUUID: String;
    FDESCRIPTION: String;
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

{ TAREASEXPERTISE }

constructor TAREASEXPERTISE.Create;
begin

end;

destructor TAREASEXPERTISE.Destroy;
begin

  inherited;
end;

procedure TAREASEXPERTISE.SetDESCRIPTION(const Value: String);
begin
  FDESCRIPTION := Value;
end;

procedure TAREASEXPERTISE.SetGUUID(const Value: String);
begin
  FGUUID := Value;
end;

end.
