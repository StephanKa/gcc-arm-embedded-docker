SET(TARGET cmsis)

ADD_LIBRARY(${TARGET}
            OBJECT
            Device/ARM/ARMCM4/Source/startup_ARMCM4.c
            Device/ARM/ARMCM4/Source/system_ARMCM4.c
            )

TARGET_COMPILE_DEFINITIONS(${TARGET}
                           PRIVATE
                           ARMCM4_FP
                           )

TARGET_INCLUDE_DIRECTORIES(${TARGET}
                           PRIVATE
                           CMSIS/Core/Include
                           Device/ARM/ARMCM4/Include
                           )
