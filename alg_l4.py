#Kolchedanstev Alexey


move_count = 8

possible_moves = [
        [-1, -2], [-2, -1], [-2,  1], [ 1, -2],
        [-1,  2], [ 2, -1], [ 1,  2], [ 2,  1]]
xrows = 5
ycols = 5
sx = 0
sy = 0

# Что бы изменить размер доски, необходимо вручную изменить размер массива desk
# и измеить переменные xrows и ycols
desk = [[],[],[],[],[],[]]
for x in range(xrows):
    for y in range(ycols):
       desk[x].append(0) 

_desk = desk
size_x = xrows
size_y = ycols
max_moves = (size_x * size_y) - 1

def if_possible_to_put(x, y):
    return x >= 0 and y >= 0 and x < size_x and y < size_y

def possible_move(x, y):
    return if_possible_to_put(x,y) and _desk[x][y] == 0

def search_the_way(_x, _y, count):
    i = 0
    next_x = 0
    next_y = 0
    _desk[_x][_y] = count
    if count > max_moves:
        return 1

    while i < move_count:
        next_x = _x + possible_moves[i][0]
        next_y = _y + possible_moves[i][1]

        if possible_move(next_x, next_y) and search_the_way(next_x, next_y, count + 1):
            return 1
        i += 1

    _desk[_x][_y] = 0
    count += 1
    return 0

def outPut():
    i = 0
    j = 0
    while i < size_x:
        while j < size_y:
            print(_desk[j])
            j += 1
        i += 1


if search_the_way(sx, sy, 1):
    outPut()
else:
    print("Not possible")



























