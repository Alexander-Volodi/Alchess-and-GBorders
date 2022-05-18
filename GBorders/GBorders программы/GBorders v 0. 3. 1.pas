uses GraphABC, ABCButtons;

begin
    setwindowwidth(2000);
    setwindowheight(1000);
    CenterWindow;
    SetWindowIsFixedSize(true);
    SetWindowCaption('GBorders v 0. 3');
    var pic: picture;
        var w, h, N: integer;
        w := 507 div 10;
        h := 494 div 10;
        N := 7;
        pic := picture.Create('Снимок3.png');
    //Первый бордюр
    for var i:=0 to 1500 div w - 1 do
    begin
        pic.Draw(i * w, 20, w, h);
    end;
    //Второй бордюр
    for var i:=0 to 1500 div w div 2 do
    begin
        if(i < 1500 div w div 2)then
        pic.Draw(i * w * 2, 20 + h + 20, w, h);
        pic.Draw(i * w * 2, 20 + h + 20, -w, h);
    end;
    //Третий бордюр
    for var i:=0 to 1500 div w - 1 do
    begin
        pic.Draw(i * w, 20 + h * 4 + 20 * 2,w, -h);
        pic.Draw(i * w, 20 + h * 2 + 20 * 2,w, h);
    end;
    //Четвёртый бордюр
    for var i:=0 to 1500 div w - 2 do
    begin
        pic.Draw(i * w + w div 2, 20 + h * 6 + 20 * 3,w, -h);
        pic.Draw(i * w, 20 + h * 4 + 20 * 3,w, h);
    end;
    pic.Draw((1500 div w - 1) * w, 20 + h * 4 + 20 * 3,w, h);
    //Пятый бордюр 
    for var i:=0 to 1500 div w div 2 do
    begin
        if(i < 1500 div w div 2)then
        pic.Draw(i * w * 2,20 * 5 + h * 6, w, h);
        pic.Draw(i * w * 2,20 * 5 + h * 6, -w, h);
        if(i < 1500 div w div 2)then
        pic.Draw(i * w * 2,20 * 5 + h * 8, w, -h);
        pic.Draw(i * w * 2,20 * 5 + h * 8, -w, -h);
    end;
    //Шестой бордюр
    for var i:=0 to 1500 div w - 1 do
    begin
        pic.Draw(i * w, h * 10 + 20 * 6,w, -h);
        pic.Draw(i * w - 2, h * 8 + 20 * 6,-w, h);
    end;
    pic.Draw(1500 div w * w - 2, h * 8 + 20 * 6,-w, h);
    //Седьмой бордюр
    for var i:=0 to 1500 div w - 24 do
    begin       
        pic.Draw(w * 2 + i * w * 4,20 * 7 + h * 12, w, -h);
    end;
    for var i:=0 to 1500 div w - 1 do
    begin       
        pic.Draw(w * 4 * i,20 * 7 + h * 12, -w, -h);
        pic.Draw(i * w * 4,20 * 7 + h * 10, w, h);
        pic.Draw(w * 2 + w * 4 * i,20 * 7 + h * 10, -w, h);
    end;   
    var b := new ButtonABC(700, 300, 50, 'Theory', clwhite);
    b.OnClick := procedure ->
    begin
        ClearWindow;
        SetFontSize(15);
        //200 191 231
        //Делаем картинку
        SetFontName('Constantia');
        w := 507 div 5;
        h := 494 div 5;
        setwindowwidth(1950);
        setwindowheight(h * 2 + 20 * 2);
        SetWindowIsFixedSize(true);
        SetWindowCaption('Borders');
        CenterWindow;
        FloodFill(1500,5,clwhite);
        for var j := 0 to N - 1 do
        begin
            case j of
                //Первый бордюр
                0:
                    begin
                        textout(700, 5, 'Hop');
                        for var i := 0 to 1500 div w - 1 do
                        begin
                            pic.Draw(i * w, 30, w, h);
                        end;
                    end;
                //Второй бордюр
                1:
                    begin
                        textout(700, 1, 'Sidle');
                        for var i := 0 to 1500 div w div 2 do
                        begin
                            if(i < 1500 div w div 2) then
                                pic.Draw(i * w * 2, 30, w, h);
                            pic.Draw(i * w * 2, 30, -w, h);
                        end;
                        
                    end;
                //Третий бордюр
                2:
                    begin
                        textout(700, 1, 'Jump');
                        for var i := 0 to 1500 div w - 1 do
                        begin
                            pic.Draw(i * w, 30 + h * 2, w, -h);
                            pic.Draw(i * w, 30, w, h);
                        end;
                    end;
                //Четвёртый бордюр
                3:
                    begin
                        textout(700, 1, 'Step');
                        for var i := 0 to 1500 div w - 2 do
                        begin
                            pic.Draw(i * w + w div 2, 30 + h * 2, w, -h);
                            pic.Draw(i * w, 30, w, h);
                        end;
                        pic.Draw((1500 div w - 1) * w, 30, w, h);
                    end;
                //Пятый бордюр
                4:
                    begin
                        textout(700, 1, 'Spinning Jump');
                        for var i := 0 to 1500 div w div 2 do
                        begin
                            if(i < 1500 div w div 2) then
                                pic.Draw(i * w * 2, 30, w, h);
                            pic.Draw(i * w * 2, 30, -w, h);
                            if(i < 1500 div w div 2) then
                                pic.Draw(i * w * 2, 30  + h * 2, w, -h);
                            pic.Draw(i * w * 2, 30  + h * 2, -w, -h);
                        end;
                    end;
                //Шестой бордюр
                5:
                    begin
                        textout(700, 1, 'Spinning Hop');
                        for var i := 0 to 1500 div w - 1 do
                        begin
                            pic.Draw(i * w, h * 2 + 30, w, -h);
                            pic.Draw(i * w - 2, 30, -w, h);
                        end;
                        pic.Draw(1500 div w * w - 2, 30, -w, h);
                    end;
                //Седьмой бордюр
                6:
                    begin
                        textout(700, 1, 'Spinning Sidle');
                        for var i := 0 to 1500 div w - 1 do
                        begin
                            pic.Draw(w * 2 + i * w * 4, 30 + h * 2, w, -h);
                        end;
                        for var i := 0 to 1500 div w - 11 do
                        begin
                            pic.Draw(w * 4 * i, 30 + h * 2, -w, -h);
                            pic.Draw(i * w * 4, 30, w, h);
                            pic.Draw(w * 2 + w * 4 * i, 30, -w, h);
                        end;
                    end; 
            end;
            sleep(3000);
            ClearWindow;
        end;
        CloseWindow;
    end;
    
end.