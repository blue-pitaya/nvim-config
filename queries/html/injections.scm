;; extends
;; Injection for vue script block
(((raw_text) @el (#has-ancestor? @el script_element)) @injection.content (#set! injection.language "typescript"))
