unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
fun=function (p: integer): integer; stdcall;
var
  Form1: TForm1;
  fun1: fun;
     hen: integer;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);


begin

hen:=LoadLibrary('Project2.dll');
if hen<>0 then
begin
@fun1:= GetProcAddress(hen,'Proisvedenie');
if @fun1<>nil then
Edit1.Text:= InttoStr(fun1(StrtoInt(Edit1.Text)));
end  ;
end;
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeLibrary(hen);
end;

end.
