signal hit
extends Area2D
export var speed = 400 #velocidad del jugador
var screen_size #tamaño del juego en ventana 
func _ready():
#	hide()
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed ("mov_izq") : 
		velocity.x -= 1 
	if Input.is_action_pressed("mov_der") :
		velocity.x += 1
	if Input.is_action_pressed("mov_arriba"):
		velocity.y -= 1
	if Input.is_action_pressed("mov_abajo"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else :
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.x !=0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
			$AnimatedSprite.animation = "up"
			$AnimatedSprite.flip_v = velocity.y > 0 
	
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false 

func _on_Player_body_entered(body):
	hide() 
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disable", true)
	 # Replace with function body.
