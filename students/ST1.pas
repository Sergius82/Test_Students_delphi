unit ST1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  System.Rtti,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.ScrollBox, FMX.Grid, FMX.Layouts, FMX.Edit, FMX.TabControl, FMX.ListBox,
  FMX.Objects, FMX.Grid.Style, FireDAC.Phys.SQLiteWrapper.Stat, FMX.Memo.Types,
  FMX.Memo;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    FDQuery1: TFDQuery;
    Grid1: TGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    Layout1: TLayout;
    Z: TTabControl;
    Stud: TTabItem;
    Rez: TTabItem;
    F_text: TEdit;
    F_label: TLabel;
    I_text: TEdit;
    I_label: TLabel;
    Label4: TLabel;
    O_text: TEdit;
    O_label: TLabel;
    Kurs_CB: TComboBox;
    Image11: TImage;
    Label5: TLabel;
    BindSourceDB2: TBindSourceDB;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    FDQuery2: TFDQuery;
    Result_CB: TComboBox;
    Grid3: TGrid;
    BindSourceDB3: TBindSourceDB;
    FIO_stud_lb: TLabel;
    Kurs_lb: TLabel;
    BindSourceDB4: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB4: TLinkGridToDataSource;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Switch1: TSwitch;
    Label3: TLabel;
    Image3: TImage;
    Label9: TLabel;
    TabItem1: TTabItem;
    Random_Students: TMemo;
    Button2: TButton;
    Button1: TButton;
    Button4: TButton;
    Button3: TButton;
    Random_kurs: TMemo;
    Label10: TLabel;
    Label11: TLabel;
    Button5: TButton;
    Label12: TLabel;
    Add_Kurs_Result: TMemo;
    Button6: TButton;
    FDQuery3: TFDQuery;
    BindSourceDB5: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB5: TLinkGridToDataSource;
    TabItem2: TTabItem;
    Grid2: TGrid;
    Layout4: TLayout;
    FDQuery4: TFDQuery;
    BindSourceDB6: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB6: TLinkGridToDataSource;
    Button7: TButton;
    Memo1: TMemo;
    Function CreateLocalBD(Local_BD:string;clear:boolean):boolean;
    Function poo(s:string):string;
    function Refresh(Local_BD:string):boolean;
    function OnError(Edit:TEdit):string;
    function KursNameToId(special:string):string;
    function IdToKursName(id:string):string;
    function FIOtoThri(S:string):string;
    function NameToId(id:string):STRING;
    Function Grid_Width(G:TGrid):boolean;
    Function Update_Students():boolean;
    function Add_New_Students(kl:integer):boolean;
    Function RefreshCB(CB:TComboBox;Local_BD,Field:string):boolean;
    function Add_New(local_Bd,s1:string; kl:integer;Memo:Tmemo):boolean;
    Function Add_New_Students2():boolean;

    procedure Clear_forms;
    function Refresh_Table(Table:string):boolean;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Grid1CellClick(const Column: TColumn; const Row: Integer);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure RezClick(Sender: TObject);
    procedure Grid1Click(Sender: TObject);
    procedure Grid3Click(Sender: TObject);
    procedure Switch1Switch(Sender: TObject);
    procedure Result_CBChange(Sender: TObject);
    procedure Kurs_CBChange(Sender: TObject);
    procedure I_textChange(Sender: TObject);
    procedure F_textChange(Sender: TObject);
    procedure O_textChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Result_CBClick(Sender: TObject);
    procedure Grid3CellClick(const Column: TColumn; const Row: Integer);
    procedure Image3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure StudClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);

  private
    { Private declarations }
  public
    ADD_stud:integer;
    ADD_result:integer;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}



procedure TForm1.Button1Click(Sender: TObject);
var
s1,s2,local_Bd,id:string;
i,int,y:integer;
begin
 // Создаем БД
   CreateLocalBD('Students',true);
   CreateLocalBD('Kurs',true);
   CreateLocalBD('Result',true);
   CreateLocalBD('Stud_Result',true);

   Add_New('Students','FIO',10,Random_Students);
   Add_New('Kurs','special',10,Random_kurs);
   RefreshCB(Kurs_CB,'Kurs','special');
   Add_New('Result','Result',4,Add_Kurs_Result);
   RefreshCB(Result_CB,'Result','Result');

   Add_New_Students2;

   Refresh_Table('All');
   FdConnection1.ExecSQL('update Result set Result_int=id-1');




