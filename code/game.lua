math.randomseed(os.time())
function move ()
    while true do
        if math.random(2) == 1 then
            coroutine.yield('move')
        else
            coroutine.yield('stay')
        end
    end
end

player1 = coroutine.wrap(move)
player2 = coroutine.wrap(move)

moves1 = 0
moves2 = 0

while true do
    if player1() == 'move' then
        moves1 = moves1 + 1
    end
    print('[1] '..string.rep('*',moves1))

    if player2() == 'move' then
        moves2 = moves2 + 1
    end
    print('[2] '..string.rep('*',moves2))

    if moves1>=10 and moves2>=10 then
        print('EMPATE')
        break
    elseif moves1 >= 10 then
        print('JOGADOR 1')
        break
    elseif moves2 >= 10 then
        print('JOGADOR 2')
        break
    end
    io.read()
end
