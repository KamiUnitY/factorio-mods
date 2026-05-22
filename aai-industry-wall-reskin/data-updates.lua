local util = require("__aai-industry__/data-util")

data.raw.item["stone-wall"].icon = "__aai-industry-wall-reskin__/graphics/icons/stone-wall.png"
util.replace_filenames_recursive(data.raw.wall["stone-wall"].pictures, "__aai-industry__", "__aai-industry-wall-reskin__")