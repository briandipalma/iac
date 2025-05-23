function update_screenshots
    for actual_screenshot in (fd -E '*retry*' actual.png ~/Downloads/artifacts/)
        set file_parts (string split \/ $actual_screenshot)
        set application $file_parts[7]
        set variant_browser (string split - $file_parts[10])
        set variant $variant_browser[1]
        set browser $variant_browser[-1]
        set current_screenshot (string replace -r "\-actual" _$browser-ci $file_parts[11])
        set current_filepath (string join / apps $application pw-tests/tests $variant screenshots $current_screenshot)

        cp $actual_screenshot $current_filepath
    end
end
