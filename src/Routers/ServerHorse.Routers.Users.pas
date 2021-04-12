unit ServerHorse.Routers.Users;

interface

uses
  System.JSON,
  Horse,
  Horse.Jhonson,
  Horse.OctetStream,
  Horse.CORS,
  ServerHorse.Controller;

procedure Registry;

implementation

uses
  System.Classes,
  ServerHorse.Controller.Interfaces,
  ServerHorse.Model.Entity.USERS,
  System.SysUtils,
  ServerHorse.Utils,
  Horse.Paginate, Vcl.Forms;


procedure Registry;
begin
  THorse
  .Use(Paginate)
  .Use(Jhonson)
  .Use(CORS)
  .Use(OctetStream)

  .Get('/users',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TUSERS>;
    begin
      iController := TController.New.USERS;
      iController.This
        .DAO
          .SQL
            .Where(TServerUtils.New.LikeFind(Req))
            .OrderBy(TServerUtils.New.OrderByFind(Req))
          .&End
        .Find;

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Get('/users/:ID',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      iController : iControllerEntity<TUSERS>;
    begin
      iController := TController.New.USERS;
      iController.This
        .DAO
          .SQL
            .Where('GUUID = ' + QuotedStr('{' + Req.Params['ID'] + '}' ))
          .&End
        .Find;

      Res.Send<TJsonArray>(iController.This.DataSetAsJsonArray);
    end)

  .Post('/users/stream', //Passado no atributo do campo imagem do front
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LStream: TMemoryStream;
    begin
      if not DirectoryExists((ExtractFilePath(application.exename))+'imagens\'+Req.Headers['Path']) then
        ForceDirectories((ExtractFilePath(application.exename))+'imagens\'+Req.Headers['Path']);

      LStream := Req.Body<TMemoryStream>;
      LStream.SaveToFile(extractfilepath(application.exename)+'imagens\'+Req.Headers['Path']+'\'+Req.Headers['FileName']);
      if Req.Headers['Host'] = 'localhost' then
       begin
         res.Send(extractfilepath(application.exename)+'imagens\'+Req.Headers['Path']+'\'+Req.Headers['FileName']).Status(201);
       end else
        begin
          Res.Send('http://'+Req.Headers['Host']+'/imagens/'+stringreplace(Req.Headers['Path'],'\','/',[rfReplaceAll, rfIgnoreCase])+'/'+Req.Headers['FileName']).Status(201);
        end;
    end)


  .Post('/users',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
      aGuuid: string;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        if not vBody.TryGetValue<String>('guuid', aGuuid) then
          vBody.AddPair('guuid', TGUID.NewGuid.ToString());
        TController.New.USERS.This.Insert(vBody);
        Res.Status(200).Send<TJsonObject>(vBody);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Put('/users/:ID',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      vBody : TJsonObject;
      aGuuid: string;
    begin
      vBody := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
      try
        if not vBody.TryGetValue<String>('guuid', aGuuid) then
          vBody.AddPair('guuid', '{' + Req.Params['ID'] + '}' );
        TController.New.USERS.This.Update(vBody);
        Res.Status(200).Send<TJsonObject>(vBody);
      except
        Res.Status(500).Send('');
      end;
    end)

  .Delete('/users/:id',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)

  var
    aTeste: string;
  begin
      try
        TController.New.USERS.This.Delete('guuid', QuotedStr('{' + Req.Params['id'] + '}'));
        Res.Status(200).Send('');
      except
        Res.Status(500).Send('');
      end;
    end);
end;

end.
