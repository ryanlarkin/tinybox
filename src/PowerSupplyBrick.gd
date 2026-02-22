# Tinybox
# Copyright (C) 2023-present Caelan Douglas Carmen Lamprecht
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

extends Brick
class_name PowerSupplyBrick

# Set a custom property
func set_property(property : StringName, value : Variant) -> void:
	super(property, value)
	# set mass after determing mass mult from size
	mass = 10 * mass_mult

# Set the material of this brick to a different one, 
# and update any related properties.
@rpc("call_local")
func set_material(new : Brick.BrickMaterial) -> void:
	# don't change material on activator bricks
	pass

@rpc("any_peer", "call_local", "reliable")
func set_colour(new : Color) -> void:
	# don't change colour
	pass

func _init() -> void:
	_brick_spawnable_type = "brick_power_supply"
	properties_to_save = ["global_position", "global_rotation", "brick_scale", "immovable", "joinable", "indestructible",]

func _ready() -> void:
	super()

@rpc("any_peer", "call_remote", "reliable")
func sync_properties(props : Dictionary) -> void:
	super(props)

func enter_state() -> void:
	super()

func _on_sleeping_state_changed() -> void:
	pass
		
func _physics_process(delta : float) -> void:
	super(delta)

func is_transmiting_power(_visited : Dictionary) -> bool:
	return true
