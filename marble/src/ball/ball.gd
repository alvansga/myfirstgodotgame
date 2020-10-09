extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed: = Vector2(300.0, 1000.0)
export var gravity: = 1500.0
var velo: = Vector2.ZERO #Vector2(300,0)

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta: float) -> void:
	var direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		0.0
	)
	velo = speed * direction
	velo.y += gravity * delta
	#velo.y = max()
	move_and_slide(velo)
	
	
