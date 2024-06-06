extends CanvasLayer

@onready var global = get_node("/root/Global")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Coin.text = ("Coins: " + str(global.coin))
	$Lives.text = ("Lives " + str(global.health))	
