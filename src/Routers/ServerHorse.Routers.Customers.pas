unit ServerHorse.Routers.Customers;

interface

uses
  System.JSON,
  Horse,
  Horse.Jhonson,
  Horse.CORS,
  ServerHorse.Controller;

procedure Registry;

implementation

uses
  System.Classes, ServerHorse.Controller.Interfaces,
  ServerHorse.Model.Entity.CUSTOMERS, System.SysUtils,
  ServerHorse.Utils;


procedure Registry;
begin
  THorse
  .Use(Jhonson)
  .Use(CORS)

  .Get('/customers',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TCUSTOMERS>;
    begin
      iController := TController.New.CUSTOMERS;
      iController.This
        .DAO
          .SQL
            .Where(TServerUtils.New.LikeFind(Req))
            .OrderBy(TServerUtils.New.OrderByFind(Req))
          .&End
        .Find;

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Post('/customers',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        TController.New.CUSTOMERS.This.Insert(vBody);
        Res.Status(200).Send('');
      except
        Res.Status(500).Send('');
      end;
    end)

  .Put('/customers',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        TController.New.CUSTOMERS.This.Update(vBody);
        Res.Status(200).Send('');
      except
        Res.Status(500).Send('');
      end;
    end)

  .Delete('/customers/:id',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      try
        TController.New.CUSTOMERS.This.Delete('ID', Req.Params['id']);
        Res.Status(200).Send('');
      except
        Res.Status(500).Send('');
      end;
    end);
end;

end.