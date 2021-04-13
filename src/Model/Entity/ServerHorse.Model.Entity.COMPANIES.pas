unit ServerHorse.Model.Entity.COMPANIES;

interface

uses
  SimpleAttributes;

type
  [Tabela('Companies')]
  TCOMPANIES = class
  private
    FIDAREASEXPERTISE: String;
    FPICTURE: String;
    FCNPJ: String;
    FIDCITY: String;
    FCOMPANYNAME: String;
    FCEP: String;
    FCOMPLEMENT: String;
    FNUMBER: Integer;
    FGUUID: String;
    FNEIGHBORHOOD: String;
    FADDRESS: String;
    FLOGO: String;
    FIDSTATE: String;
    FIDCOUNTRY: String;
    procedure SetADDRESS(const Value: String);
    procedure SetCEP(const Value: String);
    procedure SetCNPJ(const Value: String);
    procedure SetCOMPANYNAME(const Value: String);
    procedure SetCOMPLEMENT(const Value: String);
    procedure SetGUUID(const Value: String);
    procedure SetIDAREASEXPERTISE(const Value: String);
    procedure SetIDCITY(const Value: String);
    procedure SetIDSTATE(const Value: String);
    procedure SetLOGO(const Value: String);
    procedure SetNEIGHBORHOOD(const Value: String);
    procedure SetNUMBER(const Value: Integer);
    procedure SetPICTURE(const Value: String);
    procedure SetIDCOUNTRY(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    [Campo('GUUID'), Pk]
    property GUUID : String read FGUUID write SetGUUID;
    [Campo('COMPANYNAME')]
    property COMPANYNAME : String read FCOMPANYNAME write SetCOMPANYNAME;
    [Campo('CNPJ')]
    property CNPJ : String read FCNPJ write SetCNPJ;
    [Campo('IDAREASEXPERTISE')]
    property IDAREASEXPERTISE : String read FIDAREASEXPERTISE write SetIDAREASEXPERTISE;
    [Campo('IDCOUNTRY')]
    property IDCOUNTRY : String read FIDCOUNTRY write SetIDCOUNTRY;
    [Campo('IDSTATE')]
    property IDSTATE : String read FIDSTATE write SetIDSTATE;
    [Campo('IDCITY')]
    property IDCITY : String read FIDCITY write SetIDCITY;
    [Campo('LOGO')]
    property LOGO : String read FLOGO write SetLOGO;
    [Campo('CEP')]
    property CEP : String read FCEP write SetCEP;
    [Campo('ADDRESS')]
    property ADDRESS : String read FADDRESS write SetADDRESS;
    [Campo('NEIGHBORHOOD')]
    property NEIGHBORHOOD : String read FNEIGHBORHOOD write SetNEIGHBORHOOD;
    [Campo('NUMBER')]
    property NUMBER : Integer read FNUMBER write SetNUMBER;
    [Campo('COMPLEMENT')]
    property COMPLEMENT : String read FCOMPLEMENT write SetCOMPLEMENT;
    [Campo('PICTURE')]
    property PICTURE : String read FPICTURE write SetPICTURE;

end;

implementation

{ TCOMPANIES }

constructor TCOMPANIES.Create;
begin

end;

destructor TCOMPANIES.Destroy;
begin

  inherited;
end;

procedure TCOMPANIES.SetADDRESS(const Value: String);
begin
  FADDRESS := Value;
end;

procedure TCOMPANIES.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TCOMPANIES.SetCNPJ(const Value: String);
begin
  FCNPJ := Value;
end;

procedure TCOMPANIES.SetCOMPANYNAME(const Value: String);
begin
  FCOMPANYNAME := Value;
end;

procedure TCOMPANIES.SetCOMPLEMENT(const Value: String);
begin
  FCOMPLEMENT := Value;
end;

procedure TCOMPANIES.SetGUUID(const Value: String);
begin
  FGUUID := Value;
end;

procedure TCOMPANIES.SetIDAREASEXPERTISE(const Value: String);
begin
  FIDAREASEXPERTISE := Value;
end;

procedure TCOMPANIES.SetIDCITY(const Value: String);
begin
  FIDCITY := Value;
end;

procedure TCOMPANIES.SetIDCOUNTRY(const Value: String);
begin
  FIDCOUNTRY := Value;
end;

procedure TCOMPANIES.SetIDSTATE(const Value: String);
begin
  FIDSTATE := Value;
end;

procedure TCOMPANIES.SetLOGO(const Value: String);
begin
  FLOGO := Value;
end;

procedure TCOMPANIES.SetNEIGHBORHOOD(const Value: String);
begin
  FNEIGHBORHOOD := Value;
end;

procedure TCOMPANIES.SetNUMBER(const Value: Integer);
begin
  FNUMBER := Value;
end;

procedure TCOMPANIES.SetPICTURE(const Value: String);
begin
  FPICTURE := Value;
end;

end.
