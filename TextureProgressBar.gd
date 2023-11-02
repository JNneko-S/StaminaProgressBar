extends TextureProgressBar

@onready var stamina = $"."

var can_regen = false
var time_to_wait = 4.5
var s_timer = 0
var can_start_stimer = true
var isWASDPressed = false

func _ready():
	stamina.value = stamina.max_value
	
func _process(delta):
	if can_regen == false && stamina.value != 100 or stamina.value == 0:
		can_start_stimer = true
		print("can_start_stimerが作動")
		if can_start_stimer:
			s_timer += delta
			print("s_timer += delta")
			if s_timer >= time_to_wait:
				can_regen = true
				can_start_stimer = false
				s_timer = 0
				print("can_regen = true / can_start_stimer = false")
				

	if stamina.value == 1000:
		can_regen = false
		print("スタミナが満タン")

	if can_regen == true:
		stamina.value += 0.7
		print("+0.5")
		can_start_stimer = false
		s_timer = 0
		print("回復中")
		
	if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_D):
		isWASDPressed = true
		
	if isWASDPressed and Input.is_key_pressed(KEY_SHIFT):
		stamina.value -= 3.5
		can_regen = false
		s_timer = 0
		print("ダッシュ")
			
