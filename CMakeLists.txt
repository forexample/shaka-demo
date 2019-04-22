cmake_minimum_required(VERSION 3.2)

include("cmake/HunterGate.cmake")
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.23.157.tar.gz"
    SHA1 "4d502f1d8fb44cb5e9893e810607cc1f2b4aa47f"
    LOCAL
)

project(shaka-demo)

add_executable(demo main.cc)

target_compile_definitions(demo PRIVATE OS_POSIX)

hunter_add_package(shaka_player_embedded)
find_package(shaka_player_embedded CONFIG REQUIRED)
target_link_libraries(demo PRIVATE shaka_player_embedded::shaka_player_embedded)

hunter_add_package(gflags)
find_package(gflags CONFIG REQUIRED)
target_link_libraries(demo PRIVATE gflags)

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
  # Workaround for GNU linker cyclic dependencies
  target_link_libraries(
      demo
      PUBLIC
      "-Wl,--start-group"
      v8::v8_base
      v8::v8_init
      v8::v8_initializers
      v8::v8_libbase
      v8::v8_libplatform
      v8::v8_libsampler
      v8::v8_nosnapshot
      "-Wl,--end-group"
  )
endif()

add_custom_command(
    TARGET
    demo
    PRE_BUILD
    COMMAND
    ${CMAKE_COMMAND}
    -E
    make_directory
    $<TARGET_FILE_DIR:demo>
    COMMAND
    ${CMAKE_COMMAND}
    -E
    copy
    ${CMAKE_CURRENT_LIST_DIR}/shaka-player.compiled.js
    $<TARGET_FILE_DIR:demo>
)
