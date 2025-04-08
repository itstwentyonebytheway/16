type
    WordRecord = record
        Word: string;
        Frequency: Integer;
    end;

var
    Words: array of WordRecord;  
    WordCount: Integer;          
    InputWord: string;
    Found: Boolean;
    i: Integer;

procedure AddWord(const NewWord: string);
begin
    Found := False;
    // Проверяем, есть ли слово уже в массиве
    for var i := 0 to WordCount - 1 do
    begin
        if Words[i].Word = NewWord then
        begin
            Words[i].Frequency := Words[i].Frequency + 1; 
            Found := True;
            Break;
        end;
    end;

    if not Found then
    begin
        SetLength(Words, WordCount + 1);
        Words[WordCount].Word := NewWord;
        Words[WordCount].Frequency := 1;
        Inc(WordCount);
    end;
end;

begin
    WordCount := 0;

    WriteLn('Введите текст (для завершения введите "exit"):');

    repeat
        ReadLn(InputWord);
        if InputWord <> 'exit' then
            AddWord(LowerCase(InputWord)); 
    until InputWord = 'exit';

    WriteLn('Количество различных слов: ', WordCount);

    WriteLn('Алфавитно-частотный словарь:');
    for i := 0 to WordCount - 1 do
    begin
        WriteLn(Words[i].Word, ': ', Words[i].Frequency);
    end;

end.
