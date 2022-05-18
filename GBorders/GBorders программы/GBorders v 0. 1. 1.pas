uses GraphABC;

begin
    //Делаем картинку
    var pic: picture;
    var w, h, r: integer;
    r := random(7);
    w := 507 div 5;
    h := 494 div 5;
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
                        pic.Draw(i * w * 2, 20, w, h);
                    pic.Draw(i * w * 2, 20, -w, h);
                end;
                
            end;
        //Третий бордюр
        2:
            for var i := 0 to 1500 div w - 1 do
            begin
                pic.Draw(i * w, 20 + h * 2, w, -h);
                pic.Draw(i * w, 20, w, h);
            end;
        //Четвёртый бордюр
        3:
            begin
                for var i := 0 to 1500 div w - 2 do
                begin
                    pic.Draw(i * w + w div 2, 20 + h * 2, w, -h);
                    pic.Draw(i * w, 20, w, h);
                end;
                pic.Draw((1500 div w - 1) * w, 20, w, h);
            end;
        //Пятый бордюр 
        4:
            for var i := 0 to 1500 div w div 2 do
            begin
                if(i < 1500 div w div 2) then
                    pic.Draw(i * w * 2, 20, w, h);
                pic.Draw(i * w * 2, 20, -w, h);
                if(i < 1500 div w div 2) then
                    pic.Draw(i * w * 2, 20  + h * 2, w, -h);
                pic.Draw(i * w * 2, 20  + h * 2, -w, -h);
            end;
        //Шестой бордюр
        5:
            begin
                for var i := 0 to 1500 div w - 1 do
                begin
                    pic.Draw(i * w, h * 2 + 20, w, -h);
                    pic.Draw(i * w - 2, 20, -w, h);
                end;
                pic.Draw(1500 div w * w - 2, 20, -w, h);
            end;
        //Седьмой бордюр
        6:
            begin
                for var i := 0 to 1500 div w - 1 do
                begin
                    pic.Draw(w * 2 + i * w * 4, 20 + h * 2, w, -h);
                end;
                for var i := 0 to 1500 div w - 11 do
                begin
                    pic.Draw(w * 4 * i, 20 + h * 2, -w, -h);
                    pic.Draw(i * w * 4, 20, w, h);
                    pic.Draw(w * 2 + w * 4 * i, 20, -w, h);
                end;
            end;
    end;
end.