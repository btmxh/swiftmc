cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    swiftmc
    VERSION 0.1.0
    DESCRIPTION "quick implementation of minecraft in ogl"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    swiftmc_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    swiftmc_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(swiftmc_lib PUBLIC cxx_std_11)

# ---- Declare executable ----

add_executable(swiftmc_exe source/main.cpp)
add_executable(swiftmc::exe ALIAS swiftmc_exe)

set_property(TARGET swiftmc_exe PROPERTY OUTPUT_NAME swiftmc)

target_compile_features(swiftmc_exe PRIVATE cxx_std_11)

target_link_libraries(swiftmc_exe PRIVATE swiftmc_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT swiftmc_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of swiftmc"
  )
endif()

include(cmake/dev-mode.cmake)
