unit ServerHorse.Controller.Interfaces;

interface

uses
  ServerHorse.Model.DAO,
  ServerHorse.Model.Entity.USERS,
  ServerHorse.Model.Entity.CUSTOMERS;

type
  iControllerEntity<T : class> = interface;

  iController = interface
    ['{6A60E341-CB38-4034-B924-FB9B49D98577}']
    function USERS : iControllerEntity<TUSERS>;
    function CUSTOMERS : iControllerEntity<TCUSTOMERS>;
  end;

  iControllerEntity<T : class> = interface
    ['{F7476B60-A9B9-48CA-B1B6-016DADEA41D6}']
    function This : iDAOGeneric<T>;
    function &End : iController;
  end;

implementation

end.
