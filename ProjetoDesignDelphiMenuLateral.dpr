program ProjetoDesignDelphiMenuLateral;

uses
  Vcl.Forms,
  view.menu.lateral in 'view\view.menu.lateral.pas' {ViewMenuLateral};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewMenuLateral, ViewMenuLateral);
  Application.Run;
end.
