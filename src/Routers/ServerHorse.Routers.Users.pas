unit ServerHorse.Routers.Users;

interface

uses
  System.JSON,
  Horse,
  Horse.Jhonson,
  Horse.CORS,
  ServerHorse.Controller,
  ServidorHorse.Sockets.Bird;

procedure Registry;

implementation


procedure Registry;
begin
  THorse
  .Use(Jhonson)
  .Use(CORS)

  .Get('/users',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send<TJsonArray>(TController.New.USERS.This.Find);
    end)

  .Post('/users',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        TController.New.USERS.This.Insert(vBody);
        Res.Status(200).Send('');

        ServidorHorse.Sockets.Bird.SendMessage(TController.New.USERS.This.Find.ToJSON);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Delete('/users/:id',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      try
        TController.New.USERS.This.Delete('ID', Req.Params['id']);
        Res.Status(200).Send('');
        ServidorHorse.Sockets.Bird.SendMessage(TController.New.USERS.This.Find.ToJSON);
      except
        Res.Status(500).Send('');
      end;
    end);
end;

end.