end;

procedure TForm1.Button4Click(Sender: TObject);
begin
// Создаем БД
 CreateLocalBD('Students',false);  // Таблица при старте не очищается
 CreateLocalBD('Kurs',true);
 CreateLocalBD('Result',true);
 CreateLocalBD('Stud_Result',false); // Таблица при старте не очищается

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 Add_New('Kurs','special',10,Random_kurs);
 RefreshCB(Kurs_CB,'Kurs','special');

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 Add_New('Result','Result',6,Add_Kurs_Result);
 RefreshCB(Result_CB,'Result','Result');
 FdConnection1.ExecSQL('update Result set Result_int=id-1');

end;

procedure TForm1.Button7Click(Sender: TObject);
begin
//Заполняем результат
     FDQuery1.SQL.Clear;
     FDQuery1.Active:=false;
     FDQuery1.SQL.Add('select * from Stud_Result where Result_id=1');
     FDQuery1.Active:=true;
     FDQuery1.First;

     While not(FDQuery1.Eof) do
      Begin
       FDQuery1.Edit;
       FDQuery1.FieldByName('Result_id').Text:=IntToStr(2+Random(4));
       FDQuery1.FieldByName('Date_create').Text:=DateToSTR(now);
       FDQuery1.Next;
      End;
    // FDQuery1.CommitUpdates;


FDQuery4.SQL.Clear;
FDQuery4.Active:=false;
FDQuery4.SQL.Add(memo1.Lines.Text)  ;

FDQuery4.Active:=true;

Grid_Width(Grid2);


end;

procedure TForm1.Button8Click(Sender: TObject);
begin
FDQuery4.SQL.Clear;
FDQuery4.Active:=false;
FDQuery4.SQL.Add(memo1.Lines.Text)  ;
FDQuery4.Active:=true;

Grid_Width(Grid2);
end;

//-------------------------------------------------------
function TForm1.NameToId(id:string):STRING;
  begin

     FDQuery1.SQL.Clear;
     FDQuery1.Active:=false;
     FDQuery1.SQL.Add('select FIO from Students where Id='+id );
     FDQuery1.Active:=true;
     FDQuery1.First;
     Result:=FDQuery1.Fields[0].Text;
      //dfg
  end;

function TForm1.KursNameToId(special:string):string;
  begin
     FDQuery1.SQL.Clear;
     FDQuery1.Active:=false;
     FDQuery1.SQL.Add('select Id from Kurs where special='+poo(special));
     FDQuery1.Active:=true;
     FDQuery1.First;
     Result:=FDQuery1.Fields[0].Text;
      //dfg
  end;

procedure TForm1.Kurs_CBChange(Sender: TObject);
begin
Update_Students;
end;

function TForm1.IdToKursName(id:string):string;
  begin

     FDQuery1.SQL.Clear;
     FDQuery1.Active:=false;
     FDQuery1.SQL.Add('select special from Kurs where id='+poo(id));
    // showmessage('select special from Kurs where id='+poo(id));
     FDQuery1.Active:=true;
     FDQuery1.First;
     Result:=FDQuery1.Fields[0].Text;
      //dfg
  end;

//-------------------------------------------------------------------------

function TForm1.Refresh(Local_BD:string):boolean;
begin
try
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from '+Local_BD);
  FDQuery1.Active:=true;
  Result:=true;
except
Result:=false;

end;

end;

procedure TForm1.Result_CBChange(Sender: TObject);
var
error,local_Bd, s1, s2:string;
begin

if ADD_result=0 then exit;

 try
   local_Bd:='Stud_Result';
   s1:='Result_id';
   if Result_CB.ItemIndex>-1 then
   FdConnection1.ExecSQL('update '+local_Bd+' set Result_id='+poo((Result_CB.ItemIndex+1).ToString)+' where Stud_id='+FDQuery2.FieldByName('id').Text);

  {
   if Result_CB.ItemIndex>-1 then
       FdConnection1.ExecSQL('delete from '+local_Bd+' where Stud_id='+FDQuery2.FieldByName('id').Text);
   //---

   s1:='Stud_id,Result_id';
   s2:=poo(FDQuery2.FieldByName('id').Text)+','+poo((Result_CB.ItemIndex+1).ToString);
   FdConnection1.ExecSQL('insert into '+local_Bd+' ('+s1+') VALUES('+s2+')');
   }
   FDQuery2.Refresh;
  except
   Showmessage('Ошибка - результат курса уже вводился!');
  end;
