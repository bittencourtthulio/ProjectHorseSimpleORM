unit ServerHorse.Controller;

interface

uses
  ServerHorse.Model.Entity.USERS,
  ServerHorse.Controller.Generic,
  ServerHorse.Controller.Interfaces,
  ServerHorse.Model.Entity.CUSTOMERS;

type
  TController = class(TInterfacedObject, iController)
    private
      FUsers : iControllerEntity<TUSERS>;
      FCustomers : iControllerEntity<TCUSTOMERS>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function USERS : iControllerEntity<TUSERS>;
      function CUSTOMERS : iControllerEntity<TCUSTOMERS>;
  end;

implementation

{ TController }

constructor TController.Create;
begin

end;

function TController.CUSTOMERS: iControllerEntity<TCUSTOMERS>;
begin
  if not Assigned(FCustomers) then
    FCustomers := TControllerGeneric<TCUSTOMERS>.New(Self);

  Result := FCustomers;
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
