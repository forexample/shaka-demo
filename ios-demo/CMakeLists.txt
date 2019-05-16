set(
    resources
    ${CMAKE_CURRENT_LIST_DIR}/Base.lproj/LaunchScreen.storyboard
    ${CMAKE_CURRENT_LIST_DIR}/Base.lproj/Main.storyboard
    ${CMAKE_CURRENT_LIST_DIR}/assets.plist
    ${CMAKE_CURRENT_LIST_DIR}/Assets.xcassets
)

add_executable(
    ShakaPlayer
    AppDelegate.h
    AppDelegate.m
    AssetSelectionTableViewController.h
    AssetSelectionTableViewController.m
    ConfigTableValue.h
    ConfigTableValue.m
    ConfigTableViewController.h
    ConfigTableViewController.m
    ErrorDisplayView.h
    ErrorDisplayView.m
    LicenseTableViewController.h
    LicenseTableViewController.m
    LicenseViewController.h
    LicenseViewController.m
    NSObject+ShakaLayoutHelpers.h
    NSObject+ShakaLayoutHelpers.m
    PlayerViewController.h
    PlayerViewController.m
    ProgressAndBufferedSlider.h
    ProgressAndBufferedSlider.m
    main.m
    ${resources}
    ${SHAKA_PLAYER_EMBEDDED_IOS_FRAMEWORK_LOCATION}
)

target_link_libraries(
    ShakaPlayer
    PRIVATE
    shaka_player_embedded::shaka_player_embedded
)

set_target_properties(
    ShakaPlayer
    PROPERTIES
    MACOSX_BUNDLE YES
    MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_LIST_DIR}/Info.plist"
    XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY "1,2" # Universal (iPad + iPhone)
    XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC YES
    RESOURCE "${resources}"
    XCODE_ATTRIBUTE_PRODUCT_NAME "ShakaPlayer"
    XCODE_ATTRIBUTE_BUNDLE_IDENTIFIER "com.github.google.shakaplayerembedded"
    XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER  "com.github.google.shakaplayerembedded"
    XCODE_ATTRIBUTE_LD_RUNPATH_SEARCH_PATHS "@executable_path/Frameworks"
)

set_source_files_properties(
    ${SHAKA_PLAYER_EMBEDDED_IOS_FRAMEWORK_LOCATION}
    PROPERTIES
    GENERATED YES
    MACOSX_PACKAGE_LOCATION Frameworks
)
