uses GraphABC;
begin
    //Делаем картинку
    var pic: picture;
    var w, h, r: integer;
    r := random(7);
    w := 507 div 10;
    h := 494 div 10;
    pic := picture.Create('Снимок3.png');
    case r of
        //Первый бордюр
        0:
            for var i := 0 to 1500 div w - 1 do
            begin
                pic.Draw(i * w, 20, w, h);
            end;
        //Второй бордюр
        1:
            begin
                for var i := 0 to 1500 div w div 2 do
                begin
                    if(i < 1500 div w div 2) then
                        pic.Draw(i * w * 2, 20 + h + 20, w, h);
                    pic.Draw(i * w * 2, 20 + h + 20, -w, h);
                end;
                pic.Draw((1500 div w div 2 + 1) * w * 2, 20 + h + 20, -w, h);
            end;
        //Третий бордюр
        2:
            for var i := 0 to 1500 div w - 1 do
            begin
                pic.Draw(i * w, 20 + h * 4 + 20 * 2, w, -h);
                pic.Draw(i * w, 20 + h * 2 + 20 * 2, w, h);
            end;
        //Четвёртый бордюр
        3:
            begin
                for var i := 0 to 1500 div w - 2 do
                begin
                    pic.Draw(i * w + w div 2, 20 + h * 6 + 20 * 3, w, -h);
                    pic.Draw(i * w, 20 + h * 4 + 20 * 3, w, h);
                end;
                pic.Draw((1500 div w - 1) * w, 20 + h * 4 + 20 * 3, w, h);
            end;
        //Пятый бордюр 
        4:
            for var i := 0 to 1500 div w div 2 do
            begin
                if(i < 1500 div w div 2) then
                    pic.Draw(i * w * 2, 20 * 5 + h * 6, w, h);
                pic.Draw(i * w * 2, 20 * 5 + h * 6, -w, h);
                if(i < 1500 div w div 2) then
                    pic.Draw(i * w * 2, 20 * 5 + h * 8, w, -h);
                pic.Draw(i * w * 2, 20 * 5 + h * 8, -w, -h);
            end;
        //Шестой бордюр
        5:
            begin
                for var i := 0 to 1500 div w - 1 do
                begin
                    pic.Draw(i * w, h * 10 + 20 * 6, w, -h);
                    pic.Draw(i * w - 2, h * 8 + 20 * 6, -w, h);
                end;
                pic.Draw(1500 div w * w - 2, h * 8 + 20 * 6, -w, h);
            end;
        //Седьмой бордюр
        6:
            begin
                for var i := 0 to 1500 div w - 24 do
                begin
                    pic.Draw(w * 2 + i * w * 4, 20 * 7 + h * 12, w, -h);
                end;
                for var i := 0 to 1500 div w - 1 do
                begin
                    pic.Draw(w * 4 * i, 20 * 7 + h * 12, -w, -h);
                    pic.Draw(i * w * 4, 20 * 7 + h * 10, w, h);
                    pic.Draw(w * 2 + w * 4 * i, 20 * 7 + h * 10, -w, h);
                end;
            end;
    end;
end.