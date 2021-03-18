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
  aSearch, aFields : string;
  FieldsList : TStringList;
  I: Integer;
begin
  FieldsList := TStringList.Create;
  Result := '';
  aFields := '';
  try
    aReq.Query.TryGetValue('searchfields', aFields);
    aReq.Query.TryGetValue('searchvalue', aSearch);
    FieldsList.CommaText := aFields;

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
begin
  FieldsList := TStringList.Create;
  Result := '';
  aReq.Query.TryGetValue('sort', aSort);
  aReq.Query.TryGetValue('order', aOrder);
  Result := aSort + ' ' + aOrder;
end;

end.
