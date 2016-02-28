math.randomseed(os.time())
function move1 ()
    while true do
        if math.random(2) == 1 then
            coroutine.yield('move')
        else
            coroutine.yield('stay')
        end
    end
end

function move2 ()
    -- primeiro um pouco à frente
    coroutine.yield('move')
    coroutine.yield('move')
    coroutine.yield('move')
    coroutine.yield('move')

    -- agora espero um pouco
    coroutine.yield('stay')
    coroutine.yield('stay')
    coroutine.yield('stay')
    coroutine.yield('stay')

    -- agora me comporto como "move1"
    move1()
end

player1 = coroutine.wrap(move1)
player2 = coroutine.wrap(move2)

n1 = 0
n2 = 0

while true do
    if player1() == 'move' then
        n1 = n1 + 1
    end
    print('[1] '..string.rep('*',n1))

    if player2() == 'move' then
        n2 = n2 + 1
    end
    print('[2] '..string.rep('*',n2))

    if n1>=10 and n2>=10 then
        print('EMPATE')
        break
    elseif n1 >= 10 then
        print('JOGADOR 1')
        break
    elseif n2 >= 10 then
        print('JOGADOR 2')
        break
    end
    io.read()
end
