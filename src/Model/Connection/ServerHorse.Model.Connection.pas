unit ServerHorse.Model.Connection;

interface

uses
  System.JSON,
  System.Generics.Collections,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  Data.DB,
  FireDAC.Comp.Client,
  Firedac.DApt,
  Firedac.Phys.FB,
  Firedac.Phys.SQLite,
  Firedac.Phys.SQLiteDef,
  Firedac.Phys.FBDef,
  Firedac.Phys.MySQLDef,
  Firedac.Phys.MySQL,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI;


var
  FDriver : TFDPhysMYSQLDriverLink;
  FConnList : TObjectList<TFDConnection>;

function Connected : Integer;
procedure Disconnected(IndexConn : Integer);

implementation

function Connected : Integer;
var
  IndexConn : Integer;
begin
  if not Assigned(FConnList) then
    FConnList := TObjectList<TFDConnection>.Create;

    FConnList.Add(TFDConnection.Create(nil));
    IndexConn := Pred(FConnList.Count);
    FConnList.Items[IndexConn].Params.DriverID := 'SQLite';
    FConnList.Items[IndexConn].Params.Database := '..\..\database\SimpleProject.db3';
    //FConnList.Items[IndexConn].Params.UserName := 'user';
    //1FConnList.Items[IndexConn].Params.Password := 'password';
    //FConnList.Items[IndexConn].Params.Add('Port=3306');
    //FConnList.Items[IndexConn].Params.Add('CharacterSet=utf8');
    //FConnList.Items[IndexConn].Params.Add('Server=xxx');
    FConnList.Items[IndexConn].Params.Add('LockingMode=Normal');
    FConnList.Items[IndexConn].Connected;
  Result := IndexConn;
end;

procedure Disconnected(IndexConn : Integer);
begin
  FConnList.Items[IndexConn].Connected := false;
  FConnList.Items[IndexConn].Free;
  FConnList.TrimExcess;
end;

end.
