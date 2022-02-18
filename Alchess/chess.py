import pygame as pg
import sys
from random import randint

# Обозначние главных переменных
pg.init()
clock = pg.time.Clock()
sc = pg.display.set_mode((760, 760))
chess_board = [
    [[('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False],
     [('', ''), False], [('', ''), False]],
    [[('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False],
     [('', ''), False], [('', ''), False]],
    [[('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False],
     [('', ''), False], [('', ''), False]],
    [[('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False],
     [('', ''), False], [('', ''), False]],
    [[('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False],
     [('', ''), False], [('', ''), False]],
    [[('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False],
     [('', ''), False], [('', ''), False]],
    [[('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False],
     [('', ''), False], [('', ''), False]],
    [[('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False],
     [('', ''), False], [('', ''), False]],
    [[('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False], [('', ''), False],
     [('', ''), False], [('', ''), False]]]
attacked_pleases_light = [[False] * 8 for j in range(8)]
attacked_pleases_dark = [[False] * 8 for k in range(8)]
light_king_coordinate_x, light_king_coordinate_y = 4, 0
dark_king_coordinate_x, dark_king_coordinate_y = 4, 7
figure_reserve = [0, 0, '', '']
attempt_to_make_a_move = False
f1 = pg.font.Font(None, 60)
lgrey = (200, 200, 200)
dgrey = (100, 100, 100)
sc.fill(lgrey)
l_turn = True
swx = 40
swy = 0


# Функции, ищющие препятствия
def find_border_not_diagonal(tmp_c: int, minimum: int, maximum: int, vertical: bool):
    r = 0
    if vertical:
        for a in range(minimum, maximum):
            if chess_board[a][tmp_c][0] != ('', ''):
                r = True
                break
            else:
                r = False
    else:
        for a in range(minimum, maximum):
            if chess_board[tmp_c][a][0] != ('', ''):
                r = True
                break
            else:
                r = False
    return r


def find_border_diagonal(minimum_x: int, minimum_y: int, maximum_x: int, maximum_y: int, x_p: int, y_p: int, tmp_x: int,
                         tmp_y: int):
    r = 0
    for a in range(maximum_x - minimum_x):
        if ((tmp_x - x_p) > 0) == ((tmp_y - y_p) > 0):
            if chess_board[a + minimum_x][a + minimum_y][0] != ('', ''):
                r = True
                break
            else:
                r = False
        else:
            if chess_board[a + minimum_x][maximum_y - a - 1][0] != ('', ''):
                r = True
                break
            else:
                r = False
    return r


# Функция, ищющая патакованные поля
def check_not_diagonal(tmp_c: int, minimum: int, maximum: int, vertical: bool, l_check: bool):
    r = 0
    if vertical:
        for a in range(minimum, maximum):
            if l_check:
                if attacked_pleases_dark[a][tmp_c]:
                    r = True
                    break
                else:
                    r = False
            else:
                if attacked_pleases_light[a][tmp_c]:
                    r = True
                    break
                else:
                    r = False
    else:
        for a in range(minimum, maximum):
            if l_check:
                if attacked_pleases_dark[tmp_c][a]:
                    r = True
                    break
                else:
                    r = False
            else:
                if attacked_pleases_light[tmp_c][a]:
                    r = True
                    break
                else:
                    r = False
    return r


# Процедура расстановки фигур
def create_figure(vertical: int, horizontal: int, figure_title: str, figure_color: str, first=False,
                  light_king='Белый король.png', light_queen='Белый ферзь.png', light_bishop='Белый слон.png',
                  light_knight='Белый конь.png', light_rook='Белая ладья.png', light_pawn='Белая пешка.png',
                  dark_king='Чёрный король.png', dark_queen='Чёрный ферзь.png', dark_bishop='Чёрный слон.png',
                  dark_knight='Чёрный конь.png', dark_rook='Чёрная ладья.png', dark_pawn='Чёрная пешка.png'):
    x = 12
    y = 3
    figure_surf = 0
    if figure_color == "Light":
        if figure_title == "Pawn":
            figure_surf = pg.image.load(light_pawn)
        elif figure_title == "Rook":
            figure_surf = pg.image.load(light_rook)
        elif figure_title == "Knight":
            figure_surf = pg.image.load(light_knight)
        elif figure_title == "Bishop":
            figure_surf = pg.image.load(light_bishop)
        elif figure_title == "Queen":
            figure_surf = pg.image.load(light_queen)
        elif figure_title == "King":
            figure_surf = pg.image.load(light_king)
    if figure_color == "Dark":
        if figure_title == "Pawn":
            figure_surf = pg.image.load(dark_pawn)
        elif figure_title == "Rook":
            figure_surf = pg.image.load(dark_rook)
        elif figure_title == "Knight":
            figure_surf = pg.image.load(dark_knight)
        elif figure_title == "Bishop":
            figure_surf = pg.image.load(dark_bishop)
        elif figure_title == "Queen":
            figure_surf = pg.image.load(dark_queen)
        elif figure_title == "King":
            figure_surf = pg.image.load(dark_king)
    figure_surf.set_colorkey((255, 255, 255))
    figure_rect = figure_surf.get_rect(
        bottomright=((vertical + 1) * 90 + x, (8 - horizontal) * 90 - y))
    sc.blit(figure_surf, figure_rect)
    if first and (figure_title == 'King' or figure_title == 'Rook'):
        chess_board[vertical][horizontal][1] = True
    chess_board[vertical][horizontal][0] = (figure_title, figure_color)


# Функция хода
def move(coordinate_x: int, coordinate_y: int, tmp_x: int, tmp_y: int, tmp_f: tuple, x_p: int, y_p: int,
         double_move=False, super_move=False):
    global attempt_to_make_a_move
    global l_turn
    global light_king_coordinate_x
    global light_king_coordinate_y
    global dark_king_coordinate_x
    global dark_king_coordinate_y
    global figure_reserve
    x = 12
    y = 3
    if chess_board[x_p][y_p][0] != ('', ''):
        figure_reserve = x_p, y_p, chess_board[x_p][y_p][0][0], chess_board[x_p][y_p][0][1]
    elif super_move:
        figure_reserve = x_p, y_p - 1, chess_board[x_p][y_p][0][0], chess_board[x_p][y_p][0][1]
    if tmp_f[0] == 'King':
        if (l_turn and not double_move) or (not l_turn and double_move):
            light_king_coordinate_x = x_p
            light_king_coordinate_y = y_p
        else:
            dark_king_coordinate_x = x_p
            dark_king_coordinate_y = y_p
    if super_move:
        if l_turn:
            if ((coordinate_x + swx) // 90 - 1) % 2 == (coordinate_y // 90 - 2) % 2:
                pg.draw.rect(sc, dgrey,
                             (((coordinate_x + swx) // 90 - 1) * 90 + swx, (coordinate_y // 90 + 1) * 90, 90, 90))
            else:
                pg.draw.rect(sc, lgrey,
                             (((coordinate_x + swx) // 90 - 1) * 90 + swx, (coordinate_y // 90 + 1) * 90, 90, 90))
            chess_board[x_p][y_p - 1][0] = ('', '')
        else:
            if ((coordinate_x + swx) // 90 - 1) % 2 == (coordinate_y // 90) % 2:
                pg.draw.rect(sc, dgrey,
                             (((coordinate_x + swx) // 90 - 1) * 90 + swx, (coordinate_y // 90 - 1) * 90, 90, 90))
            else:
                pg.draw.rect(sc, lgrey,
                             (((coordinate_x + swx) // 90 - 1) * 90 + swx, (coordinate_y // 90 - 1) * 90, 90, 90))
            chess_board[x_p][y_p + 1][0] = ('', '')
    else:
        if ((coordinate_x + swx) // 90 - 1) % 2 == (coordinate_y // 90 - 1) % 2:
            pg.draw.rect(sc, dgrey,
                         (((coordinate_x + swx) // 90 - 1) * 90 + swx, (coordinate_y // 90) * 90, 90, 90))
        else:
            pg.draw.rect(sc, lgrey,
                         (((coordinate_x + swx) // 90 - 1) * 90 + swx, (coordinate_y // 90) * 90, 90, 90))
    chess_board[(coordinate_x + swx + x) // 90 - 1][8 - (coordinate_y - y) // 90 - 1][0] = tmp_f
    if tmp_x != 8:
        chess_board[tmp_x][tmp_y][0] = ('', '')
        if tmp_x % 2 == tmp_y % 2:
            pg.draw.rect(sc, dgrey,
                         (tmp_x * 90 + swx, (8 - tmp_y - 1) * 90, 90, 90))
        else:
            pg.draw.rect(sc, lgrey,
                         (tmp_x * 90 + swx, (8 - tmp_y - 1) * 90, 90, 90))
    create_figure(x_p, y_p, tmp_f[0],
                  tmp_f[1])
    if double_move and (figure_reserve[0] == tmp_x) and (figure_reserve[1] == tmp_y):
        create_figure(figure_reserve[0], figure_reserve[1], figure_reserve[2], figure_reserve[3])
        figure_reserve = [0, 0, '', '']
    attempt_to_make_a_move = not attempt_to_make_a_move
    l_turn = not l_turn


def short_castling(y_coordinate, tmp_x, tmp_y, tmp_f, x_p, y_p):
    global attempt_to_make_a_move
    global l_turn
    if not find_border_not_diagonal(tmp_y, min(tmp_x + 1, 7), max(tmp_x + 1, 7), True) and \
            not find_border_not_diagonal(tmp_y, min(x_p - 1, 6), max(x_p - 1, 6), True) and \
            not check_not_diagonal(tmp_y, min(tmp_x, 7), max(tmp_x, 7), True, l_turn):
        move(7 * 90, y_coordinate, tmp_x, tmp_y, tmp_f, 6, y_p)
        move(6 * 90, y_coordinate, x_p, y_p, chess_board[x_p][y_p][0], 5, y_p)
        attempt_to_make_a_move = False
        l_turn = not l_turn
    print(2)


def long_castling(y_coordinate, tmp_x, tmp_y, tmp_f, x_p, y_p):
    global attempt_to_make_a_move
    global l_turn
    if not find_border_not_diagonal(tmp_y, min(tmp_x, 2), max(tmp_x, 2), True) and \
            not find_border_not_diagonal(y_p, min(x_p + 1, 3), max(x_p + 1, 3), True) and \
            not check_not_diagonal(tmp_y, min(tmp_x, 2), max(tmp_x, 2), True, l_turn):
        move(3 * 90, y_coordinate, tmp_x, tmp_y, tmp_f, 2, y_p)
        move(4 * 90, y_coordinate, x_p, y_p, chess_board[x_p][y_p][0], 3, y_p)
        attempt_to_make_a_move = False
        l_turn = not l_turn
    print(3)


# Процедура атаки клеток
def attack():
    # Очистка
    for i in range(8):
        for j in range(8):
            attacked_pleases_light[i][j] = False
            attacked_pleases_dark[i][j] = False
    # Поиск отакующих фигур
    for i in range(8):
        for j in range(8):
            # Если фигура белая
            if chess_board[i][j][0][1] == 'Light':
                # Если фигура - король
                if chess_board[i][j][0][0] == 'King':
                    for s in range(i - 1, i + 2):
                        for k in range(j - 1, j + 2):
                            if (s >= 0) and (s <= 7) and (k >= 0) and (k <= 7):
                                attacked_pleases_light[s][k] = True
                    attacked_pleases_light[i][j] = False
                # Если фигура - пешка
                elif chess_board[i][j][0][0] == 'Pawn':
                    if j < 7:
                        if i < 7:
                            attacked_pleases_light[i + 1][j + 1] = True
                        if i > 0:
                            attacked_pleases_light[i - 1][j + 1] = True
                # Если фигура - конь
                elif chess_board[i][j][0][0] == 'Knight':
                    for s in range(i - 2, i + 3):
                        for k in range(j - 2, j + 3):
                            if (s >= 0) and (s <= 7) and (k >= 0) and (k <= 7):
                                if abs(i - s) * abs(j - k) == 2:
                                    attacked_pleases_light[s][k] = True
                # Если фигура дальнобойная
                elif (chess_board[i][j][0][0] == 'Queen') or (chess_board[i][j][0][0] == 'Rook') or (
                        chess_board[i][j][0][0] ==
                        'Bishop'):
                    # Если фигура атакует по вертикали или горизонтали
                    if (chess_board[i][j][0][0] == 'Queen') or (chess_board[i][j][0][0] == 'Rook'):
                        s = i + 2
                        if i < 7:
                            attacked_pleases_light[i + 1][j] = True
                        if s <= 7:
                            while (s <= 7) and (chess_board[s - 1][j][0][0] == ('', '')):
                                attacked_pleases_light[s][j] = True
                                s += 1
                        s = i - 2
                        if i > 0:
                            attacked_pleases_light[i - 1][j] = True
                        if s >= 0:
                            while (s >= 0) and (chess_board[s + 1][j][0][0] == ('', '')):
                                attacked_pleases_light[s][j] = True
                                s -= 1
                        s = j + 2
                        if j < 7:
                            attacked_pleases_light[i][j + 1] = True
                        if s <= 7:
                            while (s <= 7) and (chess_board[i][s - 1][0][0] == ('', '')):
                                attacked_pleases_light[i][s] = True
                                s += 1
                        s = j - 2
                        if j > 0:
                            attacked_pleases_light[i][j - 1] = True
                        if s >= 0:
                            while (s >= 0) and (chess_board[i][s + 1][0] == ('', '')):
                                attacked_pleases_light[i][s] = True
                                s -= 1
                    # Если фигура атакует по диагонали
                    if (chess_board[i][j][0][0] == 'Queen') or (chess_board[i][j][0][0] == 'Bishop'):
                        s = i + 2
                        k = j + 2
                        if (i < 7) and (j < 7):
                            attacked_pleases_light[i + 1][j + 1] = True
                        if s <= 7 and k <= 7:
                            while (s <= 7) and (k <= 7) and (chess_board[s - 1][k - 1][0] == ('', '')):
                                attacked_pleases_light[s][k] = True
                                s += 1
                                k += 1
                        s = i + 2
                        k = j - 2
                        if (i < 7) and (j > 0):
                            attacked_pleases_light[i + 1][j - 1] = True
                        if s <= 7 and k >= 0:
                            while (s <= 7) and (k >= 0) and (chess_board[s - 1][k + 1][0] == ('', '')):
                                attacked_pleases_light[s][k] = True
                                s += 1
                                k -= 1
                        s = i - 2
                        k = j + 2
                        if (i > 0) and (j < 7):
                            attacked_pleases_light[i - 1][j + 1] = True
                        if s <= 7 and k <= 7:
                            while (s >= 0) and (k <= 7) and (chess_board[s + 1][k - 1][0] == ('', '')):
                                attacked_pleases_light[s][k] = True
                                s -= 1
                                k += 1
                        s = i - 2
                        k = j - 2
                        if (i > 0) and (j > 0):
                            attacked_pleases_light[i - 1][j - 1] = True
                        if s >= 0 and k >= 0:
                            while (s >= 0) and (k >= 0) and (chess_board[s + 1][k + 1][0] == ('', '')):
                                attacked_pleases_light[s][k] = True
                                s -= 1
                                k -= 1
            # Если фигура чёная
            elif chess_board[i][j][0][1] == 'Dark':
                # Если фигура - король
                if chess_board[i][j][0][0] == 'King':
                    for s in range(i - 1, i + 2):
                        for k in range(j - 1, j + 2):
                            if (s >= 0) and (s <= 7) and (k >= 0) and (k <= 7):
                                attacked_pleases_dark[s][k] = True
                    attacked_pleases_dark[i][j] = False
                # Если фигура - пешка
                elif chess_board[i][j][0][0] == 'Pawn':
                    if j > 0:
                        if i < 7:
                            attacked_pleases_dark[i + 1][j - 1] = True
                        if i > 0:
                            attacked_pleases_dark[i - 1][j - 1] = True
                # Если фигура - конь
                elif chess_board[i][j][0][0] == 'Knight':
                    for s in range(i - 2, i + 3):
                        for k in range(j - 2, j + 3):
                            if (s >= 0) and (s <= 7) and (k >= 0) and (k <= 7):
                                if abs(i - s) * abs(j - k) == 2:
                                    attacked_pleases_dark[s][k] = True
                # Если фигура дальнобойная
                elif (chess_board[i][j][0][0] == 'Queen') or (chess_board[i][j][0][0] == 'Rook') or (
                        chess_board[i][j][0][0] ==
                        'Bishop'):
                    # Если фигура - атакует по вертикали или горизонтали
                    if (chess_board[i][j][0][0] == 'Queen') or (chess_board[i][j][0][0] == 'Rook'):
                        s = i + 2
                        if i < 7:
                            attacked_pleases_dark[i + 1][j] = True
                        if s <= 7:
                            while (s <= 7) and (chess_board[s - 1][j][0] == ('', '')):
                                attacked_pleases_dark[s][j] = True
                                s += 1
                        s = i - 2
                        if i > 0:
                            attacked_pleases_dark[i - 1][j] = True
                        if s >= 0:
                            while (s >= 0) and (chess_board[s + 1][j][0] == ('', '')):
                                attacked_pleases_dark[s][j] = True
                                s -= 1
                        s = j + 2
                        if j < 7:
                            attacked_pleases_dark[i][j + 1] = True
                        if s <= 7:
                            while (s <= 7) and (chess_board[i][s - 1][0] == ('', '')):
                                attacked_pleases_dark[i][s] = True
                                s += 1
                        s = j - 2
                        if j > 0:
                            attacked_pleases_dark[i][j - 1] = True
                        if s >= 0:
                            while (s >= 0) and (chess_board[i][s + 1][0] == ('', '')):
                                attacked_pleases_dark[i][s] = True
                                s -= 1
                    # Если фигура атакует по диагонали
                    if (chess_board[i][j][0][0] == 'Queen') or (chess_board[i][j][0][0] == 'Bishop'):
                        s = i + 2
                        k = j + 2
                        if (i < 7) and (j < 7):
                            attacked_pleases_dark[i + 1][j + 1] = True
                        if s <= 7 and k <= 7:
                            while (s <= 7) and (k <= 7) and (chess_board[s - 1][k - 1][0] == ('', '')):
                                attacked_pleases_dark[s][k] = True
                                s += 1
                                k += 1
                        s = i + 2
                        k = j - 2
                        if (i < 7) and (j > 0):
                            attacked_pleases_dark[i + 1][j - 1] = True
                        if s <= 7 and k >= 0:
                            while (s <= 7) and (k >= 0) and (chess_board[s - 1][k + 1][0] == ('', '')):
                                attacked_pleases_dark[s][k] = True
                                s += 1
                                k -= 1
                        s = i - 2
                        k = j + 2
                        if (i > 0) and (j < 7):
                            attacked_pleases_dark[i - 1][j + 1] = True
                        if s <= 7 and k <= 7:
                            while (s >= 0) and (k <= 7) and (chess_board[s + 1][k - 1][0] == ('', '')):
                                attacked_pleases_dark[s][k] = True
                                s -= 1
                                k += 1
                        s = i - 2
                        k = j - 2
                        if (i > 0) and (j > 0):
                            attacked_pleases_dark[i - 1][j - 1] = True
                        if s >= 0 and k >= 0:
                            while (s >= 0) and (k >= 0) and (chess_board[s + 1][k + 1][0] == ('', '')):
                                attacked_pleases_dark[s][k] = True
                                s -= 1
                                k -= 1


# Процедура проверки шахов
def check(x_coordinate: int, y_coordinate: int, x_p: int, y_p: int, tmp_f: tuple, tmp_x: int, tmp_y: int):
    if not l_turn:
        if attacked_pleases_dark[light_king_coordinate_x][light_king_coordinate_y]:
            move(x_coordinate, y_coordinate, x_p, y_p, tmp_f, tmp_x,
                 tmp_y, True)
            return True
        else:
            return False
    else:
        if attacked_pleases_light[dark_king_coordinate_x][dark_king_coordinate_y]:
            move(x_coordinate, y_coordinate, x_p, y_p, tmp_f, tmp_x,
                 tmp_y, True)
            return True
        else:
            return False


def attack_check_attack(x_coordinate: int, y_coordinate: int, x_p: int, y_p: int, tmp_f: tuple, tmp_x: int, tmp_y: int):
    attack()
    check(x_coordinate, y_coordinate, x_p, y_p, tmp_f, tmp_x, tmp_y)
    attack()


# Постройка шахматного поля
def chess_board_build():
    global swx
    global swy
    # Обозначение координатных обозначений
    for i in range(8):
        text1 = f1.render(str(8 - i), True,
                          (0, 0, 0))
        sc.blit(text1, (10, 30 + i * 90))
    for i in range(8):
        text1 = f1.render(chr(ord('A') + i), True,
                          (0, 0, 0))
        sc.blit(text1, (70 + i * 90, 721))
    # Рисуем белые поля
    for i in range(4):
        for j in range(4):
            pg.draw.rect(sc, lgrey,
                         (swx, swy, 90, 90))
            swx += 180
        swy += 180
        swx = 40
    swx = 130
    swy = 90
    for i in range(4):
        for j in range(4):
            pg.draw.rect(sc, lgrey,
                         (swx, swy, 90, 90))
            swx += 180
        swy += 180
        swx = 130
        pg.display.update()
    # Рисуем чёрные поля
    swx = 130
    swy = 0
    for i in range(4):
        for j in range(4):
            pg.draw.rect(sc, dgrey,
                         (swx, swy, 90, 90))
            swx += 180
        swy += 180
        swx = 130
    swx = 40
    swy = 90
    for i in range(4):
        for j in range(4):
            pg.draw.rect(sc, dgrey,
                         (swx, swy, 90, 90))
            swx += 180
        swy += 180
        swx = 40


def initiation(color: str, inv_x: int):
    x = 12
    y = 3
    sc1 = pg.display.set_mode((850, 760))
    sc1.fill((190, 190, 190))
    chess_board_build()
    for i in range(8):
        for j in range(8):
            if chess_board[i][j][0] != ('', ''):
                create_figure(i, j, chess_board[i][j][0][0], chess_board[i][j][0][1])
    create_figure(8, 2, 'Knight', color)
    create_figure(8, 3, 'Bishop', color)
    create_figure(8, 4, 'Rook', color)
    create_figure(8, 5, 'Queen', color)
    end = False
    pg.display.update()
    while not end:
        for event in pg.event.get():
            if event.type == pg.MOUSEBUTTONDOWN:
                x_position = (event.pos[0] + swx + x) // 90 - 1
                y_position = 8 - (event.pos[1] - y) // 90 - 1
                if event.button == 1:
                    if x_position == 8:
                        if y_position == 2:
                            end = True
                            if color == 'Light':
                                create_figure(inv_x, 7, 'Knight', color)
                            else:
                                create_figure(inv_x, 0, 'Knight', color)
                        elif y_position == 3:
                            end = True
                            if color == 'Light':
                                create_figure(inv_x, 7, 'Bishop', color)
                            else:
                                create_figure(inv_x, 0, 'Bishop', color)
                        elif y_position == 4:
                            end = True
                            if color == 'Light':
                                create_figure(inv_x, 7, 'Rook', color)
                            else:
                                create_figure(inv_x, 0, 'Rook', color)
                        elif y_position == 5:
                            end = True
                            if color == 'Light':
                                create_figure(inv_x, 7, 'Queen', color)
                            else:
                                create_figure(inv_x, 0, 'Queen', color)
            clock.tick(20)
            if event.type == pg.QUIT:
                sys.exit()
            pg.display.update()
    sc1 = pg.display.set_mode((760, 760))
    sc1.fill((190, 190, 190))
    chess_board_build()
    for i in range(8):
        for j in range(8):
            if chess_board[i][j][0] != ('', ''):
                create_figure(i, j, chess_board[i][j][0][0], chess_board[i][j][0][1])
    pg.display.update()


# Расстановка фигур по правилам классических шахмат
def classic_begin():
    # Начальная позиция: чёрные пешки
    for i in range(8):
        create_figure(i, 6, "Pawn", "Dark")
    # Начальная позиция: белые пешки
    for i in range(8):
        create_figure(i, 1, "Pawn", "Light")
    # Начальная позиция: чёрные ладьи
    create_figure(0, 7, "Rook", "Dark")
    create_figure(7, 7, "Rook", "Dark")
    # Начальная позиция: белые ладьи
    create_figure(0, 0, "Rook", "Light")
    create_figure(7, 0, "Rook", "Light")
    # Начальная позиция: чёрные кони
    create_figure(1, 7, "Knight", "Dark")
    create_figure(6, 7, "Knight", "Dark")
    # Начальная позиция: белые кони
    create_figure(1, 0, "Knight", "Light")
    create_figure(6, 0, "Knight", "Light")
    # Начальная позиция: чёрные слоны
    create_figure(2, 7, "Bishop", "Dark")
    create_figure(5, 7, "Bishop", "Dark")
    # Начальная позиция: белые слоны
    create_figure(2, 0, "Bishop", "Light")
    create_figure(5, 0, "Bishop", "Light")
    # Начальная позиция: чёрный ферзь
    create_figure(3, 7, "Queen", "Dark")
    # Начальная позиция: белый ферзь
    create_figure(3, 0, "Queen", "Light")
    # Начальная позиция: чёрный король
    create_figure(4, 7, "King", "Dark")
    # Начальная позиция: белый король
    create_figure(4, 0, "King", "Light")


# Расстановка фигур по правилам шахмат Фишера
def fisherandom_begin():
    # Начальная позиция: чёрные пешки
    for i in range(8):
        create_figure(i, 6, "Pawn", "Dark")
    # Начальная позиция: белые пешки
    for i in range(8):
        create_figure(i, 1, "Pawn", "Light")
    # Начальная позиция: короли
    random_vertical_king = randint(1, 6)
    create_figure(random_vertical_king, 7, "King", "Dark")
    create_figure(random_vertical_king, 0, "King", "Light")
    # Начальная позиция: ладьи
    random_vertical_rook_first = randint(0, random_vertical_king - 1)
    random_vertical_rook_second = randint(random_vertical_king + 1, 7)
    create_figure(random_vertical_rook_first, 7, "Rook", "Dark")
    create_figure(random_vertical_rook_second, 7, "Rook", "Dark")
    create_figure(random_vertical_rook_first, 0, "Rook", "Light")
    create_figure(random_vertical_rook_second, 0, "Rook", "Light")
    # Начальная позиция: слоны
    random_vertical_bishop_first = randint(0, 7)
    while ((random_vertical_bishop_first == random_vertical_king) or
           (random_vertical_bishop_first == random_vertical_rook_first) or
           (random_vertical_bishop_first == random_vertical_rook_second)):
        random_vertical_bishop_first = randint(0, 7)
    create_figure(random_vertical_bishop_first, 7, 'Bishop', 'Dark')
    create_figure(random_vertical_bishop_first, 0, 'Bishop', 'Light')
    random_vertical_bishop_second = randint(0, 7)
    while ((random_vertical_bishop_second == random_vertical_king) or
           (random_vertical_bishop_second == random_vertical_rook_first) or
           (random_vertical_bishop_second == random_vertical_rook_second) or
           (random_vertical_bishop_second % 2 == random_vertical_bishop_first % 2)):
        random_vertical_bishop_second = randint(0, 7)
    create_figure(random_vertical_bishop_second, 7, 'Bishop', 'Dark')
    create_figure(random_vertical_bishop_second, 0, 'Bishop', 'Light')
    # Начальная позиция: кони
    random_vertical_knight_first = randint(0, 7)
    while ((random_vertical_knight_first == random_vertical_king) or
           (random_vertical_knight_first == random_vertical_rook_first) or
           (random_vertical_knight_first == random_vertical_rook_second) or
           (random_vertical_knight_first == random_vertical_bishop_first) or
           (random_vertical_knight_first == random_vertical_bishop_second)):
        random_vertical_knight_first = randint(0, 7)
    create_figure(random_vertical_knight_first, 7, 'Knight', 'Dark')
    create_figure(random_vertical_knight_first, 0, 'Knight', 'Light')
    random_vertical_knight_second = randint(0, 7)
    while ((random_vertical_knight_second == random_vertical_king) or
           (random_vertical_knight_second == random_vertical_rook_first) or
           (random_vertical_knight_second == random_vertical_rook_second) or
           (random_vertical_knight_second == random_vertical_bishop_first) or
           (random_vertical_knight_second == random_vertical_bishop_second) or
           (random_vertical_knight_second == random_vertical_knight_first)):
        random_vertical_knight_second = randint(0, 7)
    create_figure(random_vertical_knight_second, 7, 'Knight', 'Dark')
    create_figure(random_vertical_knight_second, 0, 'Knight', 'Light')
    # Начальная позиция: ферзи
    random_vertical_queen = randint(0, 7)
    while ((random_vertical_queen == random_vertical_king) or
           (random_vertical_queen == random_vertical_rook_first) or
           (random_vertical_queen == random_vertical_rook_second) or
           (random_vertical_queen == random_vertical_bishop_first) or
           (random_vertical_queen == random_vertical_bishop_second) or
           (random_vertical_queen == random_vertical_knight_first) or
           (random_vertical_queen == random_vertical_knight_second)):
        random_vertical_queen = randint(0, 7)
    create_figure(random_vertical_queen, 7, 'Queen', 'Dark')
    create_figure(random_vertical_queen, 0, 'Queen', 'Light')
    # Обновление экрана
    pg.display.update()


# Расстановка фигур по правилам боевых шахмат
def battle_chess_begin():
    attempt = False
    x = 12
    y = 3
    # Задаём окно
    sc2 = pg.display.set_mode((960, 760))
    d_background = (110, 110, 110)
    l_background = (190, 190, 190)
    sc2.fill(l_background, (0, 0, 760, 760))
    sc2.fill(d_background, (760, 0, 960, 760))
    chess_board_build()
    # Закрываем пол доски
    surf1 = pg.Surface((720, 360))
    surf1.fill(l_background)
    rect = pg.Rect((40, 0, 720, 360))
    sc2.blit(surf1, rect)
    # Создаём кнопку, спрашивающую о готовности игрока
    f2 = pg.font.Font(None, 70)
    pg.draw.rect(sc2, (160, 160, 160),
                 (770, 550, 180, 160), 10, 10)
    text1 = f2.render("I'm", True,
                      (0, 0, 0))
    sc2.blit(text1, (830, 580))
    text1 = f2.render("ready", True,
                      (0, 0, 0))
    sc2.blit(text1, (800, 640))
    # Создаём первые фигуры
    create_figure(8, 7, 'Pawn', 'Light')
    create_figure(8, 6, 'Knight', 'Light')
    create_figure(8, 5, 'Bishop', 'Light')
    create_figure(8, 4, 'Rook', 'Light')
    create_figure(8, 3, 'Queen', 'Light')
    create_figure(8, 2, 'King', 'Light')
    # Создаём переменные для расстановки
    reserve = [[8, 7], [8, 6], [8, 5], [8, 4], [8, 3], [8, 2]]
    f3 = pg.font.Font(None, 100)
    quantity_figures = [[8, 2, 2, 2, 1, 1],
                        [8, 2, 2, 2, 1, 1]]
    tmp_x, tmp_y = None, None
    tmp_f = ('', '')
    ready = False
    pg.display.update()

    # Процедура, следящая за количеством фигур
    def minus(color, title):
        if quantity_figures[1][title] > 0:
            if color == 0:
                create_figure(reserve[title][0], reserve[title][1], f, 'Light')
            else:
                create_figure(reserve[title][0], reserve[title][1], f, 'Dark')
        quantity_figures[color][title] -= 1

    # Процедура, уничтожающая фигуру
    def delete_figure(title, color):
        chess_board[reserve[title][0]][reserve[title][1]][0] = ('', '')
        if color == 0:
            pg.draw.rect(sc, d_background,
                         (760, 0 + 90 * title, 90, 90))
        else:
            pg.draw.rect(sc, l_background,
                         (760, 0 + 90 * title, 90, 90))

    # Процедура, Отоброжающая количество оставшихся фигур
    def write_quantity(title, color):
        if color == 0:
            pg.draw.rect(sc, d_background,
                         (860, 0 + 90 * title, 90, 90))
        else:
            pg.draw.rect(sc, l_background,
                         (860, 0 + 90 * title, 90, 90))
        quantity = f3.render(str(quantity_figures[color][title]), True,
                             (30, 30, 30))
        sc.blit(quantity, (870, 25 + 90 * title))

    # Функция, следящая за соблюдением правила о расстаноке всех фигур на доску
    def check_figures():
        flag = False
        for n in range(6):
            if chess_board[8][n][0] == ('', ''):
                flag = True
            else:
                flag = False
                break
        return flag

    # Каркас программы
    while not ready:
        for i in pg.event.get():
            # Выход
            if i.type == pg.QUIT:
                sys.exit()
            # Запись количества оставшихся фигур
            for j in range(6):
                write_quantity(j, 0)
            # Если кнопка нажата
            if i.type == pg.MOUSEBUTTONDOWN:
                # Обновление координат
                x_position = (i.pos[0] + swx + x) // 90 - 1
                y_position = 8 - (i.pos[1] - y) // 90 - 1
                # Если игрок готов
                if (i.pos[0] >= 770) and (i.pos[0] <= 950) and (i.pos[1] >= 550) and (i.pos[1] <= 720):
                    if check_figures():
                        ready = True
                        break
                    else:
                        print("You forgot about some figures")
                # "Взятие" фигуры
                if not attempt:
                    if (i.pos[0] >= 40) and (i.pos[0] <= 850) and (i.pos[1] >= 40) and (i.pos[1] <= 720):
                        # Ищем фигуру, которой игрок решил походить
                        for f in ["Pawn", "Rook", "Knight", "Bishop", "Queen", "King"]:
                            # Если мы нашли фигуру, которую игрок решил использовать для своего хода
                            if (chess_board[x_position][y_position][0] == (f, 'Light')) and (
                                    chess_board[x_position][y_position][0] != ('', '')):
                                if x_position == 8:
                                    if f == 'Pawn':
                                        minus(0, 0)
                                    if f == 'Knight':
                                        minus(0, 1)
                                    if f == 'Bishop':
                                        minus(0, 2)
                                    if f == 'Rook':
                                        minus(0, 3)
                                    if f == 'Queen':
                                        minus(0, 4)
                                    if f == 'King':
                                        minus(0, 5)
                                tmp_f, tmp_x, tmp_y, = chess_board[x_position][y_position][0], x_position, y_position
                                attempt = True
                                break
                # "Постановка" фигуры
                elif (i.pos[0] >= 40) and (i.pos[0] <= 720) and (i.pos[1] >= 360) and (i.pos[1] <= 720) and \
                        chess_board[x_position][y_position][0][1] != tmp_f[1]:
                    move(i.pos[0], i.pos[1], tmp_x, tmp_y, tmp_f, x_position, y_position)
                    attempt = False
                    for j in range(6):
                        if quantity_figures[0][j] < 1:
                            delete_figure(j, 0)
            # Обновление экрана тактовая задержка
            pg.display.update()
            clock.tick(60)
    # Анологичное действие для чёрных фигур
    chess_board_build()
    sc2.fill(l_background, (760, 0, 960, 760))
    create_figure(8, 7, 'Pawn', 'Dark')
    create_figure(8, 6, 'Knight', 'Dark')
    create_figure(8, 5, 'Bishop', 'Dark')
    create_figure(8, 4, 'Rook', 'Dark')
    create_figure(8, 3, 'Queen', 'Dark')
    create_figure(8, 2, 'King', 'Dark')
    pg.draw.rect(sc2, (150, 150, 150),
                 (770, 550, 180, 160), 10, 10)
    text1 = f2.render("I'm", True,
                      (0, 0, 0))
    sc2.blit(text1, (830, 580))
    text1 = f2.render("ready", True,
                      (0, 0, 0))
    sc2.blit(text1, (800, 640))
    rect = pg.Rect((40, 360, 720, 360))
    sc2.blit(surf1, rect)
    ready = False
    pg.display.update()

    while not ready:
        for i in pg.event.get():
            if i.type == pg.QUIT:
                sys.exit()
            for j in range(6):
                write_quantity(j, 1)
            if i.type == pg.MOUSEBUTTONDOWN:
                x_position = (i.pos[0] + swx + x) // 90 - 1
                y_position = 8 - (i.pos[1] - y) // 90 - 1
                if (i.pos[0] >= 770) and (i.pos[0] <= 950) and (i.pos[1] >= 550) and (i.pos[1] <= 720):
                    if check_figures():
                        ready = True
                        break
                    else:
                        print("You forgot about some figures")
                if not attempt:
                    if ((i.pos[0] >= 40) and (i.pos[0] <= 850) and (i.pos[1] >= 40) and (i.pos[1] <= 360)) or \
                            ((i.pos[0] >= 760) and (i.pos[0] <= 860) and (i.pos[1] >= 40) and (i.pos[1] <= 540)):
                        # Ищем фигуру, которой игрок решил походить
                        for f in ["Pawn", "Rook", "Knight", "Bishop", "Queen", "King"]:
                            # Если мы нашли фигуру, которую игрок решил использовать для своего хода
                            if (chess_board[x_position][y_position][0] == (f, 'Dark')) and (
                                    chess_board[x_position][y_position][0] != ('', '')):
                                if x_position == 8:
                                    if f == 'Pawn':
                                        minus(1, 0)
                                    if f == 'Knight':
                                        minus(1, 1)
                                    if f == 'Bishop':
                                        minus(1, 2)
                                    if f == 'Rook':
                                        minus(1, 3)
                                    if f == 'Queen':
                                        minus(1, 4)
                                    if f == 'King':
                                        minus(1, 5)
                                tmp_f, tmp_x, tmp_y, = chess_board[x_position][y_position][0], x_position, y_position
                                attempt = True
                                break
                elif (i.pos[0] >= 40) and (i.pos[0] <= 720) and (i.pos[1] >= 0) and (i.pos[1] <= 360) and \
                        chess_board[x_position][y_position][0][1] != tmp_f[1]:
                    move(i.pos[0], i.pos[1], tmp_x, tmp_y, tmp_f, x_position, y_position)
                    attempt = False
                    for j in range(6):
                        if quantity_figures[1][j] < 1:
                            delete_figure(j, 1)
            pg.display.update()
            clock.tick(60)
    # Возвращение окна в исходное положение
    sc2 = pg.display.set_mode((760, 760))
    sc2.fill(l_background)
    chess_board_build()
    for i in range(8):
        for j in range(8):
            if chess_board[i][j][0] != ('', ''):
                create_figure(i, j, chess_board[i][j][0][0], chess_board[i][j][0][1])


# Функция, отвечающая за возможность фигур ходить, есть или другим методом взаимодействовать по шахматным правилам
def rules():
    global attempt_to_make_a_move
    pawn_coordinate = [2, 0]
    x = 12
    y = 3
    tmp_figure = ('', '')
    tmp_coordinate_x, tmp_coordinate_y = 0, 0
    while True:
        for i in pg.event.get():
            # Если игрок произвёл нажатие
            if i.type == pg.MOUSEBUTTONDOWN:
                x_position = (i.pos[0] + swx + x) // 90 - 1
                y_position = 8 - (i.pos[1] - y) // 90 - 1
                # Собирается ли игрок делать ход?
                if attempt_to_make_a_move:
                    if i.button == 1:
                        if chess_board[x_position][y_position][0][1] != tmp_figure[1] and \
                                chess_board[x_position][y_position][0][0] \
                                != 'King' and (x_position >= 0) and (x_position <= 7) and (y_position >= 0) and (
                                y_position <= 7):
                            if ((tmp_figure[0] == "Knight") and (abs(x_position - tmp_coordinate_x) *
                                                                 abs(y_position - tmp_coordinate_y)) == 2):
                                # Совершение хода
                                move(i.pos[0], i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure, x_position,
                                     y_position)
                                attack_check_attack(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                    tmp_coordinate_x,
                                                    tmp_coordinate_y)
                                if not check(i.pos[0], i.pos[1], x_position, y_position, tmp_figure, tmp_coordinate_x,
                                             tmp_coordinate_y):
                                    chess_board[pawn_coordinate[0]][pawn_coordinate[1]][1] = False
                                continue
                            elif ((tmp_figure[0] == "Bishop") and (abs(x_position - tmp_coordinate_x)
                                                                   == abs(y_position - tmp_coordinate_y))):
                                if not find_border_diagonal(min(tmp_coordinate_x, x_position) + 1,
                                                            min(tmp_coordinate_y, y_position) + 1,
                                                            max(tmp_coordinate_x, x_position),
                                                            max(tmp_coordinate_y, y_position), x_position, y_position,
                                                            tmp_coordinate_x, tmp_coordinate_y):
                                    # Совершение хода
                                    move(i.pos[0], i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure, x_position,
                                         y_position)
                                    attack_check_attack(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                        tmp_coordinate_x, tmp_coordinate_y)
                                    if not check(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                 tmp_coordinate_x,
                                                 tmp_coordinate_y):
                                        chess_board[pawn_coordinate[0]][pawn_coordinate[1]][1] = False
                                    continue
                            elif ((tmp_figure[0] == "Rook") and ((abs(x_position - tmp_coordinate_x) == 0) or abs(
                                    y_position - tmp_coordinate_y) == 0)):
                                # Проверяем, не преграждают ли нам путь фигуры
                                if ((not find_border_not_diagonal(tmp_coordinate_y,
                                                                  min(x_position, tmp_coordinate_x) + 1,
                                                                  max(x_position, tmp_coordinate_x), True))
                                    and (y_position - tmp_coordinate_y == 0)) or ((not find_border_not_diagonal
                                    (tmp_coordinate_x, min(y_position, tmp_coordinate_y) + 1,
                                     max(y_position, tmp_coordinate_y), False))
                                                                                  and (
                                                                                          x_position - tmp_coordinate_x == 0)):
                                    # Совершение хода
                                    move(i.pos[0], i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure, x_position,
                                         y_position)
                                    attack_check_attack(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                        tmp_coordinate_x, tmp_coordinate_y)
                                    chess_board[tmp_coordinate_x][tmp_coordinate_y][1] = False
                                    if not check(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                 tmp_coordinate_x,
                                                 tmp_coordinate_y):
                                        chess_board[pawn_coordinate[0]][pawn_coordinate[1]][1] = False
                                    continue
                            elif ((tmp_figure[0] == "Queen") and (((abs(x_position - tmp_coordinate_x) == 0) or
                                                                   abs(y_position - tmp_coordinate_y) == 0) or
                                                                  (abs(x_position - tmp_coordinate_x) == abs(
                                                                      y_position - tmp_coordinate_y)))):
                                if abs(x_position - tmp_coordinate_x) == 0 or abs(y_position - tmp_coordinate_y) == 0:
                                    if ((not find_border_not_diagonal(tmp_coordinate_y,
                                                                      min(x_position, tmp_coordinate_x) + 1,
                                                                      max(x_position, tmp_coordinate_x), True)) and
                                        (y_position - tmp_coordinate_y == 0)) or ((not find_border_not_diagonal
                                        (tmp_coordinate_x, min(y_position, tmp_coordinate_y) + 1,
                                         max(y_position, tmp_coordinate_y), False))
                                                                                  and (
                                                                                          x_position - tmp_coordinate_x == 0)):
                                        # Совершение хода
                                        move(i.pos[0], i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure,
                                             x_position,
                                             y_position)
                                        attack_check_attack(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                            tmp_coordinate_x, tmp_coordinate_y)
                                        if not check(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                     tmp_coordinate_x,
                                                     tmp_coordinate_y):
                                            chess_board[pawn_coordinate[0]][pawn_coordinate[1]][1] = False
                                        continue
                                else:
                                    if not find_border_diagonal(min(tmp_coordinate_x, x_position) + 1,
                                                                min(tmp_coordinate_y, y_position) + 1,
                                                                max(tmp_coordinate_x, x_position),
                                                                max(tmp_coordinate_y, y_position), x_position,
                                                                y_position,
                                                                tmp_coordinate_x, tmp_coordinate_y):
                                        # Совершение хода
                                        move(i.pos[0], i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure,
                                             x_position,
                                             y_position)
                                        attack_check_attack(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                            tmp_coordinate_x, tmp_coordinate_y)
                                        if not check(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                     tmp_coordinate_x,
                                                     tmp_coordinate_y):
                                            chess_board[pawn_coordinate[0]][pawn_coordinate[1]][1] = False
                                        continue
                            elif ((tmp_figure[0] == "King") and (((abs(x_position - tmp_coordinate_x) == 1) and
                                                                  (abs(y_position - tmp_coordinate_y) <= 1)) or
                                                                 ((abs(x_position - tmp_coordinate_x) <= 1) and
                                                                  (abs(y_position - tmp_coordinate_y) == 1)))):
                                # Совершение хода
                                move(i.pos[0], i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure, x_position,
                                     y_position)
                                attack_check_attack(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                    tmp_coordinate_x, tmp_coordinate_y)
                                if not check(i.pos[0], i.pos[1], x_position, y_position, tmp_figure, tmp_coordinate_x,
                                             tmp_coordinate_y):
                                    chess_board[tmp_coordinate_x][tmp_coordinate_y][1] = False
                                    chess_board[pawn_coordinate[0]][pawn_coordinate[1]][1] = False
                                continue
                            elif tmp_figure[0] == "Pawn":
                                if (chess_board[x_position][y_position][0][1] != "Light") and \
                                        (chess_board[x_position][y_position][0][1] != "Dark"):
                                    if tmp_figure[1] == "Light":
                                        if ((y_position - tmp_coordinate_y == 1) and (
                                                x_position - tmp_coordinate_x == 0)) \
                                                or (
                                                (tmp_coordinate_y == 1) and ((y_position - tmp_coordinate_y == 2) and
                                                                             (x_position - tmp_coordinate_x == 0)) and
                                                (chess_board[tmp_coordinate_x][2][0] == ('', ''))) \
                                                or (chess_board[x_position][y_position - 1][1] and
                                                    chess_board[x_position][y_position - 1][0][0] == 'Pawn'):
                                            if ((tmp_coordinate_y == 1) and ((y_position - tmp_coordinate_y == 2) and
                                                                             (x_position - tmp_coordinate_x == 0)) and
                                                    (chess_board[tmp_coordinate_x][2][0] == ('', ''))):
                                                chess_board[x_position][y_position][1] = True
                                                chess_board[pawn_coordinate[0]][pawn_coordinate[1]][1] = False
                                            # Совершение хода
                                            if (chess_board[x_position][y_position - 1][1] and
                                                    chess_board[x_position][y_position - 1][0][0] == 'Pawn'):
                                                move(i.pos[0], i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure,
                                                     x_position, y_position, super_move=True)
                                            else:
                                                move(i.pos[0], i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure,
                                                     x_position, y_position)
                                            chess_board[pawn_coordinate[0]][pawn_coordinate[1]][1] = False
                                            pawn_coordinate = [x_position, y_position]
                                            attack_check_attack(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                                tmp_coordinate_x, tmp_coordinate_y)
                                            if y_position == 7:
                                                initiation('Light', x_position)
                                            continue
                                    else:
                                        if ((y_position - tmp_coordinate_y == -1) and (
                                                x_position - tmp_coordinate_x == 0)) \
                                                or (
                                                (tmp_coordinate_y == 6) and ((y_position - tmp_coordinate_y == -2) and
                                                                             (x_position - tmp_coordinate_x == 0)) and
                                                (chess_board[tmp_coordinate_x][5][0] == ('', ''))) \
                                                or (chess_board[x_position][y_position + 1][1] and
                                                    chess_board[x_position][y_position + 1][0][0] == 'Pawn'):
                                            if ((tmp_coordinate_y == 6) and ((y_position - tmp_coordinate_y == -2) and
                                                                             (x_position - tmp_coordinate_x == 0)) and
                                                    (chess_board[tmp_coordinate_x][5][0] == ('', ''))):
                                                chess_board[x_position][y_position][1] = True
                                                chess_board[pawn_coordinate[0]][pawn_coordinate[1]][1] = False
                                            # Совершение хода
                                            if (chess_board[x_position][y_position + 1][1] and
                                                    chess_board[x_position][y_position + 1][0][0] == 'Pawn'):
                                                move(i.pos[0], i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure,
                                                     x_position, y_position, super_move=True)
                                            else:
                                                move(i.pos[0], i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure,
                                                     x_position, y_position)
                                            chess_board[pawn_coordinate[0]][pawn_coordinate[1]][1] = False
                                            pawn_coordinate = [x_position, y_position]
                                            attack_check_attack(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                                tmp_coordinate_x, tmp_coordinate_y)
                                            if y_position == 0:
                                                initiation('Dark', x_position)
                                            continue
                                else:
                                    if tmp_figure[1] == "Light":
                                        if (y_position - tmp_coordinate_y == 1) and (
                                                abs(x_position - tmp_coordinate_x) == 1):
                                            # Совершение хода
                                            move(i.pos[0], i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure,
                                                 x_position, y_position)
                                            attack_check_attack(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                                tmp_coordinate_x, tmp_coordinate_y)
                                            if not check(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                         tmp_coordinate_x,
                                                         tmp_coordinate_y):
                                                chess_board[pawn_coordinate[0]][pawn_coordinate[1]][1] = False
                                            continue
                                    else:
                                        if (y_position - tmp_coordinate_y == -1) and (
                                                abs(x_position - tmp_coordinate_x) == 1):
                                            # Совершение хода
                                            move(i.pos[0], i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure,
                                                 x_position, y_position)
                                            attack_check_attack(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                                tmp_coordinate_x, tmp_coordinate_y)
                                            if not check(i.pos[0], i.pos[1], x_position, y_position, tmp_figure,
                                                         tmp_coordinate_x,
                                                         tmp_coordinate_y):
                                                chess_board[pawn_coordinate[0]][pawn_coordinate[1]][1] = False
                                            continue
                        elif chess_board[x_position][y_position][0][0] == 'Rook' and (x_position >= 0) and (
                                x_position <= 7) \
                                and (y_position >= 0) and (y_position <= 7) and \
                                (chess_board[x_position][y_position][0][1] == tmp_figure[1]):
                            if x_position > tmp_coordinate_x:
                                attack()
                                short_castling(i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure,
                                               x_position, y_position)
                            else:
                                attack()
                                long_castling(i.pos[1], tmp_coordinate_x, tmp_coordinate_y, tmp_figure,
                                              x_position, y_position)
                    elif i.button == 3:
                        attempt_to_make_a_move = False
                else:
                    # Ищем фигуру, которой игрок решил походить
                    for c in ["Dark", "Light"]:
                        if attempt_to_make_a_move:
                            break
                        for f in ["Pawn", "Rook", "Knight", "Bishop", "Queen", "King"]:
                            # Если мы нашли фигуру, которую игрок решил использовать для своего хода
                            if (chess_board[x_position][y_position][0] == (f, c)) and (
                                    chess_board[x_position][y_position][0] != ('', '')):
                                if ((chess_board[x_position][y_position][0][1] == "Light") and l_turn) or \
                                        ((chess_board[x_position][y_position][0][1] == "Dark") and (not l_turn)):
                                    tmp_figure, tmp_coordinate_x, tmp_coordinate_y, = chess_board[x_position][
                                                                                          y_position][
                                                                                          0], x_position, y_position
                                    attempt_to_make_a_move = True
                                    print(1)
                                    break
            # Выход
            if i.type == pg.QUIT:
                sys.exit()
            # Окончание действие с целью не допустить зависание и с целью сделать ходы видимыми
            pg.display.update()
            clock.tick(20)
