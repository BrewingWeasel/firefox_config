#!/usr/bin/env bash

overrides=(
   "user_pref(\"layout.css.prefers-color-scheme.content-override\", 0);" # retain default colors

   # password saving (TODO: use something more secure)
   "user_pref(\"signon.rememberSignons\", true);" # restore login manager 
   "user_pref(\"extensions.formautofill.addresses.enabled\", true);" # restore address manager
   "user_pref(\"extensions.formautofill.creditCards.enabled\", true);" # restore credit card manager
   
   # general security:
   # "user_pref(\"permissions.default.geo\", 0);" # allow location requests
   "user_pref(\"browser.search.suggest.enabled\", true);" # restore search suggestions
   
   # hardening
   # "user_pref(\"identity.fxaccounts.enabled\", false);" # remove firefox sync
   # "user_pref(\"browser.tabs.firefox-view\", false); user_pref(\"browser.tabs.firefox-view-next\", false); user_pref(\"browser.tabs.firefox-view-newIcon\", false);" # remove firefox view
)

firefox_css_hacks=(
   "window_control_placeholder_support.css"
   "hide_tabs_toolbar.css"
   # "hide_tabs_toolbar_osx.css"
   # "auto_devtools_theme_for_rdm.css"
   # "autohide_bookmarks_and_main_toolbars.css"
   # "autohide_bookmarks_toolbar.css"
   # "autohide_main_toolbar.css"
   # "autohide_menubar.css"
   # "autohide_navigation_button.css"
   # "autohide_sidebar.css"
   # "autohide_tabstoolbar.css"
   # "autohide_toolbox.css"
   # "bookmarks_below_content.css"
   # "button_effect_icon_glow.css"
   # "button_effect_scale_onclick.css"
   # "button_effect_scale_onhover.css"
   # "buttonlike_toolbarbuttons.css"
   # "centered_statuspanel.css"
   # "centered_tab_content.css"
   # "centered_tab_label.css"
   # "classic_firefox_menu_button.css"
   # "classic_grid_main_menu_popup.css"
   # "click_selected_tab_to_focus_urlbar.css"
   # "color_variable_template.css"
   # "combined_favicon_and_tab_close_button.css"
   # "combined_tabs_and_main_toolbars.css"
   # "compact_extensions_panel.css"
   # "compact_proton.css"
   # "compact_urlbar_megabar.css"
   # "context_menus_more_proton.css"
   # "curved_tabs.css"
   # "custom_default_tab_favicons.css"
   # "custom_menupopup_check_icons.css"
   # "dark_checkboxes_and_radios.css"
   # "disable_newtab_on_middle_click.css"
   # "drag_window_from_urlbar.css"
   # "fake_statusbar_w_bookmarksbar.css"
   # "fake_statusbar_w_menubar.css"
   # "fake_tab_tooltip.css"
   # "fake_urlbar_dropmarker.css"
   # "floating_findbar_on_top.css"
   # "grid_overflow_menu.css"
   # "hide_statuspanel_when_fullscreen.css"
   # "hide_tabs_scrollbuttons.css"
   # "hide_tabs_toolbar_w_alltabs_button.css"
   # "hide_tabs_with_one_tab.css"
   # "hide_tabs_with_one_tab_w_window_controls.css"
   # "hide_toolbox_top_bottom_borders.css"
   # "hide_urlbar_first_row.css"
   # "icon_only_tabs.css"
   # "iconized_main_menu.css"
   # "iconized_menubar_items.css"
   # "inline_tab_audio_icons.css"
   # "integrated_searchbar_popup.css"
   # "less_static_throbber.css"
   # "linux_gtk_window_control_patch.css"
   # "loading_indicator_bouncing_line.css"
   # "loading_indicator_rotating_image.css"
   # "menubar_in_main_toolbar.css"
   # "menubar_in_tabs_toolbar.css"
   # "menubar_in_tabs_toolbar_oneliner_compatible.css"
   # "menulike_bookmarks_folder_popups.css"
   # "menupopup_forced_color_schemes.css"
   # "minimal_in-UI_scrollbars.css"
   # "minimal_text_fields.css"
   # "minimal_toolbarbuttons.css"
   # "minimal_toolbarbuttons_v2.css"
   # "minimal_toolbarbuttons_v3.css"
   # "more_visible_tab_icon.css"
   # "multi-row_bookmarks.css"
   # "multi-row_main_toolbar.css"
   # "multi-row_oneliner_combo_patch.css"
   # "multi-row_tabs.css"
   # "multi-row_tabs_below_content.css"
   # "multi-row_tabs_separate_pinned_row_patch.css"
   # "multi-row_tabs_window_control_patch.css"
   # "navbar_below_content.css"
   # "navbar_tabs_oneliner.css"
   # "navbar_tabs_oneliner_menu_buttons_on_right.css"
   # "navbar_tabs_oneliner_tabs_on_left.css"
   # "navbar_tabs_responsive_oneliner.css"
   # "navigation_buttons_inside_urlbar.css"
   # "newtab_button_always_on_hover.css"
   # "non_floating_sharp_tabs.css"
   # "normal_pinned_tabs.css"
   # "numbered_tabs.css"
   # "overlay_fullscreen_toolbars.css"
   # "overlay_menubar.css"
   # "overlay_sidebar_header.css"
   # "overlay_tab_audio_icons.css"
   # "page_action_buttons_on_hover.css"
   # "page_action_buttons_on_urlbar_hover.css"
   # "pinned_tabs_on_right.css"
   # "privatemode_indicator_as_menu_button.css"
   # "proton_dark_light_notifications.css"
   # "reload_button_in_urlbar.css"
   # "round_caption_buttons.css"
   # "round_ui_items.css"
   # "rounded_menupopups.css"
   # "scrollable_menupopups.css"
   # "scrollable_urlbar_popup.css"
   # "selected_tab_as_urlbar.css"
   # "selected_tab_gradient_border.css"
   # "sharp_menupopup_corners.css"
   # "show_navbar_on_focus_only.css"
   # "show_toolbars_in_popup_windows.css"
   # "show_window_title_in_menubar.css"
   # "shrinking_pinned_tabs.css"
   # "status_inside_menubar.css"
   # "status_inside_urlbar.css"
   # "status_inside_urlbar_v2.css"
   # "tab_animated_active_border.css"
   # "tab_close_button_always_on_hover.css"
   # "tab_closing_animation.css"
   # "tab_effect_scale_onclick.css"
   # "tab_line_loading_indicator.css"
   # "tab_loading_progress_bar.css"
   # "tab_loading_progress_throbber.css"
   # "tab_separator_lines.css"
   # "tabs_animated_gradient_border.css"
   # "tabs_below_content.css"
   # "tabs_fill_available_width.css"
   # "tabs_on_bottom.css"
   # "tabs_on_bottom_menubar_on_top_patch.css"
   # "textual_context_navigation.css"
   # "textual_searchbar_one-offs.css"
   # "toggle_tabs_toolbar_with_alt.css"
   # "toolbarbuttons_icon+label.css"
   # "toolbarbuttons_in_tabs_periphery.css"
   # "toolbars_below_content.css"
   # "urlbar_centered_text.css"
   # "urlbar_connection_type_background_colors.css"
   # "urlbar_connection_type_text_colors.css"
   # "urlbar_container_color_border.css"
   # "urlbar_info_icons_on_hover.css"
   # "urlbar_popup_full_width.css"
   # "urlbar_results_in_two_rows.css"
   # "urlbar_visible_on_active_tab_click.css"
   # "vertical_bookmarks_toolbar.css"
   # "vertical_context_navigation.css"
   # "vertical_context_navigation_v2.css"
   # "vertical_menubar.css"
   # "vertical_popup_menubar.css"
   # "vertical_tabs.css"
   # "vertical_urlbar_one-off_items.css"
   # "window_control_fallback_for_custom_windows_theme.css"
   # "window_control_force_linux_system_style.css"
)

