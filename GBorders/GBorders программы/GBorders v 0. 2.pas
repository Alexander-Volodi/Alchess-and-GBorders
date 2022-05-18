uses GraphABC;

begin
    //Делаем картинку
    var pic: picture;
    var w, h, N: integer;
    w := 507 div 5;
    h := 494 div 5;
    N := 7;
    setwindowwidth(1950);
    setwindowheight(h * 2 + 20 * 2);
    SetWindowIsFixedSize(true);
    pic := picture.Create('Снимок3.png');
    CenterWindow;
    for var j := 0 to N - 1 do
    begin
        case j of
            //Первый бордюр
            0:
                begin
                    SetWindowCaption('Hop');
                    for var i := 0 to 1500 div w - 1 do
                    begin
                        pic.Draw(i * w, 20, w, h);
                    end;
                end;
            //Второй бордюр
            1:
                begin
                    SetWindowCaption('Sidle');
                    for var i := 0 to 1500 div w div 2 do
                    begin
                        if(i < 1500 div w div 2) then
                            pic.Draw(i * w * 2, 20, w, h);
                        pic.Draw(i * w * 2, 20, -w, h);
                    end;
                    
                end;
            //Третий бордюр
            2:
                begin
                    SetWindowCaption('Jump');
                    for var i := 0 to 1500 div w - 1 do
                    begin
                        pic.Draw(i * w, 20 + h * 2, w, -h);
                        pic.Draw(i * w, 20, w, h);
                    end;
                end;
            //Четвёртый бордюр
            3:
                begin
                    SetWindowCaption('Step');
                    for var i := 0 to 1500 div w - 2 do
                    begin
                        pic.Draw(i * w + w div 2, 20 + h * 2, w, -h);
                        pic.Draw(i * w, 20, w, h);
                    end;
                    pic.Draw((1500 div w - 1) * w, 20, w, h);
                end;
            //Пятый бордюр 
            4:
                begin
                    SetWindowCaption('Spinning Jump');
                    for var i := 0 to 1500 div w div 2 do
                    begin
                        if(i < 1500 div w div 2) then
                            pic.Draw(i * w * 2, 20, w, h);
                        pic.Draw(i * w * 2, 20, -w, h);
                        if(i < 1500 div w div 2) then
                            pic.Draw(i * w * 2, 20  + h * 2, w, -h);
                        pic.Draw(i * w * 2, 20  + h * 2, -w, -h);
                    end;
                end;
            //Шестой бордюр
            5:
                begin
                    SetWindowCaption('Spinning Hop');
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
                    SetWindowCaption('Spinning Sidle');
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
        sleep(3000);
        ClearWindow;
    end;
    CloseWindow;
end.