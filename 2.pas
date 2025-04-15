type
    PWordRecord = ^TWordRecord;
    TWordRecord = record
        Word: string;
        Frequency: Integer;
        Next: PWordRecord;
    end;

var
    WordList: PWordRecord;  
    InputWord: string;
    Current, Prev: PWordRecord;
    WordCount: Integer;

procedure AddWord(const NewWord: string);
var
    Found: Boolean;
begin
    Found := False;
    Current := WordList;
    Prev := nil;

    // Проверяем, есть ли слово уже в списке
    while Current <> nil do
    begin
        if Current^.Word = NewWord then
        begin
            Current^.Frequency := Current^.Frequency + 1; 
            Found := True;
            Break;
        end;
        Prev := Current;
        Current := Current^.Next;
    end;

    if not Found then
    begin
        New(Current);
        Current^.Word := NewWord;
        Current^.Frequency := 1;
        Current^.Next := nil;
        
        if Prev = nil then
            WordList := Current
        else
            Prev^.Next := Current;
            
        Inc(WordCount);
    end;
end;

procedure FreeWordList;
var
    Temp: PWordRecord;
begin
    Current := WordList;
    while Current <> nil do
    begin
        Temp := Current;
        Current := Current^.Next;
        Dispose(Temp);
    end;
    WordList := nil;
end;

procedure PrintWordList;
var
    Temp: PWordRecord;
begin
    Temp := WordList;
    while Temp <> nil do
    begin
        WriteLn(Temp^.Word, ': ', Temp^.Frequency);
        Temp := Temp^.Next;
    end;
end;

begin
    WordList := nil;
    WordCount := 0;

    WriteLn('Введите текст (для завершения введите "exit"):');

    repeat
        ReadLn(InputWord);
        if InputWord <> 'exit' then
            AddWord(LowerCase(InputWord)); 
    until InputWord = 'exit';

    WriteLn('Количество различных слов: ', WordCount);

    WriteLn('Алфавитно-частотный словарь:');
    PrintWordList;

    FreeWordList;
end.