end;

procedure TForm1.Result_CBClick(Sender: TObject);
begin
  ADD_result:=1;
end;

procedure TForm1.RezClick(Sender: TObject);
begin
 Refresh_Table('Result');
 //fdquery
end;

procedure TForm1.StudClick(Sender: TObject);
begin
 Refresh_Table('Students');
end;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
 Refresh_Table('Result');

end;

function TForm1.poo(s:string):string;
  begin
   s:=trim(s);
   result:=chr(39)+s+chr(39);
  end;

Function TForm1.CreateLocalBD(Local_BD:string;clear:boolean):boolean;
var
  sSQL  : String;
  DBPath: string;

  function poo(s:string):string;
  begin
   result:=chr(39)+s+chr(39);
  end;
Begin
   FDConnection1.Params.Values['Database'] :='BD1';

   //----Проверка на сущестование БД если ее нет - создаем! ----
   try

      FdConnection1.Connected:=true;
         if clear=true then
          begin
             FdConnection1.ExecSQL('Drop TABLE '+Local_BD);
          end;

    except
    end;
    if Local_BD='Students' then
       begin
        FdConnection1.Connected:=true;
         sSQL:='CREATE TABLE if not exists '+Local_BD+' ( '+
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'+
          'FIO CHAR(50),'+
          'Year CHAR(15));';
        FdConnection1.ExecSQL(sSQL);
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('select * from '+Local_BD);
        FDQuery1.Active:=true;
        end;

       if Local_BD='Kurs' then
       begin
        FdConnection1.Connected:=true;
         sSQL:='CREATE TABLE if not exists '+Local_BD+' ( '+
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'+
          'special CHAR(150),'+
          'text CHAR(50));';
        FdConnection1.ExecSQL(sSQL);
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('select * from '+Local_BD);
        FDQuery1.Active:=true;
        end;

       if Local_BD='Result' then
       begin
        FdConnection1.Connected:=true;
         sSQL:='CREATE TABLE if not exists '+Local_BD+' ( '+
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'+
          'Result CHAR(50),'+
          'Result_int integer);';
        FdConnection1.ExecSQL(sSQL);
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('select * from '+Local_BD);
        FDQuery1.Active:=true;
        end;

       if Local_BD='Stud_Result' then
       begin
        FdConnection1.Connected:=true;
         sSQL:='CREATE TABLE if not exists '+Local_BD+' ( '+
        //  'id INTEGER PRIMARY KEY AUTOINCREMENT,'+
          'Stud_id INTEGER UNIQUE,'+
          'kurs_id INTEGER,'+
          'Result_id INTEGER  DEFAULT 1,'+
          'Date_create Char(50),'+
          'FOREIGN KEY(Stud_id) REFERENCES Students(id),'+
          'FOREIGN KEY(kurs_id) REFERENCES Kurs(id),'+
          'FOREIGN KEY(Result_id) REFERENCES Result(id));';

        FdConnection1.ExecSQL(sSQL);
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('select * from '+Local_BD);
        FDQuery1.Active:=true;
        end;
  //-----------------------------------------------------------------

End;

procedure TForm1.Grid1CellClick(const Column: TColumn; const Row: Integer);
begin
  if ADD_stud=1 then exit;//Отключаем пока идет ввод данных
 Clear_forms;
 FIOtoThri(NameToId(FDQuery3.FieldByName('id').Text));
 if FDQuery3.FieldByName('kurs_id').Text.Length>0 then
    Kurs_CB.ItemIndex:=StrToInt(FDQuery3.FieldByName('kurs_id').Text)-1
 else Kurs_CB.ItemIndex:=-1;
end;

procedure TForm1.Grid1Click(Sender: TObject);
begin
  if ADD_stud=1 then exit;//Отключаем пока идет ввод данных
 Clear_forms;
 FIOtoThri(NameToId(FDQuery3.FieldByName('id').Text));
 if FDQuery3.FieldByName('kurs_id').Text.Length>0 then
    Kurs_CB.ItemIndex:=StrToInt(FDQuery3.FieldByName('kurs_id').Text)-1
 else Kurs_CB.ItemIndex:=-1;
end;

