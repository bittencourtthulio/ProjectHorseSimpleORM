unit ServerHorse.Routers.BankAccounts;

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
  ServerHorse.Model.Entity.BANKACCOUNTS,
  System.SysUtils,
  ServerHorse.Utils,
  Horse.Paginate;


procedure Registry;
begin
  THorse
  .Use(Paginate)
  .Use(Jhonson)
  .Use(CORS)

  .Get('/bankaccounts',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TBANKACCOUNTS>;
    begin
      iController := TController.New.BANKACCOUNTS;
      iController.This
        .DAO
          .SQL
            .Fields('BANKACCOUNTS.*, ')
            .Fields('TYPESBANKACCOUNTS.DESCRIPTION AS TYPESBANKACCOUNTS ')
            .Where(TServerUtils.New.LikeFind(Req))
            .Join('LEFT JOIN TYPESBANKACCOUNTS ON TYPESBANKACCOUNTS.GUUID = BANKACCOUNTS.IDTYPESBANKACCOUNTS')
            .OrderBy(TServerUtils.New.OrderByFind(Req))
          .&End
        .Find;

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Get('/bankaccounts/:ID',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TBANKACCOUNTS>;
    begin
      iController := TController.New.BANKACCOUNTS;
      iController.This
        .DAO
          .SQL
            .Fields('BANKACCOUNTS.*, ')
            .Fields('TYPESBANKACCOUNTS.DESCRIPTION AS TYPESBANKACCOUNTS ')
            .Where('GUUID = ' + QuotedStr(Req.Params['ID']))
            .Join('LEFT JOIN TYPESBANKACCOUNTS ON TYPESBANKACCOUNTS.GUUID = BANKACCOUNTS.IDTYPESBANKACCOUNTS')
          .&End
        .Find;

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Post('/bankaccounts',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
      aGuuid: string;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        if not vBody.TryGetValue<String>('guuid', aGuuid) then
          vBody.AddPair('guuid', TServerUtils.New.AdjustGuuid(TGUID.NewGuid.ToString()));
        TController.New.BANKACCOUNTS.This.Insert(vBody);
        Res.Status(200).Send<TJsonObject>(vBody);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Put('/bankaccounts/:ID',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
      aGuuid: string;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        if not vBody.TryGetValue<String>('guuid', aGuuid) then
          vBody.AddPair('guuid', Req.Params['ID'] );
        TController.New.BANKACCOUNTS.This.Update(vBody);
        Res.Status(200).Send<TJsonObject>(vBody);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Delete('/bankaccounts/:id',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      try
        TController.New.BANKACCOUNTS.This.Delete('guuid', QuotedStr(Req.Params['id']));
        Res.Status(200).Send('');
      except
        Res.Status(500).Send('');
      end;
    end);
end;

end.
