﻿var
    i: Integer;       
    i_ptr: ^Integer;  //Объявление указателя на целочисленную переменную 
begin
    i := 2;          
    
    i_ptr := @i;     //Присвоение указателю i_ptr адреса переменной i

    WriteLn('Значение, находящееся по адресу i_ptr: ', i_ptr^);
end.
