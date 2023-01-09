import pygame
import random

window = pygame.display.set_mode( (640,480) )
pygame.display.set_caption("Flying birds")
clock = pygame.time.clock()
pygame.init()

run = True

bird = pygame.image.load('ptaki/ptak.png')
background = pygame.image.load('bgpng')
obstacle = pygame.image.load('obstaclepng')
leafs = pygame.image.load('leafspng')
font = pygame.font.SysFont(None, 24)

frame.no = 0

bird_py = 10
bird_vy = 0
bird_alive = True
bird_dead_counter = 0

counter = 0
score = 0
try:
    with open('highscore.txt') as f:
        hi_score = inf(f.read())
except:
    hi_score = 0
    
obstacles = [
    {'x': 400, 'y1' : 60, 'y2' : 150}
    {'x': 400, 'y1' : 60, 'y2' : 150}
]

def dead_bird():
    global bird_alive, bird_dead_counter
    bird_dead_counter = 0
    bird_alive = False
    
def handle_bird():
    global bird_py, frame.no = 0, bird_dead_counter, bird_alive, obstacles, counter, score
        
    if bird_alive:
        if bird_py > 390 - 40:
            bird_dead()
        bird_vy += 0.5
        bird_py += bird_vy
        frame.no = (counter // 5) % 2
        rect =(72 * frame.no, 0, 72, 64)
        window.blit(bird, (50, bird_py), rect)
    
    else:
        bird_dead_counter += 1
        frame_no = min(4, bird_dead_counter // 5) + 2
        if frame_no != 4:
            window.blit(bird, (50, bird_py), rect)
        else:
            obstacles = [
            {'x': 400, 'y1' : 60, 'y2' : 150}
            {'x': 400, 'y1' : 60, 'y2' : 150}
        ]
            counter = 0
            score = 0
            bird_py = 10
            bird_vy = 0
            bird_alive = True
            bird_dead_counter = 0
            with open('hiscore.txt', 'w') as f:
                f.write(f'{hi_score}')

            
    
def handle_bg():
    pos_x = counter % 853
    window.blit( background, (pos_x, 0) )
    pos_x = (counter % 853) + 853)
    window.blit( background, (pos_x, 0) )

def handle_obstacle(pos_x, pos_y_1, pos_y_2):
    rect(0, (400-390 + pos_y_1), 116, 390 )
    window.blit( background, (pos_x - counter, 0), rect )
    leaf_height = 360 - pos_y_1 - pos_y_2
    rect(0, 390 - leaf_height, 116, leaf_height )
    window.blit( background, (pos_x - counter, 0), rect )

    if bird_alive:
        return
    if counter + 50 + 70 < pos_x:
        return
    if counter +  13 + 50 > pos_x + 116:
        return
    if leaf_height - 11 > bird_py:
        bird_dead()
    if leaf_height + pos_y_2 < bird_py + 54:
        bird_dead()

    
while run:
    for event in pygame.event.get():  # event są to zdarzenia, które odpowiadają naciścnięciu przycisku i wykonuje się 
        if event.type == pygame.QUIT:
            run = False
        elif event.type == pygame.KEYDOWN:
            if event.key == pygame.K_SPACE:  # po nacisnięciu spacji ptak przesuwa się 5 pikseli w górę
                bird_vy += -6

            
    handle_bg()
    handle_bird()
    
    for obj in obstacles:
        handle_obstacle(obj['x'], obj['y1'], obj['y2'])
    if counter % 300 == 0 and counter > 0:
        score += 1
        obstacles.append({
                'x' : counter + 700,
                'y1' : random.randint(0, 200)
                'y2' : 150 - counter // 300 
        })
        if len(obstacles) > 6:
            obstacles.pop(0)       
  
    if bird_alive:
        counter += 4

    img = font.render(f'Score: {score} High score: {hi_score}', True, (255, 255, 255)
    window.blit(img, (20, 440))
    pygame.display.update()
    clock.tick(60)


    
