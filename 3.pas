type
  TArray = array[1..10] of Integer;

var
  MyList: TArray;
  i: Integer;

begin
  for i := 1 to 10 do
    MyList[i] := i;

  writeln('Полный список:');
  for i := 1 to 10 do
    write(MyList[i], ' ');
  writeln;

  writeln('Четные элементы списка:');
  for i := 1 to 10 do
  begin
    if MyList[i] mod 2 = 0 then
      write(MyList[i], ' ');
  end;
  writeln;
end.
