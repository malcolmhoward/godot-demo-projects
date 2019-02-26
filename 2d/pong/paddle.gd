extends Area2D
export var ball_dir = 1
# The player assigned to this paddle; player 1 is on the left and player 2 is on the right
export var player_number = 0

const MOVE_SPEED = 100

func _process(delta):
	var which = get_name()
	# If the player_number of the paddle has been set, then use it to determine which player controls it
	if self.player_number in [1, 2]:
		if self.player_number == 1:
			which = "left"
		else:
			which = "right"
	
	# move up and down based on input
	if Input.is_action_pressed(which+"_move_up") and position.y > 0:
		position.y -= MOVE_SPEED * delta
	if Input.is_action_pressed(which+"_move_down") and position.y < get_viewport_rect().size.y:
		position.y += MOVE_SPEED * delta
		

func _on_area_entered( area ):
	if area.get_name() == "ball":
		# assign new direction of the ball, based on its current direction
		if area.direction.x > 0:
			# If the ball is moving to the right, change the direction to the left
			ball_dir = -1
		else:
			# Otherwise, if the ball is moving to the left, change the direction to the right
			ball_dir = 1
		area.direction = Vector2(ball_dir, randf() * 2 - 1).normalized()
		# increase the ball speed
		area.speed = area.speed * 1.5
#		if ball_dir > 0:
#			# ball is moving to the right, so player 1 scores a point
#			area.player_1_score = area.player_1_score + 1
#		else:
#			# ball is moving to the left, so player 2 scores a point
#			area.player_2_score = area.player_2_score + 1
#
#		print("player_1_score: ", area.player_1_score)
#		print("player_2_score: ", area.player_2_score)