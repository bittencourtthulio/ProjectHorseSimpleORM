program ServidorHorse;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  System.Classes,
  ServerHorse.Model.Connection in 'src\Model\Connection\ServerHorse.Model.Connection.pas',
  ServerHorse.Model.DAO in 'src\Model\DAO\ServerHorse.Model.DAO.pas',
  ServerHorse.Model.Entity.USERS in 'src\Model\Entity\ServerHorse.Model.Entity.USERS.pas',
  ServerHorse.Controller.Interfaces in 'src\Controller\ServerHorse.Controller.Interfaces.pas',
  ServerHorse.Controller in 'src\Controller\ServerHorse.Controller.pas',
  ServerHorse.Controller.Generic in 'src\Controller\ServerHorse.Controller.Generic.pas',
  ServerHorse.Routers.Users in 'src\Routers\ServerHorse.Routers.Users.pas',
  ServerHorse.Model.Entity.CUSTOMERS in 'src\Model\Entity\ServerHorse.Model.Entity.CUSTOMERS.pas',
  ServerHorse.Routers.Customers in 'src\Routers\ServerHorse.Routers.Customers.pas',
  ServerHorse.Utils in 'src\Utils\ServerHorse.Utils.pas';

begin
  ServerHorse.Routers.Users.Registry;
  ServerHorse.Routers.Customers.Registry;
  THorse.Listen(9000);
end.
