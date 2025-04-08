type
    PNode = ^TNode;
    TNode = record
        Data: Integer;
        Next: PNode;
    end;

var
    Head: PNode; 
    Current: PNode;
    MaxValue, MinValue: Integer;
    i, N, Value: Integer;

begin
    Head := nil; 

    Write('Введите количество элементов в списке: ');
    ReadLn(N);

    for i := 1 to N do
    begin
        New(Current); 
        Write('Введите элемент ', i, ': ');
        ReadLn(Value);
        Current^.Data := Value; 
        Current^.Next := Head; 
        Head := Current;
    end;

    if Head <> nil then
    begin
        MaxValue := Head^.Data;
        MinValue := Head^.Data;

        Current := Head; 

        while Current <> nil do
        begin
            if Current^.Data > MaxValue then
                MaxValue := Current^.Data;
            if Current^.Data < MinValue then
                MinValue := Current^.Data;
            Current := Current^.Next; // Переход к следующему узлу
        end;

        WriteLn('Максимальный элемент в списке: ', MaxValue);
        WriteLn('Минимальный элемент в списке: ', MinValue);
    end
    else
    begin
        WriteLn('Список пуст.');
    end;

end.
