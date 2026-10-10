# PAULAR WELLORD-IAC2-GAMDES1-10/10/2026
# enemy.gd
# Detects when the player touches the enemy and sends the player back to the start.
# Attach this script to the Enemy node (a CharacterBody2D).
extends CharacterBody2D
# _ready() runs once, when the Enemy first appears in the game.
func _ready() -> void:
	# $Hitbox means "the child node named Hitbox" (the Area2D you added).
	# An Area2D announces ("emits") a signal named body_entered whenever a
	# physics body overlaps it. connect() says: when that happens, run our
	# function _on_hitbox_body_entered.
	$Hitbox.body_entered.connect(_on_hitbox_body_entered)
# Runs automatically each time something enters the Hitbox area.
# "body" is whatever just entered: the player, the floor, even this enemy.
func _on_hitbox_body_entered(body) -> void:
# Ignore everything except the player. is_in_group() checks the group
	# name that player.gd set up in its _ready() function.
	if body.is_in_group("player"):
		# print() writes a message to the Output panel at the bottom of Godot.
		print("Player touched the enemy!")
		# Call the player's respawn() function (defined in player.gd).
		body.respawn()
