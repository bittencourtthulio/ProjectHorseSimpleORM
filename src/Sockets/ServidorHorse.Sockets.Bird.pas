unit ServidorHorse.Sockets.Bird;

interface

uses
  Bird.Socket;

var
  FBirdSocket : TBirdSocket;

procedure Registry;
procedure SendMessage( aMsg : String);

implementation

uses
  System.SysUtils, System.Classes;

procedure Registry;
begin
    FBirdSocket := TBirdSocket.Create(8085);

    FBirdSocket.AddEventListener(TEventType.CONNECT,
      procedure(const ABird: TBirdSocketConnection)
      begin
        Writeln('Client Connect: ' + ABird.IPAdress)
      end);

      FBirdSocket.AddEventListener(TEventType.EXECUTE,
      procedure(const ABird: TBirdSocketConnection)
      var
        LMessage: string;
        LBird: TBirdSocketConnection;
      begin
        LMessage := ABird.WaitMessage;

         for LBird in FBirdSocket.Birds.Items do
          LBird.Send(LMessage);


        Writeln(Format('Message received from %s: %s.', [ABird.IPAdress, LMessage]));

      end);

    FBirdSocket.AddEventListener(TEventType.DISCONNECT,
      procedure(const ABird: TBirdSocketConnection)
      begin
        Write('Client Disconnect: ' + ABird.IPAdress)
      end);

    TThread.CreateAnonymousThread(
    procedure
    begin
      FBirdSocket.Start;
    end);

end;


procedure SendMessage( aMsg : String);
var
  LMessage: string;
  LBird: TBirdSocketConnection;
begin
  //LMessage := ABird.WaitMessage;

  for LBird in FBirdSocket.Birds.Items do
    LBird.Send(aMsg);

 // Writeln(Format('Message received from %s: %s.', [ABird.IPAdress, LMessage]));

end;

end.
