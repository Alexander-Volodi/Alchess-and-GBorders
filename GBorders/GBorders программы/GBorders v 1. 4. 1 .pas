uses GraphABC, ABCButtons;
procedure app;
begin
    //Главное окнo
        SetWindowWidth(1950);
        SetWindowHeight(850);
        clearwindow;
        CenterWindow;
        SetWindowIsFixedSize(true);
        SetWindowCaption('GBorders');
        var pic: picture;
        var w, h, N, r, score, attempt: integer;
        w := 507 div 10;
        h := 494 div 10;
        N := 7;
        pic := picture.Create('Снимок3.PNG');
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
                pic.Draw(i * w * 2, 30 + 20 * 4 + h * 6, w, h);
            pic.Draw(i * w * 2, 30 + 20 * 4 + h * 6, -w, h);
            if(i < 1500 div w div 2) then
                pic.Draw(i * w * 2, 30 + 20 * 4 + h * 8, w, -h);
            pic.Draw(i * w * 2, 30 + 20 * 4 + h * 8, -w, -h);
        end;
        //Шестой бордюр
        for var i := 0 to 1500 div w - 1 do
        begin
            pic.Draw(i * w, 30 + h * 10 + 20 * 5, w, -h);
            pic.Draw(i * w - 2, 30 + h * 8 + 20 * 5, -w, h);
        end;
        pic.Draw(1500 div w * w - 2, 30 + h * 8 + 20 * 5, -w, h);
        //Седьмой бордюр
        for var i := 0 to 1500 div w - 24 do
        begin
            pic.Draw(w * 2 + i * w * 4, 30 + 20 * 6 + h * 12, w, -h);
        end;
        for var i := 0 to 1500 div w - 1 do
        begin
            pic.Draw(w * 4 * i, 30 + 20 * 6 + h * 12, -w, -h);
            pic.Draw(i * w * 4, 30 + 20 * 6 + h * 10, w, h);
            pic.Draw(w * 2 + w * 4 * i, 30 + 20 * 6 + h * 10, -w, h);
        end;
