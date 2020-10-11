extends KinematicBody2D

const FLOOR_NORMAL: = Vector2.UP
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed: = Vector2(300.0, 500.0)
export var gravity: = 4000.0
var velo: = Vector2.ZERO #Vector2(300,0)

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta: float) -> void:
	var direction = get_direction()
		
	velo = calculate_move_velo(velo,direction,speed)
	
	#velo = speed * direction
	#velo.y += gravity * delta
	velo = move_and_slide(velo,FLOOR_NORMAL)
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	)

func calculate_move_velo(
		linear_velo: Vector2,
		direction: Vector2,
		speed: Vector2
	) -> Vector2:
	var new_velo: = linear_velo
	new_velo.x = speed.x * direction.x
	new_velo.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velo.y = speed.y * direction.y
	return new_velo
