# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(swiftmcTests LANGUAGES CXX)

# ---- Tests ----

add_executable(swiftmc_test source/swiftmc_test.cpp)
target_link_libraries(swiftmc_test PRIVATE swiftmc_lib)
target_compile_features(swiftmc_test PRIVATE cxx_std_11)

add_test(NAME swiftmc_test COMMAND swiftmc_test)

# ---- End-of-file commands ----

add_folders(Test)