end;
begin
    //Загрузочное окно
    setwindowwidth(500);
    setwindowheight(300);
    clearwindow(RGB(100, 100, 100));
    setbrushcolor(RGB(100, 100, 100));
    SetWindowCaption('Loading');
    SetWindowIsFixedSize(true);
    CenterWindow;
    setfontcolor(RGB(230, 230, 230));
    setfontsize(20);
    textout(190, 70, 'GBorders');
    setbrushcolor(RGB(230, 230, 230));
    rectangle(155, 127, 325, 157);
    for var i := 1 to 160 do
        for var j := 1 to 20 do
        begin
            setpixel(158 + i, 130 + j, clblack);
            if(j mod 20 = 0) then
                sleep(1);
        end;
    sleep(150);
    setbrushcolor(clwhite);
    ClearWindow;
    //Главное окно
    SetWindowWidth(1950);
    SetWindowHeight(850);
    CenterWindow;
    SetWindowIsFixedSize(true);
    SetWindowCaption('GBorders');
    var pic: picture;
    var w, h, N, r, score, attempt: integer;
    w := 507 div 10;
    h := 494 div 10;
    N := 7;
    pic := picture.Create('Снимок3.PNG');
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
            pic.Draw(i * w * 2, 30 + 20 * 4 + h * 6, w, h);
        pic.Draw(i * w * 2, 30 + 20 * 4 + h * 6, -w, h);
        if(i < 1500 div w div 2) then
            pic.Draw(i * w * 2, 30 + 20 * 4 + h * 8, w, -h);
        pic.Draw(i * w * 2, 30 + 20 * 4 + h * 8, -w, -h);
    end;
    //Шестой бордюр
    for var i := 0 to 1500 div w - 1 do
    begin
        pic.Draw(i * w, 30 + h * 10 + 20 * 5, w, -h);
        pic.Draw(i * w - 2, 30 + h * 8 + 20 * 5, -w, h);
    end;
    pic.Draw(1500 div w * w - 2, 30 + h * 8 + 20 * 5, -w, h);
    //Седьмой бордюр
    for var i := 0 to 1500 div w - 24 do
    begin
        pic.Draw(w * 2 + i * w * 4, 30 + 20 * 6 + h * 12, w, -h);
    end;
    for var i := 0 to 1500 div w - 1 do
    begin
        pic.Draw(w * 4 * i, 30 + 20 * 6 + h * 12, -w, -h);
        pic.Draw(i * w * 4, 30 + 20 * 6 + h * 10, w, h);
        pic.Draw(w * 2 + w * 4 * i, 30 + 20 * 6 + h * 10, -w, h);
    end;   
    var a := new ButtonABC(650, 395, 100, 75, 'Theory', clwhite);
    var b := new ButtonABC(1200, 315, 100, 75, 'Exercise', clwhite);
    var c := new ButtonABC(650, 235, 100, 75, 'Basics', clwhite);
    var d := new ButtonABC(100, 315, 100, 75, 'Exit', clwhite);
    d.OnClick := procedure ->
    begin
        sleep(400);  
        closewindow;
    end;
    //Основы
    c.OnClick := procedure ->
    begin
        var pic1: picture;
        pic1 := picture.Create('Снимок4.PNG');
        setbrushcolor(RGB(200,200,200));
        clearwindow(RGB(200,200,200));
        setwindowwidth(1000);
        setwindowheight(700);
        centerwindow;
        d.Visible:=false;
        c.Visible:=false;
        a.Visible:=false;
        b.Visible:=false;
        setfontsize(30);
        textout(300,250,'What is the borders?');
        var e := new ButtonABC(420,400,100,100,'Next',RGB(255,255,255));
        e.OnClick := procedure ->
        begin
            setbrushcolor(RGB(200,200,200));
            e.Destroy;
            clearwindow(RGB(200,200,200));
            textout(250,100,'Border is an ornament, you can see this.');
            textout(250,300,'But ornament can doesn''t be border.');
            //Первый бордюр
            for var i := 0 to 1500 div w - 15 do
            begin
                pic1.Draw(100 + i * w, 200, w, h);
            end;
            var e := new ButtonABC(420,500,100,100,'Next',RGB(255,255,255));
                e.OnClick := procedure ->
                begin
                    e.Destroy;
                    d.Visible:=true;
                    c.Visible:=true;
                    a.Visible:=true;
                    b.Visible:=true;
                    app;
                end;    
        end;
    end;
    //Теория
    a.OnClick := procedure ->
    begin
        ClearWindow;
        SetFontSize(15);
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
        ClearWindow;
        app;  
    end;
    b.OnClick := procedure ->
    //Задача
    begin
        if(attempt = 10)then
            attempt:=0;
        a.Visible:=false;
        c.Visible:=false;
        r := random(7);
        w := 507 div 6;
        h := 494 div 6;
        clearwindow;
        SetWindowCaption('What is it?');
        setwindowwidth(1950);
        setwindowheight(h * 2 + 430);
        SetWindowIsFixedSize(true);
        CenterWindow;
        var ho := new buttonABC(210, 40 + 180, 980, 30, 'Hop', clwhite);
        var s := new buttonABC(210, 80 + 180, 980, 30, 'Sidle', clwhite);
        var j := new buttonABC(210, 120 + 180, 980, 30, 'Jump', clwhite);
        var st := new buttonABC(210, 160 + 180, 980, 30, 'Step', clwhite);
        var sj := new buttonABC(210, 200 + 180, 980, 30, 'Spinning Jump', clwhite);
        var sh := new buttonABC(210, 240 + 180, 980, 30, 'Spinning Hop', clwhite);
        var ss := new buttonABC(210, 280 + 180, 980, 30, 'Spinning Sidle', clwhite);
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
                        setfontsize(30);
                        textout(630, 230, 'Yes,correct');
                        score := score + 1;
                        attempt := attempt + 1;
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;  
                            sleep(10000);
                            a.Visible:=true;
                            app;
                        end;
                    end;
                    s.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(460, 230, 'No,uncorrect. This is a Hop.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        s.Visible:=false;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;
                        end;
                    end;
                    j.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(460, 230, 'No,uncorrect. This is a Hop.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    st.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(460, 230, 'No,uncorrect. This is a Hop.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(460, 230, 'No,uncorrect. This is a Hop.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(460, 230, 'No,uncorrect. This is a Hop.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(460, 230, 'No,uncorrect. This is a Hop.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
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
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Sidle.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    s.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(630, 230, 'Yes,correct');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        score := score + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    j.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Sidle.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    st.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Sidle.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Sidle.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Sidle.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Sidle.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
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
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Jump.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I  advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    s.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Jump.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    j.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(630, 230, 'Yes,correct');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        score := score + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    st.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Jump.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Jump.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Jump.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Jump.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
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
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Step.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    s.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Step.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    j.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Step.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but i advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    st.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        textout(630, 230, 'Yes,correct');
                        attempt := attempt + 1;
                        score := score + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Step.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Step.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(450, 230, 'No,uncorrect. This is a Step.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
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
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Jump.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    s.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 380, 'No,uncorrect. This is a Spinnig Jump.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    j.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Jump.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    st.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Jump.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(630, 230, 'Yes,correct');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        score := score + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Jump.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Jump.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
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
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Hop.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    s.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Hop.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    j.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Hop.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    st.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Hop.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Hop.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(630, 230, 'Yes,correct');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        score := score + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Hop.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                end;
            //Седьмой бордюр
            6:
                begin  
                    for var i := 0 to 1500 div w - 14 do
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
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Sidle.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    s.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Sidle.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    j.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Sidle.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    st.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Sidle.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    sj.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Sidle.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;
                        end;
                    end;
                    sh.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(380, 230, 'No,uncorrect. This is a Spinnig Sidle.');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        attempt := attempt + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                    ss.OnClick := procedure ->
                    begin
                        setfontsize(30);
                        textout(630, 230, 'Yes,correct');
                        ho.destroy;
                        s.destroy;
                        j.destroy;
                        st.destroy;
                        sj.destroy;
                        sh.destroy;
                        ss.destroy;
                        sleep(3000);
                        attempt := attempt + 1;
                        score := score + 1;
                        if(attempt = 10) then
                        begin
                            case score of
                                0..6: textout(500, 320, 'I advise repeating theory!');
                                7..8: textout(250, 320, 'You know this topic, but I advise repeating theory.');
                                9..10: textout(550, 320, 'You know all topic.');
                            end;
                            sleep(10000);
                            a.Visible:=true;
                            app;   
                        end;
                    end;
                end; 
        end;
    end;   
end.