unit ServerHorse.Routers.Cities;

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
  ServerHorse.Model.Entity.CITIES,
  System.SysUtils,
  ServerHorse.Utils,
  Horse.Paginate;


procedure Registry;
begin
  THorse
  .Use(Paginate)
  .Use(Jhonson)
  .Use(CORS)

  .Get('/cities',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TCITIES>;
    begin
      iController := TController.New.CITIES;
      iController.This
        .DAO
          .SQL
            .Fields('CITIES.*, ')
            .Fields('STATES.STATE AS STATE, ')
            .Fields('COUNTRIES.COUNTRY AS COUNTRY ')
            .Join('LEFT JOIN STATES ON STATES.GUUID = CITIES.IDSTATE ')
            .Join('LEFT JOIN COUNTRIES ON COUNTRIES.GUUID = STATES.IDCOUNTRY ')
            .Where(TServerUtils.New.LikeFind(Req))
            .OrderBy(TServerUtils.New.OrderByFind(Req))
          .&End
        .Find(False);

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Get('/cities/:ID',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TCITIES>;
    begin
      iController := TController.New.CITIES;
      iController.This
        .DAO
          .SQL
            .Fields('CITIES.*, ')
            .Fields('STATES.STATE AS STATE, ')
            .Fields('COUNTRIES.COUNTRY AS COUNTRY ')
            .Join('LEFT JOIN STATES ON STATES.GUUID = CITIES.IDSTATE ')
            .Join('LEFT JOIN COUNTRIES ON COUNTRIES.GUUID = STATES.IDCOUNTRY ')
            .Where('CITIES.GUUID = ' + QuotedStr('{' + Req.Params['ID'] + '}' ))
          .&End
        .Find(False);

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Post('/cities',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
      aGuuid: string;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        if not vBody.TryGetValue<String>('guuid', aGuuid) then
          vBody.AddPair('guuid', TServerUtils.New.AdjustGuuid(TGUID.NewGuid.ToString()));
        TController.New.CITIES.This.Insert(vBody);
        Res.Status(200).Send<TJsonObject>(vBody);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Put('/cities/:ID',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
      aGuuid: string;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        if not vBody.TryGetValue<String>('guuid', aGuuid) then
          vBody.AddPair('guuid', Req.Params['ID']);
        TController.New.CITIES.This.Update(vBody);
        Res.Status(200).Send<TJsonObject>(vBody);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Delete('/cities/:id',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      try
        TController.New.CITIES.This.Delete('guuid', QuotedStr(Req.Params['id']));
        Res.Status(200).Send('');
      except
        Res.Status(500).Send('');
      end;
    end);
end;

end.
