unit ServerHorse.Utils;

interface

uses
  Horse.HTTP;

type
  iServerUtils = interface
    ['{6789969D-BF76-432A-B482-86CED1FB8D10}']
    function LikeFind ( aReq : THorseRequest ) : String;
    function OrderByFind ( aReq : THorseRequest ) : String;
  end;

  TServerUtils = class(TInterfacedObject, iServerUtils)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iServerUtils;
    function LikeFind ( aReq : THorseRequest ) : String;
    function OrderByFind ( aReq : THorseRequest ) : String;

  end;
implementation

uses
  System.Classes, System.SysUtils;

{ TServerUtils }

constructor TServerUtils.Create;
begin

end;

destructor TServerUtils.Destroy;
begin

  inherited;
end;

function TServerUtils.LikeFind(aReq: THorseRequest): String;
var
  aSearch : string;
  FieldsList : TStringList;
  I: Integer;
begin
  FieldsList := TStringList.Create;
  Result := '';
  try
    try
      FieldsList.CommaText := aReq.Query['searchfields'];
      aSearch := aReq.Query['searchvalue'];
    except
      //
    end;

    if FieldsList.Count > 0 then
    begin
      for I := 0 to Pred(FieldsList.Count) do
        Result := Result + FieldsList[I] + ' LIKE ' + QuotedStr('%' + aSearch +'%') + ' OR ';

      Result := Copy(Result, 1, Length(Result) - 4);
    end;
  finally
    FieldsList.Free;
  end;
end;

class function TServerUtils.New: iServerUtils;
begin
  Result := Self.Create;
end;

function TServerUtils.OrderByFind(aReq: THorseRequest): String;
var
  aOrder, aSort : string;
  FieldsList : TStringList;
  I: Integer;
begin
  FieldsList := TStringList.Create;
  Result := '';

  try
    aSort := aReq.Query['sort'];
    aOrder := aReq.Query['order'];
  except
    //
  end;

  Result := aSort + ' ' + aOrder;
end;

end.
