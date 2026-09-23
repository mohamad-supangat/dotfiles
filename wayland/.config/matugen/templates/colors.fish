# Menggunakan 'outline' agar redup namun tetap kontras dan terbaca
set fish_color_autosuggestion {{colors.outline.default.hex_stripped}}
set fish_color_comment {{colors.outline.default.hex_stripped}}

# Warna utama yang terang untuk command, keyword, dan string
set fish_color_command {{colors.primary.default.hex_stripped}}
set fish_color_keyword {{colors.primary.default.hex_stripped}}
set fish_color_quote {{colors.tertiary.default.hex_stripped}}
set fish_color_redirection {{colors.primary.default.hex_stripped}}

# Parameter dan opsi menggunakan warna teks sekunder yang terang
set fish_color_param {{colors.on_surface_variant.default.hex_stripped}}
set fish_color_option {{colors.secondary.default.hex_stripped}}

# Operator dan elemen lain
set fish_color_cancel {{colors.error.default.hex_stripped}} --reverse
set fish_color_cwd {{colors.tertiary.default.hex_stripped}}
set fish_color_cwd_root {{colors.error.default.hex_stripped}}
set fish_color_end {{colors.secondary.default.hex_stripped}}
set fish_color_error {{colors.error.default.hex_stripped}}
set fish_color_escape {{colors.secondary.default.hex_stripped}}
set fish_color_history_current --bold
set fish_color_host {{colors.primary.default.hex_stripped}}
set fish_color_host_remote {{colors.primary.default.hex_stripped}}
set fish_color_normal {{colors.on_background.default.hex_stripped}}
set fish_color_operator {{colors.secondary.default.hex_stripped}}
set fish_color_status {{colors.error.default.hex_stripped}}
set fish_color_user {{colors.tertiary.default.hex_stripped}}
set fish_color_valid_path --underline

# Highlight latar belakang (menggunakan warna container/variant agar gelap dan teks di atasnya tetap terbaca)
set fish_color_match --background={{colors.secondary_container.default.hex_stripped}}
set fish_color_search_match --background={{colors.surface_variant.default.hex_stripped}}
set fish_color_selection --background={{colors.surface_variant.default.hex_stripped}}

# Pager (Menu Auto-completion)
set fish_pager_color_background {{colors.background.default.hex_stripped}}
set fish_pager_color_completion {{colors.on_background.default.hex_stripped}}
set fish_pager_color_description {{colors.on_surface_variant.default.hex_stripped}}
set fish_pager_color_prefix {{colors.primary.default.hex_stripped}}
set fish_pager_color_progress {{colors.on_surface_variant.default.hex_stripped}}
set fish_pager_color_secondary_background {{colors.background.default.hex_stripped}}
set fish_pager_color_secondary_completion {{colors.on_background.default.hex_stripped}}
set fish_pager_color_secondary_description {{colors.on_surface_variant.default.hex_stripped}}
set fish_pager_color_secondary_prefix {{colors.primary.default.hex_stripped}}
set fish_pager_color_selected_background --background={{colors.surface_variant.default.hex_stripped}}
set fish_pager_color_selected_completion {{colors.primary.default.hex_stripped}}
set fish_pager_color_selected_description {{colors.on_surface_variant.default.hex_stripped}}
set fish_pager_color_selected_prefix {{colors.primary.default.hex_stripped}}
