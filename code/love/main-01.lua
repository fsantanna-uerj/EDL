function love.load ()
    print [[
>>>>
- "love.load" é chamada apenas uma vez
  - usamos esta função para carregar imagens
    e valores iniciais
<<<<
]]
end

function love.update (dt)
    print([[
>>>>
- "love.update" é chamada a cada frame/ciclo do jogo
  - usamos esta função para atualizar as posições,
    testar entradas, etc
  - o valor "dt" contém o número de segundos passados
    desde a última execução:
    - ]]..dt..[[ 
<<<<
]])
    love.timer.sleep(2)
end

function love.keypressed (key)
    print([[
>>>>
- "love.keypressed" é chamada a cada tecla pressionada
  - usamos esta função para "reagir" a teclas
  - o valor "key" representa a tecla pressionada:
    - ]]..key..[[ 
<<<<
]])
end

function love.draw ()
    print [[
>>>>
- "love.draw" é chamada a cada frame/ciclo do jogo
  - usamos essa função para redesenhar a tela
<<<<
]]
end