procedure TForm1.Grid3CellClick(const Column: TColumn; const Row: Integer);
begin

 FIO_stud_lb.Text:=FDQuery2.FieldByName('FIO').Text;
 Kurs_lb.Text:=FDQuery2.FieldByName('special').Text;
 if FDQuery2.FieldByName('Result_id').Text.Length>0 then
    Result_CB.ItemIndex:=StrToInt(FDQuery2.FieldByName('Result_id').Text)-1
 else Result_CB.ItemIndex:=-1;
  ADD_result:=0;
end;

procedure TForm1.Grid3Click(Sender: TObject);
begin
 FIO_stud_lb.Text:=FDQuery2.FieldByName('FIO').Text;
 Kurs_lb.Text:=FDQuery2.FieldByName('special').Text;
 if FDQuery2.FieldByName('Result_id').Text.Length>0 then
    Result_CB.ItemIndex:=StrToInt(FDQuery2.FieldByName('Result_id').Text)-1
 else Result_CB.ItemIndex:=-1;
  ADD_result:=0;

end;


 procedure TForm1.Clear_forms;
  begin
   F_text.Text:='';
   I_text.Text:='';
   O_text.Text:='';
   Kurs_CB.ItemIndex:=-1;
  end;

procedure TForm1.Image11Click(Sender: TObject);
var
error,local_Bd, s1, s2,id:string;
y:integer;
begin
  if  ADD_stud=0
   then
   begin
    ADD_stud:=1;
    Grid1.ReadOnly:=true;
    Grid1.Enabled:=false;
    Clear_forms;
    Showmessage('Введите ФИО студента и специальность и еще раз нажмите на клавишу добавить');
    exit;
   end
  else
  begin

 error:='';
 error:=error+OnError(F_text)+' ';
 error:=error+OnError(I_text)+' ';
 error:=error+OnError(O_text)+' ';
 if  Kurs_CB.ItemIndex=-1 then  error:=error+'Курс';
 if error.Length>3 then
  begin
    showmessage('Введите не заполненые поля: '+error+' и еще раз нажмите на клавишу добавить');
    exit;
  end;

  Grid1.ReadOnly:=false;
  Grid1.Enabled:=true;
  y:=Random(32)+18;
  local_Bd:='Students';
  s1:='FIO,Year';
  s2:=poo(F_text.Text+' '+I_text.Text+' '+O_text.Text)+','+poo(y.ToString);
  FdConnection1.ExecSQL('insert into '+local_Bd+' ('+s1+') VALUES('+s2+')');
  Refresh(Local_BD);

  FDQuery1.Locate('fio',F_text.Text+' '+I_text.Text+' '+O_text.Text);
  id:=FDQuery1.FieldByName('id').Text;

  s2:=poo(id)+','+poo((Kurs_CB.ItemIndex+1).ToString);
  FdConnection1.ExecSQL('insert into Stud_Result (Stud_id,kurs_id) VALUES('+s2+')');


  Refresh(Local_BD);
  FDQuery3.Refresh;
  Showmessage('Запись добавлена');
  ADD_stud:=0;

  end;

end;


Function TForm1.Update_Students():boolean;
var
error,local_Bd, s1, s2:string;
begin

  if ADD_stud=1 then exit;//Отключаем пока идет ввод данных

 error:='';
 error:=error+OnError(F_text)+' ';
 error:=error+OnError(I_text)+' ';
 error:=error+OnError(O_text)+' ';
 if  Kurs_CB.ItemIndex=-1 then  error:=error+'Курс';
 if error.Length>3 then
  begin
 //   showmessage('Не заполнены следующие поля: '+error);
    exit;
  end;

  local_Bd:='Students';
  s1:='FIO';
  s2:=poo(F_text.Text+' '+I_text.Text+' '+O_text.Text)+','+poo((Kurs_CB.ItemIndex+1).ToString);
  FdConnection1.ExecSQL('update '+local_Bd+' set Fio='+poo(F_text.Text+' '+I_text.Text+' '+O_text.Text)+' where id='+poo(FDQuery3.FieldByName('id').Text));
  FdConnection1.ExecSQL('update Stud_Result set kurs_id='+poo((Kurs_CB.ItemIndex+1).ToString)+' where Stud_id='+poo(FDQuery3.FieldByName('id').Text));
