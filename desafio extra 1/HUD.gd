extends CanvasLayer
signal start_game



func show_message (text) : 
	$Message.text = text 
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	yield($MessageTimer, "timeout")
	
	$Message.text = "Esquiva lo chobi! "
	$Message.show()
	yield(get_tree().create_timer(1),"timeout")
	$StartButton.show()
	
	
func update_score(score):
	$ScoreLabel.text = str(score)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MessageTimer_timeout():
	$StartButton.hide()
	emit_signal("start_game")
	
	 # Replace with function body.


func _on_StartButton_pressed():
	$Message.hide()
	
	 # Replace with function body.