SET(TARGET specs)

SET(FILES console.c)
IF(CMAKE_C_COMPILER_ID STREQUAL "GNU")
    LIST(APPEND FILES
         syscalls.c
         sysmem.c
         )
ENDIF()

ADD_LIBRARY(${TARGET} OBJECT ${FILES})
