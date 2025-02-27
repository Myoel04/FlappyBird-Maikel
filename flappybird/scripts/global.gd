extends Node

signal on_increment_score #creo una señal para cuando pase el pajaro entre
#las tuberias
signal on_game_start
signal on_game_over
var score := 0
var is_start := false
var nivel_actual := 1


#EMPEZAR EL JUEGO
func start_game():
	is_start = true
	score = 0
	nivel_actual=1
	#emit_signal("on_increment_score")
	emit_signal("on_game_start") #emitir señal de que empezo el juego

#SUMAR MPUNTOS
func increment_score():
	score += 1
	check_level_up()
	#on_increment_score.emit()
	emit_signal("on_increment_score")
#y cuando pasa que emita la señal

#incrementar el nivel
func check_level_up():
	if score == 15 and nivel_actual == 1:
		nivel_actual += 1

	elif score == 30 and nivel_actual == 2:
		nivel_actual += 1



#FINALIZAR JUEGO
func gameOver():
	is_start = false
	get_tree().paused = true
	emit_signal("on_game_over") #emitir la señal del game over
