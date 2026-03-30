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
        "rect": [ 100.0, 100.0, 650.0, 480.0 ],
        "openinpresentation": 0,
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
                    "id": "obj-comment",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 10.0, 580.0, 20.0 ],
                    "text": "MCP Bridge -- Inlet: start, stop, port <number>. Arg #1 = default port (5002)."
                }
            },
            {
                "box": {
                    "id": "obj-inlet",
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
                    "id": "obj-route",
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
                    "id": "obj-start-script",
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
                    "id": "obj-stop-script",
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
                    "id": "obj-port-prepend",
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
                    "id": "obj-loadbang",
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
                    "id": "obj-default-port",
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
                    "id": "obj-node",
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
                    "id": "obj-route-cmd",
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
                    "id": "obj-js",
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
                    "id": "obj-v8",
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
                    "id": "obj-status",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 430.0, 550.0, 20.0 ],
                    "text": "js/v8 use parentpatcher to target the containing patcher. Backward compatible at top level."
                }
            },
            {
                "box": {
                    "id": "obj-console",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 350.0, 200.0, 120.0, 22.0 ],
                    "varname": "mcp_console",
                    "text": "console"
                }
            },
            {
                "box": {
                    "id": "obj-pack-console",
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
                    "id": "obj-console-label",
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
                    "destination": [ "obj-route", 0 ],
                    "source": [ "obj-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-start-script", 0 ],
                    "source": [ "obj-route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-stop-script", 0 ],
                    "source": [ "obj-route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-port-prepend", 0 ],
                    "source": [ "obj-route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-node", 0 ],
                    "source": [ "obj-start-script", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-node", 0 ],
                    "source": [ "obj-stop-script", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-node", 0 ],
                    "source": [ "obj-port-prepend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-default-port", 0 ],
                    "source": [ "obj-loadbang", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-node", 0 ],
                    "source": [ "obj-default-port", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route-cmd", 0 ],
                    "source": [ "obj-node", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 0 ],
                    "source": [ "obj-route-cmd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-node", 0 ],
                    "source": [ "obj-js", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-v8", 0 ],
                    "source": [ "obj-js", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-node", 0 ],
                    "source": [ "obj-v8", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pack-console", 0 ],
                    "source": [ "obj-console", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-js", 1 ],
                    "source": [ "obj-pack-console", 0 ]
                }
            }
        ]
    }
}
