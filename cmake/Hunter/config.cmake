hunter_config(
    CURL
    VERSION ${HUNTER_CURL_VERSION}
    CMAKE_ARGS CMAKE_USE_BORINGSSL=ON
)

hunter_config(
    v8
    VERSION 3.29.86-90da229-p0
)
