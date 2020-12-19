unit ServerHorse.Controller;

interface

uses
  ServerHorse.Model.Entity.USERS,
  ServerHorse.Controller.Generic,
  ServerHorse.Controller.Interfaces;

type
  TController = class(TInterfacedObject, iController)
    private
      FUsers : iControllerEntity<TUSERS>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function USERS : iControllerEntity<TUSERS>;
  end;

implementation

{ TController }

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: iController;
begin
    Result := Self.Create;
end;

function TController.USERS: iControllerEntity<TUSERS>;
begin
  if not Assigned(FUsers) then
    FUsers := TControllerGeneric<TUSERS>.New(Self);

  Result := FUsers;
end;

end.
