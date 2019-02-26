extends Area2D

const BALL_SPEED = 100
var points_per_score = 1
var direction = Vector2(-1, 0)
var speed = BALL_SPEED

var player_1_score = 0
var player_2_score = 0

onready var initial_pos = self.position
var player_1_label = null
var player_2_label = null
var player_1_label_text = null
var player_2_label_text = null
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	player_1_label = get_node("../player1_score_label")
	player_2_label = get_node("../player2_score_label")
	player_1_label_text = player_1_label.text
	player_2_label_text = player_2_label.text
	player_1_label.text = player_1_label_text + ": " + str(player_1_score)
	player_2_label.text = player_2_label_text + ": " + str(player_2_score)
	print("labels initialized")
func reset():
	update_score()
	position = initial_pos
	speed = BALL_SPEED
	# var direction = Vector2(-1, 0)
	# direction.x = direction.x * -1
	direction = Vector2(direction.x * -1, 0)
	
func update_score():
	# update the player score when the ball goes off-screen
	if direction.x > 0:
		# ball is moving to the right, so player 1 scores a point
		player_1_score = player_1_score + 1
	else:
		# ball is moving to the left, so player 2 scores a point
		player_2_score = player_2_score + 1
	
	print("player_1_score: ", player_1_score)
	print("player_2_score: ", player_2_score)
	player_1_label.text = player_1_label_text + ": " + str(player_1_score)
	player_2_label.text = player_2_label_text + ": " + str(player_2_score)
	
func _process(delta):
	position += direction * speed * delta
	
	
