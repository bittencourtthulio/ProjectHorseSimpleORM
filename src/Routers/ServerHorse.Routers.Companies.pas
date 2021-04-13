unit ServerHorse.Routers.Companies;

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
  ServerHorse.Model.Entity.COMPANIES,
  System.SysUtils,
  ServerHorse.Utils,
  Horse.Paginate;


procedure Registry;
begin
  THorse
  .Use(Paginate)
  .Use(Jhonson)
  .Use(CORS)

  .Get('/companies',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TCOMPANIES>;
    begin
      iController := TController.New.COMPANIES;
      iController.This
        .DAO
          .SQL
            .Fields('COMPANIES.*, ')
            .Fields('AREASEXPERTISE.DESCRIPTION AS AREASEXPERTISE, ')
            .Fields('COUNTRIES.COUNTRY as COUNTRY, ')
            .Fields('STATES.STATE as STATE, ')
            .Fields('CITIES.CITY as CITY ')
            .Join('LEFT JOIN AREASEXPERTISE ON AREASEXPERTISE.GUUID = COMPANIES.IDAREASEXPERTISE')
            .Join('LEFT JOIN COUNTRIES ON COUNTRIES.GUUID = COMPANIES.IDCOUNTRY')
            .Join('LEFT JOIN STATES ON STATES.GUUID = COMPANIES.IDSTATE')
            .Join('LEFT JOIN CITIES ON CITIES.GUUID = COMPANIES.IDCITY')
            .Where(TServerUtils.New.LikeFind(Req))
            .OrderBy(TServerUtils.New.OrderByFind(Req))
          .&End
        .Find;

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Get('/companies/:ID',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TCOMPANIES>;
    begin
      iController := TController.New.COMPANIES;
      iController.This
        .DAO
          .SQL
            .Where('GUUID = ' + QuotedStr(Req.Params['ID']))
          .&End
        .Find;

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Post('/companies',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
      aGuuid: string;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        if not vBody.TryGetValue<String>('guuid', aGuuid) then
          vBody.AddPair('guuid', TServerUtils.New.AdjustGuuid(TGUID.NewGuid.ToString()));
        TController.New.COMPANIES.This.Insert(vBody);
        Res.Status(200).Send<TJsonObject>(vBody);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Put('/companies/:ID',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
      aGuuid: string;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        if not vBody.TryGetValue<String>('guuid', aGuuid) then
          vBody.AddPair('guuid', Req.Params['ID']);
        TController.New.COMPANIES.This.Update(vBody);
        Res.Status(200).Send<TJsonObject>(vBody);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Delete('/companies/:id',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      try
        TController.New.COMPANIES.This.Delete('guuid', QuotedStr(Req.Params['id']));
        Res.Status(200).Send('');
      except
        Res.Status(500).Send('');
      end;
    end);
end;

end.
