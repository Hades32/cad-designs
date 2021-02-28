import importlib

# this works around CQ-editor's inability to detect changes in WSL2
import phoneholder
importlib.reload(phoneholder)
show_object(phoneholder.result)