//  ,Kurs='+poo((Kurs_CB.ItemIndex+1).ToString)+'
//   FdConnection1.ExecSQL('update '+local_Bd+'
  Refresh(Local_BD);
  FDQuery3.Refresh;
end;

procedure TForm1.Image1Click(Sender: TObject);
var
error,local_Bd, s1, s2:string;
begin

Update_Students;

end;

procedure TForm1.Image2Click(Sender: TObject);
var
error,local_Bd, s1, s2:string;
begin
 if ADD_stud=1 then exit;//Отключаем пока идет ввод данных
  local_Bd:='Students';
  FdConnection1.ExecSQL('delete from  Stud_Result where Stud_id='+poo(FDQuery3.FieldByName('id').Text));
  FdConnection1.ExecSQL('delete from '+local_Bd+' where id='+poo(FDQuery3.FieldByName('id').Text));
  Refresh(Local_BD);
  FDQuery3.Refresh;
  Showmessage('Запись удалена!');

end;

procedure TForm1.Image3Click(Sender: TObject);
 var
  local_Bd:string;
begin
 local_Bd:='Stud_Result';
 FdConnection1.ExecSQL('delete from '+local_Bd+' where Stud_id='+FDQuery2.FieldByName('id').Text);
 Refresh_Table('Result');
end;

procedure TForm1.I_textChange(Sender: TObject);
begin
Update_Students;
end;

function TForm1.OnError(Edit:TEdit):string;
var s:string;
begin
//Находим ошибки в заполнении полей и пердаем название поля с ошибкой
  if Edit.Text.Length>0
   then  Result:=''
   else
     Begin
      s:=Edit.Name;
      Delete(s, 2, s.Length);
      s:=s+'_label';        //Имя поля берется из названного аналогичным образом, что и поле Label (F_text и F_label)
      s:=(FindComponent(s) as tlabel).Text;
      Result:=s;
   //   Showmessage(' Не заполнено поле '+s );
     End;

end;


procedure TForm1.O_textChange(Sender: TObject);
begin
Update_Students;
end;

function TForm1.FIOtoThri(S:string):string;
Begin
 F_text.Text:=Trim(Copy(S,1,pos(' ',s)-1));
 delete(s,1,pos(' ',s));
 I_text.Text:=Trim(Copy(S,1,pos(' ',s)-1));
 delete(s,1,pos(' ',s));
 O_text.Text:=Trim(s);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 ADD_stud:=0;
 ADD_result:=0;
 try
    FDConnection1.Params.Values['Database'] :='BD1';
    Refresh_Table('All');
 except
   Showmessage('Ошибка при загрузке данных, пересоздаем БД');
    // Создаем БД
   CreateLocalBD('Students',true);
   CreateLocalBD('Kurs',true);
   CreateLocalBD('Result',true);
   CreateLocalBD('Stud_Result',true);

   Add_New('Students','FIO',120,Random_Students);
   Add_New('Kurs','special',10,Random_kurs);
   RefreshCB(Kurs_CB,'Kurs','special');
   Add_New('Result','Result',6,Add_Kurs_Result);
   RefreshCB(Result_CB,'Result','Result');
   FdConnection1.ExecSQL('update Result set Result_int=id-1');

   Add_New_Students2;

   Refresh_Table('All');


 end;

 Z.TabIndex:=0;

end;

procedure TForm1.F_textChange(Sender: TObject);
begin
Update_Students;
end;

// Выставляем ширину столбцов в гридах
Function TForm1.Grid_Width(G:TGrid):boolean;
var
i:integer;
Begin
  If G.Name='Grid1' then
  Begin
   G.Columns[0].Width:=25;
   G.Columns[1].Width:=250;
   G.Columns[2].Width:=250;
   G.Columns[3].Width:=30;
   G.Columns[4].Visible:=false;
  End;

  If G.Name='Grid3' then
  Begin
   G.Columns[0].Width:=25;
   G.Columns[1].Width:=250;
   G.Columns[2].Width:=250;
   G.Columns[3].Width:=250;
   G.Columns[4].Visible:=false; //Скрываем поле с Id результатом
  End;

  If G.Name='Grid2' then
    Begin
   G.Columns[0].Width:=250;
   for i := 1 to 8 do  G.Columns[i].Width:=130;



 //  G.Columns[4].Visible:=false;
  End;



End;


