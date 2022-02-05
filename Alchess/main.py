# Установка
import pygame as pg
import sys
import chess
pg.init()
sc = pg.display.set_mode((1000, 760))
clock = pg.time.Clock()
# Называние окна
pg.display.set_caption("Alchess")
chess_icon = pg.image.load('Шахматный знак.png')
chess_icon.set_colorkey((255, 255, 255))
pg.display.set_icon(chess_icon)
# Зарисовка меню
LGREY = (200, 200, 200)
DGREY = (100, 100, 100)
sc.fill(DGREY, (0, 0, 500, 760))
sc.fill(LGREY, (500, 0, 500, 760))
pg.font.init()
f1 = pg.font.SysFont('algerian', 150)
white_king_menu = pg.image.load('Белый король меню.png')
black_king_menu = pg.image.load('Чёрный король меню.png')
white_king_menu.set_colorkey((255, 255, 255))
black_king_menu.set_colorkey((255, 255, 255))
figure_king_rect = white_king_menu.get_rect(
        bottomright=(275, 700))
sc.blit(white_king_menu, figure_king_rect)
figure_king_rect = black_king_menu.get_rect(
        bottomright=(955, 700))
sc.blit(black_king_menu, figure_king_rect)
pg.draw.rect(sc, (140, 140, 140),
             (310, 150, 380, 80), 10, 10)
pg.draw.rect(sc, (140, 140, 140),
             (310, 250, 180, 80), 10, 10)
pg.draw.rect(sc, (140, 140, 140),
             (510, 250, 180, 80), 10, 10)
text1 = f1.render('Alchess', True,
                  (0, 0, 0))
sc.blit(text1, (195, 0))
f1 = pg.font.SysFont('aharoni', 60)
text1 = f1.render('Classic chess', True,
                  (0, 0, 0))
sc.blit(text1, (350, 170))
f1 = pg.font.SysFont('aharoni', 37)
text1 = f1.render('Chess-960', True,
                  (0, 0, 0))
sc.blit(text1, (330, 280))
text1 = f1.render('Battle chess', True,
                  (0, 0, 0))
sc.blit(text1, (520, 280))
# Обновление экрана
pg.display.update()
exit_menu = False
# Переменная выбора игры
game_button = ''
# Время работы главного меню
while not exit_menu:
    for i in pg.event.get():
        if i.type == pg.QUIT:
            sys.exit()
        if i.type == pg.MOUSEBUTTONDOWN:
            if (i.pos[0] >= 310) and (i.pos[0] <= 690) and (i.pos[1] >= 150) and (i.pos[1] <= 230):
                exit_menu = True
                game_button = 'Classic chess'
            if (i.pos[0] >= 310) and (i.pos[0] <= 490) and (i.pos[1] >= 250) and (i.pos[1] <= 330):
                exit_menu = True
                game_button = 'Chess-960'
            if (i.pos[0] >= 510) and (i.pos[0] <= 690) and (i.pos[1] >= 250) and (i.pos[1] <= 330):
                exit_menu = True
                game_button = 'Battle_chess'
        clock.tick(20)

# Подготовка к игре
f1 = pg.font.Font(None, 60)
sc = pg.display.set_mode((760, 760))
sc.fill((190, 190, 190))
# Если выбраны классические шахматы
if game_button == 'Classic chess':
    chess.chess_board_build()
    chess.classic_begin()
# Если выбраны шахматы фишера
elif game_button == 'Chess-960':
    chess.chess_board_build()
    chess.fisherandom_begin()
elif game_button == 'Battle_chess':
    chess.battle_chess_begin()
# Установка шахматных правил
chess.rules()
