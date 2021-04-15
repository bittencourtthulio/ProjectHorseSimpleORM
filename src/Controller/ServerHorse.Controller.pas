unit ServerHorse.Controller;

interface

uses
  ServerHorse.Model.Entity.USERS,
  ServerHorse.Controller.Generic,
  ServerHorse.Controller.Interfaces,
  ServerHorse.Model.Entity.CUSTOMERS,
  ServerHorse.Model.Entity.OCCUPATION,
  ServerHorse.Model.Entity.COUNTRIES,
  ServerHorse.Model.Entity.STATES,
  ServerHorse.Model.Entity.CITIES,
  ServerHorse.Model.Entity.COMPANIES,
  ServerHorse.Model.Entity.AREASEXPERTISE,
  ServerHorse.Model.Entity.BANKACCOUNTS,
  ServerHorse.Model.Entity.TYPESBANKACCOUNTS;

type
  TController = class(TInterfacedObject, iController)
    private
      FUsers : iControllerEntity<TUSERS>;
      FCustomers : iControllerEntity<TCUSTOMERS>;
      FOccupations : iControllerEntity<TOCCUPATION>;
      FCountries : iControllerEntity<TCOUNTRIES>;
      FStates : iControllerEntity<TSTATES>;
      FCities : iControllerEntity<TCITIES>;
      FCompanies : iControllerEntity<TCOMPANIES>;
      FAreasExpertise : iControllerEntity<TAREASEXPERTISE>;
      FBankAccounts : iControllerEntity<TBANKACCOUNTS>;
      FTYPESBANKACCOUNTS : iControllerEntity<TTYPESBANKACCOUNTS>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function AREASEXPERTISE : iControllerEntity<TAREASEXPERTISE>;
      function BANKACCOUNTS : iControllerEntity<TBANKACCOUNTS>;
      function CITIES : iControllerEntity<TCITIES>;
      function COMPANIES : iControllerEntity<TCOMPANIES>;
      function COUNTRIES : iControllerEntity<TCOUNTRIES>;
      function CUSTOMERS : iControllerEntity<TCUSTOMERS>;
      function OCCUPATION : iControllerEntity<TOCCUPATION>;
      function STATES : iControllerEntity<TSTATES>;
      function TYPESBANKACCOUNTS : iControllerEntity<TTYPESBANKACCOUNTS>;
      function USERS : iControllerEntity<TUSERS>;
  end;

implementation

{ TController }

function TController.AREASEXPERTISE: iControllerEntity<TAREASEXPERTISE>;
begin
  if not Assigned(FAreasExpertise) then
    FAreasExpertise := TControllerGeneric<TAREASEXPERTISE>.New(Self);

  Result := FAreasExpertise;
end;

function TController.BANKACCOUNTS: iControllerEntity<TBANKACCOUNTS>;
begin
  if not Assigned(FBankAccounts) then
    FBankAccounts := TControllerGeneric<TBANKACCOUNTS>.New(Self);

  Result := FBankAccounts;
end;

function TController.CITIES: iControllerEntity<TCITIES>;
begin
  if not Assigned(FCities) then
    FCities := TControllerGeneric<TCITIES>.New(Self);

  Result := FCities;
end;

function TController.COMPANIES: iControllerEntity<TCOMPANIES>;
begin
  if not Assigned(FCompanies) then
    FCompanies := TControllerGeneric<TCOMPANIES>.New(Self);

  Result := FCompanies;
end;

function TController.COUNTRIES: iControllerEntity<TCOUNTRIES>;
begin
  if not Assigned(FCountries) then
    FCountries := TControllerGeneric<TCOUNTRIES>.New(Self);

  Result := FCountries;
end;

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

function TController.OCCUPATION: iControllerEntity<TOCCUPATION>;
begin
  if not Assigned(FOccupations) then
    FOccupations := TControllerGeneric<TOCCUPATION>.New(Self);

    Result := FOccupations;
end;

function TController.STATES: iControllerEntity<TSTATES>;
begin
  if not Assigned(FStates) then
    FStates := TControllerGeneric<TSTATES>.New(Self);

  Result := FStates;
end;

function TController.TYPESBANKACCOUNTS: iControllerEntity<TTYPESBANKACCOUNTS>;
begin
  if not Assigned(FTYPESBANKACCOUNTS) then
    FTYPESBANKACCOUNTS := TControllerGeneric<TTYPESBANKACCOUNTS>.New(Self);

  Result := FTYPESBANKACCOUNTS;
end;

function TController.USERS: iControllerEntity<TUSERS>;
begin
  if not Assigned(FUsers) then
    FUsers := TControllerGeneric<TUSERS>.New(Self);

  Result := FUsers;
end;

end.
