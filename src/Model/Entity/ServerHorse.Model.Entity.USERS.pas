unit ServerHorse.Model.Entity.USERS;

interface

uses
  SimpleAttributes;

type
  [Tabela('Users')]
  TUsers = class
  private
    FNAME :String;
    FPHONE :Integer;
    FOCCUPATION :String;
    FID: integer;
    procedure SetNAME (const Value :String);
    function GetNAME :String;
    procedure SetPHONE (const Value :Integer);
    function GetPHONE :Integer;
    procedure SetOCCUPATION (const Value :String);
    function GetOCCUPATION :String;
    procedure SetID(const Value: integer);
  public
    constructor Create;
    destructor Destroy; override;
    [Campo('ID'), AutoInc, Pk]
    property ID : integer read FID write SetID;
    [Campo('NAME')]
    property NAME :String read GetNAME write SetNAME;
    [Campo('PHONE')]
    property PHONE :Integer read GetPHONE write SetPHONE;
    [Campo('OCCUPATION')]
    property OCCUPATION :String read GetOCCUPATION write SetOCCUPATION;
end;

implementation

constructor TUsers.Create;
begin

end;

destructor TUsers.Destroy;
begin

  inherited;
end;

procedure TUsers.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TUsers.SetNAME (const Value :String);
begin
  FNAME := Value;
end;

function TUsers.GetNAME :String;
begin
  Result := FNAME;
end;

procedure TUsers.SetPHONE (const Value :Integer);
begin
  FPHONE := Value;
end;

function TUsers.GetPHONE :Integer;
begin
  Result := FPHONE;
end;

procedure TUsers.SetOCCUPATION (const Value :String);
begin
  FOCCUPATION := Value;
end;

function TUsers.GetOCCUPATION :String;
begin
  Result := FOCCUPATION;
end;

end.
