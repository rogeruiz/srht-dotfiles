require("luasnip.session.snippet_collection").clear_snippets("all")

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
-- local extras = require("luasnip.extras")

ls.add_snippets("all", {
  s("gpl3", fmt([[{comment} {project}
{comment} Copyright (C) {year} {author}
{comment}
{comment} This program is free software: you can redistribute it and/or modify it
{comment} under the terms of the GNU General Public License as published by the Free
{comment} Software Foundation, either version 3 of the License, or (at your option)
{comment} any later version.
{comment}
{comment} This program is distributed in the hope that it will be useful, but WITHOUT
{comment} ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
{comment} FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
{comment} more details.
{comment}
{comment} You should have received a copy of the GNU General Public License along with
{comment} this program. If not, see <https://www.gnu.org/licenses/>.
{}]], {
    comment = i(1, "#"),
    project = i(2, "<PROJECT>"),
    year = i(3, "<YEAR>"),
    author = i(4, "<AUTHOR>"),
    i(0),
  }, {
    repeat_duplicates = true,
  })),
  s(":lgtm:", fmt([[🌈 lgtm
{}]], {
    i(0),
  }, {
    repeat_duplicates = true,
  }))
})
