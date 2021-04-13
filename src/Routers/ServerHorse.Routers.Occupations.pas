unit ServerHorse.Routers.Occupations;

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
  System.Classes,
  ServerHorse.Controller.Interfaces,
  ServerHorse.Model.Entity.OCCUPATION,
  System.SysUtils,
  ServerHorse.Utils,
  Horse.Paginate;


procedure Registry;
begin
  THorse
  .Use(Paginate)
  .Use(Jhonson)
  .Use(CORS)

  .Get('/occupations',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TOCCUPATION>;
    begin
      iController := TController.New.OCCUPATION;
      iController.This
        .DAO
          .SQL
            .Where(TServerUtils.New.LikeFind(Req))
            .OrderBy(TServerUtils.New.OrderByFind(Req))
          .&End
        .Find;

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Get('/occupations/:ID',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TOCCUPATION>;
    begin
      iController := TController.New.OCCUPATION;
      iController.This
        .DAO
          .SQL
            .Where('GUUID = ' + QuotedStr(Req.Params['ID']))
          .&End
        .Find;

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Post('/occupations',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
      aGuuid: string;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        if not vBody.TryGetValue<String>('guuid', aGuuid) then
          vBody.AddPair('guuid', TServerUtils.New.AdjustGuuid(TGUID.NewGuid.ToString()));
        TController.New.OCCUPATION.This.Insert(vBody);
        Res.Status(200).Send<TJsonObject>(vBody);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Put('/occupations/:ID',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
      aGuuid: string;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        if not vBody.TryGetValue<String>('guuid', aGuuid) then
          vBody.AddPair('guuid', Req.Params['ID']);
        TController.New.OCCUPATION.This.Update(vBody);
        Res.Status(200).Send<TJsonObject>(vBody);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Delete('/occupations/:id',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      try
        TController.New.OCCUPATION.This.Delete('guuid', QuotedStr(Req.Params['id']));
        Res.Status(200).Send('');
      except
        Res.Status(500).Send('');
      end;
    end);
end;

end.
