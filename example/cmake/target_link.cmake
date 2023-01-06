FUNCTION(TARGET_LINK TARGET LINKER_SCRIPT)
    SET_TARGET_PROPERTIES(${TARGET} PROPERTIES SUFFIX ".elf")

    IF(CMAKE_C_COMPILER_ID STREQUAL "GNU")
        TARGET_LINK_OPTIONS(${TARGET}
                            PRIVATE
                            -T${LINKER_SCRIPT}.ld
                            -Wl,-Map=${TARGET}.map
                            )
        ADD_CUSTOM_TARGET(${TARGET}.bin ALL
                          DEPENDS ${TARGET}
                          COMMAND ${CMAKE_OBJCOPY} -Obinary ${TARGET}.elf ${TARGET}.bin
                          COMMAND ${CMAKE_OBJCOPY} -Oihex ${TARGET}.elf ${TARGET}.hex
                          )
    ELSE()
        MESSAGE(FATAL_ERROR "Unknown CMAKE_C_COMPILER_ID ${CMAKE_C_COMPILER_ID}")
    ENDIF()
ENDFUNCTION()
