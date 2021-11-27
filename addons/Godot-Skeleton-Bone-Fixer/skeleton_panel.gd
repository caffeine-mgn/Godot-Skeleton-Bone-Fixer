tool
extends ToolButton


func _on_Control_pressed():
	if current_skeleton != null:
		fix_skeleton(current_skeleton)
		$AcceptDialog.popup_centered()
		
	
var current_skeleton:Skeleton

func set_skeleton(skeleton:Skeleton)->void:
	current_skeleton = skeleton

func fix_skeleton(skeleton:Skeleton)->void:
	for child in skeleton.get_children():
		if child is PhysicalBone:
			
			child.global_transform = skeleton.get_bone_global_pose(skeleton.find_bone(child.bone_name)).scaled(Vector3(0.01, 0.01, 0.01)).rotated(Vector3.RIGHT, PI/2 )
			child.global_transform.origin += skeleton.global_transform.origin
			var shape:Spatial = child.get_child(0)
			shape.rotation.x = PI / 2
			shape.transform.origin.y = shape.shape.height / 2 + shape.shape.radius