echo -e "\033[0;31mOverriding betterfox user.js with:\033[0m"
printf "%s\n" "${overrides[@]}"
echo
echo

# TODO: why are there carriage returns in the first place?
echo -e "\033[0;35mDownloading betterfox user.js"
curl "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js" 2> /dev/null | sed '/Enter your personal overrides below this line:/r'<(printf "%s\n" "${overrides[@]}") | tr -d '\r' > user.js
echo -e "\033[0;35mDownload complete"
echo

echo "preparing userChrome.css"
rm chrome/userChrome.css 2> /dev/null
rm chrome/css_hacks/*.css 2> /dev/null
mkdir chrome/css_hacks 2> /dev/null
echo
for css_hack in "${firefox_css_hacks[@]}"; do 
   echo -e "\033[0;35mAdding \033[0;33m${css_hack}\033[0;35m to userChrome.css"
   echo "@import url(css_hacks/$css_hack);" >> chrome/userChrome.css
   echo -e "Downloading \033[0;33m${css_hack}"
   curl "https://raw.githubusercontent.com/MrOtherGuy/firefox-csshacks/master/chrome/$css_hack" > "chrome/css_hacks/$css_hack" 2> /dev/null
   echo -e "\033[0;35mDownloaded \033[0;33m${css_hack}"
done
echo -e "\033[0;35mUpdate Completed! \033[0m"
