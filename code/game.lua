math.randomseed(os.time())

function ai1 ()
    while true do
        if math.random(2) == 1 then
            coroutine.yield('move')
        else
            coroutine.yield('stand')
        end
    end
end

function ai2 ()
    -- primeiro um pouco à frente
    coroutine.yield('move')
    coroutine.yield('move')
    coroutine.yield('move')
    coroutine.yield('move')

    -- agora espero um pouco
    coroutine.yield('stand')
    coroutine.yield('stand')
    coroutine.yield('stand')
    coroutine.yield('stand')

    -- agora me comporto como "ai1"
    ai1()
end

player1 = coroutine.wrap(ai1)
player2 = coroutine.wrap(ai2)

tot1 = 0
tot2 = 0

while true do
    if player1() == 'move' then
        tot1 = tot1 + 1
    end
    print('[1] '..string.rep('*',tot1))

    if player2() == 'move' then
        tot2 = tot2 + 1
    end
    print('[2] '..string.rep('*',tot2))

    if tot1>=10 and tot2>=10 then
        print('EMPATE')
        break
    elseif tot1 >= 10 then
        print('JOGADOR 1')
        break
    elseif tot2 >= 10 then
        print('JOGADOR 2')
        break
    end
    io.read()
end
