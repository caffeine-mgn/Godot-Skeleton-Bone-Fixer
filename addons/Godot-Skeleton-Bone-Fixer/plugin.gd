tool
extends EditorPlugin

onready var editor_menu=preload("skeleton_panel.tscn").instance()
var editor_visible = false

func make_visible(visible):
	if (editor_visible==visible):
		return
	if (visible):
		add_control_to_container(CONTAINER_SPATIAL_EDITOR_MENU, editor_menu)
	else:
		remove_control_from_container(CONTAINER_SPATIAL_EDITOR_MENU, editor_menu)
	editor_visible=visible

func _enter_tree():
	#editor_menu = preload("skeleton_panel.tscn").instance()
	get_editor_interface().get_selection().connect("selection_changed", self, "_on_node_select_change")
	pass
	
func _on_node_select_change():
	var selectedNodes = get_editor_interface().get_selection().get_selected_nodes()
	if selectedNodes.size()!=1:
		make_visible(false)
	else:
		var is_skeleton = selectedNodes[0] is Skeleton#.get_class() == "Skeleton"
		make_visible(is_skeleton)
		if is_skeleton:
			editor_menu.set_skeleton(selectedNodes[0])
	pass
	
func _exit_tree():
	get_editor_interface().get_selection().disconnect("selection_changed", self, "_on_node_select_change")
	make_visible(false)
	pass
	
func get_plugin_name():
	return "Main Screen Plugin"