function TForm1.Add_New(local_Bd,s1:string; kl:integer;Memo:Tmemo):boolean;
var
s2:string;
i:integer;
begin
 if kl> Memo.Lines.Count then kl:= Memo.Lines.Count-1;
 for I := 0 to kl-1 do
  begin
     s2:=poo(Memo.Lines[i]);
     FdConnection1.ExecSQL('insert into '+local_Bd+' ('+s1+') VALUES('+s2+')');
  end;

end;

function TForm1.Add_New_Students(kl:integer):boolean;
var
s1,s2,local_Bd:string;
i:integer;
begin
  local_Bd:='Students';
  s1:='FIO';
  if kl> Random_Students.Lines.Count then kl:= Random_Students.Lines.Count;  // Не допускаем перебор значений
  for I := 1 to kl do
  begin
   s2:=poo(Random_Students.Lines[i]);
   if s2.Length<6 then begin showmessage('Недопустимое Имя '+s2)  end
   else FdConnection1.ExecSQL('insert into '+local_Bd+' ('+s1+') VALUES('+s2+')');

  end;
 

end;


Function TForm1.Add_New_Students2():boolean;
var
s1,s2,local_Bd,id:string;
i,int,y:integer;
begin
   Refresh('Students');
   FDQuery1.First;
   local_Bd:='Stud_Result';
   s1:='Stud_id,kurs_id';
   While not(FDQuery1.Eof) do
    begin
     randomize();
     int:=1+Random(10);
     y:=Random(32)+18;
     id:=FDQuery1.FieldByName('id').Text;
     s2:=id+','+int.ToString;
     try
      FdConnection1.ExecSQL('insert into '+local_Bd+' ('+s1+') VALUES('+s2+')');
     except;
      Showmessage('insert into '+local_Bd+' ('+s1+') VALUES('+s2+')')
     end;
     FdConnection1.ExecSQL('Update Students set Year='+poo(inttostr(y))+' where id='+poo(id));
     FDQuery1.Next;
    end;


end;


procedure TForm1.Button2Click(Sender: TObject);

begin
 Add_New('Students','FIO',10,Random_Students);

 Add_New_Students2;

end;

Function TForm1.RefreshCB(CB:TComboBox;Local_BD,Field:string):boolean;
Begin

  Refresh(Local_BD);
  CB.Items.Clear;
  FDQuery1.First;
  while  not(FDQuery1.Eof) do
   begin
    CB.Items.Add(FDQuery1.FieldByName(Field).Text);
    FDQuery1.Next;
   end;

End;

//Синхронизируем данные в БД и на форме
Function TForm1.Refresh_Table(Table:string):boolean;
  var
s1,s2,local_Bd:string;
begin

if (Table='Students')or(Table='All')  then
 Begin
  FDQuery3.Active:=false;
  FDQuery3.SQL.Text:='SELECT distinct s.id, s.FIO,k.special, s.year, sr.kurs_id  from  students s, kurs k, stud_result sr where sr.stud_id=s.id and sr.kurs_id=k.id';
  FDQuery3.Active:=true;

  // Обновляем значения в комбо боксе
  RefreshCB(Kurs_CB,'Kurs','special');
  //Выставляем ширину полей грида
  Grid_Width(Grid1);

 End;

if (Table='Result')or(Table='All')  then
 Begin
   if Switch1.IsChecked=true
 then
  begin
   FDQuery2.SQL.Text:='SELECT distinct s.id, s.fio,k.special,r.result,sr.result_id from Stud_Result sr, Students s, Kurs k left join result r on r.id=sr.Result_id WHERE sr.Stud_id=s.id AND sr.kurs_id=k.id and sr.result_id=1  ' ;
   FDQuery2.Active:=true;
   Grid_Width(Grid3);
  end
 else
 begin
  FDQuery2.SQL.Text:='SELECT distinct s.id, s.fio,k.special,r.result,sr.result_id  from Stud_Result sr, Students s, Kurs k left join result r on r.id=sr.Result_id WHERE sr.Stud_id=s.id AND sr.kurs_id=k.id and sr.result_id>0';
  FDQuery2.Active:=true;
  Grid_Width(Grid3);
 end;

 // Обновляем значения в комбо боксе
 RefreshCB(Result_CB,'Result','Result');
 //Выставляем ширину полей грида
 Grid_Width(Grid3);
 End;




end;

procedure TForm1.Button3Click(Sender: TObject);

begin
 Add_New_Students2;
// Refresh_Table('All');


end;



end.
