; extends
((inline) @injection.content
  (#lua-match? @injection.content "^%s*import")
  (#set! injection.language "tsx"))
((inline) @injection.content
  (#lua-match? @injection.content "^%s*export")
  (#set! injection.language "tsx"))
