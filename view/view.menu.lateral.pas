unit view.menu.lateral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TViewMenuLateral = class(TForm)
    pnlBackground: TPanel;
    pnlClose: TPanel;
    pnlHeader: TPanel;
    pnlLeft: TPanel;
    pnlBtnClose: TPanel;
    btnClose: TSpeedButton;
    pnlButtonMenu: TPanel;
    btnMenu: TSpeedButton;
    pnlMenu: TPanel;
    TimerMenu: TTimer;
    pnlBtnSuporte: TPanel;
    btnSuporte: TSpeedButton;
    pnlUser: TPanel;
    btnUser: TSpeedButton;
    pnlEmail: TPanel;
    btnEmail: TSpeedButton;
    pnlInstagram: TPanel;
    btnInstagram: TSpeedButton;
    pnlEstatistica: TPanel;
    btnLogin: TSpeedButton;
    lblTitulo: TLabel;
    Icones: TImageList;
    pnlBtnMinimizar: TPanel;
    btnMinimizar: TSpeedButton;
    pnlBtnMaximizar: TPanel;
    btnMaximizar: TSpeedButton;
    pnlFooter: TPanel;
    pnlCopyright: TPanel;
    lblCopyright: TLabel;
    pnlContent: TPanel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure TimerMenuTimer(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnMaximizarClick(Sender: TObject);
    procedure pnlCloseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewMenuLateral: TViewMenuLateral;

implementation

{$R *.dfm}

procedure TViewMenuLateral.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TViewMenuLateral.btnMaximizarClick(Sender: TObject);
begin // maximizar tela
  if WindowState = wsMaximized then
     WindowState := wsNormal
  else
    WindowState := wsMaximized;
end;

procedure TViewMenuLateral.btnMenuClick(Sender: TObject);
begin // no clique do bot�o
    // verifica se o menu est� vis�vel ou oculto e faz a anima��o
  if pnlMenu.Width = 0 then
  begin
    TimerMenu.Tag := 1;  // indicador de que o menu deve abrir
    TimerMenu.Enabled := True;
  end
  else
  begin
    TimerMenu.Tag := -1;  // indicador de que o menu deve fechar
    TimerMenu.Enabled := True;
  end;
end;

procedure TViewMenuLateral.btnMinimizarClick(Sender: TObject);
begin // mminimizar tela
  Application.Minimize;
end;

procedure TViewMenuLateral.FormCreate(Sender: TObject);
begin
   // inicializa o menu lateral com a largura 0 (oculto)
  pnlMenu.Width := 0;
  TimerMenu.Enabled := False;  // o timer inicialmente est� desativado

  // tooltip
  btnClose.Hint := 'Fechar';
  btnClose.ShowHint := True;

  btnMinimizar.Hint := 'Minimizar';
  btnMinimizar.ShowHint := True;

  btnMaximizar.Hint := 'Maximizar';
  btnMaximizar.ShowHint := True;

  btnMenu.Hint := 'Menu';
  btnMenu.ShowHint := True;
end;

procedure TViewMenuLateral.pnlCloseMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  const // mover o formul�rio sem bordas
  sc_DragMove = $f012;
begin
  inherited;
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TViewMenuLateral.TimerMenuTimer(Sender: TObject);
begin
  // controla a anima��o de abertura ou fechamento do menu
  if TimerMenu.Tag = 1 then
  begin
    // aumenta a largura do menu para mostrar
    if pnlMenu.Width < 200 then
      pnlMenu.Width := pnlMenu.Width + 200
    else
      TimerMenu.Enabled := False;  // parar anima��o quando atingir o tamanho m�ximo
  end
  else if TimerMenu.Tag = -1 then
  begin
    // diminui a largura do menu para esconder
    if pnlMenu.Width > 0 then
      pnlMenu.Width := pnlMenu.Width - 200
    else
      TimerMenu.Enabled := False;  // parar anima��o quando atingir o tamanho m�nimo
  end;
end;

end.
