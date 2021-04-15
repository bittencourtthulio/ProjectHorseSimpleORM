program ServidorHorse;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  System.Classes,
  Horse.ServerStatic,
  ServerHorse.Model.Connection in 'src\Model\Connection\ServerHorse.Model.Connection.pas',
  ServerHorse.Model.DAO in 'src\Model\DAO\ServerHorse.Model.DAO.pas',
  ServerHorse.Model.Entity.USERS in 'src\Model\Entity\ServerHorse.Model.Entity.USERS.pas',
  ServerHorse.Controller.Interfaces in 'src\Controller\ServerHorse.Controller.Interfaces.pas',
  ServerHorse.Controller in 'src\Controller\ServerHorse.Controller.pas',
  ServerHorse.Controller.Generic in 'src\Controller\ServerHorse.Controller.Generic.pas',
  ServerHorse.Routers.Users in 'src\Routers\ServerHorse.Routers.Users.pas',
  ServerHorse.Model.Entity.CUSTOMERS in 'src\Model\Entity\ServerHorse.Model.Entity.CUSTOMERS.pas',
  ServerHorse.Routers.Customers in 'src\Routers\ServerHorse.Routers.Customers.pas',
  ServerHorse.Utils in 'src\Utils\ServerHorse.Utils.pas',
  ServerHorse.Model.Entity.OCCUPATION in 'src\Model\Entity\ServerHorse.Model.Entity.OCCUPATION.pas',
  ServerHorse.Routers.Occupations in 'src\Routers\ServerHorse.Routers.Occupations.pas',
  ServerHorse.Model.Entity.COUNTRIES in 'src\Model\Entity\ServerHorse.Model.Entity.COUNTRIES.pas',
  ServerHorse.Routers.Countries in 'src\Routers\ServerHorse.Routers.Countries.pas',
  ServerHorse.Model.Entity.STATES in 'src\Model\Entity\ServerHorse.Model.Entity.STATES.pas',
  ServerHorse.Routers.States in 'src\Routers\ServerHorse.Routers.States.pas',
  ServerHorse.Model.Entity.CITIES in 'src\Model\Entity\ServerHorse.Model.Entity.CITIES.pas',
  ServerHorse.Routers.Cities in 'src\Routers\ServerHorse.Routers.Cities.pas',
  ServerHorse.Model.Entity.COMPANIES in 'src\Model\Entity\ServerHorse.Model.Entity.COMPANIES.pas',
  ServerHorse.Routers.Companies in 'src\Routers\ServerHorse.Routers.Companies.pas',
  ServerHorse.Model.Entity.AREASEXPERTISE in 'src\Model\Entity\ServerHorse.Model.Entity.AREASEXPERTISE.pas',
  ServerHorse.Routers.AreasExpertise in 'src\Routers\ServerHorse.Routers.AreasExpertise.pas',
  ServerHorse.Model.Entity.BANKACCOUNTS in 'src\Model\Entity\ServerHorse.Model.Entity.BANKACCOUNTS.pas',
  ServerHorse.Routers.BankAccounts in 'src\Routers\ServerHorse.Routers.BankAccounts.pas',
  ServerHorse.Model.Entity.TYPESBANKACCOUNTS in 'src\Model\Entity\ServerHorse.Model.Entity.TYPESBANKACCOUNTS.pas',
  ServerHorse.Routers.TypesBankAccounts in 'src\Routers\ServerHorse.Routers.TypesBankAccounts.pas';

begin
  ServerHorse.Routers.Users.Registry;
  ServerHorse.Routers.Customers.Registry;
  ServerHorse.Routers.Occupations.Registry;
  ServerHorse.Routers.Countries.Registry;
  ServerHorse.Routers.States.Registry;
  ServerHorse.Routers.Cities.Registry;
  ServerHorse.Routers.Companies.Registry;
  ServerHorse.Routers.AreasExpertise.Registry;
  ServerHorse.Routers.BankAccounts.Registry;
  ServerHorse.Routers.TypesBankAccounts.Registry;
  THorse.Use(ServerStatic('public'));
  THorse.Listen(9000);
end.
