{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 2,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 50.0, 100.0, 1000.0, 700.0 ],
        "openinpresentation": 0,
        "default_fontsize": 12.0,
        "default_fontname": "Arial",
        "gridonopen": 1,
        "gridsize": [ 15.0, 15.0 ],
        "gridsnaponopen": 1,
        "toolbarvisible": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 10.0, 800.0, 20.0 ],
                    "text": "MCP Bridge Demo -- Send [start] to the bridge, then connect from OpenCode/Claude",
                    "fontsize": 13.0,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-instructions",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 35.0, 800.0, 20.0 ],
                    "text": "AI-created objects appear in THIS patcher. The bridge uses parentpatcher to target its container."
                }
            },
            {
                "box": {
                    "id": "obj-start-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 15.0, 65.0, 38.0, 22.0 ],
                    "text": "start"
                }
            },
            {
                "box": {
                    "id": "obj-stop-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 65.0, 65.0, 35.0, 22.0 ],
                    "text": "stop"
                }
            },
            {
                "box": {
                    "id": "obj-bridge",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 100.0, 130.0, 22.0 ],
                    "text": "p mcp_bridge 5002",
                    "color": [ 0.99, 0.69, 0.15, 1.0 ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 150.0, 200.0, 650.0, 480.0 ],
                        "default_fontsize": 12.0,
                        "default_fontname": "Arial",
                        "gridonopen": 1,
                        "gridsize": [ 15.0, 15.0 ],
                        "gridsnaponopen": 1,
                        "toolbarvisible": 1,
                        "title": "MCP Bridge",
                        "boxes": [
                            {
                                "box": {
                                    "id": "sub-comment",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 15.0, 10.0, 580.0, 20.0 ],
                                    "text": "MCP Bridge -- Accepts: start, stop, port <number>. Arg #1 = default port (5002)."
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-inlet",
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 15.0, 45.0, 30.0, 30.0 ],
                                    "comment": "start, stop, port <number>"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-route",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 4,
                                    "outlettype": [ "", "", "", "" ],
                                    "patching_rect": [ 15.0, 85.0, 200.0, 22.0 ],
                                    "text": "route start stop port"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-start-script",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 15.0, 115.0, 72.0, 22.0 ],
                                    "text": "script start"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-stop-script",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 95.0, 115.0, 67.0, 22.0 ],
                                    "text": "script stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-port-prepend",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 175.0, 115.0, 85.0, 22.0 ],
                                    "text": "prepend port"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-loadbang",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 350.0, 45.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-default-port",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 350.0, 75.0, 80.0, 22.0 ],
                                    "text": "port #1"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-node",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 15.0, 160.0, 200.0, 22.0 ],
                                    "color": [ 0.99, 0.69, 0.15, 1.0 ],
                                    "saved_object_attributes": {
                                        "autostart": 0,
                                        "defer": 0,
                                        "watch": 0
                                    },
                                    "text": "node.script max_mcp_node.js"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-route-cmd",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 15.0, 200.0, 120.0, 22.0 ],
                                    "text": "route command"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-js",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 15.0, 270.0, 200.0, 22.0 ],
                                    "color": [ 0.87, 0.55, 0.0, 1.0 ],
                                    "saved_object_attributes": {
                                        "filename": "max_mcp.js",
                                        "parameter_enable": 0
                                    },
                                    "text": "js max_mcp.js"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-v8",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 350.0, 320.0, 180.0, 22.0 ],
                                    "color": [ 0.99, 0.75, 0.39, 1.0 ],
                                    "saved_object_attributes": {
                                        "parameter_enable": 0
                                    },
                                    "text": "v8 max_mcp_v8_add_on.js"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-status",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 15.0, 430.0, 550.0, 20.0 ],
                                    "text": "js/v8 use parentpatcher to target the patcher containing [p mcp_bridge]. Backward compatible at top level."
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-console",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "int" ],
                                    "patching_rect": [ 350.0, 200.0, 120.0, 22.0 ],
                                    "varname": "mcp_console",
                                    "text": "console"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-pack-console",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 350.0, 240.0, 72.0, 22.0 ],
                                    "text": "pack s s 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "sub-console-label",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 480.0, 200.0, 150.0, 20.0 ],
                                    "text": "Console capture -> js inlet 1"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "sub-route", 0 ],
                                    "source": [ "sub-inlet", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-start-script", 0 ],
                                    "source": [ "sub-route", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-stop-script", 0 ],
                                    "source": [ "sub-route", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-port-prepend", 0 ],
                                    "source": [ "sub-route", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-node", 0 ],
                                    "source": [ "sub-start-script", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-node", 0 ],
                                    "source": [ "sub-stop-script", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-node", 0 ],
                                    "source": [ "sub-port-prepend", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-default-port", 0 ],
                                    "source": [ "sub-loadbang", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-node", 0 ],
                                    "source": [ "sub-default-port", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-route-cmd", 0 ],
                                    "source": [ "sub-node", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-js", 0 ],
                                    "source": [ "sub-route-cmd", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-node", 0 ],
                                    "source": [ "sub-js", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-v8", 0 ],
                                    "source": [ "sub-js", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-node", 0 ],
                                    "source": [ "sub-v8", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-pack-console", 0 ],
                                    "source": [ "sub-console", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-pack-console", 1 ],
                                    "source": [ "sub-console", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-pack-console", 2 ],
                                    "source": [ "sub-console", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "sub-js", 1 ],
                                    "source": [ "sub-pack-console", 0 ]
                                }
                            }
                        ]
                    },
                    "saved_object_attributes": {
                        "description": "MCP Bridge - Socket.IO server for AI agent communication",
                        "digest": "",
                        "globalpatchername": "",
                        "tags": ""
                    }
                }
            },
            {
                "box": {
                    "id": "obj-divider",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 135.0, 800.0, 20.0 ],
                    "text": "--- Workspace: AI-created objects appear below this line ---",
                    "fontface": 2
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-bridge", 0 ],
                    "source": [ "obj-start-msg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-bridge", 0 ],
                    "source": [ "obj-stop-msg", 0 ]
                }
            }
        ]
    }
}
