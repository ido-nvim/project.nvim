local ido = require("ido")
local std = require("ido.std")

local project = {}

project.root = "~/code"

local function project_goto_root()
    vim.fn.chdir(project.root..project.current)
end

function project.find()
    project_goto_root()
    std.git_files()
end

function project.select()
    project.root = vim.fn.fnamemodify(project.root, ":p")

    if std.is_inside_git() then
        local current = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if vim.startswith(current, project.root) then
            project.current = current:sub(project.root:len() + 1)
            return
        end
    end

    local items = vim.fn.systemlist("find '"..project.root:gsub("'", "'\"'\"'").."' -name .git -type d -prune")
    items = vim.tbl_map(function (path)
        return vim.fn.fnamemodify(path:sub(project.root:len() + 1), ":h")
    end, items)

    project.current = ido.start(items, {prompt = "Project: "})
end

function project.open()
    project.select()
    if project.current then
        project.find()
    end
end

function project.find_files()
    if not project.current then
        project.open()
    else
        project.find()
    end
end

function project.buffer()
    if not project.current then
        project.open()
        return
    end

    local root = project.root..project.current
    local list = vim.tbl_map(function (name)
        return vim.fn.fnamemodify(name, ":p"):sub(root:len() + 2)
    end, vim.fn.getcompletion(root, "buffer"))
    std.buffer_sort(list)

    local buffer = ido.start(list, {prompt = "Buffer: "})
    if buffer then
        vim.cmd("buffer "..buffer)
    end
end

return project
