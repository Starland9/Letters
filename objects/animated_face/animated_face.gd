extends AnimatedSprite2D
class_name AnimatedFace

enum States {
	ANNOYED_IDLE,
	ANNOYED_BLINK,
	STARE,
	HAPPY_BLINK,
	HAPPY_IDLE,
	JOY
}

@export var _state := States.HAPPY_IDLE

func _ready() -> void:
	_set_state(States.HAPPY_IDLE)

func _set_state(state: States):
	if not _state == state:
		_state = state
		_update_anim()

func _update_anim():
	match _state:
		States.ANNOYED_IDLE:
			play("annoyed_idle")
		States.ANNOYED_BLINK:
			play("annoyed_blink")
		States.STARE:
			play("annoyed_stare")
		States.HAPPY_BLINK:
			play('happy_blink')
		States.HAPPY_IDLE:
			play("happy_idle")
		States.JOY:
			play("happy_joy")
