uses GraphABC, ABCButtons;

begin
    //Загрузка главного окна
    setwindowwidth(1537);
    setwindowheight(830);
    CenterWindow;
    SetWindowIsFixedSize(true);
    SetWindowCaption('GBorders v 0. 5. 1');
    var pic: picture;
    var w, h, N, r: integer;
    w := 507 div 10;
    h := 494 div 10;
    N := 7;
    pic := picture.Create('Снимок3.png');
    //Первый бордюр
    for var i := 0 to 1500 div w - 1 do
    begin
        pic.Draw(i * w, 30, w, h);
    end;
    //Второй бордюр
    for var i := 0 to 1500 div w div 2 do
    begin
        if(i < 1500 div w div 2) then
            pic.Draw(i * w * 2, 30 + h + 20, w, h);
        pic.Draw(i * w * 2, 30 + h + 20, -w, h);
    end;
    //Третий бордюр
    for var i := 0 to 1500 div w - 1 do
    begin
        pic.Draw(i * w, 30 + h * 4 + 20 * 2, w, -h);
        pic.Draw(i * w, 30 + h * 2 + 20 * 2, w, h);
    end;
    //Четвёртый бордюр
    for var i := 0 to 1500 div w - 2 do
    begin
        pic.Draw(i * w + w div 2, 30 + h * 6 + 20 * 3, w, -h);
        pic.Draw(i * w, 30 + h * 4 + 20 * 3, w, h);
    end;
    pic.Draw((1500 div w - 1) * w, 30 + h * 4 + 20 * 3, w, h);
    //Пятый бордюр 
    for var i := 0 to 1500 div w div 2 do
    begin
        if(i < 1500 div w div 2) then
            pic.Draw(i * w * 2,30+ 20 * 4 + h * 6, w, h);
        pic.Draw(i * w * 2,30 + 20 * 4 + h * 6, -w, h);
        if(i < 1500 div w div 2) then
            pic.Draw(i * w * 2,30 + 20 * 4 + h * 8, w, -h);
        pic.Draw(i * w * 2,30 + 20 * 4 + h * 8, -w, -h);
    end;
    //Шестой бордюр
    for var i := 0 to 1500 div w - 1 do
    begin
        pic.Draw(i * w,30 + h * 10 + 20 * 5, w, -h);
        pic.Draw(i * w - 2,30 + h * 8 + 20 * 5, -w, h);
    end;
    pic.Draw(1500 div w * w - 2,30 + h * 8 + 20 * 5, -w, h);
    //Седьмой бордюр
    for var i := 0 to 1500 div w - 24 do
    begin
        pic.Draw(w * 2 + i * w * 4,30 + 20 * 6 + h * 12, w, -h);
    end;
    for var i := 0 to 1500 div w - 1 do
    begin
        pic.Draw(w * 4 * i,30 + 20 * 6 + h * 12, -w, -h);
        pic.Draw(i * w * 4,30 + 20 * 6 + h * 10, w, h);
        pic.Draw(w * 2 + w * 4 * i,30 + 20 * 6 + h * 10, -w, h);
    end;   
    var a := new ButtonABC(500, 315, 100,75, 'Theory', clwhite);
    var b := new ButtonABC(900, 315, 100,75, 'Exercise', clwhite);
    //Теория
    a.OnClick := procedure ->
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
        FloodFill(1500, 5, clwhite);
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
        closewindow;
    end;
    b.OnClick := procedure ->
    
    begin
        r := random(7);
        clearwindow;
        SetWindowCaption('What is it?');
        setwindowwidth(1950);
        setwindowheight(h * 2 + 430);
        SetWindowIsFixedSize(true);
        CenterWindow;
        var ho := new buttonABC(200, 40 + 180, 1000, 30, 'Hop', clwhite);
        var s := new buttonABC(200, 80 + 180, 1000, 30, 'Sidle', clwhite);
        var j := new buttonABC(200, 120 + 180, 1000, 30, 'Jump', clwhite);
        var st := new buttonABC(200, 160 + 180, 1000, 30, 'Step', clwhite);
        var sj := new buttonABC(200, 200 + 180, 1000, 30, 'Spinning Jump', clwhite);
        var sh := new buttonABC(200, 240 + 180, 1000, 30, 'Spinning Hop', clwhite);
        var ss := new buttonABC(200, 280 + 180, 1000, 30, 'Spinning Sidle', clwhite);
        
        case r of
            //Первый бордюр
            0:
                begin
                    for var i := 0 to 1500 div w - 1 do
                    begin
                        pic.Draw(i * w, 20, w, h);
                    end;
                    ho.OnClick := procedure ->
                    begin
                        textout(650, 180, 'Yes,correct');
                        sleep(3000);
                        closewindow;
                    end;
                    s.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    j.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    st.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    
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
                    ho.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    s.OnClick := procedure ->
                    begin
                        textout(650, 180, 'Yes,correct');
                        sleep(3000);
                        closewindow;
                    end;
                    j.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    st.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    
                    
                end;
            //Третий бордюр
            2:
                begin
                    
                    for var i := 0 to 1500 div w - 1 do
                    begin
                        pic.Draw(i * w, 20 + h * 2, w, -h);
                        pic.Draw(i * w, 20, w, h);
                    end;
                    ho.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    s.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    j.OnClick := procedure ->
                    begin
                        textout(650, 180, 'Yes,correct');
                        sleep(3000);
                        closewindow;
                    end;
                    st.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end; 
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
                    ho.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    s.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    j.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    st.OnClick := procedure ->
                    begin
                        textout(650, 180, 'Yes,correct');
                        sleep(3000);
                        closewindow;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                end;
            //Пятый бордюр
            4:
                begin
                    
                    for var i := 0 to 1500 div w div 2 do
                    begin
                        if(i < 1500 div w div 2) then
                            pic.Draw(i * w * 2, 20, w, h);
                        pic.Draw(i * w * 2, 20, -w, h);
                        if(i < 1500 div w div 2) then
                            pic.Draw(i * w * 2, 20  + h * 2, w, -h);
                        pic.Draw(i * w * 2, 20  + h * 2, -w, -h);
                    end;
                    ho.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    s.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    j.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    st.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        textout(650, 180, 'Yes,correct');
                        sleep(3000);
                        closewindow;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
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
                    ho.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    s.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    j.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    st.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        textout(650, 180, 'Yes,correct');
                        sleep(3000);
                        closewindow;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
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
                    ho.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    s.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    j.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    st.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        textout(650, 180, 'No,uncorrect');
                        sleep(3000);
                        closewindow;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        textout(650, 180, 'Yes,correct');
                        sleep(3000);
                        closewindow;
                    end;
                end; 
        end;
    end;
end.