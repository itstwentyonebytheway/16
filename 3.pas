type
  PNode = ^TNode;  // Указатель на узел
  TNode = record   // Сам узел
    Value: Integer;
    Next: PNode;   // Ссылка на следующий элемент
  end;

var
  Head, Current, NewNode: PNode;
  i: Integer;

begin
  Head := nil;  
   
  for i := 1 to 10 do
  begin
    New(NewNode);             // Выделяем память под новый узел
    NewNode^.Value := i;      // Записываем значение
    NewNode^.Next := Head;    // Новый узел теперь указывает на старый Head
    Head := NewNode;          // Перемещаем Head на новый узел
  end;

  writeln('Полный список (в обратном порядке, так как добавляли в начало):');
  Current := Head;
  while Current <> nil do
  begin
    write(Current^.Value, ' ');
    Current := Current^.Next;
  end;
  writeln;

  writeln('Четные элементы списка:');
  Current := Head;
  while Current <> nil do
  begin
    if Current^.Value mod 2 = 0 then
      write(Current^.Value, ' ');
    Current := Current^.Next;
  end;
  writeln;

  Current := Head;
  while Current <> nil do
  begin
    NewNode := Current^.Next;  // Запоминаем следующий узел
    Dispose(Current);          // Освобождаем текущий
    Current := NewNode;        // Переходим к следующему
  end;
end.
