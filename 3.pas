var
    Numbers: array[1..10] of Integer; 
    i: Integer;

begin
    for i := 1 to 10 do
    begin
        Numbers[i] := i; 
    end;

    WriteLn('Список элементов:');
    for i := 1 to 10 do
    begin
        Write(Numbers[i], ' ');
    end;

    WriteLn('Четные элементы списка:');
    for i := 1 to 10 do
    begin
        if Numbers[i] mod 2 = 0 then 
        begin
            Write(Numbers[i], ' ');
        end;
    end;
    WriteLn; 
end.
