unit ServerHorse.Routers.States;

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
  ServerHorse.Model.Entity.STATES,
  System.SysUtils,
  ServerHorse.Utils,
  Horse.Paginate;


procedure Registry;
begin
  THorse
  .Use(Paginate)
  .Use(Jhonson)
  .Use(CORS)

  .Get('/states',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TSTATES>;
    begin
      iController := TController.New.STATES;
      iController.This
        .DAO
          .SQL
            .Fields('STATES.*, ')
            .Fields('COUNTRIES.COUNTRY AS COUNTRY ')
            .Join('LEFT JOIN COUNTRIES ON COUNTRIES.GUUID = STATES.IDCOUNTRY ')
            .Where(TServerUtils.New.LikeFind(Req))
            .OrderBy(TServerUtils.New.OrderByFind(Req))
          .&End
        .Find(False);

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Get('/states/:ID',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TSTATES>;
    begin
      iController := TController.New.STATES;
      iController.This
        .DAO
          .SQL
            .Fields('STATES.*, ')
            .Fields('COUNTRIES.COUNTRY AS COUNTRY ')
            .Join('LEFT JOIN COUNTRIES ON COUNTRIES.GUUID = STATES.IDCOUNTRY')
            .Where('STATES.GUUID = ' + QuotedStr(Req.Params['ID']))
          .&End
        .Find;

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Post('/states',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
      aGuuid: string;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        if not vBody.TryGetValue<String>('guuid', aGuuid) then
          vBody.AddPair('guuid', TServerUtils.New.AdjustGuuid(TGUID.NewGuid.ToString()));
        TController.New.STATES.This.Insert(vBody);
        Res.Status(200).Send<TJsonObject>(vBody);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Put('/states/:ID',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
      aGuuid: string;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        if not vBody.TryGetValue<String>('guuid', aGuuid) then
          vBody.AddPair('guuid', Req.Params['ID'] );
        TController.New.STATES.This.Update(vBody);
        Res.Status(200).Send<TJsonObject>(vBody);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Delete('/states/:id',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      try
        TController.New.STATES.This.Delete('guuid', QuotedStr(Req.Params['id']));
        Res.Status(200).Send('');
      except
        Res.Status(500).Send('');
      end;
    end);
end;

end.
