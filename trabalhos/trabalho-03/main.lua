-- Space Jamm 2.0
-- Universidade do Estatod do Rio de Janeiro - UERJ
-- Lucas Lira e Caio Saud

function love.load()

	-- BMG's and Images
	bmg = love.audio.newSource("SimpleBeat.mp3", "stream", true )
	bmg:play()
	winbmg = love.audio.newSource("Stepping.mp3", "stream", true )
	bulletimg = love.graphics.newImage ('LaserBlue.png')
	background = love.graphics.newImage('Back_Ground.jpg')
	winning = love.graphics.newImage('Won.png')

	--Game States
	gameOver=false
	gameWon=false
	canMove=true
	score=0
	--Window Dimensions
	winw = love.graphics.getWidth()
	winh = love.graphics.getHeight()

	--Create Player
	player = {}

	player.image = love.graphics.newImage('PlayerShip.png')
	player.w, player.h = 32
	player.x = winw / 2 - player.w
	player.y = winh - 50
	player.speed = 300

	--Create Enemies
	enemies = {}

	for j = 0, 1 do
		for i = 0, 7 do
			enemy = {}
			enemy.image = love.graphics.newImage('EnemyShip.png')
			enemy.w = 32
			enemy.h = 32
			enemy.x = i * (enemy.w + 60) + 100
			enemy.y = j * (enemy.h + 100) + 100
			enemy.speed = 60
			table.insert(enemies, enemy)
			enemy.right = true
		end
	end

	--Creating collision rectangle for left side
	colrectL = {}
	colrectL.x = -10
	colrectL.y = 0
	colrectL.w = 10
	colrectL.h = 600
	colrectL.mode = "fill"

	--creating collision rectangle for right side
	colrectR = {}
	colrectR.x = winw + 1
	colrectR.y = 0
	colrectR.w = 10
	colrectR.h = 600
	colrectR.mode = "fill"

	--Create Bullets
	bullets = {}
	--Bullet Timer
	canShoot = true
	canShootTimerMax = 0.5 --0.9 = perfect speed || lower speeds = faster shooting
	shootSpeed = 400
	canShootTimer = canShootTimerMax
end

function love.update(dt)

	--can shoot?
	canShootTimer = canShootTimer - (1 * dt)
	if canShootTimer < 0 then canShoot = true end

	 --boundaries and movement for player
	if canMove and love.keyboard.isDown("right") and player.x + player.w <= winw then player.x = player.x + player.speed * dt; end

    if canMove and love.keyboard.isDown("left") and player.x >= 0 then player.x = player.x - player.speed * dt; end

    --Create bullets when z or space is pressed 
    if love.keyboard.isDown(' ', 'z') and canShoot then
	newBullet = { x = player.x + (player.image:getWidth()/2), y = player.y, img = bulletImg }
	table.insert(bullets, newBullet)
	canShoot = false
	canShootTimer = canShootTimerMax
	end

-- Boundaries for Enemies

	--Enemy Loop
	 for i,v in ipairs(enemies) do
    	--Colision Check (w/ Rectangles)
  		if v.x < colrectR.x + colrectR.w and colrectR.x < v.x + v.w and v.y < colrectR.y + colrectR.h and colrectR.y < v.y + v.h then
			enemy.right = false
		end
  		if v.x < colrectL.x + colrectL.w and colrectL.x < v.x + v.w and v.y < colrectL.y + colrectL.h and colrectL.y < v.y + v.h then
			enemy.right = true
		end

	--Moving AI_Enemies (if true = move right / if false = move left)
		if enemy.right then v.x = v.x + enemy.speed * dt end

		if enemy.right == false then v.x = v.x - enemy.speed * dt end
	end

	--Update bullets positions
	for i, bullet in ipairs(bullets) do
		bullet.y = bullet.y - (shootSpeed * dt)

  		if bullet.y < 0 then -- Remove Bullets (Off the screen)
			table.remove(bullets, i)
		end
	end

	--Bullet Collision logic loop
    for i, enemy in ipairs(enemies) do
		for j, bullet in ipairs(bullets) do
			if CheckCollision(enemy.x, enemy.y, enemy.image:getWidth(), enemy.image:getHeight(), bullet.x, bullet.y, bulletimg:getWidth(), bulletimg:getHeight()) then
				table.remove(bullets, j)
				table.remove(enemies, i)
				score = score + 131
			end
		end
	end

	if not next(enemies) then
			for i, bullet in ipairs(bullets) do
				table.remove(bullets)
				canShoot = false
				canMove = false
				canShootTimer = canShootTimerMax
			end
						
			gameWon = true
			
	end
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function love.draw()
		--Drawing background
		love.graphics.draw(background)
	
		--Drawing player
		love.graphics.draw(player.image, player.x, player.y)
	
	
		--Collision rectangles
		love.graphics.rectangle(colrectR.mode, colrectR.x, colrectR.y, colrectR.w, colrectR.h)
		love.graphics.rectangle(colrectL.mode, colrectL.x, colrectL.y, colrectL.w, colrectL.h)

		--drawing bullets
		for i, bullet in ipairs(bullets) do
  		love.graphics.draw(bulletimg, bullet.x, bullet.y)
		end

		--drawing enemies
		for i,v in ipairs(enemies) do
    		love.graphics.draw(enemy.image, v.x, v.y, v.width, v.height)
		end
		love.graphics.print("Score: " .. score, 10, 5)

		--Checking for GameOver
	if gameWon == true then
		bmg:stop()
		winbmg:play()
		winbmg:setVolume(0.1)
		love.graphics.draw(winning, 0, 0)
	end 
end

