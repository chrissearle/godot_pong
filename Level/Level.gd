extends Node

var player_score = 0
var opponent_score = 0

const player_x_offset = 50

var width = 0

func _ready():
	width = get_viewport().size.x
	countdown()

func _process(delta):
	$Player.position.x = player_x_offset
	$Opponent.position.x = width - player_x_offset
	$PlayerScore.text = str(player_score)
	$OpponentScore.text = str(opponent_score)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)

func _on_LeftArea_body_entered(body):
	if (body == $Ball):
		opponent_score += 1
		scored()

func _on_RightArea_body_entered(body):
	if (body == $Ball):
		player_score += 1
		scored()

func scored():
	$ScoreSound.play()
	countdown()

func countdown():
	$Ball.stop_ball()
	$CountdownLabel.visible = true
	$CountdownTimer.start()

func _on_CountdownTimer_timeout():
	$CountdownLabel.visible = false
	$Ball.start_ball()
