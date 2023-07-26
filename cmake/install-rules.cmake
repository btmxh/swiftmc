install(
    TARGETS swiftmc_exe
    RUNTIME COMPONENT swiftmc_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
